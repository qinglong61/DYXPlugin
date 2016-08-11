//
//  NSObject_Extension.m
//  DYXPlugin
//
//  Created by duanqinglun on 15/12/25.
//  Copyright © 2015年 duanqinglun. All rights reserved.
//


#import "NSObject_Extension.h"
#import "DYXPlugin.h"

@implementation NSObject (Xcode_Plugin_Template_Extension)

+ (void)pluginDidLoad:(NSBundle *)plugin
{
    static dispatch_once_t onceToken;
    NSString *currentApplicationName = [[NSBundle mainBundle] infoDictionary][@"CFBundleName"];
    if ([currentApplicationName isEqual:@"Xcode"]) {
        dispatch_once(&onceToken, ^{
            sharedPlugin = [[DYXPlugin alloc] initWithBundle:plugin];
        });
    }
}

+ (void)swizzle:(SEL)selector
{
    SEL newSelector = NSSelectorFromString([@"GIO" stringByAppendingString:NSStringFromSelector(selector)]);
    method_exchangeImplementations(class_getInstanceMethod([self class], selector),
                                   class_getInstanceMethod([self class], newSelector));
}

+ (void)swizzleClass:(SEL)selector
{
    SEL newSelector = NSSelectorFromString([@"GIO" stringByAppendingString:NSStringFromSelector(selector)]);
    method_exchangeImplementations(class_getClassMethod([self class], selector),
                                   class_getClassMethod([self class], newSelector));
}

@end