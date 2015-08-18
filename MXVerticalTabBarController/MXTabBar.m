//
//  MXTabBar.m
//  OuGong
//
//  Created by longminxiang on 15/8/6.
//  Copyright (c) 2015年 eric. All rights reserved.
//

#import "MXTabBar.h"

@interface MXTabBar ()

@property (nonatomic) UIView *backgroundView;

@end

@implementation MXTabBar

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInitialization];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInitialization];
    }
    return self;
}

- (id)init {
    return [self initWithFrame:CGRectZero];
}

- (void)commonInitialization {
    _backgroundView = [[UIView alloc] init];
    [self addSubview:_backgroundView];
    
    [self setTranslucent:NO];
}

- (void)layoutSubviews {
    CGRect bounds = self.bounds;
    CGSize frameSize = self.frame.size;
    self.backgroundView.frame = bounds;

    CGFloat itemHeight = self.itemHeight <= 0 ? 60 : self.itemHeight;

    // Layout items
    [self.items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        MXTabBarItem *item = obj;
        CGRect iframe = CGRectMake(self.contentEdgeInsets.left, self.contentEdgeInsets.top + idx * itemHeight, frameSize.width - self.contentEdgeInsets.left - self.contentEdgeInsets.right, itemHeight);
        item.frame = iframe;
        [item setNeedsDisplay];
    }];
}

#pragma mark - Configuration

- (void)setItemHeight:(CGFloat)itemHeight
{
    if (itemHeight > 0) _itemHeight = itemHeight;
}

- (void)setItems:(NSArray *)items {
    for (MXTabBarItem *item in _items) {
        [item removeFromSuperview];
    }
    
    _items = [items copy];
    for (MXTabBarItem *item in _items) {
        [item addTarget:self action:@selector(tabBarItemWasSelected:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:item];
    }
}

#pragma mark - Item selection

- (void)tabBarItemWasSelected:(id)sender {
    if ([[self delegate] respondsToSelector:@selector(tabBar:shouldSelectItemAtIndex:)]) {
        NSInteger index = [self.items indexOfObject:sender];
        if (![[self delegate] tabBar:self shouldSelectItemAtIndex:index]) {
            return;
        }
    }
    
    [self setSelectedItem:sender];
    
    if ([[self delegate] respondsToSelector:@selector(tabBar:didSelectItemAtIndex:)]) {
        NSInteger index = [self.items indexOfObject:self.selectedItem];
        [[self delegate] tabBar:self didSelectItemAtIndex:index];
    }
}

- (void)setSelectedItem:(MXTabBarItem *)selectedItem {
    if (selectedItem == _selectedItem) {
        return;
    }
    [_selectedItem setSelected:NO];
    
    _selectedItem = selectedItem;
    [_selectedItem setSelected:YES];
}

#pragma mark - Translucency

- (void)setTranslucent:(BOOL)translucent {
    _translucent = translucent;
    
    CGFloat alpha = (translucent ? 0.9 : 1.0);
    
    [_backgroundView setBackgroundColor:[UIColor colorWithRed:245/255.0
                                                        green:245/255.0
                                                         blue:245/255.0
                                                        alpha:alpha]];
}

@end
