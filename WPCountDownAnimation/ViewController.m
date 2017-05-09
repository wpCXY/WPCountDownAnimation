//
//  ViewController.m
//  WPCountDownAnimation
//
//  Created by 王鹏 on 2017/5/9.
//  Copyright © 2017年 王鹏. All rights reserved.
//

#import "ViewController.h"
#import "WPCountDownView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [WPCountDownView startCountDownAnimationInView:self.view complete:nil];
}

@end
