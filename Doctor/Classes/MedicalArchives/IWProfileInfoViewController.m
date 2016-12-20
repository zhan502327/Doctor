//
//  IWProfileInfoViewController.m
//  Doctor
//
//  Created by 深水区 on 16/12/19.
//
//

#import "IWProfileInfoViewController.h"
#import "IWProfileArowTableViewCell.h"
#import "IWProfileTextFieldTableViewCell.h"
#import "IWProfileSecondViewController.h"

@interface IWProfileInfoViewController ()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate>

@property (nonatomic, weak) UITableView *profileTableView;


@end

@implementation IWProfileInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //懒加载
    [self profileTableView];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //设置导航栏
    [self setupNavgation];
    
}

- (void)setupNavgation
{
    self.navigationItem.title = NSLocalizedString(@"个人信息", nil);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"删除" style:UIBarButtonItemStyleDone target:self action:@selector(cancleclicked)];
    
}

- (void)cancleclicked
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"删除健康档案" message:@"将删除该人的个人信息以及医疗报告和医疗信息" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alert.alertViewStyle = UIAlertViewStyleDefault;
    [alert show];
}

#pragma mark - 弹框的代理方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        NSLog(@"确认");
        
        
    }else
    {
        NSLog(@"取消");
    }
    
}

#pragma mark - 懒加载

-(UITableView *)profileTableView{
    if (_profileTableView == nil) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStyleGrouped];
        tableView.backgroundColor=[UIColor grayColor];
        tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        tableView.scrollEnabled=YES;
        
        tableView.dataSource=self;
        tableView.delegate=self;
        [self.view addSubview:tableView];
        _profileTableView = tableView;
    }
    return _profileTableView;
}
#pragma mark - tableView delegate and tableView dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    if (section == 0) {
        return 6;
    }else
    {
        return 4;
    }
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    

    if (indexPath.section == 0) {
        NSArray *titleArray = @[@"姓名",@"与本账户关系",@"性别",@"出生日期",@"社区",@"所属区域",];
        
        if (indexPath.row == 0) {
            IWProfileTextFieldTableViewCell *cell = [IWProfileTextFieldTableViewCell normalTableViewCellWithTableView:tableView];

            cell.titleLabel.text = titleArray[indexPath.row];
            
            
            return cell;
            
            
        }else
        {
            IWProfileArowTableViewCell *cell  = [IWProfileArowTableViewCell normalTableViewCellWithTableView:tableView];
            cell.titleLabel.text = titleArray[indexPath.row];

            return cell;
        }
        
    }
    
    if (indexPath.section == 1) {
        NSArray *titleArray = @[@"职业",@"身份证",@"婚姻状况",@"文化程度"];

        if (indexPath.row == 1) {
            IWProfileTextFieldTableViewCell *cell = [IWProfileTextFieldTableViewCell normalTableViewCellWithTableView:tableView];
            cell.titleLabel.text = titleArray[indexPath.row];

            return cell;
        }else
        {
            IWProfileArowTableViewCell *cell  = [IWProfileArowTableViewCell normalTableViewCellWithTableView:tableView];
            cell.titleLabel.text = titleArray[indexPath.row];

            return cell;

        }
    }
    
    if (indexPath.section == 2) {
        NSArray *titleArray = @[@"社保",@"公积金编号",@"手机号码",@"邮箱"];

        if (indexPath.row == 0) {
            IWProfileArowTableViewCell *cell = [IWProfileArowTableViewCell normalTableViewCellWithTableView:tableView];
            cell.titleLabel.text = titleArray[indexPath.row];

            return cell;
        }else
        {
            IWProfileTextFieldTableViewCell *cell  = [IWProfileTextFieldTableViewCell normalTableViewCellWithTableView:tableView];
            cell.titleLabel.text = titleArray[indexPath.row];

            return cell;
            
        }
    }

    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        UIView *bgView =[[UIView alloc] init];
        bgView.frame = CGRectMake(0, 0, self.view.frame.size.width, 80);
        bgView.backgroundColor = [UIColor whiteColor];
        
        
        
        UIButton *iconButton = [[UIButton alloc] init];
        iconButton.frame = CGRectMake(self.view.frame.size.width / 2 - 30, 10, 60, 60);
        
        iconButton.backgroundColor = [UIColor redColor];
        iconButton.layer.masksToBounds = YES;
        iconButton.layer.cornerRadius = 30;
        [iconButton addTarget:self action:@selector(iconButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:iconButton];
        
        return bgView;
    }else{
        return nil;
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 80;
    }else
    {
        return 0.0001;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    

    
    if (section == 2) {
        UIView *bgview = [[UIView alloc] init];
        bgview.backgroundColor = [UIColor whiteColor];
        bgview.frame = CGRectMake(0, 0, self.view.frame.size.width, 50);
        
        UIButton *savebutton = [[UIButton alloc] init];
        savebutton.frame = CGRectMake(10, 10, self.view.frame.size.width-20, 40);
        savebutton.backgroundColor = [UIColor blueColor];
        [savebutton setTitle:@"保存" forState:UIControlStateNormal];
        [savebutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [savebutton addTarget:self action:@selector(saveButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [savebutton setBackgroundImage:[UIImage imageNamed:@"t_btn_normal"] forState:UIControlStateNormal];
        [savebutton setBackgroundImage:[UIImage imageNamed:@"t_btn_press"] forState:UIControlStateHighlighted];
        savebutton.contentMode = UIViewContentModeScaleAspectFit;
        [bgview addSubview:savebutton];
        return bgview;
    }else
    {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor grayColor];
        view.bounds = CGRectMake(0, 0, self.view.frame.size.width, 10);
        return view;
        
    }
    
 
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 2) {
        return 50;
    }else
    {
        return 10;
    }
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //消除cell选择痕迹
    [self performSelector:@selector(deselect) withObject:nil afterDelay:0.2];
    
    if (indexPath.section == 0) {
        NSArray *titleArray = @[@"姓名",@"与本账户关系",@"性别",@"出生日期",@"社区",@"所属区域",];
        
        if (indexPath.row != 0) {
            
            IWProfileSecondViewController *vc = [[IWProfileSecondViewController alloc] init];
            vc.title = NSLocalizedString(titleArray[indexPath.row], nil);
            [self.navigationController pushViewController:vc animated:YES];
            
            
        }
        
    }
    
    if (indexPath.section == 1) {
        NSArray *titleArray = @[@"职业",@"身份证",@"婚姻状况",@"文化程度"];
        
        if (indexPath.row != 1) {
       
            IWProfileSecondViewController *vc = [[IWProfileSecondViewController alloc] init];
            vc.title = NSLocalizedString(titleArray[indexPath.row], nil);
            [self.navigationController pushViewController:vc animated:YES];
            
        }
    }
    
    if (indexPath.section == 2) {
        NSArray *titleArray = @[@"社保",@"公积金编号",@"手机号码",@"邮箱"];
        
        if (indexPath.row != 0) {
            IWProfileSecondViewController *vc = [[IWProfileSecondViewController alloc] init];
            vc.title = NSLocalizedString(titleArray[indexPath.row], nil);
            [self.navigationController pushViewController:vc animated:YES];;
        }
    }
    
    
    
}
- (void)deselect
{
    
    [self.profileTableView deselectRowAtIndexPath:[self.profileTableView indexPathForSelectedRow] animated:YES];
    
}

#pragma mark - saveButton的点击方法
- (void)iconButtonClicked:(UIButton *)button
{
    NSLog(@"iconButtonClicked");
}

- (void)saveButtonClicked:(UIButton *)button
{
    NSLog(@"saveButtonClicked");
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
