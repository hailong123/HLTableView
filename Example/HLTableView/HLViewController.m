//
//  HLViewController.m
//  HLTableView
//
//  Created by 771145867@qq.com on 04/11/2018.
//  Copyright (c) 2018 771145867@qq.com. All rights reserved.
//

#import "HLViewController.h"

#import "HLTableViewViewController.h"

@interface HLViewController ()

@end

@implementation HLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self presentViewController:[HLTableViewViewController new]
                       animated:YES
                     completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
