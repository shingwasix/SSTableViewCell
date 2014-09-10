//
//  SSUserTableViewCell.m
//  SSTableViewCell
//
//  Created by Six on 14-9-10.
//  Copyright (c) 2014年 Shingwa Six. All rights reserved.
//

#import "SSUserTableViewCell.h"

@interface SSUserTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imgAvatar;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblSignature;
@end

@implementation SSUserTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    _imgAvatar.layer.cornerRadius = _imgAvatar.frame.size.height / 2;
}

- (void)setUser:(SSUserInfo *)user
{
    _user = user;
    
    _imgAvatar.image = [UIImage imageNamed:_user.avatar];
    _lblName.text = _user.name;
    _lblSignature.text = _user.signature;
}

@end
