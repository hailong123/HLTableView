//
//  UITableView+EmptyDataSet.m
//  AFNetworking
//
//  Created by SeaDragon on 2018/8/21.
//

#import "UITableView+EmptyDataSet.h"

#import <objc/runtime.h>

#define NStringFormat(format,...) [NSString stringWithFormat:format,__VA_ARGS__]

static const char * const kEmptyManagerKey        = "kEmptyManagerKey";

static NSString const *kImageNameKey              = @"kImageNameKey";

static NSString const *kCustomViewKey             = @"kCustomViewKey";

static NSString const *kLabelTitleKey             = @"kLabelTitleKey";
static NSString const *kLabelDescriptionKey       = @"kLabelDescriptionKey";

static NSString const *kBackgroundColorKey        = @"kBackgroundColorKey";

static NSString const *kButtonTitleKey            = @"kButtonTitleKey";
static NSString const *kButtonImageKey            = @"kButtonImageKey";
static NSString const *kButtonBackgroundImageKey  = @"kButtonBackgroundImageKey";

static inline NSString const *fetchKeyFormKey(NSString const *key, HLEmptyTableManagerState state, NSString *className) {
    
    if (state == HLEmptyTableManagerStateDefault) {
        return key;
    }
    
    return NStringFormat(@"%@%lu%@",key,(unsigned long)state,className);
}

static inline NSString *fetchDataSourceKey(id <UITableViewDataSource>dataSource) {
    
    NSString *tmp = NStringFormat(@"%@",dataSource);
    
    return [tmp componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@":<"]][1];
}

@interface WeakObj : NSObject

@property (nonatomic, readonly, weak) id data;

- (instancetype)initWithWeakObj:(id)data;

@end

@implementation WeakObj

- (instancetype)initWithWeakObj:(id)data {
    if (self = [super init]) {
        _data = data;
    }
    
    return self;
}

@end

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
        _instance = [[self alloc] init];
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
    return self.continuerDic[fetchKeyFormKey(kLabelTitleKey, self.emptyState,fetchDataSourceKey(self.tableView.dataSource))] ;
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView {
    return self.continuerDic[fetchKeyFormKey(kLabelDescriptionKey, self.emptyState,fetchDataSourceKey(self.tableView.dataSource))];
}

#pragma mark  UIImage
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return self.continuerDic[fetchKeyFormKey(kImageNameKey, self.emptyState,fetchDataSourceKey(self.tableView.dataSource))];
}

#pragma mark  UIButton
- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView
                                          forState:(UIControlState)state {
    return self.continuerDic[fetchKeyFormKey(kButtonTitleKey, self.emptyState,fetchDataSourceKey(self.tableView.dataSource))];
}

#pragma mark  UIColor

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView {
    return self.continuerDic[fetchKeyFormKey(kBackgroundColorKey, self.emptyState,fetchDataSourceKey(self.tableView.dataSource))];
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

- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view {
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

- (HLEmptyTableManagerState)hl_emptyTableManagerState {
    return self.emptyManager.emptyState;
}

#pragma mark - Private Method

- (void)configurationWithTitle:(NSString *)title
               titleAttributes:(NSDictionary<NSAttributedStringKey,id> *)titleAttributes
                   description:(NSString *)des
                 desAttributes:(NSDictionary<NSAttributedStringKey,id> *)desAttributes
                         state:(HLEmptyTableManagerState)emptyState {
    
    NSAttributedString *desAttr   = [[NSAttributedString alloc] initWithString:des attributes:desAttributes];
    NSAttributedString *titleAttr = [[NSAttributedString alloc] initWithString:title attributes:titleAttributes];
    
    [self.emptyManager.continuerDic setObject:[self convertNull:titleAttr]
                                       forKey:fetchKeyFormKey(kLabelTitleKey, emptyState,fetchDataSourceKey(self.dataSource))];
    
    [self.emptyManager.continuerDic setObject:[self convertNull:desAttr]
                                       forKey:fetchKeyFormKey(kLabelDescriptionKey, emptyState,fetchDataSourceKey(self.dataSource))];
}

- (void)configurationBackgroundColor:(UIColor *)backgroundColor
                               state:(HLEmptyTableManagerState)emptyState {
    
    NSParameterAssert(backgroundColor);
    
    [self.emptyManager.continuerDic setObject:backgroundColor
                                       forKey:fetchKeyFormKey(kBackgroundColorKey, emptyState,fetchDataSourceKey(self.dataSource))];
}

- (void)configurationWithImageNamed:(NSString *)imageNamed
                              title:(nullable NSString *)title
                         attributes:(nullable NSDictionary<NSAttributedStringKey,id> *)attributes
                        description:(nullable NSString *)des
                      desAttributes:(nullable NSDictionary<NSAttributedStringKey,id> *)desAttributes
                              state:(HLEmptyTableManagerState)emptyState {
    
    NSParameterAssert(imageNamed);
    
    NSAttributedString *attr;
    NSAttributedString *desAttr;
    
    if (title.length > 0) {
        self.emptyManager.allowTouch = YES;
        attr = [[NSAttributedString alloc] initWithString:title attributes:attributes];
    } else {
        self.emptyManager.allowTouch = NO;
        attr = [[NSAttributedString alloc] initWithString:@" "];
    }
    
    if (des.length > 0) {
        desAttr = [[NSAttributedString alloc] initWithString:des attributes:desAttributes];
    }
    
    if ([[self convertNull:[UIImage imageNamed:[self convertNull:imageNamed]]] isKindOfClass:[UIImage class]]) {
        [self.emptyManager.continuerDic setObject:[UIImage imageNamed:imageNamed]
                                           forKey:fetchKeyFormKey(kImageNameKey, emptyState,fetchDataSourceKey(self.dataSource))];
    }
    
    [self.emptyManager.continuerDic setObject:attr
                                       forKey:fetchKeyFormKey(kButtonTitleKey, emptyState,fetchDataSourceKey(self.dataSource))];
    
    [self.emptyManager.continuerDic setObject:[self convertNull:desAttr]
                                       forKey:fetchKeyFormKey(kLabelDescriptionKey, emptyState,fetchDataSourceKey(self.dataSource))];
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
    objc_setAssociatedObject(self, &kEmptyManagerKey, [[WeakObj alloc] initWithWeakObj:emptyManager], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (HLEmptyTableManager *)weakEmptyManager {
    
    WeakObj *obj = objc_getAssociatedObject(self, &kEmptyManagerKey);
    
    return obj.data;
}

- (HLEmptyTableManager *)emptyManager {
    
    HLEmptyTableManager *empty = [self weakEmptyManager];
    
    if (!empty) {
        
        empty = [HLEmptyTableManager shareInstance];
        
        self.emptyManager         = empty;
        
        self.emptyDataSetSource   = empty;
        self.emptyDataSetDelegate = empty;
    }
    
    if (empty.tableView != self) {
        empty.tableView = self;
    }
    
    return empty;
}

@end

