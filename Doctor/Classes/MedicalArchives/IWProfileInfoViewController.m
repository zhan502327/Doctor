//
//  IWProfileInfoViewController.m
//  Doctor
//
//  Created by 深水区 on 16/12/19.
//
//

#import "IWProfileInfoViewController.h"

@interface IWProfileInfoViewController ()



@end

@implementation IWProfileInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self setupNavgation];
    
    
    
}

- (void)setupNavgation
{
    self.navigationItem.title = NSLocalizedString(@"个人信息", nil);

    UIBarButtonItem *item = [[UIBarButtonItem alloc] init];
    item.title = @"删除";
    
    self.navigationItem.rightBarButtonItem = item;
    
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
