//
//  HLTableViewViewController.m
//  HLTableView_Example
//
//  Created by SeaDragon on 2018/4/12.
//  Copyright © 2018年 771145867@qq.com. All rights reserved.
//

#import "HLTableViewViewController.h"

#import "HLCellDataAdapter.h"

#import "HLHeaderView.h"
#import "HLFooterView.h"

#import "HLDemoTableViewCell.h"
#import "HLTwoDemoTableViewCell.h"

#import "UITableViewHeaderFooterView+DataAdapter.h"

#import "HLDemoModel.h"

@interface HLTableViewViewController ()
<
HLTwoDemoTableViewCellDelegate
>

@property (nonatomic, strong) HLDemoModel *demoModel;
@property (nonatomic, strong) HLDemoModel *demoModelTwo;
@property (nonatomic, strong) HLDemoModel *demoModelThree;

@end

@implementation HLTableViewViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    [HLHeaderView registerToTableView:self.tableView];
    [HLFooterView registerToTableView:self.tableView];
    
    [HLDemoTableViewCell registerToTableView:self.tableView];
    [HLTwoDemoTableViewCell registerToTableView:self.tableView];
    
    self.demoModel = [[HLDemoModel alloc] init];
    self.demoModel.nameStr      = @"测试测试";
    self.demoModel.desStr       =  @"ad法师打发撒打发打发发生发顺丰打发斯蒂芬ad法师打发撒打发打发发生发顺丰打发斯蒂芬ad法师打发撒打发打发发生发顺丰打发斯蒂芬ad法师打发撒打";
    
    self.demoModelTwo = [[HLDemoModel alloc] init];
    self.demoModelTwo.nameStr      = @"测试测试2";
    self.demoModelTwo.desStr       = @"发撒打发打发发生发顺丰打发斯蒂芬ad法师打发撒打发打发发生发顺丰打发斯蒂芬ad法师打发撒打发打发发生发顺丰打发斯蒂芬ad法师打发撒打发打发发生发顺丰打发斯蒂芬ad法师打发撒打发打发发生发顺丰打发斯蒂芬ad法师打发撒打发打发发生发顺丰打发斯蒂芬ad法师打发撒打发打发发生发顺丰打发斯蒂芬ad法师打发撒打发打发发生发顺丰打发斯蒂芬ad法师打发撒打发打发发生发顺丰打发斯蒂芬ad法师打发撒打发打发发生发顺丰打发斯蒂芬ad法师打发撒打发打发发生发顺丰打发斯蒂芬ad法师打发撒打发打发发生发顺丰打发斯蒂芬ad法师打发撒打发打发发";
    
    self.demoModelThree = [[HLDemoModel alloc] init];
    self.demoModelThree.nameStr      = @"测试测试3";
    self.demoModelThree.desStr       = @"发";
    
    //普通模式
    HLCellDataAdapter *dataA = [HLTwoDemoTableViewCell dataAdapterWithData:self.demoModelTwo
                                                        adapterDelegate:self];
    
    HLCellDataAdapter *dataB =  [HLTwoDemoTableViewCell dataAdapterWithData:self.demoModel
                                                            adapterDelegate:self];
    
    HLCellDataAdapter *dataC =  [HLTwoDemoTableViewCell dataAdapterWithData:self.demoModelThree
                                                            adapterDelegate:self];
    
    //!!!!:多Section模式
    HLCellHeaderAndFooterDataAdapter *hfAdapterA = [HLCellHeaderAndFooterDataAdapter cellHeaderAndFooterDataAdapterWithIdentifier:NSStringFromClass([HLHeaderView class]) delegate:self height:185 data:@"打点滴" type:AdapterHeightTypeHeader];
//
    HLCellHeaderAndFooterDataAdapter *hfAdapterB = [HLCellHeaderAndFooterDataAdapter cellHeaderAndFooterDataAdapterWithIdentifier:NSStringFromClass([HLFooterView class]) delegate:self height:185 data:@"打发打发打发斯蒂芬" type:AdapterHeightTypeFooter];
    
