//
//  IWHomeViewController.m
//  Doctor
//
//  Created by 范超 on 16/12/17.
//
//

#import "IWHomeViewController.h"
#import "IWScrollHeaderView.h"
#import "IWHomeTool.h"
#import "IWNavigationController.h"
#import "IWBanner.h"
#import "IWUserTool.h"
#import "IWUser.h"
#import "IWCompanyTool.h"
#import "TPKeyboardAvoidingScrollView.h"

@interface IWHomeViewController ()
@property (nonatomic, weak) IWScrollHeaderView *scrollhHeaderView;
@property (weak, nonatomic) IBOutlet UIView *mainView;
- (IBAction)loadMedicalArchives:(UIButton *)sender;
- (IBAction)loadTrainning:(UIButton *)sender;
- (IBAction)loadDoctorSign:(UIButton *)sender;
- (IBAction)loadNnpList:(UIButton *)sender;

@end

@implementation IWHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置基本属性
    [self setupBase];
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
}

- (void)setupBase {
    self.navigationItem.title = NSLocalizedString(@"family_doctor", nil);
    
    // 中间的view
}



- (IBAction)loadMedicalArchives:(UIButton *)sender {
}

- (IBAction)loadTrainning:(UIButton *)sender {
}

- (IBAction)loadDoctorSign:(UIButton *)sender {
}

- (IBAction)loadNnpList:(UIButton *)sender {
}
@end
