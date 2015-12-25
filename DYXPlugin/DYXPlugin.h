//
//  DYXPlugin.h
//  DYXPlugin
//
//  Created by duanqinglun on 15/12/25.
//  Copyright © 2015年 duanqinglun. All rights reserved.
//

#import <AppKit/AppKit.h>

@class DYXPlugin;

static DYXPlugin *sharedPlugin;

@interface DYXPlugin : NSObject

+ (instancetype)sharedPlugin;
- (id)initWithBundle:(NSBundle *)plugin;

@property (nonatomic, strong, readonly) NSBundle* bundle;
@end