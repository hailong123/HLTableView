//
//  HLTableViewViewController.m
//  HLTableView_Example
//
//  Created by SeaDragon on 2018/4/12.
//  Copyright © 2018年 771145867@qq.com. All rights reserved.
//

#import "HLTableViewViewController.h"

#import "HLCellDataAdapter.h"

#import "HLDemoTableViewCell.h"
#import "HLTwoDemoTableViewCell.h"

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
    
    [HLDemoTableViewCell registerToTableView:self.tableView];
    [HLTwoDemoTableViewCell registerToTableView:self.tableView];
    
    [HLTwoDemoTableViewCell addTarget:self action:@selector(clickMy:twoCell:) identifier:@"HLTwoDemoTableViewCell"];
    [HLTwoDemoTableViewCell addTarget:self action:@selector(clickMyOne:twoCell:) identifier:@"111"];
    
    [self registEmptyDataState:ZMCEmptyDataStateNoData title:@"无网数据" imageNamed:@"dd"];
    
    self.demoModel = [[HLDemoModel alloc] init];
    self.demoModel.nameStr      = @"测试测试";
    self.demoModel.desStr       = @"描述";
    
    self.demoModelTwo = [[HLDemoModel alloc] init];
    self.demoModelTwo.nameStr      = @"测试测试2";
    self.demoModelTwo.desStr       = @"描述2";
    
    self.demoModelThree = [[HLDemoModel alloc] init];
    self.demoModelThree.nameStr      = @"测试测试3";
    self.demoModelThree.desStr       = @"描述3";
    
    [self.adapters addObject:[HLDemoTableViewCell fixedHeightTypeDataAdapterWithData:@(14)
                                                                     adapterDelegate:self]];
    
    [self.adapters addObject:[HLTwoDemoTableViewCell dataAdapterWithData:self.demoModel
                                                              cellHeight:100
                                                         adapterDelegate:self]];

    [self.tableView reloadData];
}

#pragma mark
- (void)refreshData {
    
    NSLog(@"******** 刷新数据 ********");
    
    [self stopRefresh];
}

- (void)loadMoreData {
    
    NSLog(@"******** 刷新数据 ********");
    
    [self stopRefresh];
}

- (void)clickEmptyEvent {
    NSLog(@"*****点击空数据刷新*******");
    [self.tableView zmc_emptyDataMnager];
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
