//
//  AppDelegate.m
//  YRJsonToModelVFT
//
//  Created by 王煜仁 on 2017/6/8.
//  Copyright © 2017年 wang. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()
@property (weak) IBOutlet NSWindow *window;
@property (nonatomic, strong) MainViewController *mainVC;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
//    self.mainVC = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    self.mainVC = [[MainViewController alloc] init];
    [self.window.contentView addSubview:self.mainVC.view];
    self.mainVC.view.frame = self.window.contentView.bounds;
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

//点击close按钮，应用程序退胡
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES;
}

@end
