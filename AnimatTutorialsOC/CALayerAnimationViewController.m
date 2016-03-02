//
//  CALayerAnimationViewController.m
//  AnimatTutorialsOC
//
//  Created by JiaLi on 16/2/26.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import "CALayerAnimationViewController.h"
#define WIDTH 50

@interface CALayerAnimationViewController ()

@end

@implementation CALayerAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self drawMyLayer];
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

#pragma mark 绘制图层
-(void)drawMyLayer{
    CGSize size = [UIScreen mainScreen].bounds.size;
    
    //获得根图层
    CALayer *layer = [[CALayer alloc]init];
    //设置背景颜色,由于QuartzCore是跨平台框架，无法直接使用UIColor
    layer.backgroundColor = [UIColor colorWithRed:0 green:146/255.0 blue:1.0 alpha:1.0].CGColor;
    //设置中心点
    layer.position = CGPointMake(size.width/2, size.height/2);
    //设置大小
    layer.bounds = CGRectMake(0, 0, WIDTH,WIDTH);
    //设置圆角,当圆角半径等于矩形的一半时看起来就是一个圆形
    layer.cornerRadius = WIDTH/2;
    //设置阴影
    layer.shadowColor = [UIColor grayColor].CGColor;
    layer.shadowOffset = CGSizeMake(2, 2);
    layer.shadowOpacity =.9;
    layer.name = @"main";
    //layer.name = @"main";
    //设置边框
    //    layer.borderColor=[UIColor whiteColor].CGColor;
    //    layer.borderWidth=1;
    
    //设置锚点
    //    layer.anchorPoint=CGPointZero;
    
    [self.view.layer addSublayer:layer];
    [self addSubLayer:@"left"];
    [self addSubLayer:@"right"];
    [self addSubLayer:@"top"];
    [self addSubLayer:@"bottom"];
    [self setSubLayersPosition];
}

#pragma mark 点击放大
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch=[touches anyObject];
    CALayer *mainlayer = nil;
    for (CALayer* layer in self.view.layer.sublayers) {
        if (layer != nil && [layer.name isEqualToString:@"main"]) {
            mainlayer = layer;
            break;
        }
    }
    
    if (mainlayer == nil) {
        return;
    }
    CGFloat width = mainlayer.bounds.size.width;
    if (width == WIDTH) {
        width = WIDTH*4;
    }else{
        width = WIDTH;
    }
    mainlayer.bounds=CGRectMake(0, 0, width, width);
    mainlayer.position=[touch locationInView:self.view];
    mainlayer.cornerRadius=width/2;
    [self setSubLayersPosition];
}

- (void)setSubLayersPosition {
    CALayer *mainlayer = nil;
    
    for (CALayer* layer in self.view.layer.sublayers) {
        if (layer != nil && [layer.name isEqualToString:@"main"]) {
            mainlayer = layer;
            break;
        }
    }
    if (mainlayer == nil) {
        return;
    }
    
    CGFloat width = mainlayer.bounds.size.width;
    CGPoint pos = mainlayer.position;
    BOOL toCenter = NO;//(width == WIDTH) ;
    for (CALayer* layer in self.view.layer.sublayers) {
        if (layer != nil && ![layer.name isEqualToString:@"main"]) {
            if ([layer.name isEqualToString:@"left"]) {
                layer.position = toCenter ? CGPointMake(pos.x, pos.y) : CGPointMake(pos.x, pos.y - 2*width);
                layer.cornerRadius = width / 2;
            } else if ([layer.name isEqualToString:@"right"]) {
                layer.position = toCenter ? CGPointMake(pos.x, pos.y) : CGPointMake(pos.x, pos.y + 2*width);
                layer.cornerRadius = width / 2;
            } else if ([layer.name isEqualToString:@"top"]) {
                layer.position = toCenter ? CGPointMake(pos.x, pos.y) : CGPointMake(pos.x - 2*width, pos.y);
                layer.cornerRadius = width / 2;
            } else if ([layer.name isEqualToString:@"bottom"]) {
                layer.position = toCenter ? CGPointMake(pos.x, pos.y) : CGPointMake(pos.x + 2*width, pos.y);
                layer.cornerRadius = width / 2;
            }
            layer.bounds = CGRectMake(0, 0, WIDTH / 2,WIDTH / 2);
            layer.backgroundColor=[UIColor colorWithRed:0 green:146/255.0 blue:1.0 alpha:1.0].CGColor;
        }
    }
}

- (void)addSubLayer:(NSString*)name {
    CALayer* leftLayer = [[CALayer alloc] init];
    leftLayer.bounds = CGRectMake(0, 0, WIDTH / 2,WIDTH / 2);
    leftLayer.name = name;
    [self.view.layer addSublayer:leftLayer];

}

@end
