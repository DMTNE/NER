//
//  NERRecommendView.h
//  NER
//
//  Created by Fangjw on 2017/12/11.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NERRecommendView : UIView

@property (nonatomic) dispatch_block_t recommendBlock;

@property (nonatomic) dispatch_block_t navigationBlock;

@end
