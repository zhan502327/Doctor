//
//  IWUserRegisterViewController.m
//  Conedot
//
//  Created by 范超 on 14-10-8.
//  Copyright (c) 2014年 范超. All rights reserved.
//

#import "IWUserRegisterViewController.h"
#import "IWTabBarViewController.h"
#import "MBProgressHUD+MJ.h"
#import "IWUserTool.h"
#import "IWUser.h"
#import "IWToast.h"
#import "NSString+IW.h"

@interface IWUserRegisterViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *retryPassword;
@property (weak, nonatomic) IBOutlet UITextField *cellphone;
@property (weak, nonatomic) IBOutlet UITextField *cellphoneSc;
@property (weak, nonatomic) IBOutlet UIButton *buttonSc;
@property (weak, nonatomic) IBOutlet UIView *bannerView;
@property (weak, nonatomic) IBOutlet UILabel *labelView;
@property (weak, nonatomic) IBOutlet UIButton *buttonClose;
@property (weak, nonatomic) IBOutlet UIButton *buttonRegister;
- (IBAction)close:(id)sender;
- (IBAction)register:(id)sender;

- (IBAction)getRegisterSc;

@end

@implementation IWUserRegisterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // 设置导航
    [self setupNavBar];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self resignAllFirstResponder];
}

- (void)resignAllFirstResponder {
    [self.password resignFirstResponder];
    [self.retryPassword resignFirstResponder];
    [self.cellphone resignFirstResponder];
    [self.cellphoneSc resignFirstResponder];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

/**
 *  设置导航
 */
- (void)setupNavBar {
    self.labelView.text = NSLocalizedString(@"register", nil);
    [self.bannerView setBackgroundColor:IWGlobalColor];
    [self.buttonRegister setTitle:NSLocalizedString(@"register_now", nil) forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithName:@"btn_closeItem"] style:UIBarButtonItemStyleDone target:self action:@selector(cancel)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"register_now", nil) style:UIBarButtonItemStyleDone target:self action:@selector(userRegister)];
    
    [self.password setDelegate:self];
    [self.retryPassword setDelegate:self];
    [self.cellphone setDelegate:self];
    [self.cellphoneSc setDelegate:self];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.password) {
        [self.retryPassword becomeFirstResponder];
    } else if (textField == self.retryPassword) {
        [self.cellphone becomeFirstResponder];
    } else if (textField == self.cellphone) {
        [self.cellphoneSc becomeFirstResponder];
    } else if (textField == self.cellphoneSc) {
        [self userRegister];
    }
    return YES;
}

/**
 *  提交注册
 */
- (void)userRegister {
    NSString *password = self.password.text;
    NSString *retryPassword = self.retryPassword.text;
    NSString *cellphone = self.cellphone.text;
    NSString *cellphoneSc = self.cellphoneSc.text;
    
    // 判断密码
    if([self checkValideWithName:password error:@"please_input_password"]) return;
    
    if (![retryPassword isEqualToString:password]) {
        [IWToast toastWithView:self.view title:NSLocalizedString(@"retry_password_error", nil)];
        return;
    }
    
    // 判断手机号
    if([self checkValideWithName:cellphone error:@"please_input_cellphone"]) return;
    if (![NSString validateMobile:cellphone]) {
        [IWToast toastWithView:self.view title:NSLocalizedString(@"please_input_cellphone_error", nil)];
        return;
    }
    
    // 判断验证码
    if([self checkValideWithName:cellphoneSc error:@"please_input_cellphonesc"]) return;
    
    
    // 隐藏键盘
    [self.view endEditing:YES];
    
    // 执行注册
    IWRegisterParam *param = [[IWRegisterParam alloc] init];
    param.cellphone = cellphone;
    param.pwd = password;
    param.securityCode = cellphoneSc;
    param.channel = param.channel;
    param.deviceToken = [IWUserTool accessToken];
    
    [MBProgressHUD showMessage:NSLocalizedString(@"register_loading", nil)];
    [IWUserTool userRegisterWithParam:param success:^(IWRegisterResult *result) {
        if (result.code == 0) {
            // 请求成功
            [IWToast toastWithView:self.view title:NSLocalizedString(@"register_success", nil)];
            
            // 存储模型数据
            IWUser *user = result.datas;
            user.pwd = param.pwd;
            user.password = password;
            [IWUserTool saveUser:result.datas];
            
            // 跳转到首页
            [self dismissViewControllerAnimated:YES completion:nil];
            self.view.window.rootViewController = [[IWTabBarViewController alloc] init];
        } else {
            // 请求失败
            [IWToast toastWithView:self.view title:result.info];
        }
        // 隐藏加载框
        [MBProgressHUD hideHUD];
    } failure:^(NSError *error) {
        [IWToast toastWithView:self.view title:NSLocalizedString(@"net_error", nil)];
    }];
    
}

/**
 *  检查输入字符的合法性
 *
 *  @param name  输入字符
 *  @param error 错误显示
 *
 *  @return true：非法
 */
- (BOOL)checkValideWithName:(NSString *)name error:(NSString *)error{
    if (name == nil || [name isEqualToString:@""]) {
        [IWToast toastWithView:self.view title:NSLocalizedString(error, nil)];
        return YES;
    }
    return NO;
}

/**
 *  关闭
 */
- (void)cancel {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 *  获取验证码
 */
- (IBAction)close:(id)sender {
    [self cancel];
}

- (IBAction)register:(id)sender {
    [self userRegister];
}

- (IBAction)getRegisterSc {
    // 判断手机号
    if([self checkValideWithName:self.cellphone.text error:@"please_input_cellphone"]) return;
    
    IWRegisterScParam *param = [[IWRegisterScParam alloc] init];
    param.cellphone = self.cellphone.text;
    
    UIButton *button = self.buttonSc;
    
    [IWUserTool userRegisterScWithParam:param success:^(IWRegisterScResult *result) {
        if (result.code != 0) {
            [MBProgressHUD showSuccess:result.info];
        } else {
            [MBProgressHUD showSuccess:NSLocalizedString(@"please_check_code", nil)];
            [self startTime:button];
        }
    } failure:^(NSError *error) {
        IWLog(@"%@", error);
    }];
}

/**
 *  计时
 */
-(void)startTime:(UIButton *)button {
    __block int timeout = IWTIMECOUNT; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [button setTitle:NSLocalizedString(@"get_code", nil) forState:UIControlStateNormal];
                button.userInteractionEnabled = YES;
            });
        }else{
            //            int minutes = timeout / 60;
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [button setTitle:[NSString stringWithFormat:@"%@%@",strTime, NSLocalizedString(@"second_send", nil)] forState:UIControlStateNormal];
                button.userInteractionEnabled = NO;
                
            });
            timeout--;
            
        }
    });
    dispatch_resume(_timer);
}
@end
