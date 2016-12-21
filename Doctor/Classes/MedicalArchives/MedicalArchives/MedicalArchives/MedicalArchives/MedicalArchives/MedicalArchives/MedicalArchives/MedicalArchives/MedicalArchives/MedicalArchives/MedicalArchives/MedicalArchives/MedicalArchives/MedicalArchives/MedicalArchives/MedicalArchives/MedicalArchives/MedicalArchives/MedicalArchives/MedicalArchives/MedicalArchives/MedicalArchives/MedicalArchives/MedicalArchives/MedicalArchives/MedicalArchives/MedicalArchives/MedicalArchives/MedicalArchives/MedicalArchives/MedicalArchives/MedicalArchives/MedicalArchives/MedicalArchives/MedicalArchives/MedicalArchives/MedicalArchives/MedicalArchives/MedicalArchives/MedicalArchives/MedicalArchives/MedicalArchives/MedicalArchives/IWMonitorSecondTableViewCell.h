//
//  IWMonitorSecondTableViewCell.h
//  Doctor
//
//  Created by 深水区 on 16/12/19.
//
//

#import <UIKit/UIKit.h>

@interface IWMonitorSecondTableViewCell : UITableViewCell

//@property (nonatomic, strong) ModelClass *model;
@property (nonatomic, weak) UIImageView *vv;
@property (nonatomic, weak) UILabel *titleLabel;
+ (instancetype)normalTableViewCellWithTableView:(UITableView *)tableView;

@end
