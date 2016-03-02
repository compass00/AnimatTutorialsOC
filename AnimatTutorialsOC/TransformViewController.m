//
//  TransformViewController.m
//  AnimatTutorialsOC
//
//  Created by JiaLi on 16/2/25.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import "TransformViewController.h"
#define WIDTH 50

@interface TransformViewController () {
    CALayer *_layer;

}
@end

@implementation TransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //自定义一个图层
    _layer=[[CALayer alloc]init];
    _layer.bounds=CGRectMake(0, 0, 75, 73);
    _layer.position=CGPointMake(50, 150);
    _layer.contents=(id)[UIImage imageNamed:@"flower"].CGImage;
    _layer.anchorPoint=CGPointMake(0.5, 0.6);//设置锚点
   [self.view.layer addSublayer:_layer];
    
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

#pragma mark 关键帧动画
-(void)translationAnimation{
    //1.创建关键帧动画并设置动画属性
    CAKeyframeAnimation *keyframeAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    //2.设置关键帧,这里有四个关键帧
    NSValue *key1=[NSValue valueWithCGPoint:_layer.position];//对于关键帧动画初始值不能省略
    NSValue *key2=[NSValue valueWithCGPoint:CGPointMake(80, 220)];
    NSValue *key3=[NSValue valueWithCGPoint:CGPointMake(45, 300)];
    NSValue *key4=[NSValue valueWithCGPoint:CGPointMake(55, 400)];
    NSArray *values=@[key1,key2,key3,key4];
    keyframeAnimation.values=values;
    //设置其他属性
    keyframeAnimation.duration=8.0;
    keyframeAnimation.beginTime=CACurrentMediaTime()+2;//设置延迟2秒执行
    
    keyframeAnimation.delegate = self;
    //3.添加动画到图层，添加动画后就会执行动画
    [_layer addAnimation:keyframeAnimation forKey:@"KCKeyframeAnimation_Position"];
}

-(void)translatonAnimation:(CGPoint)location{
    //1.创建动画并指定动画属性
    CABasicAnimation *basicAnimation=[CABasicAnimation animationWithKeyPath:@"position"];
    
    //2.设置动画属性初始值、结束值
    //    basicAnimation.fromValue=[NSNumber numberWithInteger:50];//可以不设置，默认为图层初始状态
    basicAnimation.toValue=[NSValue valueWithCGPoint:location];
    
    //设置其他动画属性
    basicAnimation.duration=1.0;//动画时间5秒
    //basicAnimation.repeatCount=HUGE_VALF;//设置重复次数,HUGE_VALF可看做无穷大，起到循环动画的效果
    basicAnimation.removedOnCompletion=NO;//运行一次是否移除动画
    basicAnimation.delegate=self;
    //存储当前位置在动画结束后使用
    [basicAnimation setValue:[NSValue valueWithCGPoint:location] forKey:@"KCBasicAnimationLocation"];
    basicAnimation.autoreverses=NO;//旋转后再旋转到原来的位置

    //3.添加动画到图层，注意key相当于给动画进行命名，以后获得该图层时可以使用此名称获取
    [_layer addAnimation:basicAnimation forKey:@"KCBasicAnimation_Translation"];
}
#pragma mark 旋转动画
-(void)rotationAnimation{
    //1.创建动画并指定动画属性
    CABasicAnimation *basicAnimation=[CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    //2.设置动画属性初始值、结束值
    //    basicAnimation.fromValue=[NSNumber numberWithInt:M_PI_2];
    basicAnimation.toValue=[NSNumber numberWithFloat:M_PI_2*3];
    
    //设置其他动画属性
    basicAnimation.duration=1.0;
    basicAnimation.autoreverses=NO;//旋转后再旋转到原来的位置
    basicAnimation.removedOnCompletion=NO;//运行一次是否移除动画

    
    //4.添加动画到图层，注意key相当于给动画进行命名，以后获得该动画时可以使用此名称获取
    [_layer addAnimation:basicAnimation forKey:@"KCBasicAnimation_Rotation"];
}

#pragma mark 点击事件
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch=touches.anyObject;
    CGPoint location= [touch locationInView:self.view];
    //创建并开始动画
    [self translatonAnimation:location];
    
    [self rotationAnimation];
}
#pragma mark - 动画代理方法
#pragma mark 动画开始
    -(void)animationDidStart:(CAAnimation *)anim{
        NSLog(@"animation(%@) start.\r_layer.frame=%@",anim,NSStringFromCGRect(_layer.frame));
        NSLog(@"%@",[_layer animationForKey:@"KCBasicAnimation_Translation"]);//通过前面的设置的key获得动画
    }
    
#pragma mark 动画结束
    -(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
        NSLog(@"animation(%@) stop.\r_layer.frame=%@",anim,NSStringFromCGRect(_layer.frame));
        _layer.position=[[anim valueForKey:@"KCBasicAnimationLocation"] CGPointValue];
    }


@end