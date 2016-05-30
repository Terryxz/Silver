//
//  Utility.m
//  Silver
//
//  Created by Kai on 16/5/29.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "Utility.h"

@implementation Utility



+(CGSize)getSizeWith:(NSString*)string Font:(UIFont*)font MaxSize:(CGSize)size
{
    CGSize labelSize=[string boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading   attributes:@{NSFontAttributeName:font} context:nil].size;
    
    return labelSize;
}
@end
