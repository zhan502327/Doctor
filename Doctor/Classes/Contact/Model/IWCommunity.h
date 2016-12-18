//
//  IWCommunity.h
//  Doctor
//
//  Created by 范超 on 16/12/17.
//
//

#import <Foundation/Foundation.h>

@interface IWCommunity : NSObject
@property (nonatomic, copy) NSString *communityId;  // 部门ID
@property (nonatomic, copy) NSString *communityName; // 部门名称
@property (nonatomic, copy) NSString *communityParentId; // 父部门 ID
@property (nonatomic, copy) NSString *communityRemarkName; //部门描述名
@end
