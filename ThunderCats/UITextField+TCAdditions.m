//
//  UITextField+TCAdditions.m
//  ThunderCats
//
//  Copyright (c) 2015 Metova Inc.
//
//  MIT License
//
//  Permission is hereby granted, free of charge, to any person obtaining
//  a copy of this software and associated documentation files (the
//  "Software"), to deal in the Software without restriction, including
//  without limitation the rights to use, copy, modify, merge, publish,
//  distribute, sublicense, and/or sell copies of the Software, and to
//  permit persons to whom the Software is furnished to do so, subject to
//  the following conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
//  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
//  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
//  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "UITextField+TCAdditions.h"
#import "TCInvalidArgument.h"

@implementation UITextField (TCAdditions)

- (void)tc_setLeftAndRightPadding:(CGFloat)paddingWidth
{
    if (paddingWidth < 0) {
        [TCInvalidArgument raiseWithReason:@"paddingWidth can not be a negative number"];
    }
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, paddingWidth, self.frame.size.height)];
    
    self.leftView = paddingView;
    self.leftViewMode = UITextFieldViewModeAlways;
    self.rightView = paddingView;
    self.rightViewMode = UITextFieldViewModeUnlessEditing;
}

- (void)tc_addNextButtonToolbarWithColor:(UIColor * __tc_nonnull)toolbarColor
                               nextField:(UITextField * __tc_nonnull)nextTextField

{
    [self tc_addToolbarWithButton:@"Next" toolbarColor:toolbarColor target:nextTextField action:@selector(becomeFirstResponder)];
}

- (void)tc_addToolbarWithButton:(NSString * __tc_nonnull)buttonTitle
                   toolbarColor:(UIColor * __tc_nonnull)toolbarColor
                         target:(id)target action:(SEL)selector
{
    UIBarButtonItem *button = [[UIBarButtonItem init] initWithTitle:buttonTitle style:UIBarButtonItemStylePlain target:target action:selector];
    [self addToolBarWithButton:button toolbarColor:toolbarColor];
}

- (void)addToolBarWithButton:(UIBarButtonItem * __tc_nonnull)buttonItem
                toolbarColor:(UIColor * __tc_nonnull)toolbarColor
{
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    toolbar.tintColor = toolbarColor;
    [toolbar sizeToFit];
    
    toolbar.items = @[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil], buttonItem];
    
    self.inputAccessoryView = toolbar;
}

@end
