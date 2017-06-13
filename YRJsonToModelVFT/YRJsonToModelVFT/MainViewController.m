//
//  MainViewController.m
//  YRJsonToModelVFT
//
//  Created by 王煜仁 on 2017/6/13.
//  Copyright © 2017年 wang. All rights reserved.
//

#import "MainViewController.h"
//#import <sys/utsname.h>

@interface MainViewController ()
@property (strong) NSButton *submitBtn;
@property (nonatomic, weak) NSTextField *urlTextField;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    
//    NSDevice
//    struct utsname systemInfo;
//    uname(&systemInfo);
//    char *loginInfo = getlogin();
    
    NSTextField *urlTextField = [[NSTextField alloc] initWithFrame:CGRectMake(10, 80, 200, 30)];
    urlTextField.placeholderString = @"输入请求的URL";
//    urlTextField.bezelStyle = NSBezelStyleRoundRect;
    [self.view addSubview:urlTextField];
    self.urlTextField = urlTextField;
    
    self.submitBtn = [[NSButton alloc] initWithFrame:CGRectMake(10, 30, 100, 30)];
    //    [button setTitle:@"点击显示新的窗口"];
    NSAttributedString *buttonColor = [[NSAttributedString alloc] initWithString:@"点击显示新的窗口" attributes:@{NSForegroundColorAttributeName : [NSColor blueColor]}];
    self.submitBtn.bezelStyle = NSBezelStyleRoundRect;
    [self.submitBtn setAttributedTitle:buttonColor];
    [self.submitBtn setTarget:self];
    [self.submitBtn setAction:@selector(clickButtonToNext:)];
    [self.view addSubview:self.submitBtn];
    
}

- (void)clickButtonToNext:(id)sender {
    NSLog(@"点击了按钮-------%@", [self.urlTextField stringValue]);
    
    [self saveCurrentDataToFolder:[self.urlTextField stringValue] fileName:[self.urlTextField stringValue]];
//    [self openPanel];
}

- (void)openPanel {
    __weak typeof(self)weakSelf = self;
    //    AMPathPopUpButton *
    NSOpenPanel *panel = [NSOpenPanel openPanel];
    //是否可以创建文件夹
    panel.canCreateDirectories = YES;
    //是否可以选择文件夹
    panel.canChooseDirectories = YES;
    //是否可以选择文件
    panel.canChooseFiles = YES;
    
    //是否可以多选
    [panel setAllowsMultipleSelection:NO];
    //显示
    [panel beginSheetModalForWindow:self.view.window completionHandler:^(NSInteger result) {
        
        //是否点击open 按钮
        if (result == NSModalResponseOK) {
            //NSURL *pathUrl = [panel URL];
            NSString *pathString = [panel.URLs.firstObject path];
            weakSelf.urlTextField.stringValue = pathString;
        }
    }];
}

#pragma mark - 文件默认保存在桌面，二级文件夹名为用户输入文件名
- (void)saveCurrentDataToFolder:(NSString *)folderName fileName:(NSString *)fileName {
    
    NSString *testText = @"www.google.com.hk";
    fileName = [self.urlTextField stringValue];
    //写文件
    NSString *path = NSHomeDirectory();
    NSLog(@"这是home目录%@",path);
    //    NSString *path = @"~/Desktop/";/Users/yurenwang/Desktop/puluNews
    NSString *path_file = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"Desktop/%@" , fileName]];
    NSString *h_file = [NSString stringWithFormat:@"%@/%@.h", path_file, fileName];
    NSString *m_file = [NSString stringWithFormat:@"%@/%@.m", path_file, fileName];
    BOOL isExist = [self fileIsExist:path_file];
    NSString *h_content = [NSString stringWithFormat:@"//\n//  %@.h\n//  <#YourProjectName#>\n//\n//  Created by %@ on %@.\n//  Copyright © %ld年 %@. All rights reserved.\n//", fileName, [self getCurrentDeviceName], [self formatCurrentDate:[NSDate date]], [self getYear], [self getCurrentDeviceName]];
    if (isExist) {
        [h_content writeToFile:h_file atomically:YES encoding:NSUTF8StringEncoding error:nil];
        [testText writeToFile:m_file atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
}

#pragma mark - 创建文件
- (BOOL)fileIsExist:(NSString *)filePath {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL pathIsExist = [fileManager fileExistsAtPath:filePath];
    if (!pathIsExist) {
//        NSString *deskPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Desktop"];
//        [filePath componentsSeparatedByString:@"/"];
//        NSString *folderPath = [deskPath stringByAppendingPathComponent:@"test"];
        //只创建文件夹，不创建文件
        return [fileManager createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];
//        [fileManager createFileAtPath:filePath contents:[@"123" dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
//        return pathIsExist;
    }
    return pathIsExist;
}

#pragma mark - 获取当前时间
- (NSString *)formatCurrentDate:(NSDate *)date {
    
    NSDateFormatter *dateFormatter =[[NSDateFormatter alloc] init];
    // 设置日期格式
    [dateFormatter setDateFormat:@"YYYY/MM/dd"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    return dateString;
}

#pragma mark - 获取年月日
- (NSInteger)getYear {
    NSDate *currentDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear |NSCalendarUnitMonth | NSCalendarUnitDay fromDate:currentDate];
    return [components year];
}

#pragma mark - 获取设备名称
- (NSString *)getCurrentDeviceName {
    NSString *deviceName = [NSString stringWithFormat:@"%s", getlogin()];
    return deviceName;
}

@end
