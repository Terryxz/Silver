//
//  SilverManager.m
//  Silver
//
//  Created by Kai on 16/6/8.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "SilverManager.h"

@implementation SilverManager

+ (SilverManager *)sharedManager
{
    static SilverManager *sharedInstance = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        sharedInstance = [[self alloc] init];
        
        
    });
    return sharedInstance;
}

-(instancetype)init
{
    self=[super init];
    if (self)
    {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
       
        self.netManager=manager;
    }
    
    return self;
}

@end
