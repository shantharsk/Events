//
//  detailviewlist.h
//  Event
//
//  Created by admin on 23/02/15.
//
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"
@interface detailviewlist : UIViewController
{
    sqlite3 *db1;
}
@property (strong, nonatomic) NSString *evename;
@property (strong, nonatomic) NSString *tack;
@property (strong, nonatomic) NSString *eveplace;
@property (strong, nonatomic) NSString *eveimg;
@property (strong, nonatomic) NSString *evtentry;
@property (strong, nonatomic) NSString *viewtype;
- (IBAction)back:(id)sender;
- (IBAction)tack:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *labevename;
@property (strong, nonatomic) IBOutlet UILabel *labeveplace;
@property (strong, nonatomic) IBOutlet UILabel *labenty;
@property (strong, nonatomic) IBOutlet UIImageView *img;
@property (strong, nonatomic) IBOutlet UIButton *select;
@property (strong, nonatomic) IBOutlet UILabel *tacklab;


@end
