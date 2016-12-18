//
//  IWCompanyTool.m
//  Conedot
//
//  Created by 范超 on 14-9-27.
//  Copyright (c) 2014年 范超. All rights reserved.
//

#import "IWCompanyTool.h"
#import "IWHttpTool.h"
#import "MJExtension.h"
#import "IWFanCompany.h"

#define IWFanCompanysFile [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"fancompanys.data"]
#define IWFanCompanyFile [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"fancompany.data"]
#define IWFanCompanyDefault [NSUserDefaults standardUserDefaults]

@implementation IWCompanyTool

+ (void)saveFanCompanys:(NSArray *)fancompanys {
    [self removeFancompanys];
    [NSKeyedArchiver archiveRootObject:fancompanys toFile:IWFanCompanysFile];
}

+ (NSArray *)fancompanys {
    return [NSKeyedUnarchiver unarchiveObjectWithFile:IWFanCompanysFile];
}

+ (void)saveFanCompany:(IWFanCompany *)fancompany {
    [NSKeyedArchiver archiveRootObject:fancompany toFile:IWFanCompanyFile];
}

+ (IWFanCompany *)fancompany {
    // 取出当前选择的公司
    IWFanCompany *company = [NSKeyedUnarchiver unarchiveObjectWithFile:IWFanCompanyFile];
    return company;
}

+ (void)removeFancompanys {
    NSFileManager *manager = [NSFileManager defaultManager];
    [manager removeItemAtPath:IWFanCompanysFile error:nil];
}

+ (void)removeFancompany {
    NSFileManager *manager = [NSFileManager defaultManager];
    [manager removeItemAtPath:IWFanCompanyFile error:nil];
}



+ (void)companyApplyWithParam:(IWCompanyDetailParam *)param success:(void (^)(IWCompanyDetailResult *))success failure:(void (^)(NSError *))failure {
//    NSString *url = nil;
//    if (param.activityId) {
//        url = SERVER_DO_ACTIVITY_JOIN_URL;
//    } else {
//        url = SERVER_NOTICE_APPLY_URL;
//    }
//    [IWHttpTool postWithURL:url params:param.keyValues success:^(id json) {
//        if (success) {
//            IWCompanyDetailResult *result = [[IWCompanyDetailResult alloc] init];
//            result.code = [json[@"code"] intValue];
//            result.info = json[@"info"];
//            success(result);
//        }
//    } failure:^(NSError *error) {
//        if (failure) {
//            failure(error);
//        }
//    }];
}

+ (void)companySignUpWithParam:(IWCompanyDetailParam *)param success:(void (^)(IWCompanyDetailResult *result))success failure:(void (^)(NSError *error))failure {
    // 判断是从哪边点击过来得
//    NSString *url = nil;
//    if (param.noticeId) {
//        url = SERVER_NOTICE_SIGNUP_URL;
//    } else if (param.policyId) {
//        url = SERVER_POLICY_SIGNUP_URL;
//    } else if (param.manualId) {
//        url = SERVER_GET_TRAINNING_SYSTEM_DETAIL_PRAIZE_URL;
//    } else if (param.activityId) {
//        url = SERVER_DO_ACTIVITY_PRAIZE_URL;
//    } else {
//        url = SERVER_NEWS_SIGNUP_URL;
//    }
//    
//    [IWHttpTool postWithURL:url params:param.keyValues success:^(id json) {
//        if (success) {
//            IWCompanyDetailResult *result = [[IWCompanyDetailResult alloc] init];
//            result.code = [json[@"code"] intValue];
//            result.info = json[@"info"];
//            success(result);
//        }
//    } failure:^(NSError *error) {
//        if (failure) {
//            failure(error);
//        }
//    }];
}


+ (void)unReadNumberWithParam:(IWCompanyUnReadParam *)param success:(void (^)(IWCompanyUnReadResult *result))success failure:(void (^)(NSError *error))failure {
//    [IWHttpTool postWithURL:SERVER_GET_ALL_UNREAD_NUMBER_URL params:param.keyValues success:^(id json) {
//        if (success) {
//            IWLog(@"%@", json);
//            IWCompanyUnReadResult *result = nil;
//            if ([json[@"code"] intValue] == 0) {
//                result = [IWCompanyUnReadResult objectWithKeyValues:json];
//            } else {
//                result = [[IWCompanyUnReadResult alloc] init];
//                result.code = [json[@"code"] intValue];
//                result.info = json[@"info"];
//            }
//            success(result);
//        }
//    } failure:^(NSError *error) {
//        if (failure) {
//            failure(error);
//        }
//    }];
}

@end
