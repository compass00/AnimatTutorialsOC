//
//  ViewController.m
//  AnimatTutorialsOC
//
//  Created by JiaLi on 16/2/17.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property BOOL run;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _run = NO;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
