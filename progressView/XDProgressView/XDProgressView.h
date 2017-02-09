//
//  XDProgressView.h
//  practice
//
//  Created by xindong on 17/2/9.
//  Copyright © 2017年 xindong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XDProgressView : UIView

@property (nonatomic, assign) float progress; // 0.0 .. 1.0, default is 0.0. values outside are pinned.
@property (nonatomic, strong, nullable) UIColor *progressTintColor;
@property (nonatomic, strong, nullable) UIColor *trackTintColor;
@property (nonatomic, strong, nullable) UIImage *progressImage;
@property (nonatomic, strong, nullable) UIImage *trackImage;
@property (nonatomic, strong, nullable) NSString *text;
@property (nonatomic, strong, nullable) UIColor *textColor; // default is white color.
@property (nonatomic, strong, nullable) UIFont  *font; // default is 17.0.
@property (nonatomic, assign) NSTextAlignment textAlignment; // default is left.

- (void)setProgress:(float)progress animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