//    HLCellDataAdapter *sectionAdapter1 = [HLCellDataAdapter cellDataAdapterWithAdapterArray:@[dataA,dataB,dataC]
//                                                                              headerAdapter:hfAdapterA
//                                                                              footreAdapter:hfAdapterB];
//    HLCellDataAdapter *sectionAdapter2 = [HLCellDataAdapter cellDataAdapterWithAdapterArray:@[dataA,dataB,dataA,dataB,dataA,dataB,dataA,dataB,dataA,dataB,dataA,dataB,dataA,dataB] headerAdapter:hfAdapterA footreAdapter:hfAdapterB];
//    HLCellDataAdapter *sectionAdapter3 = [HLCellDataAdapter cellDataAdapterWithAdapterArray:@[dataA,dataB,dataB,dataB] headerAdapter:nil footreAdapter:hfAdapterB];
//    HLCellDataAdapter *sectionAdapter4 = [HLCellDataAdapter cellDataAdapterWithAdapterArray:@[dataA,dataB,dataB,dataB,dataB,dataB,dataB,dataB,dataB]];
//    HLCellDataAdapter *sectionAdapter5 = [HLCellDataAdapter cellDataAdapterWithAdapterArray:@[dataA,dataB,dataB,dataB,dataB,dataB,dataB,dataB] headerAdapter:hfAdapterA footreAdapter:hfAdapterB];
//    HLCellDataAdapter *sectionAdapter6 = [HLCellDataAdapter cellDataAdapterWithAdapterArray:@[dataA,dataB,dataB,dataB,dataB,dataB,dataB,dataB,dataB,dataB,dataB] headerAdapter:hfAdapterA footreAdapter:hfAdapterB];
//    HLCellDataAdapter *sectionAdapter7 = [HLCellDataAdapter cellDataAdapterWithAdapterArray:@[dataA,dataB,dataB,dataB,dataB,dataB] headerAdapter:nil footreAdapter:hfAdapterB];
//                                                                              headerAdapter:hfAdapterA
//                                                                              footreAdapter:hfAdapterB];
//
//    dataA.headerAdapter = hfAdapterA;
    
    //无section模式
    [self.adapters addObject:dataB];
    [self.adapters addObject:dataA];
    [self.adapters addObject:dataB];
    [self.adapters addObject:dataC];
//    [self.adapters addObject:dataB];
//    [self.adapters addObject:dataB];
//    [self.adapters addObject:dataB];
//    [self.adapters addObject:dataB];
//    [self.adapters addObject:dataB];
//    [self.adapters addObject:dataB];
//    [self.adapters addObject:dataB];
//    [self.adapters addObject:dataB];
//
    //多section模式
//    [self.adapters addObject:sectionAdapter1];
//    [self.adapters addObject:sectionAdapter2];
//    [self.adapters addObject:sectionAdapter3];
//    [self.adapters addObject:sectionAdapter4];
//    [self.adapters addObject:sectionAdapter5];
//    [self.adapters addObject:sectionAdapter6];
//    [self.adapters addObject:sectionAdapter7];
    
    [self reloadTableView];
}

//- (void)configTableViewStyle {
//    self.tableViewStyle = UITableViewStylePlain;
//}

#pragma mark
- (void)refreshData {
    
    NSLog(@"******** 刷新数据 ********");
    
    [self stopRefresh];
}

- (void)loadMoreData {
    
    NSLog(@"******** 刷新数据 ********");
    
    [self stopRefresh];
}


#pragma mark HLTwoDemoTableViewCellDelegate
- (void)twoDemoTableViewCell:(HLTwoDemoTableViewCell *)cell {
    
    //更新cell高度
    
    //cell.backgroundColor = [UIColor orangeColor];
    //[cell updateWithNewCellHeight:200 animated:YES];
    
    NSLog(@"******点击事件*******");
}

- (void)clickMy:(HLCellDataAdapter *)cellDataAdapter twoCell:(HLTwoDemoTableViewCell *)cell {
    NSLog(@"**********");
}

- (void)clickMyOne:(HLCellDataAdapter *)cellData twoCell:(HLTwoDemoTableViewCell *)cell {
    NSLog(@"******00000000000****");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
