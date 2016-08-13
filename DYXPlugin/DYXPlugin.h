//
//  DYXPlugin.h
//  DYXPlugin
//
//  Created by duanqinglun on 15/12/25.
//  Copyright © 2015年 duanqinglun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import <objc/runtime.h>

@interface NSObject (GrowingIO)

+ (void)swizzle:(SEL)selector;
+ (void)swizzleClass:(SEL)selector;

@end

@class DYXPlugin;

static DYXPlugin *sharedPlugin;

@interface DYXPlugin : NSObject

@property (nonatomic, strong, readonly) NSBundle *bundle;

+ (instancetype)sharedPlugin;
- (id)initWithBundle:(NSBundle *)plugin;

@end