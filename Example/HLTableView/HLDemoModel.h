//
//  HLDemoModel.h
//  HLTableView_Example
//
//  Created by SeaDragon on 2018/4/18.
//  Copyright © 2018年 771145867@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HLDemoModel : NSObject

@property (nonatomic, copy) NSString *nameStr;
@property (nonatomic, copy) NSString *desStr;
@property (nonatomic, weak) id delegate;

@end
