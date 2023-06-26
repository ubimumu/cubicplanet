//
//  GMKeyboard.h
//  GMKeyboard
//
//  Created by Benoît Rouleau on 2014-05-12.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface GMKeyboard : NSObject <UITextViewDelegate>

- (void)gmkb_init;
- (void)gmkb_show_keyboard;
- (void)gmkb_show_keyboard_type:(int)keyboardType :(int)returnKeyType;
- (void)gmkb_show_keyboard_ext:(int)keyboardType :(int)returnKeyType :(int)keyboardAppearance :(int)autocapitalizationType :(int)returnKeyDisabledUntilInput :(int)returnKeyNewLine :(int)predictive;
- (void)gmkb_hide_keyboard;
- (int)gmkb_keyboard_is_visible;
- (int)gmkb_keyboard_did_hide;
- (int)gmkb_keyboard_get_height;
- (void)gmkb_set_text:(NSString *)text;
- (NSString *)gmkb_get_text;
- (NSString *)gmkb_get_last_char;
- (int)gmkb_text_did_change;
- (int)gmkb_key_was_pressed;
- (int)gmkb_return_key_was_pressed;
- (int)gmkb_backspace_key_was_pressed;
- (void)gmkb_language_disable:(NSString *)language;
- (void)gmkb_language_enable:(NSString *)language;
- (int)gmkb_language_did_change;
- (NSString *)gmkb_get_language;
- (NSString *)gmkb_get_input_method;
- (int)gmkb_string_get_length:(NSString *)string;
- (NSString *)gmkb_string_char_at:(NSString *)string :(int)position;
- (NSString *)gmkb_string_copy:(NSString *)string :(int)start :(int)length;
- (int)gmkb_char_is_emoji:(NSString *)character;
- (NSString *)gmkb_char_get_image:(NSString *)character :(int)fontSize;
- (void)gmkb_clipboard_set:(NSString *)text;
- (NSString *)gmkb_clipboard_get;

- (UIKeyboardType)getConstantKeyboardType:(int)keyboardType;
- (UIReturnKeyType)getConstantReturnKeyType:(int)returnKeyType;
- (UIKeyboardAppearance)getConstantKeyboardAppearance:(int)keyboardAppearance;
- (UITextAutocapitalizationType)getConstantAutocapitalizationType:(int)capitalizationType;

- (void)keyboardWillShow:(NSNotification *)notification;
- (void)keyboardWillHide:(NSNotification *)notification;
- (void)keyboardWillChangeFrame:(NSNotification *)notification;
- (void)inputModeDidChange:(NSNotification *)notification;
- (UITextInputMode *)getCurrentInputMode;

@end

@interface GMKBTextView : UITextView
@end
