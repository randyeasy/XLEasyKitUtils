//
//  UIView+Basic.h
//  MotherBaby
//
//  Created by Mac_ZL on 14-08-26.
//  Copyright (c) 2014年 Baijiahulian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView(XLEBasic)

@property (nonatomic) CGFloat XLE_current_x;

@property (nonatomic) CGFloat XLE_current_y;


@property (nonatomic) CGFloat XLE_current_w;


@property (nonatomic) CGFloat XLE_current_h;


@property (nonatomic) CGFloat XLE_current_y_h;


@property (nonatomic) CGFloat XLE_current_x_w;


@property (nonatomic, readonly) CGPoint XLE_current_innerCenter;

/**
 * Return the x coordinate on the screen.
 */
@property (nonatomic, readonly) CGFloat XLE_screenX;

/**
 * Return the y coordinate on the screen.
 */
@property (nonatomic, readonly) CGFloat XLE_screenY;

/**
 * Return the x coordinate on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGFloat XLE_screenViewX;

/**
 * Return the y coordinate on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGFloat XLE_screenViewY;

/**
 * Return the view frame on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGRect XLE_screenFrame;

/**
 * Shortcut for frame.origin
 */
@property (nonatomic) CGPoint XLE_origin;

/**
 * Shortcut for frame.size
 */
@property (nonatomic) CGSize XLE_size;

/**
 * Shortcut for center.x
 *
 * Sets center.x = centerX
 */
@property (nonatomic) CGFloat XLE_centerX;

/**
 * Shortcut for center.y
 *
 * Sets center.y = centerY
 */
@property (nonatomic) CGFloat XLE_centerY;



@property (nonatomic) CGPoint XLE_orientationCenter;

/**
 * Return the width in portrait or the height in landscape.
 */
@property (nonatomic, readonly) CGFloat XLE_orientationWidth;

/**
 * Return the height in portrait or the width in landscape.
 */
@property (nonatomic, readonly) CGFloat XLE_orientationHeight;

/**
 * Finds the first descendant view (including this view) that is a member of a particular class.
 */
- (UIView*)XLE_descendantOrSelfWithClass:(Class)cls;

/**
 * Finds the first ancestor view (including this view) that is a member of a particular class.
 */
- (UIView*)XLE_ancestorOrSelfWithClass:(Class)cls;

/**
 *  view subviews iscontain view of kind of cls
 */
- (BOOL)XLE_subViewsContaionWithClass:(Class)cls;

/**
 * Removes all subviews.
 */
- (void)XLE_removeAllSubviews;

/**
 * The view controller whose view contains this view.
 */
- (UIViewController*)XLE_viewController;


//截图
+(UIImage *)XLE_captureView:(UIView *)theView;

@end
