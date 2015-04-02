//
//  UITableViewCell+TCAdditions.h
//  ThunderCats
//
//  Created by Metova on 11/10/13.
//  Copyright (c) 2015 Metova. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (TCAdditions)

/**
 *  Returns a string equal to the class name for use as a reuse identifier.
 *
 *  @return A reuse identifier that is equal to the class name.
 */
+ (NSString *)tc_reuseIdentifier;

/**
 *  Returns a string equal to the class name.
 *
 *  @return A string equal to the class name.
 */
+ (NSString *)tc_nibName;

/**
 *  Returns a string that is equal to the class name with "_iPad" appended to it.
 *
 *  @return A string that is equal to the class name with "_iPad" appended to it.
 */
+ (NSString *)tc_iPadNibName;

/**
 *  Returns a nib for the cell subclass if one exists and is named after the class.
 *
 *  @return The nib for the cell subclass.
 */
+ (UINib *)tc_nib;

/**
 *  Returns a nib for the cell subclass if one exists and is named after the class with "_iPad" appended to it.
 *
 *  @return The iPad nib for the cell subclass.
 */
+ (UINib *)tc_iPadNib;

@end
