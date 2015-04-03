//
//  TableViewController.m
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

#import "TableViewController.h"
#import "TableViewCell.h"
#import "UITableViewCell+TCAdditions.h"


@interface TableViewController ()

@property (strong, nonatomic) NSArray *testArray;

@end


@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.testArray = @[@"http://www.online-image-editor.com//styles/2014/images/example_image.png",
                       @"http://www.joomlaworks.net/images/demos/galleries/abstract/7.jpg",
                       @"http://www.jpl.nasa.gov/spaceimages/images/mediumsize/PIA17011_ip.jpg",
                       @"http://mintywhite.com/wp-content/uploads/2012/10/fond-ecran-wallpaper-image-arriere-plan-hd-29-HD.jpg",
                       @"http://imageswiki.com/wp-content/uploads/2014/11/images-ImageVaultHandler.jpg",
                       @"http://farm9.staticflickr.com/8378/8559402848_9fcd90d20b_b.jpg",
                       @"http://img.gettyimageslatam.com/public/userfiles/redesign/images/landing/home/img_entry_002.jpg",
                       @"http://news.bbcimg.co.uk/media/images/71832000/jpg/_71832498_71825880.jpg"];
    
    [self.tableView registerNib:[TableViewCell tc_nib] forCellReuseIdentifier:[TableViewCell tc_reuseIdentifier]];
}


#pragma mark - Table View Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.testArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[TableViewCell tc_reuseIdentifier] forIndexPath:indexPath];
    
    NSURL *url = [NSURL URLWithString:self.testArray[indexPath.row]];
    
    [cell setupWithUrl:url indexPath:indexPath blur:YES];
    
    return cell;
}

@end
