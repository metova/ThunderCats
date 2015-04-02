//
//  NSString+Utils.h
//  ThunderCats
//
//  Created by Metova on 11/10/13.
//  Copyright (c) 2015 Metova. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TCAdditions)

/**
 *  Convenience method for generating UUIDs.
 *
 *  @return A UUID string.
 */
+ (NSString *)tc_UUID;

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
- (BOOL)tc_containsString:(NSString *)substring;

/**
 *  Returns a count of the number of words in the string.
 *
 *  @return The number of words in the string.
 */
- (NSNumber *)tc_wordCount;

/**
 *  Returns a count of the number of lines in the string.
 *
 *  @return The number of lines in the string.
 */
- (NSNumber *)tc_lineCount;

/**
 *  Returns a count of the number of sentences in the string.
 *
 *  @return The number of sentences in the string.
 */
- (NSNumber *)tc_sentenceCount;

@end
