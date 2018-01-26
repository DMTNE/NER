//
//  CommitStar.h
//  FTC_iOS
//
//  Created by 方静雯 on 2017/4/24.
//  Copyright © 2017年 DreamTouch. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CommitStar;

typedef void(^finishBlock)(CGFloat currentScore);

typedef  NS_ENUM(NSInteger,starStyle){
    wholeStar=0,
};

@protocol CommitStarDelegate <NSObject>

-(void)CommitStar:(CommitStar *)commitStar currentScore:(CGFloat)currentScore;

@end

@interface CommitStar : UIView
@property (nonatomic,assign)BOOL isAnimation;
@property (nonatomic,assign)starStyle starStyle;
@property (nonatomic,assign)CGFloat currentScore;
@property (nonatomic,weak)id<CommitStarDelegate>delegate;

-(instancetype)initWithFrame:(CGRect)frame;
-(instancetype)initWithFrame:(CGRect)frame numberOfStar:(NSInteger)numberOfStar starStyle:(starStyle)starStyle isAnimation:(BOOL)isAnimation delegate:(id)delegate;

-(instancetype)initWithFrame:(CGRect)frame numberOfStar:(NSInteger)numberOfStar starStyle:(starStyle)starStyle currentScore:(CGFloat)currentScore isAnimation:(BOOL)isAnimation delegate:(id)delegate;


@end
