//
//  UIActionSheet+Blocks.m
//  XLEActionSheetBlocks
//
//  Created by Ryan Maxwell on 31/08/13.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2013 Ryan Maxwell
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//  the Software, and to permit persons to whom the Software is furnished to do so,
//  subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//  FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "UIActionSheet+XLEBlocks.h"

#import <objc/runtime.h>


@interface XLEActionSheetProxy : NSObject<UIActionSheetDelegate>
@end

static const void *XLEActionSheetProxyKey         = &XLEActionSheetProxyKey;
static const void *XLEActionSheetOriginalDelegateKey = &XLEActionSheetOriginalDelegateKey;

static const void *XLEActionSheetTapBlockKey         = &XLEActionSheetTapBlockKey;
static const void *XLEActionSheetWillPresentBlockKey = &XLEActionSheetWillPresentBlockKey;
static const void *XLEActionSheetDidPresentBlockKey  = &XLEActionSheetDidPresentBlockKey;
static const void *XLEActionSheetWillDismissBlockKey = &XLEActionSheetWillDismissBlockKey;
static const void *XLEActionSheetDidDismissBlockKey  = &XLEActionSheetDidDismissBlockKey;
static const void *XLEActionSheetCancelBlockKey      = &XLEActionSheetCancelBlockKey;

#define NSArrayObjectMaybeNil(__ARRAY__, __INDEX__) ((__INDEX__ >= [__ARRAY__ count]) ? nil : [__ARRAY__ objectAtIndex:__INDEX__])
// This is a hack to turn an array into a variable argument list. There is no good way to expand arrays into variable argument lists in Objective-C. This works by nil-terminating the list as soon as we overstep the bounds of the array. The obvious glitch is that we only support a finite number of buttons.
#define NSArrayToVariableArgumentsList(__ARRAYNAME__) NSArrayObjectMaybeNil(__ARRAYNAME__, 0), NSArrayObjectMaybeNil(__ARRAYNAME__, 1), NSArrayObjectMaybeNil(__ARRAYNAME__, 2), NSArrayObjectMaybeNil(__ARRAYNAME__, 3), NSArrayObjectMaybeNil(__ARRAYNAME__, 4), NSArrayObjectMaybeNil(__ARRAYNAME__, 5), NSArrayObjectMaybeNil(__ARRAYNAME__, 6), NSArrayObjectMaybeNil(__ARRAYNAME__, 7), NSArrayObjectMaybeNil(__ARRAYNAME__, 8), NSArrayObjectMaybeNil(__ARRAYNAME__, 9), nil

@interface UIActionSheet ()
@property (strong, nonatomic) XLEActionSheetProxy *XLE_proxy;
@end

@implementation UIActionSheet (XLEBlocks)
@dynamic XLE_tapBlock;
@dynamic XLE_cancelBlock;
@dynamic XLE_didDismissBlock;
@dynamic XLE_didPresentBlock;
@dynamic XLE_willDismissBlock;
@dynamic XLE_willPresentBlock;

+ (instancetype)XLE_showFromTabBar:(UITabBar *)tabBar
                     withTitle:(NSString *)title
             cancelButtonTitle:(NSString *)cancelButtonTitle
        destructiveButtonTitle:(NSString *)destructiveButtonTitle
             otherButtonTitles:(NSArray *)otherButtonTitles
                      tapBlock:(XLEActionSheetCompletionBlock)tapBlock {
    
    UIActionSheet *actionSheet = [[self alloc] initWithTitle:title
                                                    delegate:nil
                                           cancelButtonTitle:cancelButtonTitle
                                      destructiveButtonTitle:destructiveButtonTitle
                                           otherButtonTitles:NSArrayToVariableArgumentsList(otherButtonTitles)];

    if (tapBlock) {
        actionSheet.XLE_tapBlock = tapBlock;
    }
    
    [actionSheet showFromTabBar:tabBar];
    
#if !__has_feature(objc_arc)
    return [actionSheet autorelease];
#else
    return actionSheet;
#endif
}

+ (instancetype)XLE_showFromToolbar:(UIToolbar *)toolbar
                      withTitle:(NSString *)title
              cancelButtonTitle:(NSString *)cancelButtonTitle
         destructiveButtonTitle:(NSString *)destructiveButtonTitle
              otherButtonTitles:(NSArray *)otherButtonTitles
                       tapBlock:(XLEActionSheetCompletionBlock)tapBlock {
    
    UIActionSheet *actionSheet = [[self alloc] initWithTitle:title
                                                    delegate:nil
                                           cancelButtonTitle:cancelButtonTitle
                                      destructiveButtonTitle:destructiveButtonTitle
                                           otherButtonTitles:NSArrayToVariableArgumentsList(otherButtonTitles)];

    if (tapBlock) {
        actionSheet.XLE_tapBlock = tapBlock;
    }
    
    [actionSheet showFromToolbar:toolbar];
    
#if !__has_feature(objc_arc)
    return [actionSheet autorelease];
#else
    return actionSheet;
#endif
}

