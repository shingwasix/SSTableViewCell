//
//  SSUserInfo.m
//  SSTableViewCell
//
//  Created by Six on 14-9-10.
//  Copyright (c) 2014年 Shingwa Six. All rights reserved.
//

#import "SSUserInfo.h"

@implementation SSUserInfo

+ (instancetype)userWithJSON:(id)json
{
    if (![json isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    SSUserInfo *user = [[SSUserInfo alloc] init];
    
    id tmp = [json objectForKey:@"name"];
    if ([tmp isKindOfClass:[NSString class]]) {
        user.name = tmp;
    }
    
    tmp = [json objectForKey:@"avatar"];
    if ([tmp isKindOfClass:[NSString class]]) {
        user.avatar = tmp;
    }
    
    tmp = [json objectForKey:@"signature"];
    if ([tmp isKindOfClass:[NSString class]]) {
        user.signature = tmp;
    }
    
    return user;
}

@end
