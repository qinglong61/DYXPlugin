//
//  XcodeInterface.h
//  XPlugin
//
//  Created by duanqinglun on 16/7/11.
//  Copyright © 2016年 GrowingIO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

@interface DVTChooserView : NSView
- (void)setBackgroundColor:(id)arg1;
@end

#import <objc/runtime.h>

@interface NSObject (GrowingIO)

+ (void)swizzle:(SEL)selector;
+ (void)swizzleClass:(SEL)selector;

@end