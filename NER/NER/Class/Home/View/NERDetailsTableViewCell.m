//
//  NERDetailsTableViewCell.m
//  NER
//
//  Created by Fangjw on 2017/12/19.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import "NERDetailsTableViewCell.h"
#import "UILabel+Masonry.h"
#import "UIView+Masonry.h"
#import "UIImageView+Masonry.h"

@interface NERDetailsTableViewCell()

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UIImageView *iconImg;

@property (nonatomic, strong) NSArray *labelArray;

@property (nonatomic) NERDetailsTableViewCellType type;

@end

@implementation NERDetailsTableViewCell

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
    self.iconImg=[UIImageView imgWithBackClolr:nil image:nil superView:self.contentView];
    [self.iconImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@40);
        make.left.equalTo(self.contentView).offset(15);
        make.centerY.equalTo(self.contentView);
    }];
    
    self.lineView=[UIView viewbackClolr:LINE_COLOR superView:self.contentView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@1);
        make.left.right.bottom.equalTo(self.contentView);
    }];
}

-(void)updateView:(UIImage *)iconImg cellType:(NERDetailsTableViewCellType)cellType labelArray:(NSArray *)labelArray{
    _labelArray=labelArray;
    _type=cellType;
    self.iconImg.image=iconImg;
    
    switch (_type) {
        case NERDetailsCellIntroduce:
            [self createIntroduceEleView];
            break;
            
        case NERDetailsCellEle:
            [self createIntroduceEleView];
            break;
        case NERDetailsCellCharge:
            [self createChargeView];
            break;
    }
}

-(void)createIntroduceEleView{
    UILabel *firstLabel=[UILabel labelWithFont:[UIFont systemFontOfSize:16 weight:UIFontWeightRegular] textClolr:TEXT_COLOR_TITLE superView:self.contentView];
    firstLabel.text = _labelArray[0]?_labelArray[0]:@"";
    firstLabel.textAlignment = NSTextAlignmentLeft;
    firstLabel.numberOfLines=0;
    [firstLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImg.mas_right).offset(15);
        make.top.equalTo(self.contentView).offset(20);
        make.bottom.equalTo(self.contentView.mas_centerY).offset(-5);
    }];
    
    UILabel *secondLabel=[UILabel labelWithFont:[UIFont systemFontOfSize:16 weight:UIFontWeightRegular] textClolr:TEXT_COLOR_TITLE superView:self.contentView];
    secondLabel.text = _labelArray[1]?_labelArray[1]:@"";
    secondLabel.textAlignment = NSTextAlignmentLeft;
    secondLabel.numberOfLines=0;
    [secondLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImg.mas_right).offset(15);
        make.top.equalTo(self.contentView.mas_centerY).offset(5);
        make.bottom.equalTo(self.lineView.mas_top).offset(-20);
    }];
    
    if (_type==NERDetailsCellEle){
        [firstLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-20);
        }];
        [secondLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-20);
        }];
    }
    
    if (_type==NERDetailsCellIntroduce) {
        
        CGSize sizeo =[firstLabel.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16 weight:UIFontWeightRegular]}];
        CGSize sizet =[secondLabel.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16 weight:UIFontWeightRegular]}];
        
        [firstLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(sizeo.width>sizet.width?sizeo.width:sizet.width));
        }];
        [secondLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(sizeo.width>sizet.width?sizeo.width:sizet.width));
        }];
        
        UILabel *firstDLabel=[UILabel labelWithFont:[UIFont systemFontOfSize:16 weight:UIFontWeightRegular] textClolr:TEXT_COLOR_TITLE superView:self.contentView];
        firstDLabel.text = _labelArray[2]?_labelArray[2]:@"";
        firstDLabel.textAlignment = NSTextAlignmentLeft;
        firstDLabel.numberOfLines=0;
        [firstDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(firstLabel.mas_right);
            make.right.equalTo(self.contentView).offset(-20);
            make.centerY.equalTo(firstLabel);
        }];
        
        UILabel *secondDLabel=[UILabel labelWithFont:[UIFont systemFontOfSize:16 weight:UIFontWeightRegular] textClolr:TEXT_COLOR_TITLE superView:self.contentView];
        secondDLabel.text = _labelArray[3]?_labelArray[3]:@"";
        secondDLabel.textAlignment = NSTextAlignmentLeft;
        secondDLabel.numberOfLines=0;
        [secondDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(secondLabel.mas_right);
            make.right.equalTo(self.contentView).offset(-20);
            make.centerY.equalTo(secondLabel);
        }];
    }
}

-(void)createChargeView{
    UILabel *label=[UILabel labelWithFont:[UIFont systemFontOfSize:16 weight:UIFontWeightRegular] textClolr:TEXT_COLOR_TITLE superView:self.contentView];
    label.text = _labelArray[0]?_labelArray[0]:@"";
    label.textAlignment = NSTextAlignmentLeft;
    label.numberOfLines=0;
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImg.mas_right).offset(15);
        make.right.equalTo(self.contentView).offset(-20);
        make.top.equalTo(self.contentView).offset(20);
        make.bottom.equalTo(self.lineView.mas_top).offset(-20);
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
