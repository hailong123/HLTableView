//
//  UITableView+EmptyDataSet.m
//  AFNetworking
//
//  Created by SeaDragon on 2018/8/21.
//



#import "UITableView+EmptyDataSet.h"

#import <objc/runtime.h>

static const char * const kEmptyManagerKey      = "kEmptyManagerKey";

static const NSString *kImageNameKey            = @"kImageNameKey";

static const NSString *kCustomViewKey           = @"kCustomViewKey";

static const NSString *kLabelTitleKey           = @"kLabelTitleKey";
static const NSString *kLabelDescriptionKey     = @"kLabelDescriptionKey";

static const NSString *kBackgroundColorKey      = @"kBackgroundColorKey";

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

- (void)configurationWithTitle:(NSString *)title description:(NSString *)des {
    
    NSAttributedString *desAttr   = [[NSAttributedString alloc] initWithString:des];
    NSAttributedString *titleAttr = [[NSAttributedString alloc] initWithString:title];
    
    [self.emptyManager.continuerDic setObject:[self convertNull:titleAttr] forKey:kLabelTitleKey];
    [self.emptyManager.continuerDic setObject:[self convertNull:desAttr]   forKey:kLabelDescriptionKey];
}

- (void)configurationWithButtonTitle:(NSString *)buttonTitle
                         buttonImage:(UIImage *)buttonImage
                     backgroundImage:(UIImage *)backgroundImage
                        controlState:(UIControlState)state {
    
    NSParameterAssert(buttonImage);
    NSParameterAssert(backgroundImage);
    
    self.emptyManager.state       = state;
    NSAttributedString *desAttr   = [[NSAttributedString alloc] initWithString:buttonTitle];
    
    [self.emptyManager.continuerDic setObject:desAttr
                                       forKey:@(self.emptyManager.state)];
    [self.emptyManager.continuerDic setObject:buttonImage
                                       forKey:kButtonImageKey];
    [self.emptyManager.continuerDic setObject:backgroundImage
                                       forKey:kButtonBackgroundImageKey];
}

- (void)configurationBackgroundColor:(UIColor *)backgroundColor {
    
    NSParameterAssert(backgroundColor);
    
    [self.emptyManager.continuerDic setObject:backgroundColor  forKey:kBackgroundColorKey];
}

- (void)configurationWithImage:(UIImage *)image {
    
    NSParameterAssert(image);
    
    [self.emptyManager.continuerDic setObject:[self convertNull:@" "]
                                       forKey:@(self.emptyManager.state)];
    
    [self.emptyManager.continuerDic setObject:image forKey:kImageNameKey];
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
