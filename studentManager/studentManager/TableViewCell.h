//
//  TableViewCell.h
//  studentManager
//
//  Created by MacPro1 on 3/2/16.
//  Copyright © 2016 MacPro1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *fullName;
@property (strong, nonatomic) IBOutlet UILabel *info;
@property (strong, nonatomic) IBOutlet UIImageView *medal;

@end
