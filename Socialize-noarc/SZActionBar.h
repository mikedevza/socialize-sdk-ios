//
//  SZActionBar.h
//  SocializeSDK
//
//  Created by Nathaniel Griswold on 6/15/12.
//  Copyright (c) 2012 Socialize, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SZLikeButton.h"

@interface SZActionBar : UIView

+ (id)defaultActionBarWithFrame:(CGRect)frame entity:(id<SZEntity>)entity viewController:(UIViewController*)viewController;
- (id)initWithFrame:(CGRect)frame entity:(id<SocializeEntity>)entity viewController:(UIViewController *)controller items:(NSArray*)items;

+ (CGFloat)defaultHeight;
+ (CGFloat)defaultBetweenButtonsPadding;

@property (nonatomic, strong) id<SZEntity> entity;
@property (nonatomic, strong) UIViewController *viewController;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) UIView *testView;

// Visual customization
@property (nonatomic, strong) UIImage *backgroundImage;
@property (nonatomic, assign) CGFloat betweenButtonsPadding;

@end
