package ${YYAndroidPackageName};

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.lang.reflect.Method;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Proxy;

import ${YYAndroidPackageName}.R;

import com.yoyogames.runner.RunnerJNILib;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.app.Application;
import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.text.Editable;
import android.text.InputType;
import android.text.TextWatcher;
import android.text.method.TextKeyListener;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnFocusChangeListener;
import android.view.View.OnKeyListener;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.view.Window;
import android.view.WindowManager;
import android.view.InputDevice;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputMethodManager;
import android.view.inputmethod.InputMethodSubtype;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.TextView.OnEditorActionListener;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.provider.Settings;
import android.text.Spanned;
import android.text.SpannableStringBuilder;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.text.TextPaint;
import android.text.style.MetricAffectingSpan;

@SuppressWarnings("deprecation")
public class GMKeyboard {
	
	public static Activity activity = null;
	public static View rootView = null;
	public static DemoGLSurfaceView glView = null;
	public static Handler viewHandler = null;
	public static InputMethodManager inputMethodManager = null;
	public static Object clipboardManager = null;
	public static EditText editText = null;
	public static boolean gmkb_returnKeyFunctionality = true;
	public static boolean gmkb_keyboardIsVisible = false;
	public static boolean gmkb_keyboardDidHide = false;
	public static boolean gmkb_textDidChange = false;
	public static boolean gmkb_keyWasPressed = false;
	public static boolean gmkb_returnKeyWasPressed = false;
	public static boolean gmkb_backspaceKeyWasPressed = false;
	public static String gmkb_lastChar = "";
	public static int gmkb_keyboardHeight = 0;
	public static boolean gmkb_textDidChangeByFunction = false;
	public static int originalVisibility = 0;
	public static final Pattern gmkb_emojiPattern = Pattern.compile("[\u203C-\u204D]|[\u2190-\u21FF]|[\u2300-\u23FF]|[\u25A0-\u25FF]|[\u2600-\u26FF]|[\u2700-\u27BF]|[\u2B00-\u2BFF]|[\uD83C\uDC00-\uD83C\uDC2B]|[\uD83C\uDCA0-\uD83C\uDCF5]|[\uD83C\uDD00-\uD83C\uDDFF]|[\uD83C\uDF00-\uD83D\uDDFF]|[\uD83D\uDE00-\uD83D\uDE4F]|[\uD83D\uDE80-\uD83D\uDEFF]|[\uD83E\uDD00-\uD83E\uDDFF]");
	public static int sdk = 0;

	public interface OnKeyboardVisibilityListener {
	    void onVisibilityChanged(boolean visible);
	}
	
