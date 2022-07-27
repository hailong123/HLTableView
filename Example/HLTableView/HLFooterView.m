//
//  HLFooterView.m
//  HLTableView_Example
//
//  Created by SeaDragon on 2019/3/20.
//  Copyright © 2019 771145867@qq.com. All rights reserved.
//

#import "HLFooterView.h"

#import <Masonry/Masonry.h>

@interface HLFooterView ()

@property (nonatomic, strong) UILabel *lbl;
@property (nonatomic, strong) UIView *bgView;

@end

@implementation HLFooterView

#pragma mark - Private Method
- (void)setupHeaderFooterView {
    [self.contentView addSubview:self.lbl];
    [self.contentView addSubview:self.bgView];
}

- (void)buildSubview {
    
    //标题
    [self.lbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@15);
        make.left.equalTo(@15);
        make.height.equalTo(@30);
        make.width.equalTo(@100);
    }];
    
    //背景
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@100);
        make.height.equalTo(@100);
        make.left.equalTo(self.lbl);
        make.top.equalTo(self.lbl.mas_bottom).offset(15);
    }];
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
        _lbl.backgroundColor = [UIColor orangeColor];
    }
    
    return _lbl;
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView                 = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor blueColor];
    }
    
    return _bgView;
}


@end
