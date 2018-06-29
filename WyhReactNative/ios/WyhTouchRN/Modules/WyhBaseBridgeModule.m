//
//  WyhBaseBridgeModule.m
//  WyhTouchRN
//
//  Created by wyh on 2018/6/28.
//  Copyright © 2018年 wyh. All rights reserved.
//

#import "WyhBaseBridgeModule.h"

@implementation WyhBaseBridgeModule

#pragma mark - RCTEventEmitter

RCT_EXPORT_MODULE();

- (NSArray<NSString *> *)supportedEvents {
    return @[];
}

@end
