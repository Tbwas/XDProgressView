
//
//  XDProgressView.m
//  practice
//
//  Created by xindong on 17/2/9.
//  Copyright © 2017年 xindong. All rights reserved.
//

#import "XDProgressView.h"

#define kWidth  self.frame.size.width
#define kHeight self.frame.size.height

@interface XDProgressLayer : CALayer

- (instancetype)initWithFrame:(CGRect)frame;

@property (nonatomic, assign) float progress;
@property (nonatomic, strong, nullable) UIColor *progressTintColor;
@property (nonatomic, strong, nullable) UIImage *progressImage;
@property (nonatomic, strong, nullable) UIImage *trackImage;
@property (nonatomic, strong, nullable) NSString *text;
@property (nonatomic, strong, nullable) UIColor *textColor;
@property (nonatomic, strong, nullable) UIFont  *font;
@property (nonatomic, assign) NSTextAlignment textAlignment;

- (void)setProgress:(float)progress animated:(BOOL)animated;

@end

@implementation XDProgressLayer {
    CATextLayer *_textLayer;
    CAGradientLayer *_gradientLayer;
    CALayer *_imageLayer;
    BOOL _didLayout;
    BOOL _isAnimated;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super init]) {
        self.frame = frame;
    }
    return self;
}

- (void)display {
    [super display];
    // TO DO
}

- (void)drawInContext:(CGContextRef)ctx {
    CGRect rect = CGRectMake(0, 0, self.progress * kWidth, kHeight);
    if (self.trackImage) {    // trackImage
        CGContextScaleCTM(ctx, 1, -1);
        CGContextTranslateCTM(ctx, 0, -rect.size.height);
        CGContextDrawImage(ctx, rect, self.trackImage.CGImage);
    }
    if (self.progressImage) { // progressImage
        CGContextScaleCTM(ctx, 1, -1);
        CGContextTranslateCTM(ctx, 0, -rect.size.height);
        CGContextDrawImage(ctx, rect, self.progressImage.CGImage);
    } else  {                 // progressTintColor
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:self.cornerRadius];
        CGContextAddPath(ctx, path.CGPath);
        CGContextSetFillColorWithColor(ctx, self.progressTintColor.CGColor);
        CGContextFillPath(ctx);
    }
}

- (void)layoutSublayers {
    if (_didLayout) return;
    if (!self.font) self.font = [UIFont systemFontOfSize:17.0];
    CGSize size = [self.text sizeWithAttributes:@{NSFontAttributeName:self.font}];
    self.textLayer.frame = (CGRect){0, (kHeight - size.height) / 2, kWidth, size.height};
    _didLayout = YES;
}

- (void)setProgress:(float)progress animated:(BOOL)animated {
    _isAnimated = animated;
    self.progress = progress;
    // TO DO
}

- (void)setTextFont:(UIFont *)font {
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    self.textLayer.font = fontRef;
    self.textLayer.fontSize = font.pointSize;
    CGFontRelease(fontRef);
}

#pragma mark - Property
- (void)setProgress:(float)progress {
    _progress = progress > 1.0 ? 1.0 : progress < 0.0 ? 0.0 : progress;
    [self setNeedsDisplay];
}

- (void)setText:(NSString *)text {
    _text = text;
    self.textLayer.string = text;
}

- (void)setFont:(UIFont *)font {
    _font = font;
    [self setTextFont:font];
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    self.textLayer.foregroundColor = textColor.CGColor;
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment {
    _textAlignment = textAlignment;
    switch (textAlignment) {
        case NSTextAlignmentLeft:
            self.textLayer.alignmentMode = kCAAlignmentLeft;
            break;
        case NSTextAlignmentCenter:
            self.textLayer.alignmentMode = kCAAlignmentCenter;
            break;
        case NSTextAlignmentRight:
            self.textLayer.alignmentMode = kCAAlignmentRight;
            break;
        case NSTextAlignmentJustified:
            self.textLayer.alignmentMode = kCAAlignmentJustified;
            break;
        case NSTextAlignmentNatural:
            self.textLayer.alignmentMode = kCAAlignmentNatural;
            break;
        default:
            break;
    }
}

- (CATextLayer *)textLayer {
    if (!_textLayer) {
        _textLayer = [CATextLayer layer];
        _textLayer.contentsScale = [UIScreen mainScreen].scale;
        [self addSublayer:_textLayer];
    }
    return _textLayer;
}

- (CALayer *)imageLayer {
    if (!_imageLayer) {
        _imageLayer = [CALayer layer];
        _imageLayer.frame = self.bounds;
        _imageLayer.contents = (__bridge id)(self.progressImage.CGImage);
        [self addSublayer:_imageLayer];
    }
    return _imageLayer;
}

@end


@implementation XDProgressView

+ (Class)layerClass {
    return [XDProgressLayer class];
}

- (void)setProgress:(float)progress animated:(BOOL)animated {
    if (_progress == progress) return;
    [(XDProgressLayer *)self.layer setProgress:progress animated:animated];
}

#pragma mark - Property
- (void)setProgress:(float)progress {
    if (_progress == progress) return;
    _progress = progress;
    XDProgressLayer *layer = (XDProgressLayer *)self.layer;
    layer.progress = progress;
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment {
    if (_textAlignment == textAlignment) return;
    _textAlignment = textAlignment;
    XDProgressLayer *layer = (XDProgressLayer *)self.layer;
    layer.textAlignment = textAlignment;
}

- (void)setTrackTintColor:(UIColor *)trackTintColor {
    if (_trackTintColor == trackTintColor) return;
    _trackTintColor = trackTintColor;
    self.backgroundColor = trackTintColor;
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
- (void)setProgressTintColor:(UIColor *)progressTintColor {
    if (_progressTintColor == progressTintColor) return;
    _progressTintColor = progressTintColor;
    [self.layer performSelector:_cmd withObject:progressTintColor];
}

- (void)setProgressImage:(UIImage *)progressImage {
    if (_progressImage == progressImage) return;
    _progressImage = progressImage;
    [self.layer performSelector:_cmd withObject:progressImage];
}

- (void)setTrackImage:(UIImage *)trackImage {
    if (_trackImage == trackImage) return;
    _trackImage = trackImage;
    [self.layer performSelector:_cmd withObject:trackImage];
}

- (void)setText:(NSString *)text {
    if (_text == text) return;
    _text = text;
    [self.layer performSelector:_cmd withObject:text];
}

- (void)setTextColor:(UIColor *)textColor {
    if (_textColor == textColor) return;
    _textColor = textColor;
    [self.layer performSelector:_cmd withObject:textColor];
}

- (void)setFont:(UIFont *)font {
    if (_font == font) return;
    _font = font;
    [self.layer performSelector:_cmd withObject:font];
}
#pragma clang diagnostic pop

@end
