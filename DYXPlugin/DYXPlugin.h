//
//  DYXPlugin.h
//  DYXPlugin
//
//  Created by duanqinglun on 15/12/25.
//  Copyright © 2015年 duanqinglun. All rights reserved.
//

#import "XcodeInterface.h"

@class DYXPlugin;

static DYXPlugin *sharedPlugin;

@interface DYXPlugin : NSObject

@property (nonatomic, strong, readonly) NSBundle *bundle;

+ (instancetype)sharedPlugin;
- (id)initWithBundle:(NSBundle *)plugin;

@end