//
//  IWHealthFileViewController.m
//  Doctor
//
//  Created by 深水区 on 16/12/18.
//
//

#import "IWHealthFileViewController.h"
#import "IWHealthFileFooterView.h"

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

- (UITableView *)healthFileTabelView
{
    if (_healthFileTabelView == nil) {
        UITableView *tabelView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tabelView.delegate = self;
        tabelView.dataSource = self;
        [self.view addSubview:tabelView];
        
        _healthFileTabelView = tabelView;
        
        
    }
    
    return _healthFileTabelView;
    
}


#pragma mark - tableview的代理方法

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 22;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID =
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#(nonnull NSString *)#>]
    
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//    
//    IWHealthFileFooterView *footerView = [[IWHealthFileFooterView alloc] init];
//    footerView.frame = CGRectMake(0, 0, self.view.frame.size.width, 50);
//    return footerView;
//    
//    
//    
//    
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 50;
//}

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
