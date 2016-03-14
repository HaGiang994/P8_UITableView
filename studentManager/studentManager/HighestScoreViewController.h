//
//  highestScoreView.h
//  studentManager
//
//  Created by MacPro1 on 3/2/16.
//  Copyright © 2016 MacPro1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HighestScoreViewController : UIViewController
@property NSMutableArray *listSV;
@property (weak, nonatomic) IBOutlet UITextField *fullName;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UITextField *score;
- (IBAction)diemVan:(id)sender;
- (IBAction)diemToan:(id)sender;
- (IBAction)diemSu:(id)sender;
- (IBAction)diemLy:(id)sender;

@end
