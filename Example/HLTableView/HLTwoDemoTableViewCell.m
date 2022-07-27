//
//  HLTwoDemoTableViewCell.m
//  HLTableView_Example
//
//  Created by SeaDragon on 2018/4/12.
//  Copyright © 2018年 771145867@qq.com. All rights reserved.
//

#import "HLTwoDemoTableViewCell.h"

#import "HLDemoModel.h"

#import "Masonry/Masonry.h"

@interface HLTwoDemoTableViewCell ()

@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *contentLbl;
@property (nonatomic, strong) UIImageView *iconImageView;

@end

@implementation HLTwoDemoTableViewCell {
    struct {
        unsigned int HLTwoDemoTableViewCellDelegate : 1;
    }_hasDes;
}

@synthesize baseCellDelegate = _baseCellDelegate;

- (void)setupCell {
    
    //头像
    [self.contentView addSubview:self.iconImageView];
    //昵称
    [self.contentView addSubview:self.nameLabel];
    //内容
    [self.contentView addSubview:self.contentLbl];
    //按钮
    [self.contentView addSubview:self.btn];
}

- (void)buildView {
    
    self.backgroundColor = [UIColor greenColor];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@15);
        make.left.equalTo(@15);
        make.width.equalTo(@80);
        make.height.equalTo(@80);
        make.bottom.equalTo(self.contentLbl.mas_top).offset(-15);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@150);
        make.height.equalTo(@35);
        make.top.equalTo(self.iconImageView).offset(5);
        make.left.equalTo(self.iconImageView.mas_right).offset(5);
    }];
    
    [self.contentLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@20);
        make.right.equalTo(@-20);
        make.bottom.equalTo(self.btn.mas_top).offset(-15);
        make.top.equalTo(self.iconImageView.mas_bottom).offset(-15);
    }];
    
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@35);
        make.height.equalTo(@35);
        make.bottom.equalTo(@-15);
        make.left.equalTo(self.iconImageView);
        make.top.equalTo(self.contentLbl.mas_bottom).offset(15);
    }];
    
    [self.contentView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickIconTap)]];
}

- (void)loadContent {
    
    HLDemoModel *demoModel = self.cellDataAdapter.data;
    self.nameLabel.text    = demoModel.nameStr;
    self.contentLbl.text = demoModel.desStr;
}

- (void)clickIconTap {
    if (_hasDes.HLTwoDemoTableViewCellDelegate) {
        [self.baseCellDelegate twoDemoTableViewCell:self];
    }
}

- (void)clickBtn:(UIButton *)bt {
   
}

#pragma mark - Setter And Getter

- (void)setBaseCellDelegate:(id<HLTwoDemoTableViewCellDelegate>)baseCellDelegate {
    
    _baseCellDelegate = baseCellDelegate;
    
    _hasDes.HLTwoDemoTableViewCellDelegate = [baseCellDelegate respondsToSelector:@selector(twoDemoTableViewCell:)];
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel           = [[UILabel alloc] init];
        _nameLabel.text      = @"昵称";
        _nameLabel.textColor = [UIColor redColor];
    }
    
    return _nameLabel;
}

- (UILabel *)contentLbl {
    if (!_contentLbl) {
        _contentLbl = [[UILabel alloc] init];
        _contentLbl.textColor     = [UIColor purpleColor];
        _contentLbl.numberOfLines = 0;
    }
    return _contentLbl;
}

- (UIImageView *)iconImageView {
    
    if (!_iconImageView) {
        _iconImageView                 = [[UIImageView alloc] init];
        _iconImageView.backgroundColor = [UIColor blueColor];
    }
    
    return _iconImageView;
}

- (UIButton *)btn {
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn.backgroundColor = [UIColor brownColor];
        [_btn addTarget:self
                 action:@selector(clickBtn:)
       forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _btn;
}

@end
