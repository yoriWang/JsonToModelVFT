//
//  ViewController.m
//  YRJsonToModelVFT
//
//  Created by 王煜仁 on 2017/6/8.
//  Copyright © 2017年 wang. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    
    NSButton *button = [[NSButton alloc] initWithFrame:CGRectMake(10, 30, 100, 30)];
//    [button setTitle:@"点击显示新的窗口"];
    NSAttributedString *buttonColor = [[NSAttributedString alloc] initWithString:@"点击显示新的窗口" attributes:@{NSForegroundColorAttributeName : [NSColor blueColor]}];
    [button setAttributedTitle:buttonColor];
    [button setTarget:self];
    [button setAction:@selector(clickButtonToNext:)];
    [self.view addSubview:button];
    
}

- (void)clickButtonToNext:(id)sender {
    NSLog(@"点击了按钮-------");
    TestViewController *testVC = [[TestViewController alloc] initWithWindowNibName:@"TestViewController"];
    [testVC.window orderFront:nil];
    [testVC showWindow:self];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
