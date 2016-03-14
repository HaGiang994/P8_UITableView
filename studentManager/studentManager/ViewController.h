//
//  ViewController.h
//  studentManager
//
//  Created by MacPro1 on 3/2/16.
//  Copyright © 2016 MacPro1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListViewController.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *fullName;
@property (weak, nonatomic) IBOutlet UITextField *birth;
@property (weak, nonatomic) IBOutlet UITextField *diemVan;
@property (weak, nonatomic) IBOutlet UITextField *diemToan;
@property (weak, nonatomic) IBOutlet UITextField *diemLy;
@property (weak, nonatomic) IBOutlet UITextField *diemSu;
@property (weak, nonatomic) IBOutlet UILabel *lblNoti;
- (IBAction)btnSave:(id)sender;
- (IBAction)btnHightestScore:(id)sender;
//- (IBAction)btnListView:(id)sender;
- (IBAction)btnListView:(id)sender;
- (IBAction)btnListSV:(id)sender;

@property NSMutableArray *listSV;

@end

