//
//  UICollectionViewCell+TCAdditions.h
//  ThunderCats
//
//  Created by Metova on 11/10/13.
//  Copyright (c) 2013 Metova. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionViewCell (TCAdditions)

+ (NSString *)tc_reuseIdentifier;
+ (NSString *)tc_nibName;
+ (NSString *)tc_iPadNibName;
+ (UINib *)tc_nib;
+ (UINib *)tc_iPadNib;

@end
