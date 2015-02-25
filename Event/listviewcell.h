//
//  listviewcell.h
//  Event
//
//  Created by admin on 23/02/15.
//
//

#import <UIKit/UIKit.h>

@interface listviewcell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *img;
@property (strong, nonatomic) IBOutlet UILabel *evetname;
@property (strong, nonatomic) IBOutlet UILabel *place;
@property (strong, nonatomic) IBOutlet UILabel *entry;

@end
