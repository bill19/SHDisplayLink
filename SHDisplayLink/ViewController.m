//
//  ViewController.m
//  SHDisplayLink
//
//  Created by sunhao on 2018/9/10.
//  Copyright © 2018年 Bill. All rights reserved.
//

#import "ViewController.h"
#import "SHCountDownView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SHCountDownView *v = [[SHCountDownView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:v];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
