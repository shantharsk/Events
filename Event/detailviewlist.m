//
//  detailviewlist.m
//  Event
//
//  Created by admin on 23/02/15.
//
//

#import "detailviewlist.h"
#import "listview.h"
#import "Gridview.h"
#import "ViewController.h"
@interface detailviewlist ()
{
   // NSString *evename,*eveplace,*eveimg,*evetenty;
}
@end

@implementation detailviewlist
@synthesize evename,eveplace,eveimg,evtentry,viewtype,labenty,labevename,labeveplace,img,select,tack,tacklab;
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"evetname%@",evename);
     NSLog(@"evetplace%@",eveplace);
     NSLog(@"evetimg%@",eveimg);
     NSLog(@"evetentry%@",evtentry);
      NSLog(@"evetentry%@",viewtype);
    
    labevename.text=evename;
    labeveplace.text=eveplace;
    labenty.text=evtentry;
    [select setBackgroundImage:[UIImage imageNamed:@"unselect.png"] forState:UIControlStateNormal];
    [select setBackgroundImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateSelected];
    //[select setBackgroundImage:[UIImage imageNamed:@"unselect.png"] forState:UIControlStateNormal];
    
    self.img.image=[UIImage imageNamed:eveimg];
    
    if ([tack isEqualToString:@"tk"]) {
        
        tacklab.hidden=YES;
        select.hidden=YES;
        
    }
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(NSString *) filePath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path=[[paths objectAtIndex:0] stringByAppendingPathComponent:@"vv.sqlite"];
    NSLog(@"%@",path);
    return [[paths objectAtIndex:0] stringByAppendingPathComponent:@"vv.sqlite"];
    
}


-(void)openDB{
    if (sqlite3_open([[self filePath] UTF8String], &db1)!=SQLITE_OK) {
        sqlite3_close(db1);
        NSAssert(0, @"Database failed to open");
        
    }else{
        NSLog(@"database opened");
    }
}

-(void)Insertdata:(NSString*)query{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *databasePath = [documentsDirectory stringByAppendingPathComponent:@"vv.sqlite"];
    
    if(sqlite3_open([databasePath UTF8String],&db1) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat: @"%@",query];
        
        char *errmsg=nil;
        
        if(sqlite3_exec(db1, [querySQL UTF8String], NULL, NULL, &errmsg)==SQLITE_OK)
        {
            //[spinner stopAnimating];
            NSLog(@".. Row Added ..");
        }
    }
    sqlite3_close(db1);
}
-(void)Deletedata:(NSString*)query{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *databasePath = [documentsDirectory stringByAppendingPathComponent:@"vv.sqlite"];
    
    if(sqlite3_open([databasePath UTF8String],&db1) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat: @"%@",query];
        
        char *errmsg=nil;
        
        if(sqlite3_exec(db1, [querySQL UTF8String], NULL, NULL, &errmsg)==SQLITE_OK)
        {
            //[spinner stopAnimating];
            NSLog(@".. Row Deleted ..");
        }
    }
    sqlite3_close(db1);
}

- (IBAction)back:(id)sender {
    
    if ([viewtype isEqualToString:@"list"]) {
        listview *pollVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"listview"];
       
        
        [self presentViewController:pollVC animated:NO completion:nil];
        
    }
    
    else if([viewtype isEqualToString:@"grid"])
    {
        Gridview *pollVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"gridview"];
        
        
        [self presentViewController:pollVC animated:NO completion:nil];
    }
    
     else if([viewtype isEqualToString:@"home"]){
        ViewController *pollVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"home"];
        
        
        [self presentViewController:pollVC animated:NO completion:nil];
    }
}

- (IBAction)tack:(id)sender {
    if ([sender isSelected]) {
        [select setBackgroundImage:[UIImage imageNamed:@"unselect.png"] forState:UIControlStateNormal];
        NSLog(@"notselect");
        NSString *sql = [NSString stringWithFormat:@"delete from evet  WHERE evename='%@'",evename];
        NSLog(@"%@",sql);
        //NSLog(@"%@",sql);
        [self Deletedata:sql];

        [sender setSelected: NO];
    } else {
        [select setBackgroundImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateSelected];
        NSString *sql = [NSString stringWithFormat:@"INSERT INTO evet ('evename','eveplace','eveimg','evtenty') VALUES ('%@','%@','%@','%@')",evename,eveplace,eveimg,evtentry];
        NSLog(@"%@",sql);
        //NSLog(@"%@",sql);
       [self Insertdata:sql];
        NSLog(@"select");
        [sender setSelected: YES];
        ///[rd1 setSelected:NO];
        //[rd2 setSelected:NO];
    }

}
@end
