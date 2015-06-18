//
//  ViewController.m
//  FastestRPM
//
//  Created by Alex on 2015-06-18.
//  Copyright (c) 2015 Alex. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _needle.transform = CGAffineTransformRotate(_needle.transform, -40*M_PI/180);

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer
{
    
    CGPoint velocity = [recognizer velocityInView:self.view];
    CGFloat magnitude = sqrtf((velocity.x * velocity.x) + (velocity.y * velocity.y));

    if(magnitude < 6000) {
        NSLog(@"magnitude 1: %lf", magnitude);
        float translator = magnitude/240;
        self.needle.transform = CGAffineTransformMakeRotation(translator*M_PI/180 - 40*M_PI/180);
        NSLog(@"translator: %lf", translator);
    }
    
    else {
        self.needle.transform = CGAffineTransformMakeRotation(240*M_PI/180);
    }
    
    if ([recognizer state] == UIGestureRecognizerStateEnded)
    {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(doAnimation) userInfo:nil repeats:YES];
    }
    
}


-(void)doFancyAnimation {
    CALayer* layer = self.needle.layer;
    CABasicAnimation* animation;
    animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    animation.fromValue = [NSNumber numberWithFloat: -40*M_PI/180];
    animation.toValue = [NSNumber numberWithFloat:240*M_PI/180];
    
    animation.duration = 1.0;
    animation.cumulative = YES;
    animation.repeatCount = 0;
    animation.removedOnCompletion = YES;
    animation.fillMode = kCAFillModeForwards;
    
    [layer addAnimation:animation forKey:@"transform.rotation.z"];
}


-(void)doAnimation {
    [UIView animateWithDuration:1.0 delay:0.0 options:0 animations:^{
        self.needle.transform = CGAffineTransformMakeRotation(-40*M_PI/180);
        
    } completion:^(BOOL finished) {
        NSLog(@"animation done");
    }];

}


@end

