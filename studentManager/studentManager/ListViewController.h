//
//  listView.h
//  studentManager
//
//  Created by MacPro1 on 3/2/16.
//  Copyright © 2016 MacPro1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
//#import "Header.h"
//NSMutableArray *_listSV;
@protocol sendData <NSObject>
-(void)sendDataToA:(NSMutableArray *)array;
@end

@interface ListViewController : UIViewController
//@property NSArray* listSV;
@property NSMutableArray *listSV;
@property int indexSelected;
@property NSInteger count;
@property (weak, nonatomic) IBOutlet UILabel *counter;
@property (weak, nonatomic) IBOutlet UITextField *fullName;
@property (weak, nonatomic) IBOutlet UITextField *birth;
@property (weak, nonatomic) IBOutlet UITextField *diemVan;
@property (weak, nonatomic) IBOutlet UITextField *diemToan;
@property (weak, nonatomic) IBOutlet UITextField *diemLy;
@property (weak, nonatomic) IBOutlet UITextField *diemSu;
- (IBAction)btnFirst:(id)sender;
- (IBAction)btnPrevious:(id)sender;
- (IBAction)btnNext:(id)sender;
- (IBAction)btnLast:(id)sender;
- (IBAction)btnDelete:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnDelete;
- (void)showInformationOfIndex:(int)index;
@property (nonatomic,assign)id delegate;


@end
