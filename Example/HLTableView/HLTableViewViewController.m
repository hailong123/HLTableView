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

@end

@implementation HLTableViewViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    [HLDemoTableViewCell registerToTableView:self.tableView];
    [HLTwoDemoTableViewCell registerToTableView:self.tableView];
    
    [self registEmptyDataState:ZMCEmptyDataNoDataText title:@"无网数据" imageNamed:@""];
    
    self.demoModel = [[HLDemoModel alloc] init];
    self.demoModel.nameStr      = @"测试测试";
    self.demoModel.desStr       = @"描述";
    self.demoModel.cellDelegate = self;
    
    [self.adapters addObject:[HLDemoTableViewCell fixedHeightTypeDataAdapterWithData:@(14)]];

    [self.adapters addObject:[HLTwoDemoTableViewCell dataAdapterWithData:self.demoModel cellHeight:100]];

    [self.adapters addObject:[HLDemoTableViewCell fixedHeightTypeDataAdapterWithData:@(15)]];

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

#pragma mark HLTwoDemoTableViewCellDelegate
- (void)twoDemoTableViewCell:(HLTwoDemoTableViewCell *)cell {
    NSLog(@"*******************");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
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
