//
//  MXTabBar.h
//  OuGong
//
//  Created by longminxiang on 15/8/6.
//  Copyright (c) 2015年 eric. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MXTabBarItem.h"

#define DEFAULT_TABBAR_WIDTH    60

@class MXTabBar, MXTabBarItem;

@protocol MXTabBarDelegate <NSObject>

/**
 * Asks the delegate if the specified tab bar item should be selected.
 */
- (BOOL)tabBar:(MXTabBar *)tabBar shouldSelectItemAtIndex:(NSInteger)index;

/**
 * Tells the delegate that the specified tab bar item is now selected.
 */
- (void)tabBar:(MXTabBar *)tabBar didSelectItemAtIndex:(NSInteger)index;

@end

@interface MXTabBar : UIView

/**
 * The tab bar’s delegate object.
 */
@property (nonatomic, weak) id <MXTabBarDelegate> delegate;

/**
 * The items displayed on the tab bar.
 */
@property (nonatomic, copy) NSArray *items;

@property (nonatomic) CGFloat itemHeight;

/**
 * The currently selected item on the tab bar.
 */
@property (nonatomic, weak) MXTabBarItem *selectedItem;

/**
 * backgroundView stays behind tabBar's items. If you want to add additional views,
 * add them as subviews of backgroundView.
 */
@property (nonatomic, readonly) UIView *backgroundView;

/*
 * contentEdgeInsets can be used to center the items in the middle of the tabBar.
 */
@property UIEdgeInsets contentEdgeInsets;

/*
 * Enable or disable tabBar translucency. Default is NO.
 */
@property (nonatomic, getter=isTranslucent) BOOL translucent;

@end
