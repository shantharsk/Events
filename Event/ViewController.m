//
//  ViewController.m
//  Event
//
//  Created by admin on 23/02/15.
//
//

#import "ViewController.h"
#import "listview.h"
#import "tackviewcell.h"
#import "detailviewlist.h"
@interface ViewController ()

@end

@implementation ViewController
{
    NSUserDefaults *userName;
    NSString *name;
    NSMutableArray *evenameb;
    NSMutableArray *eveplaceb;
    NSMutableArray *eveimgb;
    NSMutableArray *evetentyb;
    UIButton *delt;
    UIButton *displaybtn;
    NSUserDefaults *getname;
    NSString *title;
}
@synthesize username,mytableview,titname,slidebtn,tacktit;
@synthesize slideview = _slideview;
@synthesize layerPosition = _layerPosition;
- (void)viewDidLoad {
    [super viewDidLoad];
    getname=[NSUserDefaults standardUserDefaults];
    title=[getname valueForKey:@"name"];
    NSLog(@"st%@",title);
    titname.text=title;
    
    tacktit.hidden=YES;
    titname.hidden=YES;
    [self GETVALUE];
    self.mytableview.tableFooterView = [[UIView alloc] init] ;
    self.mytableview.dataSource = self;
    self.mytableview.delegate = self;
    //viewmode=@"grid";
    [mytableview setEditing:YES animated:YES];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submit:(id)sender {
    
    name=username.text;
    
    userName=[NSUserDefaults standardUserDefaults];
    [userName setObject:name forKey:@"name"];
    
    listview *pollVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"listview"];
    
    
    [self presentViewController:pollVC animated:NO completion:nil];
    NSLog(@"Name%@",userName);
}
-(NSString *) filePath1{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path=[[paths objectAtIndex:0] stringByAppendingPathComponent:@"vv.sqlite"];
    NSLog(@"%@",path);
    return [[paths objectAtIndex:0] stringByAppendingPathComponent:@"vv.sqlite"];
    
}


-(void)openDB1{
    if (sqlite3_open([[self filePath1] UTF8String], &db1)!=SQLITE_OK) {
        sqlite3_close(db1);
        NSAssert(0, @"Database failed to open");
        
    }else{
        NSLog(@"database opened");
    }
}
-(void)GETVALUE{
    
    [self openDB1];
    
    eveimgb =[[NSMutableArray alloc]init];
    evenameb =[[NSMutableArray alloc]init];
    eveplaceb =[[NSMutableArray alloc]init];
    evetentyb =[[NSMutableArray alloc]init];
    
    NSString *sql =[NSString stringWithFormat:@"SELECT * FROM evet"];
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(db1, [sql UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement)== SQLITE_ROW) {
            
            
            
            char *field0 = (char *)sqlite3_column_text(statement, 0);
            NSString *field0Str =[[NSString alloc]initWithUTF8String:field0];
            
            char *field2 = (char *)sqlite3_column_text(statement, 1);
            NSString *field2Str =[[NSString alloc]initWithUTF8String:field2];
            char *field1 = (char *)sqlite3_column_text(statement, 2);
            NSString *field1Str =[[NSString alloc]initWithUTF8String:field1];
            
            char *field3 = (char *)sqlite3_column_text(statement, 3);
            NSString *field3Str =[[NSString alloc]initWithUTF8String:field3];
            
            
            NSString *str0 = [[NSString alloc]initWithFormat:@"%@",field0Str];
            NSString *str = [[NSString alloc]initWithFormat:@"%@",field1Str];
            NSString *str1 = [[NSString alloc]initWithFormat:@"%@",field2Str];
            NSString *str3 = [[NSString alloc]initWithFormat:@"%@",field3Str];
            
            // NSString *str2 = [[NSString alloc]initWithFormat:@"%@",field3Str];
            [eveimgb addObject:str];
            [eveplaceb addObject:str1];
            [evenameb addObject:str0];
            [evetentyb addObject:str3];
            NSLog(@"%@",eveimgb);
            NSLog(@"%@",eveplaceb);
            NSLog(@"%@",eveplaceb);
            // [array2 addObject:str2];
            
            
        }
        
    }
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return evenameb.count;
    
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *cellIdentifier =@"Cell";
    
    
    tackviewcell *cell =(tackviewcell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        
        cell = [[tackviewcell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.evena.text = [evenameb objectAtIndex:indexPath.row];
    cell.evepl.text =[eveplaceb objectAtIndex:indexPath.row];
    cell.eveten.text =[evetentyb objectAtIndex:indexPath.row];
    
    
    
    cell.img.image = [UIImage imageNamed:[eveimgb objectAtIndex:indexPath.row]];
    
    delt = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    delt.frame =CGRectMake(550, 30, 60, 50);
    UIImage *btnImage = [UIImage imageNamed:@"cancel.png"];
    [delt setBackgroundImage:btnImage forState:UIControlStateNormal];
    [delt addTarget:self action:@selector(Acceptrequest:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:delt];
    [delt setTag:indexPath.row];
    
    
    displaybtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    displaybtn.frame =CGRectMake(650, 40, 60, 30);
    [displaybtn setTitle:@"View" forState:UIControlStateNormal];
    [displaybtn addTarget:self action:@selector(DEl:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:displaybtn];
    [displaybtn setTag:indexPath.row];
    return cell;
    
    
}
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return UITableViewCellEditingStyleNone;
}
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    
}

-(IBAction)DEl:(id)sender
{
    UIButton *btn =(UIButton*)sender;
    
    NSString *str=[evenameb objectAtIndex:btn.tag];
    NSLog(@"%@",str);
    
    NSString *ss = [eveplaceb objectAtIndex:btn.tag];
    NSString *kk =[eveimgb objectAtIndex:btn.tag];
    NSString *mm =[evetentyb objectAtIndex:btn.tag];
    NSLog(@"%@,%@",ss,kk);
    
    detailviewlist *pollVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"detail"];
    // pollVC.message=message.text;
    pollVC.evename=str;
    pollVC.eveplace=ss;
    pollVC.eveimg=kk;
    pollVC.evtentry=mm;
    pollVC.viewtype=@"home";
    pollVC.tack=@"tk";
    [self presentViewController:pollVC animated:NO completion:nil];
    
    // [mytableview deleteRowsAtIndexPaths:Titlelabel withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [mytableview reloadData];
}
- (IBAction)swipeges:(UISwipeGestureRecognizer *)sender {
    titname.hidden=NO;
    tacktit.hidden=NO;

    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        _slideview.frame =  CGRectMake(0, 0, 750, 1024);
        [UIView animateWithDuration:0.10 animations:^{
            _slideview.frame =  CGRectMake(0, 0, 20, 1024);
            
        }];
        
        mytableview.frame =  CGRectMake(0,  60, 750, 887);
        [UIView animateWithDuration:1.25 animations:^{
            mytableview.frame =  CGRectMake(0, 60, 20, 972);
        }];
        //[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(btnshow) userInfo:nil repeats:YES];
        
        slidebtn.frame =  CGRectMake(20, 500, 40, 120);
        [UIView animateWithDuration: 5.00 animations:^{
            slidebtn.frame =  CGRectMake(20, 500, 40, 120);
            
        }];
        
    }
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        _slideview.frame =  CGRectMake(0, 0, 750, 1024);
        [UIView animateWithDuration:0.25 animations:^{
            _slideview.frame =  CGRectMake(0, 0, 750, 1024);
        }];
        
        mytableview.frame =  CGRectMake(0,  60, 750, 887);
        [UIView animateWithDuration:1.25 animations:^{
            mytableview.frame =  CGRectMake(0, 60, 750, 972);
        }];
        
        slidebtn.frame =  CGRectMake(750, 500, 40, 120);
        [UIView animateWithDuration:0.25 animations:^{
            slidebtn.frame =  CGRectMake(750, 500, 40, 120);
        }];
        
        // [self animatedLayerToPoint: VIEW_HIDDENrt];
    }
    
}