	public final void setKeyboardListener(final OnKeyboardVisibilityListener listener) {
		rootView.getViewTreeObserver().addOnGlobalLayoutListener(new OnGlobalLayoutListener() {
	        private boolean wasOpened = false;
	        private final int DefaultKeyboardDP = 100;
	        // Lollipop includes button bar in the root. Add height of button bar (48dp) to maxDiff
	        private final int EstimatedKeyboardDP = DefaultKeyboardDP + (Build.VERSION.SDK_INT >= 21 ? 48 : 0);
	        private final Rect r = new Rect();
			@Override
			public void onGlobalLayout() {
	            // Convert the DP to pixels.
	            int estimatedKeyboardHeight = (int)TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, EstimatedKeyboardDP, rootView.getResources().getDisplayMetrics());

	            // Conclude whether the keyboard is shown or not.
	            rootView.getWindowVisibleDisplayFrame(r);
	            int heightDiff = rootView.getRootView().getHeight() - (r.bottom - r.top);
	            gmkb_keyboardHeight = heightDiff;
	            boolean isShown = heightDiff >= estimatedKeyboardHeight;

	            if (isShown == wasOpened) {
	                return;
	            }

	            wasOpened = isShown;
	            listener.onVisibilityChanged(isShown);
			}
	    });
	}

	public void gmkb_init() {
		//Log.i("yoyo", "gmkb_init");
		sdk = Build.VERSION.SDK_INT;
		activity = RunnerActivity.CurrentActivity;
		rootView = activity.findViewById(android.R.id.content);
		glView = (DemoGLSurfaceView)activity.findViewById(R.id.demogl);
		viewHandler = RunnerActivity.ViewHandler;
		if (sdk >= 11) {
			originalVisibility = glView.getSystemUiVisibility();
		}
		
		// Hide the keyboard when the app is paused
		if (sdk >= 14) {
		    try {
			    Method mRegisterActivityLifecycleCallbacks = null;
			    Class<?> mActivityLifecycleCallbacks = null;
		    	Class<?> applicationClass = Class.forName("android.app.Application");
		        Method[] allMethods = applicationClass.getDeclaredMethods();
		        for (Method thisMethod : allMethods) {
			        if (thisMethod.getName().equals("registerActivityLifecycleCallbacks")) {
				        mRegisterActivityLifecycleCallbacks = thisMethod;
				        break;
			        }
		        }
			    if (mRegisterActivityLifecycleCallbacks != null) {
			    	Class<?>[] allClasses = applicationClass.getClasses();
			    	for (Class<?> thisClass : allClasses) {
			    	    if (thisClass.getName().equals("android.app.Application$ActivityLifecycleCallbacks")) {
			    	    	mActivityLifecycleCallbacks = thisClass;
			    	    	break;
			    	    }
			    	}
			    }	
			    if (mActivityLifecycleCallbacks != null) {
			    	class MyInvocationHandler implements InvocationHandler {
			    		public Object invoke(Object proxy, Method method, Object[] args)  {
			    		     if (method.getName().equals("onActivityPaused")) {
			    		    	 keyboardHide();
			    		     }
			    		     return true;
			    		}
			    	}
			    	InvocationHandler handler = new MyInvocationHandler();
				    Object proxy = Proxy.newProxyInstance(mActivityLifecycleCallbacks.getClassLoader(),
				    		                            	new Class[] { mActivityLifecycleCallbacks },
				    		                                handler);
					mRegisterActivityLifecycleCallbacks.invoke(activity.getApplication(), proxy);
			    }
		    } catch (Exception e) {
		    	Log.i("yoyo", "Exception when trying to registerActivityLifecycleCallbacks: " + e.toString());
		    }
		}
		
		// Detect when the keyboard is no longer visible
		setKeyboardListener(new OnKeyboardVisibilityListener() {
			@Override
			public void onVisibilityChanged(boolean visible) {
				if (!visible && gmkb_keyboardIsVisible) {
					keyboardHide();
				}
			}
		});
		
		viewHandler.post(new Runnable() {
			public void run() {
				inputMethodManager = (InputMethodManager)activity.getSystemService(Context.INPUT_METHOD_SERVICE);
				if (sdk >= 11) {
					clipboardManager = (android.content.ClipboardManager)activity.getSystemService(Context.CLIPBOARD_SERVICE);
				} else {
					clipboardManager = (android.text.ClipboardManager)activity.getSystemService(Context.CLIPBOARD_SERVICE);
				}
				rootView.setFocusable(true);
				rootView.setFocusableInTouchMode(true);
				editText = new EditText(activity) {
					@Override
					public boolean onKeyPreIme(int keyCode, KeyEvent event) {
						if (keyCode == KeyEvent.KEYCODE_BACK && event.getAction() == KeyEvent.ACTION_UP) {
							keyboardHide();
							return false;
						}
						return super.dispatchKeyEvent(event);
					}
				};
	    		RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(1, 1);
	    		params.leftMargin = -1;
	    		params.topMargin = 0;
	    		editText.setLayoutParams(params);
	    		editText.setFocusable(true);
	    		editText.setFocusableInTouchMode(true);
	    		editText.setBackgroundColor(Color.TRANSPARENT);
	    		editText.setTextColor(Color.TRANSPARENT);
	    		editText.setCursorVisible(false);
	    		ViewGroup vg = (ViewGroup)RunnerActivity.CurrentActivity.findViewById(R.id.ad);
				vg.addView(editText);
				editText.addTextChangedListener(new TextWatcher() {
			        @Override
			        public void onTextChanged(CharSequence text, int start, int lengthBefore, int lengthAfter) {
						gmkb_textDidChange = true;
						if (!gmkb_textDidChangeByFunction) {
							gmkb_keyWasPressed = true;
							gmkb_lastChar = "";
							if (lengthAfter > 0) {
								gmkb_lastChar = text.subSequence(start, start + lengthAfter).toString();
							}
							if (lengthAfter < lengthBefore) {
								gmkb_backspaceKeyWasPressed = true;
							}
						}
						gmkb_textDidChangeByFunction = false;
			        }
			        @Override
			        public void beforeTextChanged(CharSequence text, int start, int lengthBefore, int lengthAfter) {
			        }
			        @Override
			        public void afterTextChanged(Editable arg0) {
			        }
			    });
				editText.setOnEditorActionListener(new OnEditorActionListener() {
					@Override
					public boolean onEditorAction(TextView v, int actionId, KeyEvent event) {
						if ((event != null && event.getKeyCode() == KeyEvent.KEYCODE_ENTER && event.getAction() == KeyEvent.ACTION_DOWN)
								|| actionId == EditorInfo.IME_ACTION_DONE || actionId == EditorInfo.IME_ACTION_GO 
								|| actionId == EditorInfo.IME_ACTION_NEXT || actionId == EditorInfo.IME_ACTION_SEARCH 
								|| actionId == EditorInfo.IME_ACTION_SEND) {
							gmkb_keyWasPressed = true;
							gmkb_returnKeyWasPressed = true;
							return (!gmkb_returnKeyFunctionality);
						}
						return false;
					}
				});
			}
		});
	}
	
	public void gmkb_show_keyboard() {
		//Log.i("yoyo", "gmkb_show_keyboard");
		gmkb_show_keyboard_ext(0, 0, 0, 0, 0, 1, 0);
	}
	
	public void gmkb_show_keyboard_type(double keyboardType, double returnKeyType) {
		//Log.i("yoyo", "gmkb_show_keyboard_type");
		gmkb_show_keyboard_ext(keyboardType, returnKeyType, 0, 0, 0, 1, 0);
	}
	
	public void gmkb_show_keyboard_ext(
									final double keyboardType,
									final double returnKeyType,
									final double keyboardAppearance,
									final double autocapitalizationType,
									final double returnKeyDisabledUntilInput,
									final double returnKeyNewLine,
									final double predictive) {
		//Log.i("yoyo", "gmkb_show_keyboard_ext");
	    gmkb_returnKeyFunctionality = false;
	    if (returnKeyNewLine == 1) {
	        gmkb_returnKeyFunctionality = true;
	    }
		gmkb_keyboardDidHide = false;
	    gmkb_textDidChange = false;
		gmkb_keyWasPressed = false;
	    gmkb_returnKeyWasPressed = false;
	    gmkb_backspaceKeyWasPressed = false;
		gmkb_textDidChangeByFunction = false;
	    viewHandler.post(new Runnable() {
	    	public void run() {
	    		editText.clearFocus();
	    		boolean inputTypeIsText = true;
	    		int inputType = InputType.TYPE_CLASS_TEXT;
	    		int imeOptions = EditorInfo.IME_FLAG_NO_EXTRACT_UI;
	    		if (sdk >= 11) {
	    			imeOptions |= EditorInfo.IME_FLAG_NO_FULLSCREEN;
	    		}
	    		switch ((int)keyboardType) {
	    			case 0:
	    				break;
	    			case 1:
	    				inputType |= InputType.TYPE_TEXT_VARIATION_NORMAL;
	    				break;
	    			case 2:
	    				inputType = InputType.TYPE_CLASS_NUMBER;
	    				inputTypeIsText = false;
	    				break;
	    			case 3:
	    				inputType |= InputType.TYPE_TEXT_VARIATION_URI;
	    				break;
	    			case 4:
	    				inputType = InputType.TYPE_CLASS_NUMBER;
	    				if (sdk >= 11) {
	    					inputType |= InputType.TYPE_NUMBER_VARIATION_NORMAL;
	    				}
	    				inputTypeIsText = false;
	    				break;
	    			case 5:
	    				inputType = InputType.TYPE_CLASS_PHONE;
	    				inputTypeIsText = false;
	    				break;
	    			case 6:
	    				inputType |= InputType.TYPE_TEXT_VARIATION_PERSON_NAME;
	    				break;
	    			case 7:
	    				inputType |= InputType.TYPE_TEXT_VARIATION_EMAIL_ADDRESS;
	    				break;
	    			case 8:
	    				inputType = InputType.TYPE_CLASS_NUMBER | InputType.TYPE_NUMBER_FLAG_DECIMAL;
	    				inputTypeIsText = false;
	    				break;
	    			case 9:
	    				inputType |= InputType.TYPE_TEXT_VARIATION_SHORT_MESSAGE;
	    				break;
	    			case 10:
	    				inputType |= InputType.TYPE_TEXT_VARIATION_WEB_EDIT_TEXT;
	    				break;
	    			case 11:
	    				inputType = InputType.TYPE_CLASS_DATETIME;
	    				inputTypeIsText = false;
	    				break;
	    			case 12:
	    				inputType |= InputType.TYPE_TEXT_VARIATION_PASSWORD;
	    				break;
	    			default:
	    				break;
	    		}
	    		String returnKeyText = "";
	    		switch ((int)returnKeyType) {
	    			case 0:
	    				imeOptions |= EditorInfo.IME_ACTION_UNSPECIFIED;
	    				break;
	    			case 1:
	    				imeOptions |= EditorInfo.IME_ACTION_GO;
	    				break;
	    			case 2:
	    				imeOptions |= EditorInfo.IME_ACTION_DONE;
	    				returnKeyText = "Google";
	    				break;
	    			case 3:
	    				imeOptions |= EditorInfo.IME_ACTION_DONE;
	    				returnKeyText = "Join";
	    				break;
	    			case 4:
	    				imeOptions |= EditorInfo.IME_ACTION_NEXT;
	    				break;
	    			case 5:
	    				imeOptions |= EditorInfo.IME_ACTION_DONE;
	    				returnKeyText = "Route";
	    				break;
	    			case 6:
	    				imeOptions |= EditorInfo.IME_ACTION_SEARCH;
	    				break;
	    			case 7:
	    				imeOptions |= EditorInfo.IME_ACTION_SEND;
	    				break;
	    			case 8:
	    				imeOptions |= EditorInfo.IME_ACTION_DONE;
	    				returnKeyText = "Yahoo";
	    				break;
	    			case 9:
	    				imeOptions |= EditorInfo.IME_ACTION_DONE;
	    				break;
	    			default:
	    				break;
	    		}
	    		if (inputTypeIsText) {
	    			switch ((int)autocapitalizationType) {
	    				case 0:
	    					inputType |= InputType.TYPE_TEXT_FLAG_CAP_SENTENCES;
	    					break;
	    				case 1:
	    					break;
	    				case 2:
	    					inputType |= InputType.TYPE_TEXT_FLAG_CAP_WORDS;
	    					break;
	    				case 3:
	    					inputType |= InputType.TYPE_TEXT_FLAG_CAP_CHARACTERS;
	    					break;
	    				default:
	    					break;
	    			}
	    		}
	    		if (gmkb_returnKeyFunctionality) {
	    			editText.setSingleLine(false);
	    			inputType |= InputType.TYPE_TEXT_FLAG_MULTI_LINE;
	    		}
	    		else {
	    			editText.setSingleLine();
	    		}
	    		if (predictive == 0) {
	    			inputType |= InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS;
	    		}
	    		editText.setImeOptions(imeOptions);
	    		editText.setInputType(inputType);
	    		if (returnKeyText.length() != 0) {
	    			editText.setImeActionLabel(returnKeyText, EditorInfo.IME_ACTION_DONE);
	    		}
	    		editText.requestFocus();
	    		editText.setSelection(editText.getText().length());
    			inputMethodManager.toggleSoftInput(InputMethodManager.SHOW_FORCED, InputMethodManager.HIDE_NOT_ALWAYS);
	    		gmkb_keyboardIsVisible = true;
	    	}
	    });
	}
	
	public void gmkb_hide_keyboard() {
		//Log.i("yoyo", "gmkb_hide_keyboard");
	    viewHandler.post(new Runnable() {
	    	public void run() {
				keyboardHide();
	    	}
	    });
	}
	
	public double gmkb_keyboard_is_visible() {
		//Log.i("yoyo", "gmkb_keyboard_is_visible");
		if (gmkb_keyboardIsVisible) {
			return 1;
		}
		return 0;
	}

	public double gmkb_keyboard_did_hide() {
		//Log.i("yoyo", "gmkb_keyboard_did_hide");
	    if (gmkb_keyboardDidHide) {
	    	gmkb_keyboardDidHide = false;
	        return 1;
	    }
	    return 0;
	}
	
	public double gmkb_keyboard_get_height() {
		//Log.i("yoyo", "gmkb_keyboard_get_height");
		return gmkb_keyboardHeight;
	}
	
	public void gmkb_set_text(final String text) {
		//Log.i("yoyo", "gmkb_set_text");
		viewHandler.post(new Runnable() {
	    	public void run() {
			gmkb_textDidChangeByFunction = true;
			editText.setText(text);
			editText.setSelection(editText.getText().length());
	    	}
	    });
	}
	
	public String gmkb_get_text() {
		//Log.i("yoyo", "gmkb_get_text");
		return editText.getText().toString();
	}
	
	public String gmkb_get_last_char() {
		//Log.i("yoyo", "gmkb_get_last_char");
		return gmkb_lastChar;
	}
	
	public double gmkb_text_did_change() {
		//Log.i("yoyo", "gmkb_text_did_change");
	    if (gmkb_textDidChange) {
	        gmkb_textDidChange = false;
	        return 1;
	    }
	    return 0;
	}

	public double gmkb_key_was_pressed() {
		//Log.i("yoyo", "gmkb_key_was_pressed");
	    if (gmkb_keyWasPressed) {
	    	gmkb_keyWasPressed = false;
	        return 1;
	    }
	    return 0;
	}
	
	public double gmkb_return_key_was_pressed() {
		//Log.i("yoyo", "gmkb_return_key_was_pressed");
	    if (gmkb_returnKeyWasPressed) {
	    	gmkb_returnKeyWasPressed = false;
	        return 1;
	    }
	    return 0;
	}
	
	public double gmkb_backspace_key_was_pressed() {
		//Log.i("yoyo", "gmkb_backspace_key_was_pressed");
	    if (gmkb_backspaceKeyWasPressed) {
	    	gmkb_backspaceKeyWasPressed = false;
	        return 1;
	    }
	    return 0;
	}
	
	public void gmkb_language_disable(String language) {
		//Log.i("yoyo", "gmkb_language_disable");
	}
	
	public void gmkb_language_enable(String language) {
		//Log.i("yoyo", "gmkb_language_enable");
	}
	
	public double gmkb_language_did_change() {
		//Log.i("yoyo", "gmkb_language_did_change");
		return 0;
	}
	
	public String gmkb_get_language() {
		//Log.i("yoyo", "gmkb_get_language");
		return "";
	}
	
	public String gmkb_get_input_method() {
		//Log.i("yoyo", "gmkb_get_input_method");
		return Settings.Secure.getString(activity.getContentResolver(), Settings.Secure.DEFAULT_INPUT_METHOD);
	}
	
	public double gmkb_string_get_length(String string) {
		//Log.i("yoyo", "gmkb_string_get_length");
		List<Integer> characterPositions = getCharacterPositions(string);
		return characterPositions.size() - 1;
	}
	
	public String gmkb_string_char_at(String string, double index) {
		//Log.i("yoyo", "gmkb_string_char_at");
		return gmkb_string_copy(string, index, 1);
	}
	
	public String gmkb_string_copy(String string, double index, double length) {
		//Log.i("yoyo", "gmkb_string_copy");
		List<Integer> characterPositions = getCharacterPositions(string);
		if (index < characterPositions.size() - 1) {
			return string.substring(characterPositions.get((int) index), characterPositions.get((int) (index + Math.min(length, characterPositions.size() - index - 1))));
		}
		return "";
	}
	
	public double gmkb_char_is_emoji(String character) {
		//Log.i("yoyo", "gmkb_char_is_emoji");
        return (gmkb_emojiPattern.matcher(character).find() ? 1 : 0);
	}
	
	public String gmkb_char_get_image(String character, double fontSize) {
		//Log.i("yoyo", "gmkb_char_get_image");
		TextView textView = new TextView(activity); 
		textView.layout(0, 0, (int)Math.round(fontSize * 1.25), (int)Math.round(fontSize * 1.5));
		textView.setTypeface(Typeface.DEFAULT);
		textView.setTextSize(TypedValue.COMPLEX_UNIT_PX, (float)fontSize);
		textView.setGravity(Gravity.CENTER);
		textView.setText(character);
		textView.setDrawingCacheEnabled(true); 
		textView.setDrawingCacheQuality(View.DRAWING_CACHE_QUALITY_HIGH);
		String fileName = "emoji.png";
		File file = new File(activity.getFilesDir(), fileName);
		try {
			boolean success = textView.getDrawingCache().compress(CompressFormat.PNG, 100, new FileOutputStream(file));
		}
		catch (FileNotFoundException ex) {
			Log.i("yoyo", "Cannot write to files directory");
		}
		return fileName;
	}

	public void gmkb_clipboard_set(final String text) {
		//Log.i("yoyo", "gmkb_clipboard_set");
		if (sdk >= 11) {
			((android.content.ClipboardManager) clipboardManager).setPrimaryClip(ClipData.newPlainText(text, text));
		}
		else {
			((android.text.ClipboardManager) clipboardManager).setText(text);
		}
	}
	
	public String gmkb_clipboard_get() {
		//Log.i("yoyo", "gmkb_clipboard_get");
		if (sdk >= 11) {
			ClipData primaryClip = ((android.content.ClipboardManager) clipboardManager).getPrimaryClip();
			if (primaryClip.getItemCount() > 0) {
				return primaryClip.getItemAt(0).getText().toString();
			}
			return "";
		}
		else {
			return ((android.text.ClipboardManager) clipboardManager).getText().toString();
		}
	}
	
	private void keyboardHide() {
		//Log.i("yoyo", "keyboardHide");
		editText.clearFocus();
		inputMethodManager.hideSoftInputFromWindow(editText.getWindowToken(), 0);
		gmkb_keyboardIsVisible = false;
		gmkb_keyboardDidHide = true;
		if (sdk >= 11) {
			viewHandler.post(new Runnable() {
				public void run() {
					glView.setSystemUiVisibility(originalVisibility);
				}
			});
		}
	}

	private List<Integer> getCharacterPositions(String string) {
		List<Integer> characterPositions = new ArrayList<Integer>();
		int currentCharacter = 0;
		final char[] chars = string.toCharArray();
		for (int i = 0; i < chars.length; i++) {
			// if the char is not the trailing part of a surrogate pair, save this position
			if (i == 0 || !Character.isSurrogatePair(chars[i-1], chars[i])) {
				characterPositions.add(i);
			}
		}
		characterPositions.add(chars.length);
		return characterPositions;
	}
	
}