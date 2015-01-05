//
//  TableViewCell.m
//  ThunderCats
//
//  Created by William Grand on 6/9/14.
//  Copyright (c) 2014 Metova. All rights reserved.
//

#import "TableViewCell.h"
#import "UIImageView+WebCacheBlur.h"

@interface TableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *testImageView;

@end

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setupWithUrl:(NSURL *)url indexPath:(NSIndexPath *)indexPath blur:(BOOL)isBlurred {
    if (isBlurred) {
        [self.testImageView sd_setBlurredImageWithURL:url completed:nil];
    }
    else {
        [self.testImageView sd_setImageWithURL:url completed:nil];
    }
    
}

@end
