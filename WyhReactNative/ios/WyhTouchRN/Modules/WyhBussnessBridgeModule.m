//
//  WyhBussnessBridgeModule.m
//  WyhTouchRN
//
//  Created by wyh on 2018/6/28.
//  Copyright © 2018年 wyh. All rights reserved.
//

#import "WyhBussnessBridgeModule.h"
#import "WyhAccountModule.h"

static NSString * const ReactNativeNotifi = @"ReactNativeNotifi";

@interface WyhBussnessBridgeModule()



@end

@implementation WyhBussnessBridgeModule

static WyhBussnessBridgeModule *_module = nil;


//+ (instancetype)sharedModule {
//    if (_module == nil) {
//        _module = [[WyhBussnessBridgeModule alloc]init];
//    }
//    return _module;
//}
//
//+ (instancetype)allocWithZone:(struct _NSZone *)zone {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        _module = [super allocWithZone:zone];
//    });
//    return _module;
//}

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(openTestLog:(NSString *)log){
    // thread is 'com.facebook.react.<#module name#>'
    [self JS_invoke_OC];
}

- (void)JS_invoke_OC {
    // default is not in main queue.
    dispatch_async(dispatch_get_main_queue(), ^{
        [WyhAccountModule showAccountAlertWithMsg:@"JS invoke OC"];
    });
    
    NSLog(@"%@: Test log !",self.name);
}

+ (void)OC_invoke_JS:(NSInteger)functionTag {
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:ReactNativeNotifi object:@{@"tag":@(functionTag)}];
    
}


- (void)handleReactNativeNotifi:(NSNotification *)notifi {
    NSDictionary *info = notifi.object;
    NSLog(@"当前应当执行的方法的tag:%@",info[@"tag"]);
    [self sendEventWithName:@"iOS_Native" body:@{
                                                 @"tag":info[@"tag"]
                                                 }];
}

#pragma mark - RCTEventEmitter

- (NSArray<NSString *> *)supportedEvents {
    return @[@"iOS_Native"];
}

- (void)startObserving {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleReactNativeNotifi:) name:ReactNativeNotifi object:nil];
}

- (void)stopObserving {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

// to JS const value.
- (NSDictionary *)constantsToExport {
    return @{@"calender":@"我就是日历！！！"};
}

@end
