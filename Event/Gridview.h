//
//  Gridview.h
//  Event
//
//  Created by admin on 23/02/15.
//
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"
@interface Gridview : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDataSource,UITableViewDelegate>
{
     CGFloat animatedDistance;
    sqlite3 *db1;
}
@property (strong, nonatomic) IBOutlet UICollectionView *mycollectionview;
@property (strong, nonatomic) IBOutlet UIView *slideview;
@property (nonatomic) CGFloat layerPosition;
@property (strong, nonatomic) IBOutlet UIButton *slidebtn;
@property (strong, nonatomic) IBOutlet UILabel *titname;
@property (strong, nonatomic) IBOutlet UITableView *mytableview;
@property (strong, nonatomic) IBOutlet UILabel *tacktit;
- (IBAction)listview:(id)sender;
@end
