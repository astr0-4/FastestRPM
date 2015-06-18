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

- (void)viewDidLoad {
    [super viewDidLoad];
    _needle.transform = CGAffineTransformRotate(_needle.transform, -40*M_PI/180);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
