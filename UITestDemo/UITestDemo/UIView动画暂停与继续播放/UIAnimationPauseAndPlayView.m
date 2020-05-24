//
//  UIAnimationPauseAndPlayView.m
//  UITestDemo
//
//  Created by FelixYin on 2020/5/24.
//  Copyright © 2020 FelixYin. All rights reserved.
//

#import "UIAnimationPauseAndPlayView.h"

@implementation UIAnimationPauseAndPlayView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)play{
    CFTimeInterval currentTime = [self.layer convertTime:CACurrentMediaTime() fromLayer:nil];
    NSLog(@"Play Begin CACurrentMediaTime:%f", currentTime) ;
    [UIView animateWithDuration:3 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        [UIView setAnimationRepeatCount:MAXFLOAT];
        self.alpha = 0;
    } completion:nil];
}

//t = (tp - begin) * speed + offset.
- (void)pause{
    CFTimeInterval pausedTime = [self.layer convertTime:CACurrentMediaTime() fromLayer:nil];
    NSLog(@"Pause CACurrentMediaTime:%f",pausedTime) ;
    self.layer.speed = 0.0;
    self.layer.timeOffset = pausedTime; //记录暂停时的时间
}

//t = (tp - begin) * speed + offset. = （1000 - 0)*1 + 1 = 1001  需要明确一细节点，时间是一直在走的
- (void)resume{
    CFTimeInterval pausedTime = [self.layer timeOffset];
    CFTimeInterval currentTime = [self.layer convertTime:CACurrentMediaTime() fromLayer:nil];
    self.layer.speed = 1.0;
    self.layer.timeOffset = 0.0;
    self.layer.beginTime = 0.0;
    NSLog(@"Resume Begin CACurrentMediaTime:%f", currentTime) ;
    CFTimeInterval timeSincePause = currentTime - pausedTime; //计算动画暂停时长
    self.layer.beginTime = timeSincePause;
    NSLog(@"Resume End CACurrentMediaTime:%f",[self.layer convertTime:CACurrentMediaTime() fromLayer:nil]) ;
}

@end
