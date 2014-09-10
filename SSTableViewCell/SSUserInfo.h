//
//  SSUserInfo.h
//  SSTableViewCell
//
//  Created by Six on 14-9-10.
//  Copyright (c) 2014年 Shingwa Six. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSUserInfo : NSObject
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *avatar;
@property (copy, nonatomic) NSString *signature;

+ (instancetype)userWithJSON:(id)json;
@end
