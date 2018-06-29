//
//  WyhBussnessBridgeModule.h
//  WyhTouchRN
//
//  Created by wyh on 2018/6/28.
//  Copyright © 2018年 wyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WyhBaseBridgeModule.h"

/**
 This object will be auto-init in React Native life cycle, don't write instance-function if it isn't a single-instance.
 */
@interface WyhBussnessBridgeModule : WyhBaseBridgeModule

@property (nonatomic, copy) NSString *name;

//+ (instancetype)sharedModule;

+ (void)OC_invoke_JS:(NSInteger)functionTag;

@end
