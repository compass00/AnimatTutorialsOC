//
//  AnimationBaseViewController.m
//  AnimatTutorialsOC
//
//  Created by JiaLi on 16/2/22.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import "AnimationBaseViewController.h"

@interface AnimationBaseViewController ()

@end

@implementation AnimationBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.run = NO;
    // Do any additional setup after loading the view.
    UIButton* playbutton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [playbutton setImage:[UIImage imageNamed:@"playImage"] forState:UIControlStateNormal];
    UIBarButtonItem* right = [[UIBarButtonItem alloc] initWithCustomView:playbutton];
    [playbutton addTarget:self action:@selector(playAnimation:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = right;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playAnimation:(id)sender {
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
