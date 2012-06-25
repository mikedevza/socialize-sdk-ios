//
//  SZActionButton.h
//  Socialize
//
//  Created by Nathaniel Griswold on 6/23/12.
//  Copyright (c) 2012 Socialize. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SZActionButton : UIView

@property (nonatomic, strong) UIButton *actualButton;

@property (nonatomic, strong) UIImage *disabledImage;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UIImage *highlightedImage;
@property (nonatomic, strong) UIImage *icon;

@property (nonatomic, assign) BOOL autoresizeDisabled;

@property (nonatomic, assign) NSTimeInterval failureRetryInterval;

@property (nonatomic, copy) void(^actionBlock)();

@property (nonatomic, strong) NSString *title;

+ (SZActionButton*)actionButtonWithFrame:(CGRect)frame icon:(UIImage*)icon title:(NSString*)title actionBlock:(void(^)())actionBlock;
+ (NSTimeInterval)defaultFailureRetryInterval;
- (void)autoresize;


@end