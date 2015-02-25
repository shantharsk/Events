//
//  listview.m
//  Event
//
//  Created by admin on 23/02/15.
//
//

#import "listview.h"
#import "listviewcell.h"
#import "detailviewlist.h"
#import "tackviewcell.h"
#import "Gridview.h"
@interface listview ()
{
    NSArray *eventna,*evtplace,*evtentry,*evtimg;
    NSString *viewmode;
    NSMutableArray *evenameb;
    NSMutableArray *eveplaceb;
    NSMutableArray *eveimgb;
    NSMutableArray *evetentyb;
     UIButton *delt;
    UIButton *displaybtn;
     NSUserDefaults *getname;
    NSString *title;
}
@end

@implementation listview
@synthesize mytableview,slidebtn,mytableview2,titname,tacktit;
@synthesize slideview = _slideview;
@synthesize layerPosition = _layerPosition;

- (void)viewDidLoad {
    [super viewDidLoad];
   // self.slideview.alpha=0;
    getname=[NSUserDefaults standardUserDefaults];
   title=[getname valueForKey:@"name"];
    NSLog(@"st%@",title);
    titname.text=title;
    tacktit.hidden=YES;
    titname.hidden=YES;
    [self GETVALUE];
    viewmode=@"list";
     self.mytableview.tableFooterView = [[UIView alloc] init] ;
    self.mytableview.dataSource = self;
    self.mytableview.delegate = self;
    
    self.mytableview2.tableFooterView = [[UIView alloc] init] ;
    self.mytableview2.dataSource = self;
    self.mytableview2.delegate = self;
    

   
    // [mytableview setEditing:YES animated:YES];
     [mytableview2 setEditing:YES animated:YES];
    
    eventna = [[NSArray alloc]initWithObjects:@"Metallica Concert",@"Saree Exhibition",@"Wine tasting event",@"Startups Meet",@"Summer Noon Party",@"Rock and Roll",@"Barbecue Fridays",@"Summer workshop",@"Impressions & Expressions",@"Italian carnival",nil];
    
    
    evtplace = [[NSArray alloc]initWithObjects:@"Palace Grounds",@"Malleswaram Grounds",@"Links Brewery",@"Kanteerava Indoor Stadium",@"Kumara Park",@"Sarjapur Road",@"Whitefield",@"Indiranagar",@"MG Road",@"Electronic City",nil];
    
    evtentry = [[NSArray alloc]initWithObjects:@"paid entry",@"free entry",@"paid entry",@"paid entry",@"paid entry",@"paid entry",@"paid entry",@"free entry",@"free entry",@"free entry",nil];
    
    evtimg = [[NSArray alloc]initWithObjects:@"image1.jpg",@"image2.jpg",@"image3.jpg",@"image4.jpg",@"image5.jpg",@"image6.jpg",@"image7.jpg",@"image8.jpg",@"image9.jpg",@"image10.jpg",nil];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     if (tableView == mytableview) {
    return eventna.count;
     }
     if (tableView == mytableview2) {
    return evenameb.count;
     }
return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == mytableview) {
        static NSString *cellIdentifier =@"Cell";
        
        
        listviewcell *cell =(listviewcell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            
            cell = [[listviewcell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        
        cell.evetname.text = [eventna objectAtIndex:indexPath.row];
        cell.place.text =[evtplace objectAtIndex:indexPath.row];
        cell.entry.text =[evtentry objectAtIndex:indexPath.row];
        
        
        
        cell.img.image = [UIImage imageNamed:[evtimg objectAtIndex:indexPath.row]];
        return cell;
    }
    if (tableView == mytableview2) {
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
      //  UIImage *btnImage1 = [UIImage imageNamed:@"view.png"];
       // [delt setBackgroundImage:btnImage1 forState:UIControlStateNormal];
        [displaybtn addTarget:self action:@selector(DEl:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:displaybtn];
         [displaybtn setTag:indexPath.row];
        return cell;
    }

  return 0;
    
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
    pollVC.viewtype=@"list";
    pollVC.tack=@"tk";
    [self presentViewController:pollVC animated:NO completion:nil];
    
    // [mytableview deleteRowsAtIndexPaths:Titlelabel withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [mytableview reloadData];
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
    
    [mytableview2 reloadData];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"listdetail"]){
        detailviewlist *controller = (detailviewlist *)segue.destinationViewController;
        // HERE I retrieve index path from parameter
        
        
        NSLog(@"indexpath = %li", (long)self.mytableview.indexPathForSelectedRow.row);
        controller.evename = [eventna objectAtIndex:self.mytableview.indexPathForSelectedRow.row];
        controller.eveimg = [evtimg objectAtIndex:self.mytableview.indexPathForSelectedRow.row];
        controller.eveplace = [evtplace objectAtIndex:self.mytableview.indexPathForSelectedRow.row];
        controller.evtentry = [evtentry objectAtIndex:self.mytableview.indexPathForSelectedRow.row];
        controller.viewtype=viewmode;
       // NSLog(@"photoid = %@", controller.flickerID);
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
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
-(void)btnshow
{
    
}

- (IBAction)swipeges:(UISwipeGestureRecognizer *)sender {
     //self.mytableview2.frame=CGRectMake(0, 62, 768, 887);
    tacktit.hidden=NO;
    titname.hidden=NO;
     if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
         
         titname.hidden=YES;
         
         slidebtn.hidden=YES;
         _slideview.frame =  CGRectMake(0, 52, 750, 972);
         [UIView animateWithDuration:0.10 animations:^{
             _slideview.frame =  CGRectMake(0, 52, 20, 972);
             
         }];
         mytableview2.frame =  CGRectMake(0,  62, 750, 887);
         [UIView animateWithDuration:1.25 animations:^{
             mytableview2.frame =  CGRectMake(0, 62, 20, 972);
         }];
         

        
          //[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(btnshow) userInfo:nil repeats:YES];
         
         slidebtn.frame =  CGRectMake(20, 500, 40, 120);
         [UIView animateWithDuration: 5.00 animations:^{
             slidebtn.frame =  CGRectMake(20, 500, 40, 120);
          
         }];
            slidebtn.hidden=NO;
     }
     if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
          titname.hidden=NO;
         
         //self.mytableview2.frame=CGRectMake(0, 62, 20, 887);
         _slideview.frame =  CGRectMake(0, 52, 768, 972);
         [UIView animateWithDuration:1.25 animations:^{
             _slideview.frame =  CGRectMake(0, 52, 768, 972);
         }];
         
         mytableview2.frame =  CGRectMake(0,  62, 768, 887);
         [UIView animateWithDuration:1.25 animations:^{
             mytableview2.frame =  CGRectMake(0, 62, 768, 972);
         }];

         
         
         slidebtn.frame =  CGRectMake(750, 500, 40, 120);
         [UIView animateWithDuration:0.25 animations:^{
             slidebtn.frame =  CGRectMake(750, 500, 40, 120);
         }];
         
        // [self animatedLayerToPoint: VIEW_HIDDENrt];
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
- (IBAction)viewswipegest:(UISwipeGestureRecognizer *)sender {
    
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        slidebtn.hidden=YES;
        
        tacktit.hidden=YES;
        titname.hidden=YES;
        _slideview.frame =  CGRectMake(0, 52, 750, 972);
        [UIView animateWithDuration:0.10 animations:^{
            _slideview.frame =  CGRectMake(0, 52, 20, 972);
            
        }];
        
        //[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(btnshow) userInfo:nil repeats:YES];
        
        slidebtn.frame =  CGRectMake(20, 500, 40, 120);
        [UIView animateWithDuration: 5.00 animations:^{
            slidebtn.frame =  CGRectMake(20, 500, 40, 120);
            
        }];
        slidebtn.hidden=NO;
    }
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        
        titname.hidden=NO;
        _slideview.frame =  CGRectMake(0, 52, 750, 972);
        [UIView animateWithDuration:1.25 animations:^{
            _slideview.frame =  CGRectMake(0, 52, 750, 972);
        }];
        
        slidebtn.frame =  CGRectMake(750, 500, 40, 120);
        [UIView animateWithDuration:0.25 animations:^{
            slidebtn.frame =  CGRectMake(750, 500, 40, 120);
        }];
        
        // [self animatedLayerToPoint: VIEW_HIDDENrt];
    }
    

}

- (IBAction)slidebtn:(id)sender {
  
     self.slideview.alpha=1;
}
- (IBAction)grid:(id)sender {
    Gridview *pollVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"gridview"];
    
    
    [self presentViewController:pollVC animated:NO completion:nil];
}
@end
