//
//  WyhMainViewController.m
//  WyhTouchRN
//
//  Created by wyh on 2018/6/25.
//  Copyright © 2018年 wyh. All rights reserved.
//

#import "WyhMainViewController.h"

@interface WyhMainViewController ()

@end

@implementation WyhMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel *label = [[UILabel alloc]init];
    label.font = [UIFont boldSystemFontOfSize:50.f];
    label.text = @"Hello World";
    [label sizeToFit];
    label.center = self.view.center;
    [self.view addSubview:label];
    
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
