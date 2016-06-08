//
//  SilverManager.h
//  Silver
//
//  Created by Kai on 16/6/8.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SilverManager : NSObject
+ (SilverManager *)sharedManager;
@property (nonatomic, strong) AFURLSessionManager *netManager;

@end
