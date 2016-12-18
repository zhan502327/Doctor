//
//  IWCommunityCell.m
//  Doctor
//
//  Created by 范超 on 16/12/17.
//
//

#import "IWCommunityCell.h"
#import "IWCommunity.h"

@interface IWCommunityCell()
@property (nonatomic, weak) UIView *divider;
@end

@implementation IWCommunityCell

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat dividerX = 10;
    CGFloat dividerH = 0.5;
    CGFloat dividerY = self.frame.size.height - dividerH;
    CGFloat dividerW = self.frame.size.width;
    self.divider.frame = CGRectMake(dividerX, dividerY, dividerW, dividerH);
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"community";
    IWCommunityCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[IWCommunityCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIView *divider = [[UIView alloc] init];
        divider.backgroundColor = [UIColor lightGrayColor];
        divider.alpha = 0.5;
        [self.contentView addSubview:divider];
        self.divider = divider;
    }
    return self;
}

- (void)setCommunity:(IWCommunity *)community {
    _community = community;
    
    // name
    self.textLabel.text = community.communityName;
    self.textLabel.font = [UIFont systemFontOfSize:14];
    
    // ass
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

@end