- (IBAction)viewswipegest:(UISwipeGestureRecognizer *)sender {
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        
        titname.hidden=YES;
        tacktit.hidden=YES;

        _slideview.frame =  CGRectMake(0, 0, 750, 1024);
        [UIView animateWithDuration:0.10 animations:^{
            _slideview.frame =  CGRectMake(0, 0, 20, 1024);
            
        }];
        
        //[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(btnshow) userInfo:nil repeats:YES];
        
        slidebtn.frame =  CGRectMake(20, 500, 40, 120);
        [UIView animateWithDuration: 5.00 animations:^{
            slidebtn.frame =  CGRectMake(20, 500, 40, 120);
            
        }];
        
    }
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        
        //titname.hidden=NO;
        _slideview.frame =  CGRectMake(0, 0, 750, 1024);
        [UIView animateWithDuration:0.25 animations:^{
            _slideview.frame =  CGRectMake(0, 52, 750, 1024);
        }];
        
        slidebtn.frame =  CGRectMake(750, 500, 40, 120);
        [UIView animateWithDuration:0.25 animations:^{
            slidebtn.frame =  CGRectMake(750, 500, 40, 120);
        }];
        
        // [self animatedLayerToPoint: VIEW_HIDDENrt];
    }
    
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
-(IBAction)Acceptrequest:(id)sender
{
    UIButton *btn =(UIButton*)sender;
    // NSIndexPath *indexPath = [NSIndexPath indexPathForRow:btn.tag inSection:0];
    NSString *str=[evenameb objectAtIndex:btn.tag];
    NSLog(@"%@",str);
    NSString *sql = [NSString stringWithFormat:@"delete from evet  WHERE evename='%@'",str];
    NSLog(@"%@",sql);
    //NSLog(@"%@",sql);
    [self Deletedata:sql];
    [evenameb removeObjectAtIndex:btn.tag];
    [evetentyb removeObjectAtIndex:btn.tag];
    [eveimgb removeObjectAtIndex:btn.tag];
    [eveplaceb removeObjectAtIndex:btn.tag];
    // [mytableview deleteRowsAtIndexPaths:Titlelabel withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [mytableview reloadData];
}


@end
