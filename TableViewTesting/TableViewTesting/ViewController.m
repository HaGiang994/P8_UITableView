//
//  ViewController.m
//  TableViewTesting
//
//  Created by MacPro1 on 2/26/16.
//  Copyright © 2016 MacPro1. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>{
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
    phones=[NSMutableArray arrayWithObjects:@"iPhone 6",@"iPhone 6 Plus", @"Sony XPeria", @"HTC Desire", @"Galaxy S5", @"Galaxy Tab 4", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnEdit:(id)sender {
   

}

- (IBAction)btnAdd:(id)sender {
    
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Add smartphone" message:@"Please anter name of smartphone" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Add", nil];
//        alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
//        [alertView show];
    
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"Add smartphone" message:@"Please anter name of smartphone" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style: UIAlertActionStyleDefault
                                               handler:^(UIAlertAction *action){
                                                   UITextField *textField = alertView.textFields[0];
                                                   [phones addObject:textField.text];
                                                   [self.tableView reloadData];
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
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"BasicCell"];
    cell.textLabel.text=[phones objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=@"You put your detail information here";
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
//    if (buttonIndex==1) {
//        [phones addObject:[[alertView textFieldAtIndex:0] text]];
//        [self.tableView reloadData];
//    }
//}

@end
