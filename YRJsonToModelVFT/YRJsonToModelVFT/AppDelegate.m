//
//  AppDelegate.m
//  YRJsonToModelVFT
//
//  Created by 王煜仁 on 2017/6/8.
//  Copyright © 2017年 wang. All rights reserved.
//

#import "AppDelegate.h"
#import "MainWindowController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    MainWindowController *mainWC = [[MainWindowController alloc] initWithWindowNibName:@"MainWindowController"];
    [mainWC.window  center];
    [mainWC.window orderFront:nil];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

//点击close按钮，应用程序退胡
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES;
}

@end
