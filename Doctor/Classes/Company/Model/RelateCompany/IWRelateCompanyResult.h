//
//  IWRelateCompanyResult.h
//  Conedot
//
//  Created by 范超 on 14-9-27.
//  Copyright (c) 2014年 范超. All rights reserved.
//

#import "IWBaseResult.h"

@interface IWRelateCompanyResult : IWBaseResult
/**
 *  总条数
 */
@property (nonatomic, assign) long totalCount;

/**
 *  页码
 */
@property (nonatomic, assign) int pageNumber;

/**
 *  页面大小
 */
@property (nonatomic, assign) int pageSize;

/**
 *  分页数据
 */
@property (nonatomic, strong) NSArray *pageData;
@end
