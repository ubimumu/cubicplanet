//
//  GMKeyboard.mm
//  GMKeyboard
//
//  Created by Benoît Rouleau on 2014-05-12.
//
//

#import "GMKeyboard.h"

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

static GMKBTextView *gmkb_textView;
static bool gmkb_returnKeyFunctionality = YES;
static bool gmkb_keyboardDidHide = NO;
static bool gmkb_textDidChange = NO;
static bool gmkb_keyWasPressed = NO;
static bool gmkb_returnKeyWasPressed = NO;
static bool gmkb_backspaceKeyWasPressed = NO;
static bool gmkb_userJustPressedKey = NO;
static bool gmkb_userJustPressedReturnKey = NO;
static bool gmkb_justChangedSelection = NO;
static NSString *gmkb_lastChar = @"";
static NSString *gmkb_lastCharNext = @"";
static NSMutableArray *gmkb_disabledLanguages;
static int gmkb_keyboardHeight = 0;
static bool gmkb_languageDidChange = NO;
static int gmkb_savedImagesCount = 0;

@implementation GMKeyboard

- (void)gmkb_init {
    //NSLog(@"gmkb_init");
    gmkb_textView = [[GMKBTextView alloc] init];
    gmkb_textView.frame = CGRectMake(0, -100, 50, 50);
    [[[UIApplication sharedApplication] keyWindow] addSubview:gmkb_textView];
    gmkb_textView.hidden = YES;
    gmkb_textView.spellCheckingType = UITextSpellCheckingTypeNo;
    gmkb_textView.delegate = self;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillChangeFrame:)
                                                 name:UIKeyboardWillChangeFrameNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(inputModeDidChange:)
                                                 name:UITextInputCurrentInputModeDidChangeNotification
                                               object:nil];
    gmkb_disabledLanguages = [[NSMutableArray alloc] init];
}

- (void)gmkb_show_keyboard {
    //NSLog(@"gmkb_show_keyboard");
    [self gmkb_show_keyboard_ext:0 :0 :0 :0 :0 :1 :0];
}

- (void)gmkb_show_keyboard_type:(int)keyboardType :(int)returnKeyType {
    //NSLog(@"gmkb_show_keyboard_type");
    [self gmkb_show_keyboard_ext:keyboardType :returnKeyType :0 :0 :0 :1 :0];
}

- (void)gmkb_show_keyboard_ext:(int)keyboardType :(int)returnKeyType :(int)keyboardAppearance :(int)autocapitalizationType :(int)returnKeyDisabledUntilInput :(int)returnKeyNewLine :(int)predictive {
    //NSLog(@"gmkb_show_keyboard_ext");
    gmkb_textView.keyboardType = [self getConstantKeyboardType:keyboardType];
    gmkb_textView.secureTextEntry = NO;
    if (keyboardType == 12) {
        gmkb_textView.secureTextEntry = YES;
    }
    gmkb_textView.returnKeyType = [self getConstantReturnKeyType:returnKeyType];
    gmkb_textView.keyboardAppearance = [self getConstantKeyboardAppearance:keyboardAppearance];
    gmkb_textView.autocapitalizationType = [self getConstantAutocapitalizationType:autocapitalizationType];
    gmkb_textView.enablesReturnKeyAutomatically = NO;
    if (returnKeyDisabledUntilInput) {
        gmkb_textView.enablesReturnKeyAutomatically = YES;
    }
    gmkb_returnKeyFunctionality = NO;
    if (returnKeyNewLine) {
        gmkb_returnKeyFunctionality = YES;
    }
    gmkb_textView.autocorrectionType = UITextAutocorrectionTypeNo;
    if (predictive) {
        gmkb_textView.autocorrectionType = UITextAutocorrectionTypeDefault;
    }
    if ([self gmkb_keyboard_is_visible]) {
        [self gmkb_hide_keyboard];
    }
    gmkb_keyboardDidHide = NO;
    gmkb_textDidChange = NO;
    gmkb_keyWasPressed = NO;
    gmkb_returnKeyWasPressed = NO;
    gmkb_backspaceKeyWasPressed = NO;
    gmkb_userJustPressedKey = NO;
    gmkb_userJustPressedReturnKey = NO;
    gmkb_languageDidChange = NO;
    [gmkb_textView becomeFirstResponder];
}

- (void)gmkb_hide_keyboard {
    //NSLog(@"gmkb_hide_keyboard");
    [gmkb_textView resignFirstResponder];
}

