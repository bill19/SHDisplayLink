//
//  SHCountDownView.m
//  SHDisplayLink
//
//  Created by sunhao on 2018/9/11.
//  Copyright © 2018年 Bill. All rights reserved.
//

#import "SHCountDownView.h"

static CFTimeInterval const kScreenShotTimeDiff = 10;

@interface SHCountDownView ()

@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, assign) CFTimeInterval starTime;
@property (nonatomic, strong) UILabel *countLab;
@end

@implementation SHCountDownView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //INFO
        [self setupSubViews];
        [self creatDisplayLink];
    }
    return self;
}
- (void)setupSubViews {

    UILabel *countLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    countLab.font = [UIFont systemFontOfSize:14.0f];
    countLab.textColor = [UIColor redColor];
    countLab.text = [NSString stringWithFormat:@"倒计时%.lf",kScreenShotTimeDiff];
    countLab.backgroundColor = [UIColor greenColor];
    [self addSubview:countLab];
    self.countLab = countLab;

}

- (void)creatDisplayLink {
    _starTime = 0;
    if (!_displayLink) {
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(countdown:)];
        [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
}

- (void)stopCountTime {
    [_displayLink invalidate];
    _displayLink = nil;
    _starTime = 0;
}

- (void)countdown:(CADisplayLink *)displayLink {
    if (!self.starTime) {
        self.starTime = displayLink.timestamp;
    }
    CFTimeInterval timeDifference = displayLink.timestamp - self.starTime;
    self.countLab.text = [NSString stringWithFormat:@"倒计时%.lf",timeDifference/1];
    if (timeDifference > kScreenShotTimeDiff) {
        self.displayLink.paused = YES;
        [self stopCountTime];
    }
}

@end
