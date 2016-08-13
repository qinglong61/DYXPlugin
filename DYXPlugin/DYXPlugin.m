//
//  DYXPlugin.m
//  DYXPlugin
//
//  Created by duanqinglun on 15/12/25.
//  Copyright © 2015年 duanqinglun. All rights reserved.
//

#import "DYXPlugin.h"

@interface DYXPlugin()

@property (nonatomic, strong, readwrite) NSBundle *bundle;
@end

@implementation DYXPlugin

+ (instancetype)sharedPlugin
{
    return sharedPlugin;
}

- (id)initWithBundle:(NSBundle *)plugin
{
    if (self = [super init]) {
        self.bundle = plugin;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didApplicationFinishLaunchingNotification:)
                                                     name:NSApplicationDidFinishLaunchingNotification
                                                   object:nil];
        
//        [[NSNotificationCenter defaultCenter] addObserver:self
//                                                 selector:@selector(filterNotification:)
//                                                     name:nil
//                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(windowWillBecomeVisible:)
                                                     name:@"_NSWindowWillBecomeVisible"
                                                   object:nil];
    }
    return self;
}

- (void)didApplicationFinishLaunchingNotification:(NSNotification*)notify
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSApplicationDidFinishLaunchingNotification object:nil];
    [self addMenu];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textSelectionDidChange:) name:NSTextViewDidChangeSelectionNotification object:nil];
}

- (void)windowWillBecomeVisible:(NSNotification *)notify
{
    if ([notify.object isKindOfClass:NSClassFromString(@"IDEWorkspaceWindow")]) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:@"_NSWindowWillBecomeVisible" object:nil];
        [self changeWindow:notify.object];
    }
}

- (void)filterNotification:(NSNotification*)notify
{
//    if ([notify.name containsString:@"NSThreadWillExitNotification"]
//        || [notify.name containsString:@"NSUserDefaultsDidChangeNotification"]
//        || [notify.name containsString:@"NSViewFrameDidChangeNotification"]
//        || [notify.name containsString:@"DVTDeviceUsabilityDidChangeNotification"]
//        || [notify.name containsString:@"NSViewDidUpdateTrackingAreasNotification"]
//        || [notify.name containsString:@"NSMenu"]
//        || [notify.name containsString:@"NSBundleDidLoadNotification"]
//        || [notify.name containsString:@"IDEEditor"]
//        || [notify.name containsString:@"NSApplication"]
//        ) {
//        return;
//    }
    NSLog(@"%@", notify.name);
}

- (void)addMenu
{
    NSMenuItem *menuBarItem = [[NSApp mainMenu] itemWithTitle:@"MyPlugins"];
    if (!menuBarItem) {
        menuBarItem = [[NSMenuItem alloc] initWithTitle:@"MyPlugins" action:NULL keyEquivalent:@""];
        NSMenu *newMenu = [[NSMenu alloc] initWithTitle:@"MyPlugins"];
        [menuBarItem setSubmenu:newMenu];
        [[NSApp mainMenu] insertItem:menuBarItem atIndex:[[NSApp mainMenu] numberOfItems]];
    }
    
    NSMenuItem *actionMenuItem = [[NSMenuItem alloc] initWithTitle:@"Search google" action:@selector(doMenuAction) keyEquivalent:@"0"];
            [actionMenuItem setKeyEquivalentModifierMask:NSAlphaShiftKeyMask | NSControlKeyMask];
    [actionMenuItem setTarget:self];
    [[menuBarItem submenu] addItem:actionMenuItem];
    
    [[menuBarItem submenu] addItem:[NSMenuItem separatorItem]];
    actionMenuItem = [[NSMenuItem alloc] initWithTitle:@"Search stackoverflow" action:@selector(doMenuAction) keyEquivalent:@"0"];
    [actionMenuItem setKeyEquivalentModifierMask:NSAlphaShiftKeyMask | NSControlKeyMask];
    [actionMenuItem setTarget:self];
    [[menuBarItem submenu] addItem:actionMenuItem];
    
    [[menuBarItem submenu] addItem:[NSMenuItem separatorItem]];
    actionMenuItem = [[NSMenuItem alloc] initWithTitle:@"Search github" action:@selector(doMenuAction) keyEquivalent:@"0"];
    [actionMenuItem setKeyEquivalentModifierMask:NSAlphaShiftKeyMask | NSControlKeyMask];
    [actionMenuItem setTarget:self];
    [[menuBarItem submenu] addItem:actionMenuItem];
}

- (void)doMenuAction
{
    NSAlert *alert = [[NSAlert alloc] init];
    [alert setMessageText:@"Search Github"];
    [alert runModal];
}

- (void)changeWindow:(NSWindow *)window
{
    NSView *NSThemeFrame = [[window contentView] superview];
    
    Method m0 = class_getInstanceMethod([self class], @selector(sw_drawRect:));
    class_addMethod([NSThemeFrame class], @selector(sw_drawRect:), method_getImplementation(m0), method_getTypeEncoding(m0));
    
    Method m1 = class_getInstanceMethod([NSThemeFrame class], @selector(drawRect:));
    Method m2 = class_getInstanceMethod([NSThemeFrame class], @selector(sw_drawRect:));
    
    method_exchangeImplementations(m1, m2);
}

- (void)sw_drawRect:(NSRect)rect
{
    [self sw_drawRect:rect];
    
    [[NSColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1] set];
    [[NSBezierPath bezierPathWithRect:rect] fill];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
