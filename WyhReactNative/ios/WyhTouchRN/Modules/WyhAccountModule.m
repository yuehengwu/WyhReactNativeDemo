//
//  WyhAccountModule.m
//  WyhTouchRN
//
//  Created by wyh on 2018/6/28.
//  Copyright © 2018年 wyh. All rights reserved.
//

#import "WyhAccountModule.h"
#import "UIAlertController+Window.h"

@implementation WyhAccountModule

+ (void)showAccountAlertWithMsg:(NSString *)msg {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Tip" message:[NSString stringWithFormat:@"name:%@",msg] preferredStyle:(UIAlertControllerStyleAlert)];
    [alert addAction:[UIAlertAction actionWithTitle:@"cancel" style:(UIAlertActionStyleCancel) handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"ok" style:(UIAlertActionStyleDefault) handler:nil]];
    [alert show];
    
}

@end
