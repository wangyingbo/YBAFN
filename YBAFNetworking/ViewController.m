//
//  ViewController.m
//  YBAFNetworking
//
//  Created by 王迎博 on 16/6/23.
//  Copyright © 2016年 王迎博. All rights reserved.
//

#import "ViewController.h"
#import "YBAFN.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (IBAction)initAlertView:(id)sender
{
    [YBAFN YB_alertViewContent:@"这是用来测试的呀" WithStyle:LXASAnimationLeftShake indexBlock:^(NSInteger btnIndex) {
        if (btnIndex == 0) {
            NSLog(@"点击了确定");
        }
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