+ (instancetype)XLE_showInView:(UIView *)view
                 withTitle:(NSString *)title
         cancelButtonTitle:(NSString *)cancelButtonTitle
    destructiveButtonTitle:(NSString *)destructiveButtonTitle
         otherButtonTitles:(NSArray *)otherButtonTitles
                  tapBlock:(XLEActionSheetCompletionBlock)tapBlock {
    
    UIActionSheet *actionSheet = [[self alloc] initWithTitle:title
                                                    delegate:nil
                                           cancelButtonTitle:cancelButtonTitle
                                      destructiveButtonTitle:destructiveButtonTitle
                                           otherButtonTitles:NSArrayToVariableArgumentsList(otherButtonTitles)];

    if (tapBlock) {
        actionSheet.XLE_tapBlock = tapBlock;
    }
    
    [actionSheet showInView:view];
    
#if !__has_feature(objc_arc)
    return [actionSheet autorelease];
#else
    return actionSheet;
#endif
}

+ (instancetype)XLE_showFromBarButtonItem:(UIBarButtonItem *)barButtonItem
                             animated:(BOOL)animated
                            withTitle:(NSString *)title
                    cancelButtonTitle:(NSString *)cancelButtonTitle
               destructiveButtonTitle:(NSString *)destructiveButtonTitle
                    otherButtonTitles:(NSArray *)otherButtonTitles
                             tapBlock:(XLEActionSheetCompletionBlock)tapBlock {
    
    UIActionSheet *actionSheet = [[self alloc] initWithTitle:title
                                                    delegate:nil
                                           cancelButtonTitle:cancelButtonTitle
                                      destructiveButtonTitle:destructiveButtonTitle
                                           otherButtonTitles:NSArrayToVariableArgumentsList(otherButtonTitles)];

    if (tapBlock) {
        actionSheet.XLE_tapBlock = tapBlock;
    }
    
    [actionSheet showFromBarButtonItem:barButtonItem animated:animated];
    
#if !__has_feature(objc_arc)
    return [actionSheet autorelease];
#else
    return actionSheet;
#endif
}

+ (instancetype)XLE_showFromRect:(CGRect)rect
                      inView:(UIView *)view
                    animated:(BOOL)animated
                   withTitle:(NSString *)title
           cancelButtonTitle:(NSString *)cancelButtonTitle
      destructiveButtonTitle:(NSString *)destructiveButtonTitle
           otherButtonTitles:(NSArray *)otherButtonTitles
                    tapBlock:(XLEActionSheetCompletionBlock)tapBlock {
    
    UIActionSheet *actionSheet = [[self alloc] initWithTitle:title
                                                    delegate:nil
                                           cancelButtonTitle:cancelButtonTitle
                                      destructiveButtonTitle:destructiveButtonTitle
                                           otherButtonTitles:NSArrayToVariableArgumentsList(otherButtonTitles)];

    if (tapBlock) {
        actionSheet.XLE_tapBlock = tapBlock;
    }
    
    [actionSheet showFromRect:rect inView:view animated:animated];
    
#if !__has_feature(objc_arc)
    return [actionSheet autorelease];
#else
    return actionSheet;
#endif
}

#pragma mark - set get
- (XLEActionSheetProxy *)XLE_proxy{
    XLEActionSheetProxy *proxy = objc_getAssociatedObject(self, XLEActionSheetProxyKey);
    if (proxy == nil) {
        proxy = [[XLEActionSheetProxy alloc] init];
        [self setXLE_proxy:proxy];
    }
    return proxy;
}

- (void)setXLE_proxy:(XLEActionSheetProxy *)XLE_proxy
{
    objc_setAssociatedObject(self, XLEActionSheetProxyKey, XLE_proxy, OBJC_ASSOCIATION_RETAIN);
}

- (void)XLE_checkActionSheetDelegate {
    if (self.delegate != self.XLE_proxy) {
        objc_setAssociatedObject(self, XLEActionSheetOriginalDelegateKey, self.delegate, OBJC_ASSOCIATION_ASSIGN);
        self.delegate = self.XLE_proxy;
    }
}

- (XLEActionSheetCompletionBlock)XLE_tapBlock {
    return objc_getAssociatedObject(self, XLEActionSheetTapBlockKey);
}

- (void)setXLE_tapBlock:(XLEActionSheetCompletionBlock)tapBlock {
    [self XLE_checkActionSheetDelegate];
    objc_setAssociatedObject(self, XLEActionSheetTapBlockKey, tapBlock, OBJC_ASSOCIATION_COPY);
}

- (XLEActionSheetCompletionBlock)XLE_willDismissBlock {
    return objc_getAssociatedObject(self, XLEActionSheetWillDismissBlockKey);
}

- (void)setXLE_willDismissBlock:(XLEActionSheetCompletionBlock)willDismissBlock {
    [self XLE_checkActionSheetDelegate];
    objc_setAssociatedObject(self, XLEActionSheetWillDismissBlockKey, willDismissBlock, OBJC_ASSOCIATION_COPY);
}

