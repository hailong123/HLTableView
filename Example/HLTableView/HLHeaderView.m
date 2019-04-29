//
//  HLHeaderView.m
//  HLTableView_Example
//
//  Created by SeaDragon on 2019/3/19.
//  Copyright © 2019 771145867@qq.com. All rights reserved.
//

#import "HLHeaderView.h"

@interface HLHeaderView ()

@property (nonatomic, strong) UILabel *lbl;
@property (nonatomic, strong) UIView *bgView;

@end

@implementation HLHeaderView

#pragma mark - Private Method
- (void)setupHeaderFooterView {
    [self.contentView addSubview:self.lbl];
    [self.contentView addSubview:self.bgView];
}

- (void)buildSubview {
    //标题
    self.lbl.frame = CGRectMake(0, 0, 250, 35);
    //背景
    self.bgView.frame = CGRectMake(260, 0, 100, 35);
}

- (void)loadContent {
 
    NSString *str = self.data;
    self.lbl.text = str;
}

#pragma mark - Public Method

#pragma mark - Delegate

#pragma mark - Setter And Getter
- (UILabel *)lbl {
    if (!_lbl) {
        _lbl                 = [[UILabel alloc] init];
        _lbl.backgroundColor = [UIColor redColor];
    }
    
    return _lbl;
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView                 = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor yellowColor];
    }
    
    return _bgView;
}

@end
