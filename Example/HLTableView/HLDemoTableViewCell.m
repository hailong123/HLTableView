//
//  HLDemoTableViewCell.m
//  HLTableView_Example
//
//  Created by SeaDragon on 2018/4/12.
//  Copyright © 2018年 771145867@qq.com. All rights reserved.
//

#import "HLDemoTableViewCell.h"

@interface HLDemoTableViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation HLDemoTableViewCell

- (void)buildView {
    
    [self.contentView addSubview:self.titleLabel];
    
    self.contentView.backgroundColor = [UIColor redColor];
    
    self.titleLabel.frame = self.bounds;
}

- (void)loadContent {
    self.titleLabel.text = [NSString stringWithFormat:@"%@",self.data];
    if ([self.data integerValue] == 14) {
        self.backgroundColor = [UIColor orangeColor];
    }
}

+ (CGFloat)cellHeightWithData:(id)data {
    return 80;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel           = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor yellowColor];
    }
    
    return _titleLabel;
}

@end
