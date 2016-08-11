//
//  HackerTheme.m
//  DYXPlugin
//
//  Created by duanqinglun on 16/8/11.
//  Copyright © 2016年 duanqinglun. All rights reserved.
//

#import "HackerTheme.h"

@implementation DVTChooserView (HackerTheme)

+ (void)load
{
    [self.class swizzle:@selector(setBackgroundColor:)];
}

- (void)sw_setBackgroundColor:(id)arg1
{
    [self sw_setBackgroundColor:[NSColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1]];
}

@end