//
//  YLBNavigationController.m
//  Yunlaoban
//
//  Created by 范茂羽 on 2017/10/18.
//  Copyright © 2017年 范茂羽. All rights reserved.
//

#import "YLBNavigationController.h"

@interface YLBNavigationController ()

@end

@implementation YLBNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationBar.translucent = YES;
    [self.navigationBar setShadowImage:[UIImage new]];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if(self.viewControllers.count >= 1)
    {
        UIButton *leftItem = [[UIButton alloc] init];
        [leftItem setImage:[UIImage imageNamed:@"backIcon"] forState:UIControlStateNormal];
        leftItem.size = CGSizeMake(60, 44);
        leftItem.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 40);
        [leftItem addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:leftItem];
        viewController.navigationItem.leftBarButtonItem = backItem;
        viewController.hidesBottomBarWhenPushed = true;
    }
    
    [super pushViewController:viewController animated:animated];
}


-(void)backAction{
    [self popViewControllerAnimated:YES];
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
