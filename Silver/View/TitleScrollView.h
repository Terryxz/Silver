//
//  TitleScrollView.h
//  Silver
//
//  Created by Kai on 16/5/29.
//  Copyright © 2016年 Kai. All rights reserved.
//


#import <UIKit/UIKit.h>

@protocol TitleScrollDelegate <NSObject>

-(void)titleSelectedIndex:(NSInteger)index;

@end
@interface TitleScrollView : UIScrollView<UIScrollViewDelegate>
-(id)initWithFrame:(CGRect)frame titleArray:(NSArray*)array Index:(NSInteger)index;
@property (nonatomic, assign) id <TitleScrollDelegate>titleDelegate;
-(void)setTitleIndex:(NSInteger)index;
@end
