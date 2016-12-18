//
//  IWHomeViewController.m
//  Doctor
//
//  Created by 范超 on 16/12/17.
//
//

#import "IWHomeViewController.h"
#import "IWHealthFileViewController.h"

@interface IWHomeViewController ()

@property (nonatomic, weak) UIButton *familyHealthFileBtn;



@end

@implementation IWHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    self.title = @"家庭医生";
    
    
    [self familyHealthFileBtn];
    
}

- (UIButton *)familyHealthFileBtn
{
    if (_familyHealthFileBtn == nil) {
        UIButton *button = [[UIButton alloc] init];
        [button setTitle:@"家庭健康档案" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor greenColor];
        button.frame = CGRectMake(30, 200, 150, 100);
        [button addTarget:self action:@selector(familyHealthFileBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        
        _familyHealthFileBtn = button;
        
        
    }
    return _familyHealthFileBtn;
}

- (void)familyHealthFileBtnClicked:(UIButton *)btn
{
    
    IWHealthFileViewController *vc = [[IWHealthFileViewController alloc] init];
    vc.title = @"健康档案";
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
