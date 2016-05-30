//
//  FirstViewController.m
//  Silver
//
//  Created by Kai on 16/5/28.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "HomeViewController.h"
#import "TitleScrollView.h"
#import "SilverView.h"

@interface HomeViewController ()<TitleScrollDelegate>

@property(nonatomic,strong)TitleScrollView*titleScrollView;
@property(nonatomic,strong)NSArray*titleArray;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) SilverView *silerView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareData];
    [self initTitleView];
    [self initScrollViewAndTableView];
    
    

}

-(void)prepareData
{
    self.titleArray=@[@"精选",@"信托",@"资管",@"阳光私募",@"私募基金",@"海外保险"];
}
-(void)initTitleView
{
    UIView*titleView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    titleView.backgroundColor=[UIColor colorWithRed:0.12f green:0.70f blue:0.55f alpha:1.00f];
    TitleScrollView*scrollTitle=[[TitleScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-64, 64) titleArray:self.titleArray Index:0];
    scrollTitle.titleDelegate=self;
    self.titleScrollView=scrollTitle;
    
    
    UIButton*searchButton=[UIButton buttonWithType:UIButtonTypeCustom];
    

    searchButton.frame=CGRectMake(self.view.frame.size.width-64, 0, 64, 64);
    
    

   
    [searchButton setImage:[UIImage imageNamed:@"icon_search"] forState:UIControlStateNormal];
    searchButton.imageEdgeInsets=UIEdgeInsetsMake(20, 20, 20, 20);
    [searchButton addTarget:self action:@selector(searchClick:) forControlEvents:UIControlEventTouchUpInside];
    searchButton.backgroundColor=[UIColor clearColor];
    
    
    [titleView addSubview:searchButton];
    
    [titleView addSubview:scrollTitle];
    [self.view addSubview:titleView];
}

-(void)initScrollViewAndTableView
{
    UIScrollView*scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
    scrollView.delegate=self;
    [self.titleArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        SilverView*silerView=[[SilverView alloc]initWithFrame:CGRectMake(idx*scrollView.frame.size.width, 0, scrollView.frame.size.width, scrollView.frame.size.height)];
        
        [scrollView addSubview:silerView];
        if (idx==0)
        {
            self.silerView=silerView;
            silerView.tableView.backgroundColor=[UIColor orangeColor];
        }
        

        
    }];
    scrollView.pagingEnabled=YES;
    
    self.scrollView=scrollView;
    scrollView.contentSize=CGSizeMake(self.titleArray.count*scrollView.frame.size.width, 0);
    
    [self.view addSubview:scrollView];
}
#pragma ----Action-----
-(void)searchClick:(UIButton*)button
{
    
}
#pragma ----TitleScrollDelegate----

-(void)titleSelectedIndex:(NSInteger)index
{
    NSLog(@"index=%d",index);
    
    [self.scrollView setContentOffset:CGPointMake(index*self.silerView.frame.size.width, 0) animated:YES];
}
#pragma mark----UIScrollViewDelegate-----
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat offsetx=scrollView.contentOffset.x;
    
    NSInteger index=(offsetx/self.silerView.frame.size.width);
    [self.titleScrollView setTitleIndex:index];
}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    NSLog(@"end");
}
@end
