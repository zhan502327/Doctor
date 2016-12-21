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
#import "IWHealhFileModel.h"


@interface IWHealthFileViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, weak) UITableView *healthFileTabelView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@property (nonatomic, weak) UIButton *bottomButton;



@end

@implementation IWHealthFileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dataSource = [NSMutableArray arrayWithCapacity:0];

    //请求数据
    [self loadData];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationItem.title = NSLocalizedString(@"健康档案",nil);
}

#pragma mark - 数据请求
- (void)loadData
{
    
    
    
    NSString *loginID = [NSString stringWithFormat:@"%@",[IWUserTool user].loginId];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
    [params setValue:loginID forKey:@"loginId"];
    [params setValue:@"3" forKey:@"relationship"];
    
    
    
    [IWHttpTool postWithURL:SERVER_GET_GET_MEMBER_LIST_URL params:params success:^(id json) {
        
        if ([json[@"code"] intValue] == 0) {
            
            NSArray *tempArray = json[@"datas"];
        
            for (NSDictionary *subDic in tempArray) {
                IWHealhFileModel *model = [[IWHealhFileModel alloc] init];
                [model setValuesForKeysWithDictionary:subDic];
                [self.dataSource addObject:model];
                [self.healthFileTabelView reloadData];
            }
            //懒加载控件
            [self healthFileTabelView];
            [self bottomButton];
        }
        
        
        
    } failure:^(NSError *error) {
        
    }];

}

-(UIButton *)bottomButton{
    if (_bottomButton == nil) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];

        button.frame = CGRectMake(self.view.frame.size.width - 70, self.view.frame.size.height - 70, 50, 50);
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 25;
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button addTarget:self action:@selector(bottombuttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        button.titleLabel.numberOfLines = 2;
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"liuyan_btn_highlighted"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"liuyan_btn"] forState:UIControlStateHighlighted];

        [button setTitle:@"添加\n人员" forState:UIControlStateNormal];
        
        [self.view addSubview:button];
        
        _bottomButton=button;
    }
    return _bottomButton;
}
//点击事件
-(void)bottombuttonClicked:(UIButton *)button{
    IWProfileInfoViewController *vc = [[IWProfileInfoViewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:YES];
    
}


- (UITableView *)healthFileTabelView
{
    if (_healthFileTabelView == nil) {
        UITableView *tabelView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        tabelView.delegate = self;
        tabelView.dataSource = self;
        tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tabelView.showsHorizontalScrollIndicator=NO;
        tabelView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:tabelView];
        
        _healthFileTabelView = tabelView;
        
        
    }
    
    return _healthFileTabelView;
    
}


#pragma mark - tableview的代理方法


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.count;
    
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
    
    
    cell.model = self.dataSource[indexPath.section];
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
    vc.model = self.dataSource[indexPath.section];
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
