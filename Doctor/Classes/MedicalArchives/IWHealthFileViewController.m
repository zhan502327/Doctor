//
//  IWHealthFileViewController.m
//  Doctor
//
//  Created by 深水区 on 16/12/18.
//
//

#import "IWHealthFileViewController.h"
#import "IWHealthFileTableViewCell.h"
#import "IWMedicalInfoViewController.h"
#import "IWMedicalReportViewController.h"
#import "IWMedicalMonitorViewController.h"
#import "IWProfileInfoViewController.h"


@interface IWHealthFileViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, weak) UITableView *healthFileTabelView;




@end

@implementation IWHealthFileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    

    //懒加载控件
    [self healthFileTabelView];
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationItem.title = NSLocalizedString(@"健康档案",nil);
}

- (UITableView *)healthFileTabelView
{
    if (_healthFileTabelView == nil) {
        UITableView *tabelView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStylePlain];
        tabelView.delegate = self;
        tabelView.dataSource = self;
        tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:tabelView];
        
        _healthFileTabelView = tabelView;
        
        
    }
    
    return _healthFileTabelView;
    
}


#pragma mark - tableview的代理方法


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 11;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    IWHealthFileTableViewCell *cell = [IWHealthFileTableViewCell normalTableViewCellWithTableView:tableView];
    __weak typeof(self) ws = self;

    [cell setFirstBtnBlock:^{
       
        IWMedicalMonitorViewController *vc = [[IWMedicalMonitorViewController alloc] init];
        vc.view.backgroundColor = [UIColor whiteColor];

        [ws.navigationController pushViewController:vc animated:YES];
    }];
    
    [cell setSecondBtnBlock:^{
        IWMedicalReportViewController *vc = [[IWMedicalReportViewController alloc] init];
        vc.view.backgroundColor = [UIColor whiteColor];

        [ws.navigationController pushViewController:vc animated:YES];
        
    }];
    
    [cell setThirdBtnBlock:^{
       
        IWMedicalInfoViewController *vc = [[IWMedicalInfoViewController alloc] init];
        vc.view.backgroundColor = [UIColor whiteColor];
        

        [ws.navigationController pushViewController:vc animated:YES];
    }];
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor grayColor];
    view.frame = CGRectMake(0, 0, self.view.frame.size.width, 10);
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    IWProfileInfoViewController *vc = [[IWProfileInfoViewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:YES];
    
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
