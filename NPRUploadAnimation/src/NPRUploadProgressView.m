//
//  NPRUploadProgressView.m
//
//  Code generated using QuartzCode on 10/17/14.
//  www.quartzcodeapp.com
//

#import "NPRUploadProgressView.h"

@interface NPRUploadProgressView ()

@property (nonatomic, strong) CAShapeLayer *oval;
@property (nonatomic, strong) CAShapeLayer *oval2;
@property (nonatomic, strong) CAShapeLayer *arrow1;
@property (nonatomic, strong) CAShapeLayer *arrow2;
@property (nonatomic, strong) CAShapeLayer *checklist;

@end

@implementation NPRUploadProgressView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupLayers];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupLayers];
    }
    return self;
}


- (void)setupLayers{
    CAShapeLayer * oval = [CAShapeLayer layer];
    oval.frame       = CGRectMake(22, 43, 237, 237);
    oval.fillColor   = nil;
    oval.strokeColor = [UIColor colorWithRed:0.835 green: 0.835 blue:0.835 alpha:1].CGColor;
    oval.lineWidth   = 29;
    oval.path        = [self ovalPath].CGPath;
    [self.layer addSublayer:oval];
    
    CAShapeLayer * oval2 = [CAShapeLayer layer];
    oval2.frame       = CGRectMake(23, 42, 237, 237);
    oval2.fillColor   = nil;
    oval2.strokeColor = [UIColor colorWithRed:0.253 green: 0.527 blue:0.835 alpha:1].CGColor;
    oval2.lineWidth   = 29;
    oval2.path        = [self oval2Path].CGPath;
    oval2.strokeStart = 1;
    [self.layer addSublayer:oval2];
    _oval2 = oval2;
    
    CAShapeLayer * arrow1 = [CAShapeLayer layer];
    arrow1.anchorPoint = CGPointMake(0.5, 0.3);
    arrow1.frame       = CGRectMake(94, 163, 91, 53);
    [arrow1 setValue:@(-180 * M_PI/180) forKeyPath:@"transform.rotation"];
    arrow1.lineCap     = kCALineCapRound;
    arrow1.lineJoin    = kCALineJoinRound;
    arrow1.fillColor   = nil;
    arrow1.strokeColor = [UIColor colorWithRed:0.835 green: 0.835 blue:0.835 alpha:1].CGColor;
    arrow1.lineWidth   = 20;
    arrow1.path        = [self arrow1Path].CGPath;
    [self.layer addSublayer:arrow1];
    _arrow1 = arrow1;
    
    CAShapeLayer * arrow2 = [CAShapeLayer layer];
    arrow2.anchorPoint = CGPointMake(0.5, 0.3);
    arrow2.frame       = CGRectMake(94, 163, 91, 53);
    [arrow2 setValue:@(-180 * M_PI/180) forKeyPath:@"transform.rotation"];
    arrow2.lineCap     = kCALineCapRound;
    arrow2.lineJoin    = kCALineJoinRound;
    arrow2.fillColor   = nil;
    arrow2.strokeColor = [UIColor colorWithRed:0.835 green: 0.835 blue:0.835 alpha:1].CGColor;
    arrow2.lineWidth   = 20;
    arrow2.path        = [self arrow2Path].CGPath;
    [self.layer addSublayer:arrow2];
    _arrow2 = arrow2;
    [_arrow2 setHidden:YES];
    
    CAShapeLayer * checklist = [CAShapeLayer layer];
    checklist.anchorPoint = CGPointMake(0.5, 0.3);
    checklist.frame       = CGRectMake(95, 127, 124, 88);
    checklist.lineCap     = kCALineCapRound;
    checklist.lineJoin    = kCALineJoinRound;
    checklist.fillColor   = nil;
    checklist.strokeColor = [UIColor colorWithRed:0 green: 0 blue:0 alpha:0].CGColor;
    checklist.lineWidth   = 20;
    checklist.path        = [self checklistPath].CGPath;
    [self.layer addSublayer:checklist];
    
    [self.oval2 addAnimation:[self oval2Animation] forKey:@"oval2Animation"];
    [self.arrow1 addAnimation:[self pathAnimation] forKey:@"pathAnimation"];
    [self.arrow2 addAnimation:[self path2Animation] forKey:@"path2Animation"];
    
    [self.oval2 setSpeed:0];
    [self.arrow1 setSpeed:0];
    [self.arrow2 setSpeed:0];
}


