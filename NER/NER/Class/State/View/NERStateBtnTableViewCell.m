//
//  NERStateBtnTableViewCell.m
//  NER
//
//  Created by Fangjw on 2017/12/27.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import "NERStateBtnTableViewCell.h"
#import "UIButton+Masonry.h"

@interface NERStateBtnTableViewCell()

@property (nonatomic, retain) UIButton *leftBtn;

@property (nonatomic, retain) UIButton *rightBtn;

@end

@implementation NERStateBtnTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        [self createView];
    }
    return self;
}

-(void)createView{
    self.leftBtn=[UIButton buttonWithFont:[UIFont systemFontOfSize:18 weight:UIFontWeightMedium] textClolr:SECOND_COLOR backClolr:[UIColor whiteColor] radius:8 superView:self.contentView];
    self.leftBtn.layer.borderWidth=1;
    self.leftBtn.layer.borderColor=SECOND_COLOR.CGColor;
    [self.leftBtn setTitle:@"升起" forState:UIControlStateNormal];
    [self.leftBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@56);
        make.width.equalTo(@((SCREEN_WIDTH-30)/2));
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(10);
    }];
    
    self.rightBtn=[UIButton buttonWithFont:[UIFont systemFontOfSize:18 weight:UIFontWeightMedium] textClolr:[UIColor whiteColor] backClolr:SECOND_COLOR radius:8 superView:self.contentView];
    [self.rightBtn setTitle:@"下降" forState:UIControlStateNormal];
    [self.rightBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@56);
        make.width.equalTo(@((SCREEN_WIDTH-30)/2));
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView).offset(-10);
    }];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
