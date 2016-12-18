//
//  IWCommunityCell.h
//  Doctor
//
//  Created by 范超 on 16/12/17.
//
//

#import <UIKit/UIKit.h>
@class IWCommunity;

@interface IWCommunityCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) IWCommunity *community;
@end
