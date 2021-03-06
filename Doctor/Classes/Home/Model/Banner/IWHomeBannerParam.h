//
//  IWHomeBannerParam.h
//  Conedot
//
//  Created by 范超 on 15/5/22.
//  Copyright (c) 2015年 范超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IWHomeBannerParam : NSObject

/**
 * 登录 ID
 */
@property (nonatomic, copy) NSString *loginId;

/**
 * 公司 ID
 */
@property (nonatomic, strong) NSNumber *companyId;
@end
