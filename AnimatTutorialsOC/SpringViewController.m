//
//  SpringViewController.m
//  AnimatTutorialsOC
//
//  Created by JiaLi on 16/2/23.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import "SpringViewController.h"


@interface SpringViewController ()

@end

@implementation SpringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.ball0.center = CGPointMake(self.view.center.x, 85.0);
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

- (IBAction)playAnimation:(id)sender {
  
    CGFloat height = self.run ? -100 : 100;
   __weak __block SpringViewController *blockSelf = self;
    [blockSelf addAnimation:_ball0 withBoundsHeight:height option:UIViewAnimationOptionCurveEaseInOut completion:^(BOOL finished){
        [blockSelf addAnimation:_ball1 withBoundsHeight:height option:UIViewAnimationOptionCurveEaseIn completion:^(BOOL finished){
            [blockSelf addAnimation:_ball2 withBoundsHeight:height option:UIViewAnimationOptionCurveEaseOut completion:^(BOOL finished){
                [blockSelf addAnimation:_ball3 withBoundsHeight:height option:UIViewAnimationOptionCurveLinear completion:^(BOOL finished){
                }];

            }];
        }];
    }];
    self.run = !self.run;
}

- (void) addAnimation:(UIView*)v withBoundsHeight:(CGFloat)boundsHeight option:(UIViewAnimationOptions)option completion:(void (^ __nullable)(BOOL finished))completion{
    [UIView animateWithDuration: 0.5 delay: 0 usingSpringWithDamping: 0.2 initialSpringVelocity: 0 options: option animations: ^{
        v.center = CGPointMake(v.center.x, v.center.y - boundsHeight);
    } completion: completion];

}

@end
