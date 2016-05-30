//
//  TitleScrollView.m
//  Silver
//
//  Created by Kai on 16/5/29.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "TitleScrollView.h"



@interface TitleScrollView  ()
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) NSMutableArray *buttonArray;
@end

@implementation TitleScrollView



-(id)initWithFrame:(CGRect)frame titleArray:(NSArray*)array Index:(NSInteger)index
{
    
    self=[super initWithFrame:frame];
    if (self)
    {
        
        float buttonWith=60;
        float buttonHeight=44;
        _buttonArray=[[NSMutableArray alloc]init];
        
        float totalWith=0;
        for (int i=0; i<array.count; i++)
        {
            UIButton*button=[UIButton buttonWithType:UIButtonTypeCustom];
            
            CGSize size=[Utility getSizeWith:array[i] Font:Font(18) MaxSize:CGSizeMake(100, 44)];
            button.frame=CGRectMake(totalWith, (frame.size.height-buttonHeight)/2.0, size.width+15, buttonHeight);
            totalWith+=size.width+15;
            
            button.tag=i;
            [button setTitle:array[i] forState:UIControlStateNormal];
            button.titleLabel.font=Font(18);
            button.titleLabel.textAlignment=NSTextAlignmentCenter;
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
           
            [button addTarget:self action:@selector(titleButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
            button.backgroundColor=[UIColor clearColor];
            [_buttonArray addObject:button];
            [self addSubview:button];
            
        }
        self.contentSize=CGSizeMake(totalWith, 0);
        self.backgroundColor=[UIColor clearColor];
        UIView*line=[[UIView alloc]initWithFrame:CGRectMake(0, frame.size.height-2, buttonWith, 2)];
        self.showsVerticalScrollIndicator=NO;
        self.showsHorizontalScrollIndicator=NO;
        //self.bounces=NO;
        line.backgroundColor=[UIColor whiteColor];
        self.lineView=line;
        self.delegate=self;
        
        [self addSubview:line];
        
        
    }
    
    return self;
    
}


-(void)titleButtonClicked:(UIButton*)sender
{
    NSLog(@"titleclick");
    
    NSInteger index=sender.tag;
    [self setTitleIndex:index];
    if ([self.titleDelegate conformsToProtocol:@protocol(TitleScrollDelegate) ])
    {
        [self.titleDelegate titleSelectedIndex:index];
    }
}


-(void)setTitleIndex:(NSInteger)index
{
    UIButton*sender=(UIButton*)_buttonArray[index];
    
    
    CGRect frame=sender.frame;
    [UIView animateWithDuration:0.35 animations:^{
        self.lineView.frame=CGRectMake(frame.origin.x, self.lineView.frame.origin.y, frame.size.width, self.lineView.frame.size.height);
    } completion:nil];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"offset.y=%f",scrollView.contentOffset.y);
}
@end
