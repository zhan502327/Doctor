//
//  IWMonitorSecondTableViewCell.m
//  Doctor
//
//  Created by 深水区 on 16/12/19.
//
//

#import "IWMonitorSecondTableViewCell.h"

@implementation IWMonitorSecondTableViewCell


+ (instancetype)normalTableViewCellWithTableView:(UITableView *)tableView{
    NSString *className = NSStringFromClass([self class]);
    [tableView registerClass:[self class] forCellReuseIdentifier:className];
    IWMonitorSecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:className];
    cell.selectedBackgroundView=[[UIView alloc]initWithFrame:cell.frame];
    cell.backgroundColor=[UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    
    [cell nameLabel];
    [cell rightLabel];
    [cell resultLabel];
    [cell bgView];
    [cell lineView];
    [cell resultView];
    
 

    return cell;
}
+ (BOOL)requiresConstraintBasedLayout
{
    return YES;
}
-(void)updateConstraints{
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top);
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        
    }];
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bgView.mas_bottom).offset(20);
        make.left.equalTo(self.bgView.mas_left).offset(10);
        make.right.equalTo(self.bgView.mas_right).offset(-10);
        make.height.mas_equalTo(@(0.5));
        
        
        
        
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.lineView.mas_top).offset(-1);
        make.left.equalTo(self.bgView.mas_left).offset(10);
        make.height.mas_equalTo(@(30));
        make.width.mas_equalTo(@(50));
    }];
    
    [_resultLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView.mas_top);
        make.height.mas_equalTo(@(30));
        make.width.mas_equalTo(@(80));
        make.centerX.mas_equalTo(self.bgView.mas_centerX);
    }];

    
    [_rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView.mas_bottom);
        make.right.equalTo(self.bgView.mas_right).offset(-10);
        make.height.mas_equalTo(@(30));
        make.width.mas_equalTo(@(70));
    }];
    
    [_resultView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.lineView.mas_top);
        make.height.mas_equalTo(@(30));
        make.width.mas_equalTo(@(130));
        make.centerX.mas_equalTo(self.bgView.mas_centerX);
    }];
    
    
    [super updateConstraints];
}
#pragma mark - 懒加载视图

-(UIView *)bgView{
    if (_bgView == nil) {
        UIView *view =[[UIView alloc]init];
        view.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:view];
        _bgView = view;
    }
    return _bgView;
}

-(UIView *)lineView{
    if (_lineView == nil) {
        UIView *view =[[UIView alloc]init];
        view.backgroundColor = [UIColor greenColor];
        [self.bgView addSubview:view];
        _lineView = view;
    }
    return _lineView;
}

-(UIView *)resultView{
    if (_resultLabel == nil) {
        UIView *view =[[UIView alloc]init];
        view.backgroundColor = [UIColor greenColor];
        [self.bgView addSubview:view];
        _bgView = view;
    }
    return _bgView;
}

-(UILabel *)nameLabel{
    if (_nameLabel == nil) {
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentLeft;
        label.textColor = [UIColor grayColor];
        label.text = @"午餐前：";
        label.font = [UIFont systemFontOfSize:14];
        
        [self.bgView addSubview:label];
        _nameLabel = label;
    }
    return _nameLabel;
}

-(UILabel *)rightLabel{
    if (_rightLabel == nil) {
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentRight;
        label.textColor = [UIColor greenColor];
        label.text = @"7.8nmmol/L";
        label.font = [UIFont systemFontOfSize:14];
        
        [self.bgView addSubview:label];
        _rightLabel = label;
    }
    return _rightLabel;
}

-(UILabel *)resultLabel{
    if (_resultLabel == nil) {
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentRight;
        label.textColor = [UIColor redColor];
        
        NSString *str = @"1.5nmmol/L";
        NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:str];
//        // 设置字体和设置字体的范围
//        [attrStr addAttribute:NSFontAttributeName
//                        value:[UIFont systemFontOfSize:30.0f]
//                        range:NSMakeRange(0, 3)];
        // 添加文字颜色
        [attrStr addAttribute:NSForegroundColorAttributeName
                        value:[UIColor grayColor]
                        range:NSMakeRange(str.length - 7, 7)];
        
        label.text = [NSString stringWithFormat:@"%@",attrStr];
        label.font = [UIFont systemFontOfSize:14];
        
        [self.bgView addSubview:label];
        _resultLabel = label;
    }
    return _resultLabel;
}




#pragma mark -数据处理
//- (void)setModel:(<#ModelClass#> *)model
//{
//    _model = model;
//    [_imgView ideago_setImageWithURL:model.img placeholderImage:[UIImage imageNamed:@"placeholder1"]];
//    _titleLabel.text = model.title;
//}



@end
