//
//  CommitStar.m
//  FTC_iOS
//
//  Created by 方静雯 on 2017/4/24.
//  Copyright © 2017年 DreamTouch. All rights reserved.
//

#import "CommitStar.h"


#define choiceStar @"collection"
#define noChoiceStar @"star"
typedef void(^commitBlock)(CGFloat currentScore);

@interface CommitStar()

@property(nonatomic,strong)UIView *choiceStarView;
@property(nonatomic,strong)UIView *noChoiceStarView;
@property(nonatomic,assign)NSInteger starCount;
@property(nonatomic,strong)commitBlock commit;

@end


@implementation CommitStar

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        _starCount=5;
        _starStyle=wholeStar;
        [self creatStar];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame numberOfStar:(NSInteger)numberOfStar starStyle:(starStyle)starStyle isAnimation:(BOOL)isAnimation delegate:(id)delegate{
    if(self=[super initWithFrame:frame]){
        _starCount=numberOfStar;
        _starStyle=starStyle;
        _isAnimation=isAnimation;
        _delegate=delegate;
        [self creatStar];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame numberOfStar:(NSInteger)numberOfStar starStyle:(starStyle)starStyle currentScore:(CGFloat)currentScore isAnimation:(BOOL)isAnimation delegate:(id)delegate{
    if(self=[super initWithFrame:frame]){
        _starCount=numberOfStar;
        _starStyle=starStyle;
        _currentScore=currentScore;
        _isAnimation=isAnimation;
        _delegate=delegate;
        [self creatStar];
    }
    return self;
}


-(void)creatStar{
    self.choiceStarView=[self creatStarView:choiceStar];
    self.noChoiceStarView=[self creatStarView:noChoiceStar];
    
    self.choiceStarView.frame=CGRectMake(0, 0, self.bounds.size.width*_currentScore/_starCount, self.bounds.size.height);
    [self addSubview:self.noChoiceStarView];

    [self addSubview:self.choiceStarView];
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(commit:)];
    tap.numberOfTapsRequired=1;
    [self addGestureRecognizer:tap];
    
}


-(UIView *)creatStarView:(NSString *)imageName{
    UIView *view=[[UIView alloc]initWithFrame:self.bounds];
    view.clipsToBounds = YES;
    view.backgroundColor=[UIColor clearColor];
    for (NSInteger i=0; i<_starCount; i++) {
        UIImageView *imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
        imageView.frame=CGRectMake(i*self.bounds.size.width/_starCount, 0, self.bounds.size.width/_starCount, self.bounds.size.height);
        imageView.contentMode=UIViewContentModeScaleAspectFit;
        [view addSubview:imageView];
        
    }
    return view;
}
                  
                  
-(void)commit:(UITapGestureRecognizer *)tap{
    CGPoint tapPoint = [tap locationInView:self];
    CGFloat offset = tapPoint.x;
    CGFloat realStarScore = offset / (self.bounds.size.width / _starCount);
    switch (_starStyle) {
        case wholeStar:
        {
            self.currentScore = ceilf(realStarScore);
            break;
        }
           default:
            break;
    }
    
}
                  
-(void)layoutSubviews {
    [super layoutSubviews];
    __weak CommitStar *weakSelf = self;
    CGFloat animationTimeInterval = self.isAnimation ? 0.2 : 0;
    [UIView animateWithDuration:animationTimeInterval animations:^{
        weakSelf.choiceStarView.frame = CGRectMake(0, 0, weakSelf.bounds.size.width * weakSelf.currentScore/_starCount, weakSelf.bounds.size.height);
    }];
}

-(void)setCurrentScore:(CGFloat)currentScore {
    if (_currentScore == currentScore) {
        return;
    }
    if (currentScore < 0) {
        _currentScore = 0;
    } else if (currentScore > _starCount) {
        _currentScore = _starCount;
    } else {
        _currentScore = currentScore;
    }
    if ([self.delegate respondsToSelector:@selector(CommitStar:currentScore:)]) {
        [self.delegate CommitStar:self currentScore:_currentScore];
    }
    if (self.commit) {
        _commit(_currentScore);
    }
    [self setNeedsLayout];
}
                  
                  
                  
                  
                  
@end
