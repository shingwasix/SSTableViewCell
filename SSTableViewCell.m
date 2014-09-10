//
//  SSTableViewCell.m
//
//  1.0.0
//
//  Created by Shingwa Six on 14-09-10.
//  Copyright (c) 2014年 waaile.com All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "SSTableViewCell.h"

@implementation SSTableViewCell

+ (CGFloat)height
{
    return [[self model] frame].size.height;
}

+ (NSString *)identifier
{
    return [[self model] reuseIdentifier];
}

+ (instancetype)model
{
    static NSMutableDictionary *_models = nil;
    if (!_models) {
        _models = [[NSMutableDictionary alloc] init];
    }
    NSString *className = NSStringFromClass(self);
    id model = [_models objectForKey:className];
    if (!model) {
        model = [self cell];
        [_models setObject:model forKey:className];
    }
    return model;
}

+ (instancetype)cell
{
    NSString *className = NSStringFromClass(self);
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:className owner:nil options:nil];
    return [nib objectAtIndex:0];
}

+ (instancetype)cell:(UITableView *)tableView
{
    id cell = [tableView dequeueReusableCellWithIdentifier:[self identifier]];
    if (!cell) {
        cell = [self cell];
    }
    return cell;
}

@end
