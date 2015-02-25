//
//  listview.h
//  Event
//
//  Created by admin on 23/02/15.
//
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"
@interface listview : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    CGFloat animatedDistance;
    sqlite3 *db1;
}

- (IBAction)slidebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *mytableview;
@property (strong, nonatomic) IBOutlet UIView *slideview;
@property (nonatomic) CGFloat layerPosition;
@property (strong, nonatomic) IBOutlet UIButton *slidebtn;
@property (strong, nonatomic) IBOutlet UITableView *mytableview2;
@property (strong, nonatomic) IBOutlet UILabel *titname;
- (IBAction)grid:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *tacktit;
@end
