//
//  IWMedicalMonitorViewController.m
//  Doctor
//
//  Created by 深水区 on 16/12/19.
//
//

#import "IWMedicalMonitorViewController.h"
#import "IWMonitorFirstTableViewCell.h"
#import "IWmOnitorSSTableViewCell.h"
#import "IWmOnitorTTTableViewCell.h"

@interface IWMedicalMonitorViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak) UITableView *myTableView;


@end

@implementation IWMedicalMonitorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //懒加载
    [self myTableView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationItem.title = NSLocalizedString(@"健康监测",nil);
}

#pragma mark - 懒加载控件

- (UITableView *)myTableView
{
    if (_myTableView == nil) {
        UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableView.backgroundColor = [UIColor grayColor];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view insertSubview:tableView atIndex:1];
        _myTableView = tableView;
    }
    return _myTableView ;
}
#pragma mark - tableView delegate and tableView dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    }else{
        return 0;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row==0) {
            return 120;
        }else if (indexPath.row==1){
            return 100;
        }else
        {
            return 110;
        }
    }else{
        return 111;
    }

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    __weak typeof(self) ws = self;
    
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            
            IWMonitorFirstTableViewCell *cell = [IWMonitorFirstTableViewCell normalTableViewCellWithTableView:tableView];
            return cell;
        }else if (indexPath.row == 1){
            
            IWmOnitorSSTableViewCell *cell = [IWmOnitorSSTableViewCell normalTableViewCellWithTableView:tableView];
            return cell;
        }else{
            IWMonitorTTTableViewCell *cell = [IWMonitorTTTableViewCell normalTableViewCellWithTableView:tableView];
            return cell;
        }
    }else{
        return nil;
    }

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //消除cell选择痕迹
    [self performSelector:@selector(deselect) withObject:nil afterDelay:0.2];
}
- (void)deselect
{
    [self.myTableView deselectRowAtIndexPath:[self.myTableView indexPathForSelectedRow] animated:YES];
}
//HeaderInSection  &&  FooterInSection
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *backView = [[UIView alloc]init];
    backView.backgroundColor = [UIColor clearColor];
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
    view.frame = CGRectMake(10, 0, self.view.frame.size.width - 20, 80);
    [backView addSubview:view];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(10, 0, 100, 40);
    label.backgroundColor = [UIColor whiteColor];
    label.textColor = [UIColor grayColor];
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont systemFontOfSize:14];
    if (section == 0) {
        label.text = @"血压";
    }else{
        label.text = @"血糖";
    }

    [view addSubview:label];
    
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(view.frame.size.width - 90, 5, 70, 30);
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn setTitle:@"数据统计" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(headerButtonCliclked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [view addSubview:btn];
    
    
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(view.frame.size.width - 18, (40 - 13)/2, 7, 13);
    imageView.image = [UIImage imageNamed:@"xuanze"];
    [view addSubview:imageView];

    //细线
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor grayColor];
    lineView.frame = CGRectMake(0, 40, view.frame.size.width, 0.5);
    [view addSubview:lineView];
    
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.text = [NSString stringWithFormat:@"测于:2016-11-11"];
    timeLabel.frame = CGRectMake(10, lineView.frame.origin.y + 1, 200, 30);
    timeLabel.font = [UIFont systemFontOfSize:12];
    timeLabel.textColor = [UIColor blueColor];
    timeLabel.textAlignment = NSTextAlignmentLeft;
    timeLabel.backgroundColor = [UIColor whiteColor];
    [view addSubview:timeLabel];
    
    
    return backView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 80;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *backView = [[UIView alloc]init];
    backView.backgroundColor = [UIColor clearColor];
    
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(10, 0, self.view.frame.size.width - 20 , 40);
    btn.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn setTitle:@"添加新纪录" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(footerBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:btn];
    return backView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 40;
}


#pragma mark - 按钮点击事件

- (void)headerButtonCliclked:(UIButton *)btn
{
    NSLog(@"headerButtonCliclked");
}

- (void)footerBtnClicked:(UIButton *)btn
{
    NSLog(@"footerBtnClicked");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
