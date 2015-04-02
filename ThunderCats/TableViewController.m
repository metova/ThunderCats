//
//  TableViewController.m
//  
//
//  Created by William Grand on 6/9/14.
//
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "UITableViewCell+TCAdditions.h"


@interface TableViewController ()

@property (copy, nonatomic) NSArray *testArray;

@end


@implementation TableViewController

- (void)viewDidLoad {
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
