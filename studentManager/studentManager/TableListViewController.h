//
//  tableListView.h
//  studentManager
//
//  Created by MacPro1 on 3/2/16.
//  Copyright © 2016 MacPro1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCell.h"

@protocol sendData <NSObject>
- (void)sendDataToA:(NSMutableArray *)array;
@end

@interface TableListViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet TableViewCell *tableView;
@property NSMutableArray *listSV;
@property (weak, nonatomic) IBOutlet UITableView *tableListView;
@property (weak, nonatomic) IBOutlet UILabel *lblTittle;
- (IBAction)diemToan:(id)sender;
- (IBAction)diemLy:(id)sender;
- (IBAction)diemVan:(id)sender;
- (IBAction)diemSu:(id)sender;
@property (nonatomic,assign)id delegate;

@end
