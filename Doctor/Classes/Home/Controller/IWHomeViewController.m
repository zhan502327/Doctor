//
//  IWHomeViewController.m
//  Doctor
//
//  Created by 范超 on 16/12/17.
//
//

#import "IWHomeViewController.h"
#import "IWHealthFileViewController.h"
#import "IWScrollHeaderView.h"
#import "IWHomeTool.h"
#import "IWNavigationController.h"
#import "IWBanner.h"
#import "IWUserTool.h"
#import "IWUser.h"
#import "IWCompanyTool.h"
#import "TPKeyboardAvoidingScrollView.h"
#import "Masonry.h"

@interface IWHomeViewController ()
@property (nonatomic, weak) IWScrollHeaderView *scrollhHeaderView;

@property (nonatomic, weak) UIButton *familyHealthFileBtn;



@end

@implementation IWHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

//    self.title = @"";
    
    // 设置基本属性
    [self setupBase];
    
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
    [self.navigationController pushViewController:vc animated:YES];
 
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = NO;
    
    // 删除系统自动生成的UITabBarButton
    for (UIView *child in self.tabBarController.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
    [self setupBase];
}

- (void)setupBase {
    self.navigationItem.title = NSLocalizedString(@"家庭医生", nil);
}



@end
