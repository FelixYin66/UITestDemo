//
//  CALayer+Add.h
//  UITestDemo
//
//  Created by FelixYin on 2020/5/24.
//  Copyright © 2020 FelixYin. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (Add)

@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGPoint center;
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;
@property (nonatomic) CGPoint origin;
@property (nonatomic, getter=frameSize, setter=setFrameSize:) CGSize  size;

@end

NS_ASSUME_NONNULL_END
