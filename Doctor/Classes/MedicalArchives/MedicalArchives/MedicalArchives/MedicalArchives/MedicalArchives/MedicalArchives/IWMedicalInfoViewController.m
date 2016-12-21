//
//  IWMedicalInfoViewController.m
//  Doctor
//
//  Created by 深水区 on 16/12/19.
//
//

#import "IWMedicalInfoViewController.h"
#import "IWInfoTableViewCell.h"

@interface IWMedicalInfoViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak) UITableView *myTableView;

@end

@implementation IWMedicalInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //懒加载控件
    [self myTableView];
}

#pragma mark - 懒加载控件

- (UITableView *)myTableView
{
    if (_myTableView == nil) {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64)];
        tableView.backgroundColor = [UIColor grayColor];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        tableView.showsHorizontalScrollIndicator = NO;
        tableView.showsVerticalScrollIndicator = NO;
        [self.view insertSubview:tableView atIndex:1];
        _myTableView = tableView;
    }
    return _myTableView ;
}
#pragma mark - tableView delegate and tableView dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0 ) {
        return 3;
    }
    
    if (section == 5) {
        return 3;
    }
    if (section == 6) {
        return 4;
    }
    
    return 1;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    __weak typeof(self) ws = self;
    IWInfoTableViewCell *cell = [IWInfoTableViewCell normalTableViewCellWithTableView:tableView];
    
    if (indexPath.section == 0) {
        NSArray *titleArray = @[@"身高",@"体重",@"血型"];
        cell.titleLabel.text = titleArray[indexPath.row];
    }else if(indexPath.section == 5) {
        NSArray *titleArray = @[@"疾病",@"手术",@"输血"];
        cell.titleLabel.text = titleArray[indexPath.row];
    }else if (indexPath.section == 6) {
        NSArray *titleArray = @[@"祖父母",@"父亲",@"母亲",@"兄弟姊妹"];
        cell.titleLabel.text = titleArray[indexPath.row];
    }else{
        if (indexPath.row == 0) {
            NSArray *titleArray = @[@"",@"生育史",@"烟酒史",@"过敏史",@"暴露史",@"",@"",@"遗传病史",@"残疾情况",@"锻炼情况"];
            cell.titleLabel.text = titleArray[indexPath.section];
            
            
        }
        
        
    }
    
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
    
    if (section == 5 || section == 6) {
        UIView *backView = [[UIView alloc]init];
        backView.backgroundColor = [UIColor clearColor];
        backView.frame = CGRectMake(0, 0, self.view.frame.size.width, 40);
        
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        view.frame = CGRectMake(10, 0, self.view.frame.size.width - 20, 40);
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(5, 0, 200, 40);
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor grayColor];
        label.textAlignment = NSTextAlignmentLeft;
        label.backgroundColor = [UIColor whiteColor];
        [view addSubview:label];
        [backView addSubview:view];
        if (section == 5) {
            label.text = @"疾病既往史";
        }else
        {
            label.text = @"家族史";
        }
        
        return backView;
    }else{
        
        return nil;
    }

}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 5 || section == 6) {
        return 40;
    }else
    {
        return 0.0001;
    }
    
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *backView = [[UIView alloc]init];
    backView.backgroundColor = [UIColor grayColor];
    return backView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationItem.title = NSLocalizedString(@"医疗信息",nil);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