- (int)gmkb_keyboard_is_visible {
    //NSLog(@"gmkb_keyboard_is_visible");
    return [gmkb_textView isFirstResponder];
}

- (int)gmkb_keyboard_did_hide {
    //NSLog(@"gmkb_keyboard_did_hide");
    if (gmkb_keyboardDidHide) {
        gmkb_keyboardDidHide = NO;
        return 1;
    }
    return 0;
}

- (int)gmkb_keyboard_get_height {
    //NSLog(@"gmkb_keyboard_get_height");
    return gmkb_keyboardHeight;
}

- (void)gmkb_set_text:(NSString *)text {
    //NSLog(@"gmkb_set_text");
    gmkb_textView.text = text;
    gmkb_textDidChange = YES;
    [gmkb_textView.undoManager removeAllActions];
}

- (NSString *)gmkb_get_text {
    //NSLog(@"gmkb_get_text");
    return gmkb_textView.text;
}

- (NSString *)gmkb_get_last_char {
    //NSLog(@"gmkb_get_last_char");
    return gmkb_lastChar;
}

- (int)gmkb_text_did_change {
    //NSLog(@"gmkb_text_did_change");
    if (gmkb_textDidChange) {
        gmkb_textDidChange = NO;
        return 1;
    }
    return 0;
}

- (int)gmkb_key_was_pressed {
    //NSLog(@"gmkb_key_was_pressed");
    if (gmkb_keyWasPressed) {
        gmkb_keyWasPressed = NO;
        return 1;
    }
    return 0;
}

- (int)gmkb_return_key_was_pressed {
    //NSLog(@"gmkb_return_key_was_pressed");
    if (gmkb_returnKeyWasPressed) {
        gmkb_returnKeyWasPressed = NO;
        return 1;
    }
    return 0;
}

- (int)gmkb_backspace_key_was_pressed {
    //NSLog(@"gmkb_backspace_key_was_pressed");
    if (gmkb_backspaceKeyWasPressed) {
        gmkb_backspaceKeyWasPressed = NO;
        return 1;
    }
    return 0;
}

- (void)gmkb_language_disable:(NSString *)language {
    //NSLog(@"gmkb_language_disable");
    [gmkb_disabledLanguages addObject:language];
}

- (void)gmkb_language_enable:(NSString *)language {
    //NSLog(@"gmkb_language_enable");
    NSInteger count = [gmkb_disabledLanguages count];
    for (NSInteger index = (count - 1); index >= 0; index--) {
        NSString *thisLanguage = gmkb_disabledLanguages[index];
        if ([thisLanguage isEqualToString:language]) {
            [gmkb_disabledLanguages removeObjectAtIndex:index];
        }
    }
}

- (int)gmkb_language_did_change {
    //NSLog(@"gmkb_language_did_change");
    if (gmkb_languageDidChange) {
        gmkb_languageDidChange = NO;
        return 1;
    }
    return 0;
}

- (NSString *)gmkb_get_language {
    //NSLog(@"gmkb_get_language");
    UITextInputMode *currentInputMode = [self getCurrentInputMode];
    if (currentInputMode != nil) {
        return [currentInputMode primaryLanguage];
    }
    return @"";
}

- (NSString *)gmkb_get_input_method {
    //NSLog(@"gmkb_get_input_method");
    UITextInputMode *currentInputMode = [self getCurrentInputMode];
    if (currentInputMode != nil) {
        return [currentInputMode valueForKey:@"identifier"];
    }
    return @"";
}

- (int)gmkb_string_get_length:(NSString *)string {
    //NSLog([NSString stringWithFormat:@"gmkb_string_get_length:%@", string]);
    __block int length = 0;
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length])
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                length++;
                            }];
    return length;
}

- (NSString *)gmkb_string_char_at:(NSString *)string :(int)index {
    //NSLog([NSString stringWithFormat:@"gmkb_string_char_at:%@,%d", string, index]);
    __block int count = 0;
    __block NSString *character = @"";
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length])
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                if (count == index) {
                                    character = [substring retain];
                                    *stop = YES;
                                }
                                count++;
                            }];
    return character;
}

