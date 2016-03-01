//
//  ViewController.m
//  TableViewTesting
//
//  Created by MacPro1 on 2/26/16.
//  Copyright © 2016 MacPro1. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>{
    NSMutableArray *phones;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)btnEdit:(id)sender;
- (IBAction)btnAdd:(id)sender;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //phones=[NSMutableArray arrayWithObjects:@"iPhone 6",@"iPhone 6 Plus", @"Sony XPeria", @"HTC Desire", @"Galaxy S5", @"Galaxy Tab 4", nil];

    NSDictionary *iphone6Dict = [NSDictionary dictionaryWithObjectsAndKeys:
                               
                                 @"iPhone 6",@"name",
                               
                                 @"iphone6.png",@"image",
                               
                                 @"iPhone 6 isn't simply bigger — it's better in every way. Larger, yet dramatically thinner. More powerful, but remarkably power efficient.",@"detail", nil];
    
    NSDictionary *iphone6PlusDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                   
                                @"iPhone 6 Plus",@"name",
                                   
                                @"iphone6plus",@"image",
                                   
                                @"Apple iPhone 6 Plus smartphone with 5.50-inch 1080x1920 display alongside 1GB RAM and 8-megapixel rear camera.",@"detail" ,nil];
    
    NSDictionary *xperiaDict = [NSDictionary dictionaryWithObjectsAndKeys:
                              
                                @"Sony XPeria",@"name",
                              
                                @"xperiaz",@"image",
                              
                                @"Xperia Z – the precision engineered Full HD smartphone from Sony with a razor sharp, super bright display.",@"detail",nil];
    
    NSDictionary *htcDict = [NSDictionary dictionaryWithObjectsAndKeys:
                           
                                @"HTC Desire",@"name",
                           
                                @"htcdesign",@"image",
                           
                                @"HTC Desire 816 Android smartphone. Announced 2014, February. Features 3G, 5.5″ Super LCD2 capacitive touchscreen, 13 MP camera, Wi-Fi, GPS",@"detail",nil];
    
    NSDictionary *galaxys5Dict = [NSDictionary dictionaryWithObjectsAndKeys:
                                
                                @"Galaxy S5",@"name",
                                
                                @"galaxys5",@"image",
                                
                                @"Samsung Galaxy S5 is an Android smartphone produced by Samsung Electronics. Unveiled on 24 February 2014 at Mobile World Congress in Barcelona",@"detail",nil];
    
    NSDictionary *tab4Dict = [NSDictionary dictionaryWithObjectsAndKeys:
                            
                                @"Galaxy Tab 4",@"name",
                            
                                @"tab4",@"image",
                            
                                @"Designed with the whole family in mind, the Samsung Galaxy Tab® 4 offers endless entertainment options. The new Multi User Mode, brilliant display",@"detail",nil];
    
    phones = [NSMutableArray arrayWithObjects:iphone6Dict,iphone6PlusDict,xperiaDict,htcDict,galaxys5Dict,tab4Dict, nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnEdit:(id)sender {
    if (self.tableView.editing){
        [self.tableView setEditing:NO animated:YES];
    }else{
        [self.tableView setEditing:YES animated:YES];
    }
}

- (IBAction)btnAdd:(id)sender {
    
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Add smartphone" message:@"Please anter name of smartphone" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Add", nil];
//        alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
//        [alertView show];
   
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"Add smartphone" message:@"Please enter name of smartphone" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style: UIAlertActionStyleDefault
                                               handler:^(UIAlertAction *action){
                                                   UITextField *textField = alertView.textFields[0];
                                                   NSDictionary *newPhone = [NSDictionary dictionaryWithObjectsAndKeys:
                                                                             textField.text,@"name",
                                                                             @"placeholder",@"image",
                                                                             @"This is my new phone",@"detail",nil];
                                                   [phones addObject:newPhone];
                                                   [self.tableView reloadData];
//                                                 [phones addObject:textField.text];
//                                                 [self.tableView reloadData];
                                               }];
    
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style: UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction *action){
                                                       NSLog(@"cancel btn");
                                                       [alertView dismissViewControllerAnimated:YES completion:nil];
                                                   }];
    [alertView addAction:ok];
    [alertView addAction:cancel];
    
    [alertView addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.placeholder = @"phone name";
        textField.keyboardType = UIKeyboardTypeDefault;
       
    }];
    [self presentViewController:alertView animated:YES completion:nil];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return phones.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"myCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    NSDictionary *phoneDict = [phones objectAtIndex:indexPath.row];
    
    UIImageView *phoneImage = (UIImageView*)[cell viewWithTag:8];
    
    phoneImage.image = [UIImage imageNamed:[phoneDict objectForKey:@"image"]];
    
    UILabel *phoneName = (UILabel*)[cell viewWithTag:9];
    
    phoneName.text = [phoneDict objectForKey:@"name"];
    
    UILabel *phoneDetail = (UILabel*)[cell viewWithTag:10];
    
    phoneDetail.text = [phoneDict objectForKey:@"detail"];
    
//    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"BasicCell"];
//    cell.textLabel.text=[phones objectAtIndex:indexPath.row];
//    cell.detailTextLabel.text=@"You put your detail information here";
//    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 84.0f;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:
    (NSIndexPath *)indexPath{
    
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [phones removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
//    if (buttonIndex==1) {
//        
//        NSDictionary *newPhone = [NSDictionary dictionaryWithObjectsAndKeys:
//                                  
//                                  [[alertView textFieldAtIndex:0] text],@"name",
//                                  
//                                  @"placeholder",@"image",
//                                  
//                                  @"This is my new phone",@"detail",nil];
//        
//        [phones addObject:newPhone];
//        
//        
//        [phones addObject:[[alertView textFieldAtIndex:0] text]];
//        [self.tableView reloadData];
//}
//}

@end
