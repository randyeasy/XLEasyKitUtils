//
//  UIButton+XLEEdgeInsets.h
//  Pods
//
//  Created by Randy on 16/2/25.
//
//

//TODO 测试

#import <UIKit/UIKit.h>
#import "XLEViewType.h"

@interface UIButton (XLEEdgeInsets)

- (void)XLE_setImagePoint:(CGPoint)point;
- (void)XLE_setTitlePoint:(CGPoint)point;

- (void)XLE_setImageEdgeWithOffset:(CGFloat)offset
                         direction:(XLEViewDirectionType)direction;
- (void)XLE_setTitleEdgeWithOffset:(CGFloat)offset
                         direction:(XLEViewDirectionType)direction;
- (void)XLE_setContentEdgeWithOffset:(CGFloat)offset
                         direction:(XLEViewDirectionType)direction;

@end
