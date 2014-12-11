//
//  NSString+Utils.m
//  ThunderCats
//
//  Created by Metova on 11/10/13.
//  Copyright (c) 2013 Metova. All rights reserved.
//

#import "NSString+TCAdditions.h"

@implementation NSString (TCAdditions)

+ (NSString *)tc_UUID
{
    return [[NSUUID UUID] UUIDString];
}

//Regex changed based on RFC 5322. http://www.regular-expressions.info/email.html for more information
- (BOOL)tc_isValidEmailAddressFormat
{
    NSString *emailRegex = @"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])"; //"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
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
