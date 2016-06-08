//
//  SilverTableView.m
//  Silver
//
//  Created by Kai on 16/5/29.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "SilverView.h"
#import "MJRefresh.h"

@implementation SilverView

-(instancetype)initWithFrame:(CGRect)frame
{
    
    self=[super initWithFrame:frame];
    if (self)
    {
        self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) style:UITableViewStylePlain];
        
        
        UIImageView*imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 250)];
        imageView.image=[UIImage imageNamed:@"header.jpeg"];
        self.tableView.tableHeaderView=imageView;
        
        self.tableView.delegate=self;
        self.tableView.dataSource=self;
        [self.tableView reloadData];
        
        [self addSubview:self.tableView];
        
        __unsafe_unretained __typeof(self) weakSelf = self;
        
        MJRefreshNormalHeader* refreshHeader=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            
            
            NSLog(@"刷新")    ;
             [weakSelf.tableView.mj_header performSelector:@selector(endRefreshing) withObject:nil afterDelay:2.0];
        }];
        
        
        MJRefreshAutoNormalFooter* refreshFooter=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
           
            
            NSLog(@"加载更多") ;
            
            [weakSelf.tableView.mj_footer performSelector:@selector(endRefreshing) withObject:nil afterDelay:0.5];
        }];
        
        self.tableView.mj_header=refreshHeader;
        self.tableView.mj_footer=refreshFooter;
        
        
    }
    return self;
}




#pragma ----TableViewDelegate------
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* identy=@"cell";
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:identy];
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identy];
    }
    
    cell.textLabel.text=[NSString stringWithFormat:@"%d",indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel*label=[[UILabel alloc ]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 30)];
    
    label.text=[NSString stringWithFormat:@"%d",section];
    label.textAlignment=NSTextAlignmentCenter;
    return label;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
@end
