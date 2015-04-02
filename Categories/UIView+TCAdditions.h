//
//  UIView+TCAdditions.h
//  ThunderCats
//
//  Created by Metova on 5/2/13.
//  Copyright (c) 2015 Metova. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (TCAdditions)

/**
 *  Calls resignFirstResponder on this view or its subviews (1 level down) if the view is the first responder.
 */
- (void)tc_findAndResignFirstResponder;

@end
