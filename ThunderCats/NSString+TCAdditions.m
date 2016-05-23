//
//  NSString+TCAdditions.m
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


#import "NSString+TCAdditions.h"

@implementation NSString (TCAdditions)

+ (NSString *)tc_UUID
{
    return [[NSUUID UUID] UUIDString];
}


- (BOOL)tc_isValidEmailAddressFormat
{
    NSString *emailRegex = @"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}


- (BOOL)tc_containsString:(NSString *)substring
{
    NSRange range = [self rangeOfString:substring];
    return (range.location != NSNotFound);
}


- (NSNumber *)tc_wordCount
{
    __block NSUInteger wordCount = 0;
    [self enumerateSubstringsInRange:NSMakeRange(0, self.length)
                             options:NSStringEnumerationByWords
                          usingBlock:^(NSString *character, NSRange substringRange, NSRange enclosingRange, BOOL *stop)
     {
         wordCount++;
     }];
    
    return @(wordCount);
}


- (NSNumber *)tc_lineCount
{
    __block NSUInteger lineCount = 0;
    [self enumerateSubstringsInRange:NSMakeRange(0, self.length)
                             options:NSStringEnumerationByLines
                          usingBlock:^(NSString *character, NSRange substringRange, NSRange enclosingRange, BOOL *stop)
     {
         lineCount++;
     }];
    
    return @(lineCount);
}


- (NSNumber *)tc_sentenceCount
{
    __block NSUInteger sentenceCount = 0;
    [self enumerateSubstringsInRange:NSMakeRange(0, self.length)
                             options:NSStringEnumerationBySentences
                          usingBlock:^(NSString *character, NSRange substringRange, NSRange enclosingRange, BOOL *stop)
     {
         sentenceCount++;
     }];
    
    return @(sentenceCount);
}

@end
