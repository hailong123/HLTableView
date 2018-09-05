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
    }
    
    return self;
}

#pragma mark - Public Method
- (void)setHeaderFooterViewBackgroundColor:(UIColor *)backgroundColor {
    self.contentView.backgroundColor = backgroundColor;
}

- (void)setupHeaderFooterView {}

- (void)buildSubview {}

- (void)loadContent {
    [[NSException exceptionWithName:@"方法调用错误" reason:@"此方法需子类重写" userInfo:nil] raise];
}

+ (CGFloat)heightWithData:(nullable id)data {
    return 0.f;
}

@end
