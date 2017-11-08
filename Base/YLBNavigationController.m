//
//  YLBNavigationController.m
//  Yunlaoban
//
//  Created by 范茂羽 on 2017/10/18.
//  Copyright © 2017年 范茂羽. All rights reserved.
//

#import "YLBNavigationController.h"
#import "YLBMessageController.h"

@interface YLBNavigationController ()<UINavigationControllerDelegate>

@property (nonatomic, strong)UILabel *countLabel;

@end

@implementation YLBNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationBar.translucent = YES;
    [self.navigationBar setShadowImage:[UIImage new]];
    self.delegate = self;

    self.countLabel = [UILabel labelWithTitle:@"0" fontSize:10 textColor:[UIColor whiteColor] textWeight:UIFontWeightLight];
    self.countLabel.backgroundColor = [UIColor redColor];
    [self.navigationBar addSubview:self.countLabel];
    [self.navigationBar bringSubviewToFront:self.countLabel];
    self.countLabel.size = CGSizeMake(20, 20);
    self.countLabel.textAlignment = NSTextAlignmentCenter;
    self.countLabel.layer.cornerRadius = 10;
    self.countLabel.layer.masksToBounds = YES;
    self.countLabel.rightTop = CGPointMake(self.navigationBar.width-6, 1);
    
    self.countLabel.hidden = [UIApplication sharedApplication].applicationIconBadgeNumber <= 0?YES:NO;
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
    
    self.countLabel.hidden = YES;
    
    [super pushViewController:viewController animated:animated];
}


-(void)backAction{
    [self popViewControllerAnimated:YES];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if(navigationController.viewControllers.count == 1 && ![viewController isKindOfClass:[YLBMessageController class]]){
        NSInteger count = [UIApplication sharedApplication].applicationIconBadgeNumber;
        self.countLabel.text = [NSString stringWithFormat:@"%ld", count];
        
        self.countLabel.hidden = count<=0?YES:NO;
    }else{
        self.countLabel.hidden = YES;
    }
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
