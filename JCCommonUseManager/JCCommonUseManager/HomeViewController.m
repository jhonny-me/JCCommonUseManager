//
//  HomeViewController.m
//  JCCommonUseManager
//
//  Created by 顾强 on 15/7/31.
//  Copyright (c) 2015年 jhonny.copper. All rights reserved.
//

#import "HomeViewController.h"
#import "JCCommonUseManager.h"
#import "UIViewController+HUD.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.testLb.text = [NSString stringWithFormat:@"%f",SCREEN_WIDTH];
    NSArray *a = @[@"1",@"4"];
    NSDictionary *b= @{@"1":@1,
                     @"2":@2
                     };
    JCLog([a description]);
    JCLog(b);
    NSLog(@"%d",[JCVaildJudger validateMobile:@"123"]);
    
    [self showHudInView:self.view hint:@"adassdd"];
    [UIView animateWithDuration:2.f animations:^{
        self.testBtn.center = self.view.center;
    } completion:^(BOOL finished) {
        [self hideHud];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
