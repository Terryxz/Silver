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
#import "SilverManager.h"

@interface HomeViewController ()<TitleScrollDelegate>

@property(nonatomic,strong)TitleScrollView*titleScrollView;
@property(nonatomic,strong)NSArray*titleArray;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) SilverView *silerView;
@property (nonatomic, strong) AFURLSessionManager* manager;
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
    
    
    
    SilverManager* silver=[SilverManager sharedManager];
    
    
    NSURL *URL = [NSURL URLWithString:@"http://httpbin.org/get"];
    NSString*URLString=@"http://api.siyinjia.com//1.0/other/config/info1?city_id=0&platform=iphone&platform_version=9.3.2&device_id=fb83d5ce4fea33f51a7de80da79cd2341fa2a343&network_type=Wifi&channel=appstore&app_version=4.1.0&id_customer=0&customer_id=0&type_member=0&md5=1286fe";
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:URLString parameters:nil error:nil];;
    
    
    
    
    NSURLSessionDataTask *dataTask = [silver.netManager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"%@ %@", response, responseObject);
        }
    }];
    [dataTask resume];


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
           // silerView.tableView.backgroundColor=[UIColor orangeColor];
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
