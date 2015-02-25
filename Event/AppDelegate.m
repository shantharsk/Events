//
//  AppDelegate.m
//  Event
//
//  Created by admin on 23/02/15.
//
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize databasePath,myDataBase;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    if (![[NSUserDefaults standardUserDefaults] valueForKey:@"firstRunCompleted"])
    {
        [self createDatabase];
    }

    return YES;
}
-(NSString *) filePath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path=[[paths objectAtIndex:0] stringByAppendingPathComponent:@"vv.sqlite"];
    NSLog(@"%@",path);
    return [[paths objectAtIndex:0] stringByAppendingPathComponent:@"vv.sqlite"];
    
}


-(void)openDB{
    if (sqlite3_open([[self filePath] UTF8String], &myDataBase)!=SQLITE_OK) {
        sqlite3_close(myDataBase);
        NSAssert(0, @"Database failed to open");
        
    }else{
        NSLog(@"database opened");
    }
}

- (void)createDatabase
{
    // get the path to our data base
    NSArray *directories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *doctumentsDirectory = [directories lastObject];
    self.databasePath = [[NSString alloc] initWithString:[doctumentsDirectory stringByAppendingPathComponent:@"/vv.sqlite"]];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    // create DB if it does not already exists
    if (![fileManager fileExistsAtPath:self.databasePath]) {
        
        const char *dbPath = [self.databasePath UTF8String];
        
        if (sqlite3_open(dbPath, &myDataBase) == SQLITE_OK) {
            
            char *errorMsg;
            const char *sql_statement = "CREATE TABLE IF NOT EXISTS evet (evename TEXT, eveplace TEXT,eveimg TEXT,evtenty TEXT);";
            //  "CREATE TABLE IF NOT EXISTS cll (lnid INTEGER PRIMARY KEY,date TEXT, messgg TEXT,time TEXT,type TEXT);";
            
            if (sqlite3_exec(myDataBase, sql_statement, NULL, NULL, &errorMsg) != SQLITE_OK) {
                
                [self errorCreatingTable:[NSString stringWithFormat:@"failed creating table. ERROR:%s", errorMsg]];
            }
            
            sqlite3_close(myDataBase);
            
        } else {
            // NSLog(<#NSString *format, ...#>)
            [self errorCreatingTable:@"failed openning / creating table"];
        }
    }
}
- (void)errorCreatingTable:(NSString *)errorMsg
{
    NSLog(@"%@", errorMsg);
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
