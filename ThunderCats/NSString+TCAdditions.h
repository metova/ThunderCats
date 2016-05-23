//
//  NSString+TCAdditions.h
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


#import <Foundation/Foundation.h>
#import "TCNullabilityMacros.h"

@interface NSString (TCAdditions)

/**
 *  Convenience method for generating UUIDs.
 *
 *  @return A UUID string.
 */
+ (NSString * __tc_nonnull)tc_UUID;

/**
 *  Performs a regex match to see whether the email address is a valid format. Specifically, it performs a case-insensitive match with the following regex:
 *  "[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])"
 *
 *  @return A Boolean value that indicates whether the string is a valid email address format.
 */
- (BOOL)tc_isValidEmailAddressFormat;

/**
 *  Used to determine whether a substring is present within the string.
 *
 *  @param substring The substring to check for.
 *
 *  @return A Boolean value that indicates whether the substring is present.
 */
- (BOOL)tc_containsString:(NSString * __tc_nonnull)substring;

/**
 *  Returns a count of the number of words in the string.
 *
 *  @return The number of words in the string.
 */
- (NSNumber * __tc_nonnull)tc_wordCount;

/**
 *  Returns a count of the number of lines in the string.
 *
 *  @return The number of lines in the string.
 */
- (NSNumber * __tc_nonnull)tc_lineCount;

/**
 *  Returns a count of the number of sentences in the string.
 *
 *  @return The number of sentences in the string.
 */
- (NSNumber * __tc_nonnull)tc_sentenceCount;

@end
