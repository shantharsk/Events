//
//  ViewController.h
//  Event
//
//  Created by admin on 23/02/15.
//
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"
@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    CGFloat animatedDistance;
    sqlite3 *db1;
}
@property (strong, nonatomic) IBOutlet UITextField *username;
- (IBAction)submit:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *mytableview;
@property (strong, nonatomic) IBOutlet UIView *slideview;
@property (nonatomic) CGFloat layerPosition;
@property (strong, nonatomic) IBOutlet UIButton *slidebtn;
@property (strong, nonatomic) IBOutlet UILabel *titname;
@property (strong, nonatomic) IBOutlet UILabel *tacktit;
@end

