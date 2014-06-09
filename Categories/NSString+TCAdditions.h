//
//  NSString+Utils.h
//  ThunderCats
//
//  Created by Metova on 11/10/13.
//  Copyright (c) 2013 Metova. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TCAdditions)

+ (NSString *)tc_UUID;

- (BOOL)tc_isValidEmailAddressFormat;
- (BOOL)tc_containsString:(NSString *)substring;

- (NSNumber *)tc_wordCount;
- (NSNumber *)tc_lineCount;
- (NSNumber *)tc_sentenceCount;

@end
