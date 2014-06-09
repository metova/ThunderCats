//
//  NSString+Utils.h
//  CategoryUtilsProject
//
//  Created by lgauthier on 11/10/13.
//  Copyright (c) 2013 Metova. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Utils)

- (BOOL)isValidEmailAddressFormat;
+ (NSString *)uuidWithLength:(NSInteger)length;

@end