- (NSString *)gmkb_string_copy:(NSString *)string :(int)index :(int)length {
    //NSLog([NSString stringWithFormat:@"gmkb_string_copy:%@,%d,%d", string, index, length]);
    __block int count = 0;
    __block int chars = 0;
    __block int rangeLocation = 0;
    __block int rangeLength = 0;
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length])
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                if (count == index) {
                                    rangeLocation = chars;
                                }
                                if (count == index + length) {
                                    rangeLength = chars - rangeLocation;
                                    *stop = YES;
                                }
                                count++;
                                chars += substring.length;
                            }];
    if (length > 0 && rangeLength == 0) {
        rangeLength = chars - rangeLocation;
    }
    return [string substringWithRange:NSMakeRange(rangeLocation, rangeLength)];
}

- (int)gmkb_char_is_emoji:(NSString *)character {
    //NSLog(@"gmkb_char_is_emoji");
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[\u203C-\u204D]|[\u2190-\u21FF]|[\u2300-\u23FF]|[\u25A0-\u25FF]|[\u2600-\u26FF]|[\u2700-\u27BF]|[\u2B00-\u2BFF]|[\\uD83C\\uDC00-\\uD83C\\uDC2B]|[\\uD83C\\uDCA0-\\uD83C\\uDCF5]|[\\uD83C\\uDD00-\\uD83C\\uDDFF]|[\\uD83C\\uDF00-\\uD83D\\uDDFF]|[\\uD83D\\uDE00-\\uD83D\\uDE4F]|[\\uD83D\\uDE80-\\uD83D\\uDEFF]|[\\uD83E\\uDD00-\\uD83E\\uDDFF]" options:NSRegularExpressionCaseInsensitive error:&error];
    return ([regex firstMatchInString:character options:0 range:NSMakeRange(0, [character length])] == nil ? 0 : 1);
}

