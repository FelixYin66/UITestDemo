//
//  ViewController.m
//  UITestDemo
//
//  Created by FelixYin on 2020/5/24.
//  Copyright © 2020 FelixYin. All rights reserved.
//

#import "ViewController.h"
#import "UIAnimationPauseAndPlayView.h"
#import "UIView+Add.h"

@interface ViewController ()

@property (nonatomic,strong) UIAnimationPauseAndPlayView *animationView1;
@property (nonatomic,assign) NSInteger number;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self.view addSubview:self.animationView1];
}

// MARK: TouchBegan

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (_number == 0) {
        [self.animationView1 play];
    }
    if (_number%2 == 1) {
        [self.animationView1 pause];
    }
    
    if (_number > 0 &&_number%2 == 0) {
        [self.animationView1 resume];
    }
    _number++;
}


// MARK: Lazy Loading

- (UIAnimationPauseAndPlayView *)animationView1{
    if (!_animationView1) {
        _animationView1 = [[UIAnimationPauseAndPlayView alloc] initWithFrame:CGRectMake(100, 84, 100, 100)];
    }
    return _animationView1;;
}

@end
