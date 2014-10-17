//
//  ViewController.h
//  NPRUploadAnimation
//
//  Created by  on 10/17/14.
//  Copyright (c) 2014 Delightful. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NPRUploadProgressView.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet NPRUploadProgressView *uploadProgressView;

- (IBAction)progressChanged:(id)sender;

@end

