//
//  NERMenuButton.h
//  NER
//
//  Created by Fangjw on 2017/12/11.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NERMenuButtonDelegate <NSObject>

-(void)choiceMenu:(NSInteger)choiceCount;

@end

@interface NERMenuButton : UIView

@property (nonatomic, weak)id<NERMenuButtonDelegate>nerMenuButtonDelegate;

-(instancetype)initWithFrame:(CGRect)frame menuArray:(NSArray *)menuArray listArray:(NSArray *)listArray;

@end
