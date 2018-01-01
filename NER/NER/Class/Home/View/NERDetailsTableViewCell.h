//
//  NERDetailsTableViewCell.h
//  NER
//
//  Created by Fangjw on 2017/12/19.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, NERDetailsTableViewCellType) {
    NERDetailsCellIntroduce = 0,
    NERDetailsCellEle = 1,
    NERDetailsCellCharge = 2
};

@interface NERDetailsTableViewCell : UITableViewCell

-(void)updateView:(UIImage *)iconImg cellType:(NERDetailsTableViewCellType)cellType labelArray:(NSArray *)labelArray;

@end
