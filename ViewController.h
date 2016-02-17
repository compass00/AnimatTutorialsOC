//
//  ViewController.h
//  AnimatTutorialsOC
//
//  Created by JiaLi on 16/2/17.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong) IBOutlet UIButton* cargreen;
@property (strong) IBOutlet UIButton* carper;
@property (strong) IBOutlet UIButton* carblue;

- (IBAction)playAnimation:(id)sender;

@end

