//
//  SimpleAnimatViewController.m
//  AnimatTutorialsOC
//
//  Created by JiaLi on 16/2/18.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import "SimpleAnimatViewController.h"

@interface SimpleAnimatViewController ()
@property BOOL run;

@end

@implementation SimpleAnimatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = [NSString stringWithFormat:@"%@", @"UIView"];
 
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
    const CGFloat offset = CGRectGetWidth([UIScreen mainScreen].bounds);
    if (!_run) {
        [UIView animateWithDuration: 0.5 animations: ^{
            self.carblue.center = CGPointMake(offset - self.carblue.frame.size.width / 2, self.carblue.center.y);
        } completion: ^(BOOL finished){
            [UIView animateWithDuration: 0.5 delay: 0.01 options: 0 animations: ^{
                
                self.cargreen.center = CGPointMake(offset - self.cargreen.frame.size.width / 2, self.cargreen.center.y);
            } completion: ^(BOOL finished) {
                [UIView animateWithDuration: 1.5 delay: 0 usingSpringWithDamping: 0.6 initialSpringVelocity: 0 options: 0 animations: ^{
                    self.carper.center = CGPointMake(offset - self.carper.frame.size.width / 2, self.carper.center.y);
                } completion: nil];
            }];
        }];
    } else {
        [UIView animateWithDuration: 0.5 animations: ^{
            self.carblue.center = CGPointMake(self.carblue.frame.size.width + 10, self.carblue.center.y);
        } completion: ^(BOOL finished){
            [UIView animateWithDuration: 0.5 delay: 0.01 options: 0 animations: ^{
                
                self.cargreen.center = CGPointMake(self.cargreen.frame.size.width + 10, self.cargreen.center.y);
            } completion: ^(BOOL finished) {
                [UIView animateWithDuration: 1.5 delay: 0 usingSpringWithDamping: 0.6 initialSpringVelocity: 0 options: 0 animations: ^{
                    self.carper.center = CGPointMake(self.carper.frame.size.width + 10, self.carper.center.y);
                } completion: nil];
            }];
        }];
    }
    _run = !_run;
    
}

@end
