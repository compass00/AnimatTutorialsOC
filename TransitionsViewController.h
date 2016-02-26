//
//  TransitionsViewController.h
//  AnimatTutorialsOC
//
//  Created by JiaLi on 16/2/23.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimationBaseViewController.h"

@interface TransitionsViewController : AnimationBaseViewController
@property (strong, nonatomic) IBOutlet UIImageView* cardJ;
@property (strong, nonatomic) IBOutlet UIImageView* cardK;
@property (strong, nonatomic) IBOutlet UIImageView* cardA;
@property (strong, nonatomic) IBOutlet UIImageView* card3;
@property (strong, nonatomic) IBOutlet UIView* curlView;
@property (strong, nonatomic) IBOutlet UIView* curlView2;

@property (strong, nonatomic) IBOutlet UILabel* animationOptionTopLeft;
@property (strong, nonatomic) IBOutlet UILabel* animationOptionTopRight;
@property (strong, nonatomic) IBOutlet UILabel* animationOptionBottomLeft;
@property (strong, nonatomic) IBOutlet UILabel* animationOptionBottomRight;

@end
