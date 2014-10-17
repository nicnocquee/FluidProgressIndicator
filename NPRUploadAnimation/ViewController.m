//
//  ViewController.m
//  NPRUploadAnimation
//
//  Created by  on 10/17/14.
//  Copyright (c) 2014 Delightful. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnProgress:)];
    [self.uploadProgressView setUserInteractionEnabled:YES];
    [self.uploadProgressView addGestureRecognizer:tapGesture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tapOnProgress:(UITapGestureRecognizer *)gesture {
    [self.uploadProgressView startAllAnimations:nil];
}

- (IBAction)progressChanged:(UISlider *)sender {
    [self.uploadProgressView setProgress:sender.value];
}
@end
