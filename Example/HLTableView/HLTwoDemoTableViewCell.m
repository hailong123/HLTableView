//
//  HLTwoDemoTableViewCell.m
//  HLTableView_Example
//
//  Created by SeaDragon on 2018/4/12.
//  Copyright © 2018年 771145867@qq.com. All rights reserved.
//

#import "HLTwoDemoTableViewCell.h"

#import "HLDemoModel.h"

@interface HLTwoDemoTableViewCell ()

@property (nonatomic, strong) UILabel *nameLabel;
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
    
}

- (void)buildView {
    
    self.backgroundColor     = [UIColor greenColor];
    
    self.nameLabel.frame     = CGRectMake(30 + 10, 10, 200, 30);
    
    self.iconImageView.frame = CGRectMake(10, 10, 20, 20);
    
    [self.contentView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickIconTap)]];
}

- (void)loadContent {
    
    HLDemoModel *demoModel = self.cellDataAdapter.data;
    self.baseCellDelegate  = self.cellDataAdapter.cellDataAdapterDelegate;
    self.nameLabel.text    = demoModel.nameStr;
}

- (void)clickIconTap {
    if (_hasDes.HLTwoDemoTableViewCellDelegate) {
        [self.baseCellDelegate twoDemoTableViewCell:self];
    }
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

- (UIImageView *)iconImageView {
    
    if (!_iconImageView) {
        _iconImageView                 = [[UIImageView alloc] init];
        _iconImageView.backgroundColor = [UIColor blueColor];
    }
    
    return _iconImageView;
}

@end
