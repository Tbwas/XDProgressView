//
//  ViewController.m
//  progressView
//
//  Created by xindong on 17/2/9.
//  Copyright © 2017年 xindong. All rights reserved.
//

#import "ViewController.h"
#import "XDProgressView.h"

@interface ViewController ()

@property (nonatomic, strong) XDProgressView *progressView;

@end

@implementation ViewController {
    UIProgressView *pp;
    CGFloat _progress;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _progress += 0.05;
    if (_progressView.progress > 0.99) {
        _progressView.progress = 0.0;
    }
    [pp setProgress:_progress animated:YES];
    [self.progressView setProgress:_progress animated:NO];
//    self.progressView.progress += _progress;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _progressView = [[XDProgressView alloc] initWithFrame:(CGRect){0, 0, 200, 30}];
    _progressView.center = self.view.center;
    _progressView.progress = 0.3;
    _progressView.progressImage = [[UIImage imageNamed:@"progressImage.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _progressView.trackImage = [[UIImage imageNamed:@"progressImage.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

//    _progressView.progressTintColor = [UIColor greenColor];
//    _progressView.trackTintColor = [UIColor greenColor];
    _progressView.text = @"xindong";
    _progressView.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_progressView];
    
#warning -- trackImage and progressImage animated
    
    pp = [[UIProgressView alloc] initWithFrame:CGRectMake(100, 100, 200, 30)];
    pp.progress = 0.4;
    pp.progressImage = [[UIImage imageNamed:@"progressImage.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    pp.trackTintColor = [UIColor lightGrayColor];
    [self.view addSubview:pp];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
