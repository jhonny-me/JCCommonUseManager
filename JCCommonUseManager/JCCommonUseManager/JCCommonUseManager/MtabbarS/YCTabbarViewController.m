//
//  YCTabbarViewController.m
//  CheHuiPai-Auction
//
//  Created by 夏文强 on 15/8/3.
//  Copyright (c) 2015年 夏文强. All rights reserved.
//

#import "YCTabbarViewController.h"
#warning 这边是自己的vc
//#import "YCCarViewController.h"
//#import "YCPersonalViewController.h"
//#import "YCAssessmentViewController.h"
//#import "YCDistributionViewController.h"
#import "UIColor+Hex.h"

@interface YCTabbarViewController ()<CustomTabBarViewDelegate>

@end

@implementation YCTabbarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    //设置NavigationBar背景颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithHexString:@"#43a0d7"]];
    //@{}代表Dictionary
    NSDictionary *attributes=[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:20],NSFontAttributeName, nil];
    [[UINavigationBar appearance] setTitleTextAttributes:attributes];
    [self addTabbarItems];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addTabbarItems{
#warning 替换为自己要的vc
    /*
    YCDistributionViewController *auction = [[YCDistributionViewController alloc] initWithNibName:@"YCDistributionViewController" bundle:nil];
    UINavigationController *flipFirst = [[UINavigationController alloc] initWithRootViewController:auction];
    
    YCAssessmentViewController *snap = [[YCAssessmentViewController alloc] initWithNibName:@"YCAssessmentViewController" bundle:nil];
    UINavigationController *flipSecond = [[UINavigationController alloc] initWithRootViewController:snap];
    
    YCCarViewController *record = [[YCCarViewController alloc] initWithNibName:@"YCCarViewController" bundle:nil];
    UINavigationController *flipThree = [[UINavigationController alloc] initWithRootViewController:record];
    
    YCPersonalViewController *personal = [[YCPersonalViewController alloc] initWithNibName:@"YCPersonalViewController" bundle:nil];
    UINavigationController *flipFourth = [[UINavigationController alloc] initWithRootViewController:personal];
    
    
    NSArray* tabBarItems = [NSArray arrayWithObjects:
                            [NSDictionary dictionaryWithObjectsAndKeys:
                             @"分布",@"title",
                             @"yc_tabar_distribution_unselected", @"image",
                             @"yc_tabar_distribution_selected",@"selectedImage",
                             flipFirst, @"view",
                             nil],
                            [NSDictionary dictionaryWithObjectsAndKeys:
                             @"评估",@"title",
                             @"yc_tabar_assessment_unselected", @"image",
                             @"yc_tabar_assessment_selected",@"selectedImage",
                             flipSecond, @"view",
                             nil],
                            [NSDictionary dictionaryWithObjectsAndKeys:
                             @"车行",@"title",
                             @"yc_tabar_car_unselected", @"image",
                             @"yc_tabar_car_selected",@"selectedImage",
                             flipThree, @"view",
                             nil],
                            [NSDictionary dictionaryWithObjectsAndKeys:
                             @"我的",@"title",
                             @"yc_tabar_personal_unselected", @"image",
                             @"yc_tabar_personal_selected",@"selectedImage",
                             flipFourth, @"view",
                             nil],
                            
                            nil];
    
    [self setupTabBar:tabBarItems];
    self.viewdelegate = self;
    */
}
- (void) onTouchUpInsideItemAtIndex:(NSUInteger)itemIndex{
    if (itemIndex == 7) {
        //处理特殊界面
    }
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
