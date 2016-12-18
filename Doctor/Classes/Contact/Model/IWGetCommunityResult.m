//
//  IWGetCommunityResult.m
//  Doctor
//
//  Created by 范超 on 16/12/17.
//
//

#import "IWGetCommunityResult.h"
#import "IWCommunity.h"
#import "IWHospital.h"

@implementation IWGetCommunityResult
- (NSDictionary *)objectClassInArray {
    return @{@"communityDatas" : [IWCommunity class], @"hospitalDatas" : [IWHospital class]};
}
@end
