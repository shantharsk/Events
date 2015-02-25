//
//  AppDelegate.h
//  Event
//
//  Created by admin on 23/02/15.
//
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    sqlite3 *db1;
}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSString *databasePath;
@property (nonatomic) sqlite3 *myDataBase;

@end

