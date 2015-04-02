//
//  TableViewCell.h
//  ThunderCats
//
//  Created by William Grand on 6/9/14.
//  Copyright (c) 2014 Metova. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

- (void)setupWithUrl:(NSURL *)url
           indexPath:(NSIndexPath *)indexPath
                blur:(BOOL)isBlurred;

@end
