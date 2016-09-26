//
//  SpringViewController.m
//  AnimatTutorialsOC
//
//  Created by JiaLi on 16/2/23.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import "SpringViewController.h"
#import <objc/runtime.h>
#import "Singleton.h"

@interface SpringViewController ()
@property int lablenumber;

@end

@implementation SpringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.ball0.center = CGPointMake(self.view.center.x, 85.0);
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timeShowText) userInfo:nil repeats:YES];
    _lablenumber = 0;
   [[NSRunLoop mainRunLoop]addTimer:timer forMode:NSDefaultRunLoopMode];
    unsigned int outCount = 0;
    Ivar * ivars = class_copyIvarList([SpringViewController class], &outCount);
    for (unsigned int i = 0; i < outCount; i ++) {
        Ivar ivar = ivars[i];
        const char * name = ivar_getName(ivar);
        const char * type = ivar_getTypeEncoding(ivar);
        NSLog(@"类型为 %s 的 %s ",type, name);
    }
    free(ivars);
    
     outCount = 0;
    objc_property_t * properties = class_copyPropertyList([SpringViewController class], &outCount);
    for (unsigned int i = 0; i < outCount; i ++) {
        objc_property_t property = properties[i];
        //属性名
        const char * name = property_getName(property);
        //属性描述
        const char * propertyAttr = property_getAttributes(property);
        NSLog(@"属性描述为 %s 的 %s ", propertyAttr, name);
        
        //属性的特性
        unsigned int attrCount = 0;
        objc_property_attribute_t * attrs = property_copyAttributeList(property, &attrCount);
        for (unsigned int j = 0; j < attrCount; j ++) {
            objc_property_attribute_t attr = attrs[j];
            const char * name = attr.name;
            const char * value = attr.value;
            NSLog(@"属性的描述：%s 值：%s", name, value);
        }
        free(attrs);
        NSLog(@"\n");
    }
    free(properties);
    __weak __block SpringViewController *blockSelf = self;
    int height_example = {{5, 5, 5}, {5, 5, 5},{5, 5, 5}};

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [blockSelf delayLog];
    });
    
    //Singleton* s = [Singleton shareInstance];
    //Singleton* ts = [[Singleton alloc] init];
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
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);// dispatch_get_main_queue()
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, queue, ^{
        [blockSelf loopHugBlock];
    });
    
    dispatch_group_async(group, queue, ^{
        [blockSelf loopHugBlock];
        
    });
 

    dispatch_group_async(group, queue, ^{
        [blockSelf loopHugBlock];
        
     });
    
    dispatch_group_async(group, queue, ^{
        [blockSelf loopHugBlock];
        
     });

    dispatch_group_notify(group, queue, ^{
        [blockSelf loopHugBlock];
        
    });
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

- (void)loopHugBlock {
    for (int i=0; i++; i< 100) {
       // NSURL * url = [NSURL URLWithString:@"http://avatar.csdn.net/2/C/D/1_totogo2010.jpg"];
       // NSData * data = [[NSData alloc]initWithContentsOfURL:url];
        //UIImage *image = [[UIImage alloc]initWithData:data];
        NSLog(@"block%d", i);
        //if (data != nil) {
        //    dispatch_async(dispatch_get_main_queue(), ^{
        //        NSLog(@"%d", i);
        //    });
        //}
    }

}

- (void)timeShowText {

    [UIView animateWithDuration: 0.5 delay: 0.01 options: 0 animations: ^{
        self.label.text = [NSString stringWithFormat:@"%d", _lablenumber];
        self.label.alpha = 0.0;
        self.label.transform = CGAffineTransformMakeScale(2.0, 2.0);
        //[self.label setNeedsDisplay];
     }completion:^(BOOL finished){
         self.label.alpha = 1.0;
        self.label.transform = CGAffineTransformMakeScale(1.0, 1.0);

    }];
    _lablenumber++;
}

void walkFunc(id self, SEL _cmd) {
    //let the dog walk
}

+ (BOOL)resolveClassMethod:(SEL)sel {
    
    NSString * selString = NSStringFromSelector(sel);
    if ([selString isEqualToString:@"walk"]) {
        class_addMethod(self.class, @selector(walk), (IMP)walkFunc, "@:");
    }
    return [super resolveInstanceMethod:sel];
}
- (void)delayLog {
    NSLog(@"dispatch log......");
}
@end
