//
//  TransitionsViewController.m
//  AnimatTutorialsOC
//
//  Created by JiaLi on 16/2/23.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import "TransitionsViewController.h"
#define CARDQ_TAG 101
#define CARD2_TAG 102
@interface TransitionsViewController ()

@end

@implementation TransitionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self cardBorder:self.cardJ];
    [self cardBorder:self.cardK];
    [self cardBorder:self.cardA];
    [self cardBorder:self.card3];
    [self addTransitionSubView:self.curlView];
    [self addTransitionSubView:self.curlView2];
    // Do any additional setup after loading the view from its nib.
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

- (void) playAnimation:(id)sender {
     __weak __block TransitionsViewController *blockSelf = self;
    
    self.animationOptionTopLeft.text = self.run ? [NSString stringWithFormat:@"%@", @"TransitionCurlUp"] : [NSString stringWithFormat:@"%@", @"TransitionCurlDown"];
    {
    UIImageView* fromView = [self.curlView viewWithTag:self.run? CARD2_TAG : CARDQ_TAG];
    UIImageView* toView = [self.curlView viewWithTag:self.run? CARDQ_TAG : CARD2_TAG];
    [blockSelf addAnimationRemove:fromView toView:toView option:(self.run ?UIViewAnimationOptionTransitionCurlUp:UIViewAnimationOptionTransitionCurlDown) completion:^(BOOL finished){
        [self.curlView addSubview:fromView];
        [self.curlView bringSubviewToFront:toView];
    }];
  
    }
    
    self.animationOptionTopRight.text = self.run ? [NSString stringWithFormat:@"%@", @"TransitionCrossDissolve"] : [NSString stringWithFormat:@"%@", @"TransitionNone"];
    {
        UIImageView* fromView = [self.curlView2 viewWithTag:self.run? CARD2_TAG : CARDQ_TAG];
        UIImageView* toView = [self.curlView2 viewWithTag:self.run? CARDQ_TAG : CARD2_TAG];
        [blockSelf addAnimationRemove:fromView toView:toView option:(self.run ? UIViewAnimationOptionTransitionCrossDissolve:UIViewAnimationOptionTransitionNone) completion:^(BOOL finished){
            [self.curlView2 addSubview:fromView];
            [self.curlView2 bringSubviewToFront:toView];
        }];
        
    }
    
    self.animationOptionBottomLeft.text = self.run ? [NSString stringWithFormat:@"%@", @"TransitionFlipFromLeft"] : [NSString stringWithFormat:@"%@", @"TransitionFlipFromRight"];
    [blockSelf addAnimation:self.run? self.cardJ :self.cardA toView:self.run?self.cardA:self.cardJ option:(self.run ?UIViewAnimationOptionTransitionFlipFromLeft:UIViewAnimationOptionTransitionFlipFromRight) completion:^(BOOL finished){
        
    }];
    self.animationOptionBottomRight.text = self.run ? [NSString stringWithFormat:@"%@", @"TransitionFlipFromTop"] : [NSString stringWithFormat:@"%@", @"TransitionFlipFromBottom"];
    [blockSelf addAnimation:self.run?self.cardK:self.card3 toView:self.run?self.card3:self.cardK option:(self.run ?UIViewAnimationOptionTransitionFlipFromTop:UIViewAnimationOptionTransitionFlipFromBottom) completion:^(BOOL finished){}];

    self.run = !self.run;
}

- (void)addAnimation:(UIView*)fromView toView:(UIView*)toView option:(UIViewAnimationOptions)option completion:(void (^ __nullable)(BOOL finished))completion{
    [UIView transitionWithView:fromView duration:1.0 options:option animations:^ {
        fromView.alpha = 0.0;
     }completion:completion];
    [UIView transitionWithView:toView duration:1.0 options:option animations:^ {
        toView.alpha = 1.0;
    }completion:completion];

}

- (void)addAnimationRemove:(UIView*)fromView toView:(UIView*)toView option:(UIViewAnimationOptions)option completion:(void (^ __nullable)(BOOL finished))completion{
    [UIView transitionFromView:fromView toView:toView duration:1.0 options:option completion:completion];
}

- (void)cardBorder:(UIView*)toView {
    toView.layer.borderColor = [[UIColor blackColor] CGColor];
    toView.layer.borderWidth = 1.0;
}

- (void)addTransitionSubView:(UIView*)superView {
    UIImageView* cardQView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.curlView.frame.size.width, self.curlView.frame.size.height)];
    cardQView.image = [UIImage imageNamed:@"cardQ"];
    cardQView.tag = CARDQ_TAG;
    
    UIImageView* card2View = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.curlView.frame.size.width, self.curlView.frame.size.height)];
    card2View.image = [UIImage imageNamed:@"card2"];
    card2View.tag = CARD2_TAG;
    //[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cardQ"]];
    [superView addSubview:cardQView];
    [superView addSubview:card2View];
    [superView bringSubviewToFront:cardQView];

}


@end
