//
//  WyhTabBarController.m
//  WyhTouchRN
//
//  Created by wyh on 2018/6/25.
//  Copyright © 2018年 wyh. All rights reserved.
//

#import "WyhTabBarController.h"
#import "WyhNavigationController.h"
//#import "WyhMainViewController.h"

@interface WyhTabBarController ()

@end

@implementation WyhTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addChildViewControllerWithvcName:[NSClassFromString(@"WyhMainViewController") new] title:@"Home" imageName:@"home" selectedImage:@"home_sel"];
    
    [self addChildViewControllerWithvcName:[NSClassFromString(@"WyhRNViewController") new] title:@"React native" imageName:@"react" selectedImage:@"react_sel"];
    
    
}


- (void)addChildViewControllerWithvcName:(UIViewController *)vcName title:(NSString *)title imageName:(NSString *)imageName selectedImage:(NSString *)selectedImage {
    
    WyhNavigationController *NC = [[WyhNavigationController alloc]initWithRootViewController:vcName];
    NC.topViewController.title = title;
    NC.tabBarItem.image = [UIImage imageNamed:imageName];
    NC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:NC];
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
