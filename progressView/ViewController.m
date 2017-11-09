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

@property (nonatomic, strong) XDProgressView *customProgressView;
@property (nonatomic, strong) UIProgressView *systomProgressView;
@property (nonatomic, assign) CGFloat progress;

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _progress += 0.05;
    _systomProgressView.progress = _progress;
    _customProgressView.progress = _progress;
    if (_progress > 0.95) {
        _progress = 0.0;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _systomProgressView = [[UIProgressView alloc] initWithFrame:CGRectMake(100, 100, 200, 30)];
    CGPoint center = self.view.center;
    center.y -= 60;
    _systomProgressView.center = center;
    _systomProgressView.progress = 0.5;
    _systomProgressView.progressTintColor = [UIColor greenColor];
    _systomProgressView.trackTintColor = [UIColor redColor];
//    _systomProgressView.trackImage = [UIImage imageNamed:@"progressImage"];
    [self.view addSubview:_systomProgressView];
    
    _customProgressView = [[XDProgressView alloc] initWithFrame:(CGRect){0, 0, 200, 30}];
    _customProgressView.center = self.view.center;
    _customProgressView.progress = 0.5;
    _customProgressView.progressTintColor = [UIColor greenColor];
    _customProgressView.trackTintColor = [UIColor redColor];
    _customProgressView.text = @"xindong";
//    _customProgressView.trackImage = [UIImage imageNamed:@"progressImage"];
//    _customProgressView.roundedCorner = YES;
//    _customProgressView.animationDuration = 1.0;
    _customProgressView.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_customProgressView];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
