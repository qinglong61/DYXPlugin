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
    }
    return self;
}

- (void)didApplicationFinishLaunchingNotification:(NSNotification*)noti
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSApplicationDidFinishLaunchingNotification object:nil];
    
    NSMenuItem *menuItem = [[NSApp mainMenu] itemWithTitle:@"Help"];
    if (menuItem) {
        [[menuItem submenu] addItem:[NSMenuItem separatorItem]];
        NSMenuItem *actionMenuItem = [[NSMenuItem alloc] initWithTitle:@"Search Github" action:@selector(doMenuAction) keyEquivalent:@""];
//        [actionMenuItem setKeyEquivalentModifierMask:NSAlphaShiftKeyMask | NSControlKeyMask];
        [actionMenuItem setTarget:self];
        [[menuItem submenu] addItem:actionMenuItem];
    }
}

- (void)doMenuAction
{
    NSAlert *alert = [[NSAlert alloc] init];
    [alert setMessageText:@"Search Github"];
    [alert runModal];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