- (IBAction)startAllAnimations:(id)sender{
    [self.oval2 setSpeed:2];
    [self.arrow1 setSpeed:2];
    [self.arrow2 setSpeed:2];
    
    [self.oval2 addAnimation:[self oval2Animation] forKey:@"oval2Animation"];
    [self.arrow1 addAnimation:[self pathAnimation] forKey:@"pathAnimation"];
    [self.arrow2 addAnimation:[self path2Animation] forKey:@"path2Animation"];
    [self updateValueFromAnimationsForLayers:@[self.oval2, self.arrow1, self.arrow2]];
}


- (void)setProgress:(CGFloat)progress {
    [self.oval2 setTimeOffset:progress];
    [self.arrow1 setTimeOffset:progress];
    [self.arrow2 setTimeOffset:progress];
}

- (CABasicAnimation*)oval2Animation{
    CABasicAnimation * strokeStartAnim = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    strokeStartAnim.fromValue          = @1;
    strokeStartAnim.toValue            = @0;
    strokeStartAnim.duration           = 0.8;
    strokeStartAnim.removedOnCompletion = NO;
    strokeStartAnim.fillMode = kCAFillModeForwards;
    
    return strokeStartAnim;
}

- (CAAnimationGroup*)pathAnimation{
    CAKeyframeAnimation * transformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    transformAnim.values                = @[@(-180 * M_PI/180),
                                            @(180 * M_PI/180)];
    transformAnim.keyTimes              = @[@0, @1];
    transformAnim.duration              = 0.8;
    
    CABasicAnimation * hiddenAnim = [CABasicAnimation animationWithKeyPath:@"hidden"];
    hiddenAnim.fromValue          = @NO;
    hiddenAnim.toValue            = @YES;
    hiddenAnim.duration           = 0.05;
    hiddenAnim.beginTime          = 0.75;
    
    CAAnimationGroup *pathAnim   = [CAAnimationGroup animation];
    pathAnim.animations          = @[transformAnim, hiddenAnim];
    [pathAnim.animations setValue:kCAFillModeBoth forKeyPath:@"fillMode"];
    pathAnim.fillMode            = kCAFillModeForwards;
    pathAnim.removedOnCompletion = NO;
    pathAnim.duration = [self maxDurationFromAnimations:pathAnim.animations];
    
    
    return pathAnim;
}

- (CAAnimationGroup*)path2Animation{
    CABasicAnimation * pathAnim = [CABasicAnimation animationWithKeyPath:@"path"];
    pathAnim.fromValue          = (id)[self arrow2Path].CGPath;
    pathAnim.toValue            = (id)[self checklistPath].CGPath;
    pathAnim.duration           = 0.1;
    pathAnim.beginTime          = 0.8;
    
    CABasicAnimation * transformAnim = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    transformAnim.fromValue          = @(-180 * M_PI/180);
    transformAnim.toValue            = @(0);
    transformAnim.duration           = 0.1;
    transformAnim.beginTime          = 0.8;
    
    CABasicAnimation * positionAnim = [CABasicAnimation animationWithKeyPath:@"position"];
    positionAnim.fromValue          = [NSValue valueWithCGPoint:CGPointMake(140, 178.972)];
    positionAnim.toValue            = [NSValue valueWithCGPoint:CGPointMake(129, 150.476)];
    positionAnim.duration           = 0.1;
    positionAnim.beginTime          = 0.8;
    
    CABasicAnimation * strokeColorAnim = [CABasicAnimation animationWithKeyPath:@"strokeColor"];
    strokeColorAnim.fromValue          = (id)[UIColor colorWithRed:0.835 green: 0.835 blue:0.835 alpha:1].CGColor;
    strokeColorAnim.toValue            = (id)[UIColor colorWithRed:0.255 green: 0.529 blue:0.835 alpha:1].CGColor;
    strokeColorAnim.duration           = 0.1;
    strokeColorAnim.beginTime          = 0.8;
    
    CABasicAnimation * hiddenAnim = [CABasicAnimation animationWithKeyPath:@"hidden"];
    hiddenAnim.fromValue          = @YES;
    hiddenAnim.toValue            = @NO;
    hiddenAnim.duration           = 0.05;
    hiddenAnim.beginTime          = 0.75;
    
    CAAnimationGroup *pathAnimGroup   = [CAAnimationGroup animation];
    pathAnimGroup.animations          = @[pathAnim, transformAnim, positionAnim, strokeColorAnim, hiddenAnim];
    [pathAnimGroup.animations setValue:kCAFillModeBoth forKeyPath:@"fillMode"];
    pathAnimGroup.fillMode            = kCAFillModeForwards;
    pathAnimGroup.removedOnCompletion = NO;
    pathAnimGroup.duration = [self maxDurationFromAnimations:pathAnimGroup.animations];
    
    
    return pathAnimGroup;
}

