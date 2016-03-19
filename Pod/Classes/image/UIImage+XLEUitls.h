//
//  UIImage+XLEUitls.h
//  Pods
//
//  Created by Randy on 15/12/5.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (XLEUitls)

- (UIImage *)XLE_imageToSize:(CGSize) size;
- (UIImage *)XLE_grayImage;
- (UIImage *)XLE_imageWithRenderingOriginal;
- (UIImage *)XLE_imageWithRenderingTemplate;
+ (UIImage *)XLE_imageWithColor:(UIColor *)color size:(CGSize)imgSize;
- (UIImage *)XLE_imageWithTintColor:(UIColor *)tintColor;
- (UIImage *)XLE_imageWithGradientTintColor:(UIColor *)tintColor;

- (UIImage *)XLE_imageWithTintColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode;

+ (UIImage *)XLE_imageFromView:(UIView *)orgView;

+ (UIImage *)XLE_imageFromAttributtedText:(NSAttributedString *)aAtt size:(CGSize)size;

@end
