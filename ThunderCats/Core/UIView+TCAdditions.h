//
//  UIView+TCAdditions.h
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


#import <UIKit/UIKit.h>
#import "TCNullabilityMacros.h"

typedef NS_ENUM(NSUInteger, TCSearchStrategy) {
    TCSearchStrategyBreadthFirst,
    TCSearchStrategyDepthFirst
};

@interface UIView (TCAdditions)

/**
 *  Calls resignFirstResponder on this view or its subviews (1 level down) if the view is the first responder.
 */
- (void)tc_findAndResignFirstResponder;

/**
 *  Returns a flattened subview hierarchy. All subviews within this view's subview hierarchy are returned.
 *
 *  @return An array of all the view's subviews in its subview hierarchy.
 */
- (NSArray * __tc_nonnull)tc_getAllSubviewsRecursively;

/**
 *  Returns the first subview it encounters that satisfies the condition block. This method uses a breadth first search strategy.
 *
 *  @param conditionBlock The block to apply to each subview.
 *
 *  @return The first subview encountered that satisfies the condition block.
 */
- (UIView * __tc_nullable)tc_subviewThatSatisfiesBlock:( BOOL (^ __tc_nonnull)(UIView * __tc_nonnull view))conditionBlock;

/**
 *  Returns the first subview it encounters that satisfies the condition block. This method can perform a breadth first search strategy or a depth first search strategy.
 *
 *  @param searchStrategy The search strategy to use.
 *  @param conditionBlock The block to apply to each subview.
 *
 *  @return The first subview encountered that satisfies the condition block.
 */
- (UIView * __tc_nullable)tc_findSubviewUsingSearchStrategy:(TCSearchStrategy)searchStrategy
                                         thatSatisfiesBlock:(BOOL (^ __tc_nonnull)(UIView * __tc_nonnull view))conditionBlock;

@end
