//
//  UIView+TCAdditions.m
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


#import "UIView+TCAdditions.h"

@implementation UIView (TCAdditions)

- (void)tc_findAndResignFirstResponder
{
    if ([self isFirstResponder])
    {
        [self resignFirstResponder];
        return;
    }
    
    for (UIView *subview in [self subviews])
    {
        if ([subview isFirstResponder])
        {
            [subview resignFirstResponder];
            return;
        }
    }
}


- (NSArray *)tc_getAllSubviewsRecursively
{
    NSMutableArray *subviews = [NSMutableArray new];
    for (UIView *subview in self.subviews)
    {
        [subviews addObject:subview];
        [subviews addObjectsFromArray:[subview tc_getAllSubviewsRecursively]];
    }
    
    return subviews;
}


- (UIView *)tc_subviewThatSatisfiesBlock:(BOOL (^)(UIView *))conditionBlock
{
    return [self tc_findSubviewUsingSearchStrategy:TCSearchStrategyBreadthFirst
                                thatSatisfiesBlock:conditionBlock];
}


- (UIView *)tc_findSubviewUsingSearchStrategy:(TCSearchStrategy)searchStrategy
                           thatSatisfiesBlock:(BOOL (^)(UIView *))conditionBlock
{
    switch (searchStrategy)
    {
        case TCSearchStrategyBreadthFirst:
            return [self tc_breadthFirstSubviewThatSatisfiesBlock:conditionBlock];
    
        case TCSearchStrategyDepthFirst:
            return [self tc_depthFirstSubviewThatSatisfiesBlock:conditionBlock];
    }
}


- (UIView *)tc_depthFirstSubviewThatSatisfiesBlock:(BOOL (^)(UIView *))conditionBlock
{
    for (UIView *subview in self.subviews)
    {
        if (conditionBlock(subview))
        {
            return subview;
        }
        else
        {
            UIView *view = [subview tc_depthFirstSubviewThatSatisfiesBlock:conditionBlock];
            
            if (view)
            {
                return view;
            }
        }
    }
    
    return nil;
}


- (UIView *)tc_breadthFirstSubviewThatSatisfiesBlock:(BOOL (^)(UIView *))conditionBlock
{
    NSMutableArray *nextViewsToCheck = [self.subviews mutableCopy];
    
    NSInteger i = 0;
    while (i < nextViewsToCheck.count)
    {
        UIView *view = nextViewsToCheck[i];
        if (conditionBlock(view))
        {
            return view;
        }
        else
        {
            i++;
            [nextViewsToCheck addObjectsFromArray:view.subviews];
        }
    }
    
    return nil;
}


@end
