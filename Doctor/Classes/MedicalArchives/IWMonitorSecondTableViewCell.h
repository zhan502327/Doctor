//
//  IWMonitorSecondTableViewCell.h
//  Doctor
//
//  Created by 深水区 on 16/12/19.
//
//

#import <UIKit/UIKit.h>

@interface IWMonitorSecondTableViewCell : UITableViewCell


//@property (nonatomic, strong) <#ModelClass#> *model;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *rightLabel;
@property (nonatomic, weak) UILabel *resultLabel;


@property (nonatomic, weak) UIView *bgView;

@property (nonatomic, weak) UIView *lineView;
@property (nonatomic, weak) UIView *resultView;







+ (instancetype)normalTableViewCellWithTableView:(UITableView *)tableView;


@end