- (NSString *)gmkb_char_get_image:(NSString *)character :(int)fontSize {
    //NSLog(@"gmkb_char_get_image");
    UILabel *label = [[[UILabel alloc] init] autorelease];
    [label setFont:[UIFont systemFontOfSize:fontSize]];
    label.text = character;
    label.opaque = NO;
    label.backgroundColor = UIColor.clearColor;
    CGSize measuredSize = [character sizeWithAttributes:@{NSFontAttributeName: label.font}];
    label.frame = CGRectMake(0, 0, measuredSize.width, measuredSize.height);
    UIGraphicsBeginImageContextWithOptions(label.bounds.size, label.opaque, 0.0);
    [label.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData *imageData = UIImagePNGRepresentation(img);
    NSString *docsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *fileName = [NSString stringWithFormat:@"emoji%d.png", gmkb_savedImagesCount];
    NSString *path = [docsDirectory stringByAppendingPathComponent:fileName];
    gmkb_savedImagesCount++;
    [imageData writeToFile:path atomically:YES];
    return fileName;
}

- (void)gmkb_clipboard_set:(NSString *)text {
    //NSLog(@"gmkb_clipboard_set");
    [UIPasteboard generalPasteboard].string = text;
}

- (NSString *)gmkb_clipboard_get {
    //NSLog(@"gmkb_clipboard_get");
    NSString *text = [UIPasteboard generalPasteboard].string;
    if (text.length > 0) {
        return text;
    }
    return @"";
}

- (UIKeyboardType)getConstantKeyboardType:(int)keyboardType {
    switch (keyboardType) {
        case 0: return UIKeyboardTypeDefault; break;
        case 1: return UIKeyboardTypeASCIICapable; break;
        case 2: return UIKeyboardTypeNumbersAndPunctuation; break;
        case 3: return UIKeyboardTypeURL; break;
        case 4: return UIKeyboardTypeNumberPad; break;
        case 5: return UIKeyboardTypePhonePad; break;
        case 6: return UIKeyboardTypeNamePhonePad; break;
        case 7: return UIKeyboardTypeEmailAddress; break;
        case 8: return UIKeyboardTypeDecimalPad; break;
        case 9: return UIKeyboardTypeTwitter; break;
        case 10: return UIKeyboardTypeWebSearch; break;
        case 11: return UIKeyboardTypeASCIICapable; break;
        case 12: return UIKeyboardTypeASCIICapable; break;
        default: return UIKeyboardTypeDefault; break;
    }
}

- (UIReturnKeyType)getConstantReturnKeyType:(int)returnKeyType {
    switch (returnKeyType) {
        case 0: return UIReturnKeyDefault; break;
        case 1: return UIReturnKeyGo; break;
        case 2: return UIReturnKeyGoogle; break;
        case 3: return UIReturnKeyJoin; break;
        case 4: return UIReturnKeyNext; break;
        case 5: return UIReturnKeyRoute; break;
        case 6: return UIReturnKeySearch; break;
        case 7: return UIReturnKeySend; break;
        case 8: return UIReturnKeyYahoo; break;
        case 9: return UIReturnKeyDone; break;
        default: return UIReturnKeyDefault; break;
    }
}

- (UIKeyboardAppearance)getConstantKeyboardAppearance:(int)keyboardAppearance {
    switch (keyboardAppearance) {
        case 0: return UIKeyboardAppearanceLight; break;
        case 1: return UIKeyboardAppearanceDark; break;
        default: return UIKeyboardAppearanceLight; break;
    }
}

- (UITextAutocapitalizationType)getConstantAutocapitalizationType:(int)capitalizationType {
    switch (capitalizationType) {
        case 0: return UITextAutocapitalizationTypeSentences; break;
        case 1: return UITextAutocapitalizationTypeNone; break;
        case 2: return UITextAutocapitalizationTypeWords; break;
        case 3: return UITextAutocapitalizationTypeAllCharacters; break;
        default: return UITextAutocapitalizationTypeSentences; break;
    }
}

- (void)keyboardWillShow:(NSNotification*)notification {
    //NSLog(@"keyboardWillShow");
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    gmkb_keyboardHeight = (int)keyboardSize.height;
}

- (void)keyboardWillHide:(NSNotification*)notification {
    //NSLog(@"keyboardWillHide");
    gmkb_keyboardHeight = 0;
}

- (void)keyboardWillChangeFrame:(NSNotification*)notification {
    //NSLog(@"keyboardWillChangeFrame");
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    gmkb_keyboardHeight = (int)keyboardSize.height;
}

- (void)inputModeDidChange:(NSNotification *)notification {
    //NSLog(@"inputModeDidChange");
    gmkb_languageDidChange = YES;
}

- (UITextInputMode *)getCurrentInputMode {
    //NSLog(@"getCurrentInputMode");
    UITextInputMode *currentInputMode = nil;
    currentInputMode = [gmkb_textView textInputMode];
    return currentInputMode;
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    //NSLog(@"textView shouldChangeTextInRange");
    NSString *language = [self gmkb_get_language];
    NSInteger count = [gmkb_disabledLanguages count];
    for (NSInteger index = 0; index < count; index++) {
        if ([gmkb_disabledLanguages[index] isEqualToString:language] || ([gmkb_disabledLanguages[index] isEqualToString:@""] && !language)) {
            return NO;
        }
    }
    if([text isEqualToString:@"\n"]) {
        if (!gmkb_returnKeyFunctionality) {
            gmkb_keyWasPressed = YES;
            gmkb_returnKeyWasPressed = YES;
            return NO;
        }
        else {
            gmkb_userJustPressedReturnKey = YES;
        }
    }
    gmkb_userJustPressedKey = YES;
    gmkb_lastCharNext = [text retain];
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView {
    //NSLog(@"textViewDidChange");
    gmkb_justChangedSelection = YES;
    gmkb_textView.selectedRange = NSMakeRange([gmkb_textView.text length], 0);
    gmkb_textDidChange = YES;
    if (gmkb_userJustPressedKey) {
        gmkb_keyWasPressed = YES;
        gmkb_lastChar = gmkb_lastCharNext;
        gmkb_userJustPressedKey = NO;
    }
    if (gmkb_userJustPressedReturnKey) {
        gmkb_returnKeyWasPressed = YES;
        gmkb_userJustPressedReturnKey = NO;
    }
}

- (void)textViewDidChangeSelection:(UITextView *)textView {
    //NSLog(@"textViewDidChangeSelection");
    if (!gmkb_justChangedSelection) {
        gmkb_justChangedSelection = YES;
        gmkb_textView.selectedRange = NSMakeRange([gmkb_textView.text length], 0);
    }
    else {
        gmkb_justChangedSelection = NO;
    }
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    //NSLog(@"textViewShouldEndEditing");
    gmkb_keyboardDidHide = YES;
    return YES;
}

@end


@implementation GMKBTextView

-(void)insertText:(NSString *)text {
    //NSLog(@"insertText");
    [super insertText:text];
}

-(void)deleteBackward {
    //NSLog(@"deleteBackward");
    [super deleteBackward];
    gmkb_keyWasPressed = YES;
    gmkb_backspaceKeyWasPressed = YES;
}

@end
