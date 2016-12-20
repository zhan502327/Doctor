//
//  IWMedicalMonitorViewController.m
//  Doctor
//
//  Created by 深水区 on 16/12/19.
//
//

#import "IWMedicalMonitorViewController.h"
#import "IWMonitorFirstTableViewCell.h"

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
        UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
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
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 100;
        
    }else
    {
        return 50;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    __weak typeof(self) ws = self;
    
    
    IWMonitorFirstTableViewCell *cell = [IWMonitorFirstTableViewCell normalTableViewCellWithTableView:tableView];
    
    
    
    return cell;
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
    view.frame = CGRectMake(10, 0, self.view.frame.size.width - 20, 40);
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
    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(headerButtonCliclked:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(view.frame.size.width - 18, (40 - 13)/2, 7, 13);
    imageView.image = [UIImage imageNamed:@"xuanze"];
    [view addSubview:imageView];
    
    
    return backView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *backView = [[UIView alloc]init];
    backView.backgroundColor = [UIColor clearColor];
    
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(10, 0, self.view.frame.size.width - 20, 40);
    [btn setTitle:@"添加新纪录" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(footerBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return backView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
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
