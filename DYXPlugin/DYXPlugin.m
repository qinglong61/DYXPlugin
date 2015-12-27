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
    
    [self addMenu];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textSelectionDidChange:) name:NSTextViewDidChangeSelectionNotification object:nil];
//    if (!self.textView) {
//        NSResponder *firstResponder = [[NSApp keyWindow] firstResponder];
//        if ([firstResponder isKindOfClass:NSClassFromString(@"DVTSourceTextView")] && [firstResponder isKindOfClass:[NSTextView class]]) {
//            self.textView = (NSTextView *)firstResponder;
//        }
//    }
//    if (self.textView) {
//        NSNotification *notification = [NSNotification notificationWithName:NSTextViewDidChangeSelectionNotification object:self.textView];
//        [self selectionDidChange:notification];
//        
//    }
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

- (void)textSelectionDidChange:(NSNotification *)notification
{
//    NSLog(@"%@", notification);
    if ([notification.object isKindOfClass:NSClassFromString(@"DVTSourceTextView")]) {
//        static dispatch_once_t onceToken;
//        dispatch_once(&onceToken, ^{
//            
//        });
//        NSTextView *DVTSourceTextView = notification.object;
//        DVTSourceTextView.backgroundColor = [NSColor clearColor];
//        DVTSourceTextView.layer.opaque = NO;
//        NSView *superView = DVTSourceTextView.superview;
//        do {
//            superView.layer.backgroundColor = [NSColor clearColor].CGColor;
//            superView.layer.opaque = NO;
//            superView = superView.superview;
////            NSLog(@"%@", superView);
//        } while (superView.superview);
//        superView.layer.backgroundColor = [NSColor clearColor].CGColor;
//        superView.layer.opaque = NO;
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
