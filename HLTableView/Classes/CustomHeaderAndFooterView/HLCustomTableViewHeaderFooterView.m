//
//  HLCustomTableViewHeaderFooterView.m
//  HLTableView
//
//  Created by SeaDragon on 2018/8/28.
//

#import "HLCustomTableViewHeaderFooterView.h"

@implementation HLCustomTableViewHeaderFooterView

#pragma mark - Private Method
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self setupHeaderFooterView];
        [self buildSubview];
        [self layoutUI];
    }
    
    return self;
}

#pragma mark - Public Method
- (void)setHeaderFooterViewBackgroundColor:(UIColor *)backgroundColor {
    self.contentView.backgroundColor = backgroundColor;
}

- (void)setupHeaderFooterView {}

- (void)buildSubview {}

- (void)layoutUI {};

- (void)loadContent {}

+ (CGFloat)heightWithData:(nullable id)data {
    return 0.f;
}

@end
