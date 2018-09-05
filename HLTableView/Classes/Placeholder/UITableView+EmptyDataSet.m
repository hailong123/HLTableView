//
//  UITableView+EmptyDataSet.m
//  AFNetworking
//
//  Created by SeaDragon on 2018/8/21.
//



#import "UITableView+EmptyDataSet.h"

#import <objc/runtime.h>

static const char * const kEmptyManagerKey        = "kEmptyManagerKey";

static const NSString *kImageNameKey              = @"kImageNameKey";

static const NSString *kCustomViewKey             = @"kCustomViewKey";

static const NSString *kLabelTitleKey             = @"kLabelTitleKey";
static const NSString *kLabelDescriptionKey       = @"kLabelDescriptionKey";

static const NSString *kBackgroundColorKey        = @"kBackgroundColorKey";

static const NSString *kButtonImageKey            = @"kButtonImageKey";
static const NSString *kButtonBackgroundImageKey  = @"kButtonBackgroundImageKey";


@interface HLEmptyTableManager ()

@property (nonatomic, strong) NSMutableDictionary *continuerDic;

@property (nonatomic, assign) UIControlState state;

@end

@implementation HLEmptyTableManager

#pragma mark - Private Method
+ (instancetype)shareInstance {
    static HLEmptyTableManager *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[HLEmptyTableManager alloc] init];
    });
    
    return _instance;
}

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.allowTouch  = YES;
        self.allowScroll = NO;

    }
    
    return self;
}

#pragma mark - DZNEmptyDataSetSource

#pragma mark  UILabel
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    return self.continuerDic[kLabelTitleKey] ;
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView {
    return self.continuerDic[kLabelDescriptionKey];
}

#pragma mark  UIImage
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return self.continuerDic[kImageNameKey];
}

#pragma mark  UIButton
- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView
                                          forState:(UIControlState)state {
    return self.continuerDic[@(self.state)];
}

#pragma mark  UIColor

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView {
    return self.continuerDic[kBackgroundColorKey];
}

#pragma mark  Offset
- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView {
    return self.verticalOffset;
}

- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView {
    return self.spaceHeight;
}

#pragma mark - DZNEmptyDataSetDelegate

#pragma mark  Operating
- (BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView {
    return self.isAllowTouch;
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView {
    return self.isAllowScroll;
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button {
    if (self.emptyManagerDelegate && [self.emptyManagerDelegate respondsToSelector:@selector(touchEmptyTableManager:)]) {
        [self.emptyManagerDelegate touchEmptyTableManager:self];
    }
}

- (NSMutableDictionary *)continuerDic {
    
    if (!_continuerDic) {
        _continuerDic = [NSMutableDictionary dictionary];
    }
    
    return _continuerDic;
}

@end

@implementation UITableView (EmptyDataSet)

#pragma mark - Public Method

- (void)refreshEmptyData {
    [self reloadEmptyDataSet];
}

#pragma mark - Private Method

- (void)configurationWithTitle:(NSString *)title
               titleAttributes:(NSDictionary<NSAttributedStringKey,id> *)titleAttributes
                   description:(NSString *)des
                 desAttributes:(NSDictionary<NSAttributedStringKey,id> *)desAttributes {
    
    NSAttributedString *desAttr   = [[NSAttributedString alloc] initWithString:des attributes:desAttributes];
    NSAttributedString *titleAttr = [[NSAttributedString alloc] initWithString:title attributes:titleAttributes];
    
    [self.emptyManager.continuerDic setObject:[self convertNull:titleAttr] forKey:kLabelTitleKey];
    [self.emptyManager.continuerDic setObject:[self convertNull:desAttr]   forKey:kLabelDescriptionKey];
}

- (void)configurationBackgroundColor:(UIColor *)backgroundColor {
    
    NSParameterAssert(backgroundColor);
    
    [self.emptyManager.continuerDic setObject:backgroundColor  forKey:kBackgroundColorKey];
}

- (void)configurationWithImage:(UIImage *)image
                         title:(nullable NSString *)title
                    attributes:(nullable NSDictionary<NSAttributedStringKey,id> *)attributes {
    
    NSParameterAssert(image);
    
    NSAttributedString *attr;
    
    if (title.length > 0) {
        self.emptyManager.allowTouch = YES;
        attr = [[NSAttributedString alloc] initWithString:title attributes:attributes];
    } else {
        self.emptyManager.allowTouch = NO;
        attr = [[NSAttributedString alloc] initWithString:@" "];
    }

    [self.emptyManager.continuerDic setObject:image forKey:kImageNameKey];
    [self.emptyManager.continuerDic setObject:attr  forKey:@(self.emptyManager.state)];
}

- (NSString *)convertNull:(id)object {
    
    // 转换空串
    if ([object isEqual:[NSNull null]]) {
        return @"";
    } else if ([object isKindOfClass:[NSNull class]]) {
        return @"";
    } else if (object == nil) {
        return @"";
    }
    
    return object;
}

#pragma mark Setter And Getter
- (void)setEmptyManager:(HLEmptyTableManager *)emptyManager {
    objc_setAssociatedObject(self, &kEmptyManagerKey, emptyManager, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (HLEmptyTableManager *)emptyManager {
    
    HLEmptyTableManager *empty = objc_getAssociatedObject(self, &kEmptyManagerKey);
    
    if (!empty) {

        empty           = [HLEmptyTableManager shareInstance];
        empty.tableView = self;

        self.emptyManager         = empty;

        self.emptyDataSetSource   = empty;
        self.emptyDataSetDelegate = empty;
    }
    
    return empty;
}

@end
