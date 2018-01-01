//
//  NERChoiceView.h
//  NER
//
//  Created by Fangjw on 2017/12/7.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NERChoiceViewDelegate <NSObject>

-(void)toDetailsView;

@end

@interface NERChoiceView : UIView

@property (nonatomic, weak)id<NERChoiceViewDelegate>nerChoiceViewDelegate;

@end
