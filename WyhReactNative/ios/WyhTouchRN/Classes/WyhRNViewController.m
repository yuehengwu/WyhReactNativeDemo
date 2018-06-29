//
//  WyhRNViewController.m
//  WyhTouchRN
//
//  Created by wyh on 2018/6/25.
//  Copyright © 2018年 wyh. All rights reserved.
//

#import "WyhRNViewController.h"
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import "UIAlertController+Window.h"
#import "WyhRNDetailViewController.h"
#import "WyhBussnessBridgeModule.h"

static NSString * const _WyhReactNative = @"WyhReactNative";

@interface WyhRNViewController ()

@end

@implementation WyhRNViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)loadView {

    self.view = [self getReactNativeView];
}


- (RCTRootView *)getReactNativeView {
    
//    NSURL *jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.bundle?platform=ios"];
    NSURL *jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
    
    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                        moduleName:_WyhReactNative
                                                 initialProperties:@{
                                                                     @"scores" : @[
                                                                             @{
                                                                                 @"name" : @"甲",
                                                                                 @"value": @"你觉得呢"
                                                                                 },
                                                                             @{
                                                                                 @"name" : @"乙",
                                                                                 @"value": @"..."
                                                                                 }
                                                                             ]
                                                                     } launchOptions:nil];
    return rootView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initialize];
    [self configUI];
    
}

- (void)initialize {
//    WyhBussnessBridgeModule *module = [WyhBussnessBridgeModule sharedModule];
//    module.name = @"我是单例";
}

- (void)configUI {
    
//    UIView *RNView = [self getReactNativeView];
//    [self.view addSubview:RNView];
    
    // can't get RN view frame.
//    [self.view setNeedsLayout];
//    [self.view layoutIfNeeded];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Push" style:(UIBarButtonItemStylePlain) target:self action:@selector(pushNextController)];
    
    UIButton *native_btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    native_btn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 75, [UIScreen mainScreen].bounds.size.height - 150, 150, 30);
    [native_btn setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
    [native_btn addTarget:self action:@selector(testModuleFuction) forControlEvents:(UIControlEventTouchUpInside)];
    [native_btn setTitle:@"OC调用JS" forState:(UIControlStateNormal)];
    
    [self.view addSubview:native_btn];
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Break point to show RN render need download!
    
}

- (void)testModuleFuction {
    
    [WyhBussnessBridgeModule OC_invoke_JS:1];
}

- (void)pushNextController {
    
    WyhRNDetailViewController *detailVC = [WyhRNDetailViewController new];
    [self.navigationController pushViewController:detailVC animated:YES];
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