#pragma mark - Bezier Path


- (UIBezierPath*)ovalPath{
    UIBezierPath*  ovalPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 237, 237)];;
    return ovalPath;
}


- (UIBezierPath*)oval2Path{
    UIBezierPath *oval2Path = [UIBezierPath bezierPath];
    [oval2Path moveToPoint:CGPointMake(118.307, 0)];
    [oval2Path addCurveToPoint:CGPointMake(0, 118.307) controlPoint1:CGPointMake(52.968, 0) controlPoint2:CGPointMake(0, 52.968)];
    [oval2Path addCurveToPoint:CGPointMake(118.307, 236.613) controlPoint1:CGPointMake(0, 183.646) controlPoint2:CGPointMake(52.968, 236.613)];
    [oval2Path addCurveToPoint:CGPointMake(236.613, 118.307) controlPoint1:CGPointMake(183.646, 236.613) controlPoint2:CGPointMake(236.613, 183.646)];
    [oval2Path addCurveToPoint:CGPointMake(118.307, 0) controlPoint1:CGPointMake(236.613, 52.968) controlPoint2:CGPointMake(183.646, 0)];
    
    return oval2Path;
}


- (UIBezierPath*)arrow1Path{
    UIBezierPath *arrow1Path = [UIBezierPath bezierPath];
    [arrow1Path moveToPoint:CGPointMake(0, 0)];
    [arrow1Path addLineToPoint:CGPointMake(45.439, 52.57)];
    [arrow1Path addLineToPoint:CGPointMake(90.879, 0)];
    
    return arrow1Path;
}


- (UIBezierPath*)checklistPath{
    UIBezierPath *checklistPath = [UIBezierPath bezierPath];
    [checklistPath moveToPoint:CGPointMake(0, 35.389)];
    [checklistPath addLineToPoint:CGPointMake(45.439, 87.959)];
    [checklistPath addLineToPoint:CGPointMake(123.775, 0)];
    
    return checklistPath;
}


- (UIBezierPath*)arrow2Path{
    UIBezierPath *arrow2Path = [UIBezierPath bezierPath];
    [arrow2Path moveToPoint:CGPointMake(0, 0)];
    [arrow2Path addLineToPoint:CGPointMake(45.439, 52.57)];
    [arrow2Path addLineToPoint:CGPointMake(90.879, 0)];
    
    return arrow2Path;
}

#pragma mark - Others

- (void)updateValueFromAnimationsForLayers:(NSArray*)layers{
    for (CALayer *layer in layers) {
        [self updateValueFromAnimationsForLayer:layer];
    }
}

- (void)updateValueFromAnimationsForLayer:(CALayer *)layer{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    void (^__block updateValueForAnim)(CAAnimation *) = ^(CAAnimation *anim){
        if ([anim isKindOfClass:[CABasicAnimation class]]) {
            CABasicAnimation *basicAnim = (CABasicAnimation*)anim;
            if (!basicAnim.autoreverses) [layer setValue:basicAnim.toValue forKey:basicAnim.keyPath];
        }
        else if ([anim isKindOfClass:[CAKeyframeAnimation class]]) {
            CAKeyframeAnimation *keyAnim = (CAKeyframeAnimation*)anim;
            if (!anim.autoreverses) [layer setValue:keyAnim.values.lastObject forKey:keyAnim.keyPath];
        }
        else if ([anim isKindOfClass:[CAAnimationGroup class]]) {
            CAAnimationGroup *groupAnim = (CAAnimationGroup*)anim;
            for (CAAnimation *subAnim in groupAnim.animations) {
                updateValueForAnim(subAnim);
            }
        }
    };
    for (NSString *animKey in layer.animationKeys) {
        CAAnimation *anim = [layer animationForKey:animKey];
        updateValueForAnim(anim);
    }
    
    [CATransaction commit];
}

- (CGFloat)maxDurationFromAnimations:(NSArray*)anims{
    CGFloat maxDuration = 0;
    for (CAAnimation *anim in anims) {
        maxDuration = MAX(anim.beginTime + anim.duration * (CGFloat)(anim.repeatCount == 0 ? 1.0f : anim.repeatCount) * (anim.autoreverses ? 2.0f : 1.0f), maxDuration);
    }
    if (maxDuration == INFINITY) {
        maxDuration = 1000.0f;
    }
    
    return maxDuration;
}

@end