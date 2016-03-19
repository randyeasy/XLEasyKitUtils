//
//  UIView+XLEKey.m
//  Pods
//
//  Created by Randy on 15/11/27.
//
//

#import "UIView+XLEKey.h"
#import <objc/runtime.h>

static char XLEViewObjectKey;

@implementation UIView (XLEKey)
@dynamic XLE_key;

- (id)XLE_key
{
    return objc_getAssociatedObject(self, &XLEViewObjectKey);
}

- (void)setXLE_key:(id)XLE_key
{
    objc_setAssociatedObject(self, &XLEViewObjectKey,
                             XLE_key,
                             OBJC_ASSOCIATION_RETAIN);
}

@end
