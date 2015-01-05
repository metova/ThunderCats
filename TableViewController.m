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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.testArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[TableViewCell tc_reuseIdentifier] forIndexPath:indexPath];
    
    NSURL *url = [NSURL URLWithString:self.testArray[indexPath.row]];
    
    [cell setupWithUrl:url indexPath:indexPath blur:YES];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

@end
