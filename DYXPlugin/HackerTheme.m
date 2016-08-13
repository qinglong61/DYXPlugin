//
//  HackerTheme.m
//  DYXPlugin
//
//  Created by duanqinglun on 16/8/11.
//  Copyright © 2016年 duanqinglun. All rights reserved.
//

#import "DYXPlugin.h"

@interface DVTChooserView : NSView
- (void)setBackgroundColor:(id)arg1;
@end

@implementation DVTChooserView (HackerTheme)

+ (void)load
{
    [self.class swizzle:@selector(setBackgroundColor:)];
}

- (void)sw_setBackgroundColor:(id)arg1
{
    [self sw_setBackgroundColor:[NSColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1]];
}

@end

@interface DVTBorderedView : NSView
@property(copy, nonatomic) NSColor *backgroundColor;
@property(copy, nonatomic) NSColor *inactiveBackgroundColor;
@end
@implementation DVTBorderedView (HackerTheme)

+ (void)load
{
    [self.class swizzle:@selector(drawRect:)];
}

- (void)sw_drawRect:(NSRect)dirtyRect
{
    self.backgroundColor = [NSColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1];
    [self sw_drawRect:dirtyRect];
}

@end

@interface IDEPathControl : NSPathControl
@end

@implementation IDEPathControl (HackerTheme)

+ (void)load
{
    [self.class swizzle:@selector(drawRect:)];
}

- (void)sw_drawRect:(NSRect)dirtyRect
{
    self.backgroundColor = [NSColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1];
    [self sw_drawRect:dirtyRect];
}

@end

@interface IDEPathComponentCell : NSPathComponentCell

- (void)drawInteriorWithFrame:(struct CGRect)arg1 inView:(id)arg2;
- (void)drawWithFrame:(struct CGRect)arg1 inView:(id)arg2;
- (void)_drawDividerForFrame:(struct CGRect)arg1 inControlView:(id)arg2;
- (void)_drawChevronDividerInFrame:(struct CGRect)arg1 isActive:(BOOL)arg2 isDemiSize:(BOOL)arg3;

@end

@implementation IDEPathComponentCell (HackerTheme)

+ (void)load
{
    [self.class swizzle:@selector(drawInteriorWithFrame:inView:)];
//    [self.class swizzle:@selector(textColor)];
}

- (void)sw_drawInteriorWithFrame:(struct CGRect)arg1 inView:(id)arg2
{
    [[NSColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1] set];
    [[NSBezierPath bezierPathWithRect:arg1] fill];
    
    [self sw_drawInteriorWithFrame:arg1 inView:arg2];
}

//- (NSColor *)sw_textColor
//{
//    return [NSColor redColor];
//}

@end