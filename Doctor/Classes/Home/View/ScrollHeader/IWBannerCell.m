//
//  IWBannerCell.m
//  Conedot
//
//  Created by 范超 on 15/6/8.
//  Copyright (c) 2015年 范超. All rights reserved.
//

#import "IWBannerCell.h"
#import "IWBanner.h"
#import "UIImageView+WebCache.h"

@interface IWBannerCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@end

@implementation IWBannerCell

- (void)awakeFromNib {
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageClick:)];
    [self.iconView addGestureRecognizer:singleTap];
}

/**
 * 点击事件
 */
- (void)imageClick:(UITapGestureRecognizer *)recongnizer {
    [IWNotificationCenter postNotificationName:IWHomeClickNotification object:self userInfo:@{ IWHomeClickNotificationBanner : self.banner}];
}

- (void)setBanner:(IWBanner *)banner {
    _banner = banner;
    
    if ([banner.defaultId isEqualToString:@""] || banner.defaultId == nil) {
        [self.iconView sd_setImageWithURL:[NSURL URLWithString:banner.url] placeholderImage:[UIImage imageWithName:@"banner_default"]];
    } else {
        [self.iconView setImage:[UIImage imageWithName:banner.defaultId]];
    }
}

@end
