//
//  UIView+line.h
//  BJEducation_student
//
//  Created by Mrlu-bjhl on 14-9-18.
//  Copyright (c) 2014年 Baijiahulian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XLEline)

+ (UIView *)XLE_lineWithColor:(UIColor *)color frame:(CGRect)frame;

+ (UIView *)XLE_lineWithColor:(UIColor *)color size:(CGSize)size;

+ (UIView *)XLE_graylineWithFrame:(CGRect)frame;

+ (UIView *)XLE_graylineWithSize:(CGSize)size;

+ (UIView *)XLE_graylineWithWidth:(CGFloat)width;


@end