- (XLEActionSheetCompletionBlock)XLE_didDismissBlock {
    return objc_getAssociatedObject(self, XLEActionSheetDidDismissBlockKey);
}

- (void)setXLE_didDismissBlock:(XLEActionSheetCompletionBlock)didDismissBlock {
    [self XLE_checkActionSheetDelegate];
    objc_setAssociatedObject(self, XLEActionSheetDidDismissBlockKey, didDismissBlock, OBJC_ASSOCIATION_COPY);
}

- (XLEActionSheetBlock)XLE_willPresentBlock {
    return objc_getAssociatedObject(self, XLEActionSheetWillPresentBlockKey);
}

- (void)setXLE_willPresentBlock:(XLEActionSheetBlock)willPresentBlock {
    [self XLE_checkActionSheetDelegate];
    objc_setAssociatedObject(self, XLEActionSheetWillPresentBlockKey, willPresentBlock, OBJC_ASSOCIATION_COPY);
}

- (XLEActionSheetBlock)XLE_didPresentBlock {
    return objc_getAssociatedObject(self, XLEActionSheetDidPresentBlockKey);
}

- (void)setXLE_didPresentBlock:(XLEActionSheetBlock)didPresentBlock {
    [self XLE_checkActionSheetDelegate];
    objc_setAssociatedObject(self, XLEActionSheetDidPresentBlockKey, didPresentBlock, OBJC_ASSOCIATION_COPY);
}

- (XLEActionSheetBlock)XLE_cancelBlock {
    return objc_getAssociatedObject(self, XLEActionSheetCancelBlockKey);
}

- (void)setXLE_cancelBlock:(XLEActionSheetBlock)cancelBlock {
    [self XLE_checkActionSheetDelegate];
    objc_setAssociatedObject(self, XLEActionSheetCancelBlockKey, cancelBlock, OBJC_ASSOCIATION_COPY);
}


@end

@implementation XLEActionSheetProxy

#pragma mark - UIActionSheetDelegate

- (void)willPresentActionSheet:(UIActionSheet *)actionSheet {
    XLEActionSheetBlock completion = actionSheet.XLE_willPresentBlock;
    
    if (completion) {
        completion(actionSheet);
    }
    
    id originalDelegate = objc_getAssociatedObject(self, XLEActionSheetOriginalDelegateKey);
    if (originalDelegate && [originalDelegate respondsToSelector:@selector(willPresentActionSheet:)]) {
        [originalDelegate willPresentActionSheet:actionSheet];
    }
}

- (void)didPresentActionSheet:(UIActionSheet *)actionSheet {
    XLEActionSheetBlock completion = actionSheet.XLE_didPresentBlock;
    
    if (completion) {
        completion(actionSheet);
    }
    
    id originalDelegate = objc_getAssociatedObject(self, XLEActionSheetOriginalDelegateKey);
    if (originalDelegate && [originalDelegate respondsToSelector:@selector(didPresentActionSheet:)]) {
        [originalDelegate didPresentActionSheet:actionSheet];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    XLEActionSheetCompletionBlock completion = actionSheet.XLE_tapBlock;
    
    if (completion) {
        completion(actionSheet, buttonIndex);
    }
    
    id originalDelegate = objc_getAssociatedObject(self, XLEActionSheetOriginalDelegateKey);
    if (originalDelegate && [originalDelegate respondsToSelector:@selector(actionSheet:clickedButtonAtIndex:)]) {
        [originalDelegate actionSheet:actionSheet clickedButtonAtIndex:buttonIndex];
    }
}

- (void)actionSheetCancel:(UIActionSheet *)actionSheet {
    XLEActionSheetBlock completion = actionSheet.XLE_cancelBlock;
    
    if (completion) {
        completion(actionSheet);
    }
    
    id originalDelegate = objc_getAssociatedObject(self, XLEActionSheetOriginalDelegateKey);
    if (originalDelegate && [originalDelegate respondsToSelector:@selector(actionSheetCancel:)]) {
        [originalDelegate actionSheetCancel:actionSheet];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex {
    XLEActionSheetCompletionBlock completion = actionSheet.XLE_willDismissBlock;
    
    if (completion) {
        completion(actionSheet, buttonIndex);
    }
    
    id originalDelegate = objc_getAssociatedObject(self, XLEActionSheetOriginalDelegateKey);
    if (originalDelegate && [originalDelegate respondsToSelector:@selector(actionSheet:willDismissWithButtonIndex:)]) {
        [originalDelegate actionSheet:actionSheet willDismissWithButtonIndex:buttonIndex];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    XLEActionSheetCompletionBlock completion = actionSheet.XLE_didDismissBlock;
    
    if (completion) {
        completion(actionSheet, buttonIndex);
    }
    
    id originalDelegate = objc_getAssociatedObject(self, XLEActionSheetOriginalDelegateKey);
    if (originalDelegate && [originalDelegate respondsToSelector:@selector(actionSheet:didDismissWithButtonIndex:)]) {
        [originalDelegate actionSheet:actionSheet didDismissWithButtonIndex:buttonIndex];
    }
}


@end
