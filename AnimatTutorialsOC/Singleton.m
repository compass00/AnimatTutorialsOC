//
//  Singleton.m
//  AnimatTutorialsOC
//
//  Created by JiaLi on 16/3/25.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import "Singleton.h"
static Singleton* st = nil;

@implementation Singleton

+ (Singleton*)shareInstance {
    if (st == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            st = [[super allocWithZone:nil] init];
        });

    }
    
    return st;
}

+ (id)allocWithZone:(struct _NSZone *)zone {
    return [self shareInstance];
}

+ (id)copy {
    return self;
}

+ (id)retain {
    return self;
}


@end
