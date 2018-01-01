//
//  TableViewCell.h
//  BCP
//
//  Created by Harry on 2017/12/18.
//  Copyright © 2017年 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;
@property (weak, nonatomic) IBOutlet UILabel *Label;
@property (weak, nonatomic) IBOutlet UITextField *TextField;
@property (weak, nonatomic) IBOutlet UIButton *ListBtn;

@end
