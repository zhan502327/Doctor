//
//  IWContactViewController.m
//  Conedot
//
//  Created by 范超 on 14-9-23.
//  Copyright (c) 2014年 范超. All rights reserved.
//

#import "IWContactViewController.h"
#import "IWUser.h"
#import "IWUserTool.h"
#import "IWCompanyTool.h"
#import "IWFanCompany.h"
#import "IWToast.h"
#import "IWContact.h"
#import "IWContactGroup.h"
#import "IWDepartmentViewController.h"
#import "IWContactTool.h"
#import "MBProgressHUD+MJ.h"
#import "IWDepartmentPeopleViewController.h"
#import "IWPeopleViewController.h"
#import "IWPeople.h"
#import "IWNavigationController.h"
#import "IWContactTool.h"

@interface IWContactViewController ()

@property (nonatomic, strong) NSMutableArray *datas;
@property (nonatomic, strong) IWPeople *people;
@property (nonatomic, weak) UITableView *tableView;
@end

@implementation IWContactViewController

- (NSMutableArray *)datas {
    if (_datas == nil) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
#ifdef __IPHONE_7_0
    if (iOS7) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
#endif
    // 初始化view
    [self setupView];
    
    // 加载公司数据
    [self loadDepartmentData];
    
}


- (void)setupView {
    self.view.backgroundColor = IWTableViewBgColor;
    
    // 设置tableview
    self.tableView.rowHeight = 50;
    self.tableView.sectionHeaderHeight = 44;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 设置右边的item
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(search)];
}

- (void)search {
//    IWContactSearchViewController *vc = [[IWContactSearchViewController alloc] init];
//    vc.isApproval = self.isApproval;
//    [self.navigationController pushViewController:vc animated:YES];
}

/**
 *  加载部门数据
 */
- (void)loadDepartmentData {
    IWContactLevelParam *param = [[IWContactLevelParam alloc] init];
    param.loginId = [IWUserTool user].loginId;
    param.companyId = @(IWCompanyId);
    
    // 显示加载框
    [MBProgressHUD showMessage:NSLocalizedString(@"loading", nil)];
    [IWContactTool departmentWithParam:param success:^(IWContactLevelResult *result) {
        // 存储用于显示title
        [[NSUserDefaults standardUserDefaults] setValue:@"" forKey:UserDefaultContactHeaderTitle];
        [[NSUserDefaults standardUserDefaults] setValue:NSLocalizedString(@"community_title", nil) forKey:UserDefaultContactHeaderTitle];
        
        // 判断
        if (result.deptDatas != nil && result.deptDatas.count > 0 && result.userDatas != nil && result.userDatas.count > 0) {
            // 有部门，有人员
            IWDepartmentPeopleViewController *dpVc = [[IWDepartmentPeopleViewController alloc] init];
//            dpVc.departments = result.deptDatas;
//            dpVc.peoples = result.userDatas;
//            dpVc.topTitle = company.companyName;
//            dpVc.isApproval = self.isApproval;
//            dpVc.company = company;
            [self.navigationController pushViewController:dpVc animated:YES];
        } else if (result.deptDatas != nil && result.deptDatas.count > 0) {
            // 只有部门
            // 进入下一级页面
            IWDepartmentViewController *vc = [[IWDepartmentViewController alloc] init];
//            vc.topTitle = company.companyNickname;
//            vc.datas = result.deptDatas;
//            vc.isApproval = self.isApproval;
//            vc.company = company;
            [self.navigationController pushViewController:vc animated:YES];
        } else {
            // 只有人员
            IWPeopleViewController *peopleVc = [[IWPeopleViewController alloc] init];
//            peopleVc.datas = result.userDatas;
//            peopleVc.topTitle = company.companyNickname;
//            peopleVc.isApproval = self.isApproval;
            [self.navigationController pushViewController:peopleVc animated:YES];
        }
        
        // 隐藏加载框
        [MBProgressHUD hideHUD];
    } failure:^(NSError *error) {
        [IWToast toastWithView:self.view title:NSLocalizedString(@"net_error", nil)];
        // 隐藏加载框
        [MBProgressHUD hideHUD];
    }];
}

@end
