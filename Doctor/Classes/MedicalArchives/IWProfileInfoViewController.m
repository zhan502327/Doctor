//
//  IWProfileInfoViewController.m
//  Doctor
//
//  Created by 深水区 on 16/12/19.
//
//

#import "IWProfileInfoViewController.h"
#import "IWProfileArowTableViewCell.h"
#import "IWProfileTextFieldTableViewCell.h"
#import "IWProfileSecondViewController.h"
#import "IWProfileInfoModel.h"

@interface IWProfileInfoViewController ()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate,UIImagePickerControllerDelegate>

{
    NSData *imageData;
    UIButton *iconButton;
    NSMutableArray *dataSource;
}

@property (nonatomic, weak) UITableView *profileTableView;


@end

@implementation IWProfileInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //设置导航栏
    [self setupNavgation];

    
    if (self.model == nil) {
        
        //懒加载
        [self profileTableView];
    }else{
        //请求数据
        [self loadData];
    }
    
}



- (void)setupNavgation
{
    self.navigationItem.title = NSLocalizedString(@"个人信息", nil);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"删除" style:UIBarButtonItemStyleDone target:self action:@selector(cancleclicked)];
    
}

- (void)cancleclicked
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"删除健康档案" message:@"将删除该人的个人信息以及医疗报告和医疗信息" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alert.alertViewStyle = UIAlertViewStyleDefault;
    [alert show];
}

#pragma mark - 弹框的代理方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        NSLog(@"确认");
    
        NSNumber *companyId = @(IWCompanyId);
        NSString *loginID = [NSString stringWithFormat:@"%@",[IWUserTool user].loginId];
        NSString *memberId = self.model.memberId;
        
        NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
        [params setValue:companyId forKey:@"companyId"];
        [params setValue:loginID forKey:@"loginId"];
        [params setValue:memberId forKey:@"memberId"];
        
        
        
        [IWHttpTool postWithURL:SERVER_DO_DELETE_MEMBER_URL params:params success:^(id json) {
            
            if ([json[@"code"] intValue] == 0) {
                
                [MBProgressHUD showSuccess:@"删除成功"];
                
            
                
            }
            
            
            
        } failure:^(NSError *error) {
            
        }];

        
        
    }else
    {
        NSLog(@"取消");
    }
    
}

#pragma mark - 数据请求
- (void)loadData
{
    dataSource = [NSMutableArray array];
    NSString *cellphone = [IWUserTool user].cellphone;
    NSNumber *companyId = @(IWCompanyId);
    NSString *loginID = [NSString stringWithFormat:@"%@",[IWUserTool user].loginId];
    NSString *memberId = self.model.memberId;
    NSString *pwd = [IWUserTool user].pwd;
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
    [params setValue:cellphone forKey:@"cellphone"];
    [params setValue:companyId forKey:@"companyId"];
    [params setValue:loginID forKey:@"loginId"];
    [params setValue:memberId forKey:@"memberId"];
    [params setValue:pwd forKey:@"pwd"];
    
    
    
    [IWHttpTool postWithURL:SERVER_GET_LOGIN_INFO_URL params:params success:^(id json) {
        
        if ([json[@"code"] intValue] == 0) {
            
            NSDictionary *tempDic = json[@"datas"];
            
            IWProfileInfoModel *model = [[IWProfileInfoModel alloc] init];
            [model setValuesForKeysWithDictionary:tempDic];
            [dataSource addObject:model];
            [self.profileTableView reloadData];
            
            
            //懒加载
            [self profileTableView];

        }
        
        
        
    } failure:^(NSError *error) {
        
    }];
    
}

#pragma mark - 懒加载

-(UITableView *)profileTableView{
    if (_profileTableView == nil) {
        UITableView *tableView;
        if (self.model == nil) {
            tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStyleGrouped];
        }else
        {
            tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height
                                                                      ) style:UITableViewStyleGrouped];

        }

        
        
        tableView.backgroundColor=[UIColor grayColor];
        tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        tableView.scrollEnabled=YES;
        
        tableView.dataSource=self;
        tableView.delegate=self;
        [self.view addSubview:tableView];
        _profileTableView = tableView;
    }
    return _profileTableView;
}
#pragma mark - tableView delegate and tableView dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    IWProfileInfoModel *model = dataSource.firstObject;
    
    
    if ([model.siStatus intValue] == 1) {
        
        if (section == 0) {
            return 6;
        }else{
            return 4;
        }
        
    }else{
        if (section == 0) {
            return 6;
        }else if (section == 1){
            return 4;
        }
        else
        {
            return 3;
        }

    }


    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    IWProfileInfoModel *model = dataSource.firstObject;


    
    
    if (indexPath.section == 0) {
        NSArray *titleArray = @[@"姓名",@"与本账户关系",@"性别",@"出生日期",@"社区",@"所属区域",];
        NSArray *resultArray;
        if (model == nil) {
            resultArray = @[@"",@"",@"",@"",@"",@""];
        }else{
            resultArray = @[model.userName,model.relationship,model.gender2show,model.birthday,model.communityName,model.siPlace];
        }

        if (indexPath.row == 0) {
            IWProfileTextFieldTableViewCell *cell = [IWProfileTextFieldTableViewCell normalTableViewCellWithTableView:tableView];

            cell.titleLabel.text = titleArray[indexPath.row];
            cell.newsTextField.placeholder = @"请填写真实姓名";
            cell.newsTextField.text = resultArray[indexPath.row];
            
            
            return cell;
            
            
        }else if (indexPath.row == 1){
         
            IWProfileArowTableViewCell *cell  = [IWProfileArowTableViewCell normalTableViewCellWithTableView:tableView];
            cell.titleLabel.text = titleArray[indexPath.row];
            if ([resultArray[indexPath.row] isEqualToString:@"0"]) {
                cell.resultLabel.text = @"本人";
            }else if ([resultArray[indexPath.row] isEqualToString:@"1"]){
                cell.resultLabel.text = @"家人";

            }else{
                cell.resultLabel.text = @"其他";
            }
            return cell;
            
        }else
        {
            IWProfileArowTableViewCell *cell  = [IWProfileArowTableViewCell normalTableViewCellWithTableView:tableView];
            cell.titleLabel.text = titleArray[indexPath.row];

            cell.resultLabel.text = resultArray[indexPath.row];
            return cell;
        }
        
    }
    
    if (indexPath.section == 1) {
        NSArray *titleArray = @[@"职业",@"身份证",@"婚姻状况",@"文化程度"];
        
        NSArray *resultArray;
        if (model == nil) {
            resultArray = @[@"",@"",@"",@""];
        }else{
            resultArray = @[model.occupation2show,model.userCard,model.maritalStatus2show,model.education2show];
        }

        if (indexPath.row == 1) {
            IWProfileTextFieldTableViewCell *cell = [IWProfileTextFieldTableViewCell normalTableViewCellWithTableView:tableView];
            cell.titleLabel.text = titleArray[indexPath.row];

            cell.newsTextField.placeholder = @"请填写身份证号";

            cell.newsTextField.text = resultArray[indexPath.row];
            return cell;
        }else
        {
            IWProfileArowTableViewCell *cell  = [IWProfileArowTableViewCell normalTableViewCellWithTableView:tableView];
            cell.titleLabel.text = titleArray[indexPath.row];

            cell.resultLabel.text = resultArray[indexPath.row];
            return cell;

        }
    }
    
    if (indexPath.section == 2) {
        
        
        if ([model.siStatus intValue] == 0) {//无社保
            NSArray *titleArray = @[@"社保",@"手机号码",@"邮箱"];
            NSArray *resultArray;
            if (model == nil) {
                resultArray = @[@"无",@"",@""];

            }else{
                resultArray = @[@"无",model.cellphone,model.mail];

            }
            if (indexPath.row == 0) {
                IWProfileArowTableViewCell *cell = [IWProfileArowTableViewCell normalTableViewCellWithTableView:tableView];
                cell.titleLabel.text = titleArray[indexPath.row];
                cell.resultLabel.text = resultArray[indexPath.row];
                
                return cell;
            }else
            {
                IWProfileTextFieldTableViewCell *cell  = [IWProfileTextFieldTableViewCell normalTableViewCellWithTableView:tableView];
                cell.titleLabel.text = titleArray[indexPath.row];

                cell.newsTextField.text = resultArray[indexPath.row];
                return cell;
                
            }
            
        }else{
            NSArray * titleArray = @[@"社保",@"公积金编号",@"手机号码",@"邮箱"];
            NSArray *resultArray;
            if (model == nil) {
                resultArray = @[@"有",@"",@"",@""];
            }else
            {
                resultArray = @[@"有",model.siCode,model.cellphone,model.mail];

            }

            if (indexPath.row == 0) {
                IWProfileArowTableViewCell *cell = [IWProfileArowTableViewCell normalTableViewCellWithTableView:tableView];
                cell.titleLabel.text = titleArray[indexPath.row];
                cell.resultLabel.text = resultArray[indexPath.row];
                
                return cell;
            }else
            {
                IWProfileTextFieldTableViewCell *cell  = [IWProfileTextFieldTableViewCell normalTableViewCellWithTableView:tableView];
                cell.titleLabel.text = titleArray[indexPath.row];
                cell.newsTextField.text = resultArray[indexPath.row];
                return cell;
                
            }
        }
    

    }

    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    IWProfileInfoModel *model = dataSource.firstObject;
    if (section == 0) {
        UIView *bgView =[[UIView alloc] init];
        bgView.frame = CGRectMake(0, 0, self.view.frame.size.width, 80);
        bgView.backgroundColor = [UIColor whiteColor];
        
        
        
        iconButton = [[UIButton alloc] init];
        iconButton.frame = CGRectMake(self.view.frame.size.width / 2 - 30, 10, 60, 60);
        
        iconButton.layer.masksToBounds = YES;
        iconButton.layer.cornerRadius = 30;
        [iconButton addTarget:self action:@selector(iconButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        if (model.photo) {

            UIImageView *imageView = [[UIImageView alloc]init];
            [imageView sd_setImageWithURL:[NSURL URLWithString:model.photo]];
             UIImage *image = imageView.image;
            [iconButton setImage:image forState:UIControlStateNormal];
        }else{
            [iconButton setImage:[UIImage imageNamed:@"90boy"] forState:UIControlStateNormal];

        }
        
        
        [bgView addSubview:iconButton];
        
        
        return bgView;
    }else{
        return nil;
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 80;
    }else
    {
        return 0.0001;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    

    
    if (section == 2) {
        UIView *bgview = [[UIView alloc] init];
        bgview.backgroundColor = [UIColor whiteColor];
        bgview.frame = CGRectMake(0, 0, self.view.frame.size.width, 50);
        
        UIButton *savebutton = [[UIButton alloc] init];
        savebutton.frame = CGRectMake(10, 10, self.view.frame.size.width-20, 40);
        savebutton.backgroundColor = [UIColor clearColor];
        [savebutton setTitle:@"保存" forState:UIControlStateNormal];
        [savebutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [savebutton addTarget:self action:@selector(saveButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        savebutton.layer.masksToBounds = YES;
        savebutton.layer.cornerRadius = 3;
        NSArray *arrat = @[@"t_btn_normal",@"t_btn_press"];
        for (int i = 0; i<2; i++) {
            // 加载图片
            UIImage *image = [UIImage imageNamed:arrat[i]];
            
            // 设置端盖的值
            CGFloat top = image.size.height * 0.5;
            CGFloat left = image.size.width * 0.5;
            CGFloat bottom = image.size.height * 0.5;
            CGFloat right = image.size.width * 0.5;
            
            UIEdgeInsets edgeInsets = UIEdgeInsetsMake(top, left, bottom, right);
            
            // 拉伸图片
            UIImage *newImage = [image resizableImageWithCapInsets:edgeInsets];

            if (i == 0) {
                [savebutton setBackgroundImage:newImage forState:UIControlStateNormal];

            }else{
                [savebutton setBackgroundImage:newImage forState:UIControlStateHighlighted];

            }
        }
        
        
        savebutton.contentMode = UIViewContentModeScaleAspectFit;
        [bgview addSubview:savebutton];
        return bgview;
    }else
    {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor grayColor];
        view.bounds = CGRectMake(0, 0, self.view.frame.size.width, 10);
        return view;
        
    }
    
 
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 2) {
        return 70;
    }else
    {
        return 10;
    }
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //消除cell选择痕迹
    [self performSelector:@selector(deselect) withObject:nil afterDelay:0.2];
    
    if (indexPath.section == 0) {
        NSArray *titleArray = @[@"姓名",@"与本账户关系",@"性别",@"出生日期",@"社区",@"所属区域",];
        
        if (indexPath.row != 0) {
            
            IWProfileSecondViewController *vc = [[IWProfileSecondViewController alloc] init];
            vc.title = NSLocalizedString(titleArray[indexPath.row], nil);
            vc.index = indexPath;
            [self.navigationController pushViewController:vc animated:YES];
            
        }
        
    }
    
    if (indexPath.section == 1) {
        NSArray *titleArray = @[@"职业",@"身份证",@"婚姻状况",@"文化程度"];
        
        if (indexPath.row != 1) {
       
            IWProfileSecondViewController *vc = [[IWProfileSecondViewController alloc] init];
            vc.title = NSLocalizedString(titleArray[indexPath.row], nil);
            vc.index = indexPath;

            [self.navigationController pushViewController:vc animated:YES];
            
        }
    }
    
    if (indexPath.section == 2) {
        NSArray *titleArray = @[@"社保",@"公积金编号",@"手机号码",@"邮箱"];
        
        if (indexPath.row == 0) {
            IWProfileSecondViewController *vc = [[IWProfileSecondViewController alloc] init];
            vc.title = NSLocalizedString(titleArray[indexPath.row], nil);
            vc.index = indexPath;

            [self.navigationController pushViewController:vc animated:YES];;
        }
    }
    
    
    
}
- (void)deselect
{
    
    [self.profileTableView deselectRowAtIndexPath:[self.profileTableView indexPathForSelectedRow] animated:YES];
    
}

#pragma mark - saveButton的点击方法
- (void)iconButtonClicked:(UIButton *)button
{
    NSLog(@"iconButtonClicked");
    
    
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"从手机相册选择", nil];
    [sheet showInView:self.view];
    
}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        //拍照
        [self takePhoto];
        
    }
    if(buttonIndex == 1){
        
        //从手机相册选择
        [self LocalPhoto];
    }
}

//拍照
- (void)takePhoto{
    //资源类型为照相机
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    //判断是否有相机
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]){
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        //设置拍照后的图片可被编辑
        picker.allowsEditing = YES;
        //资源类型为照相机
        picker.sourceType = sourceType;
        [self presentViewController:picker animated:NO completion:nil];
    }else {
        NSLog(@"该设备无摄像头");
    }
}

//从手机相册选择
- (void)LocalPhoto{
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    //资源类型为图片库
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    //设置选择后的图片可被编辑
    picker.allowsEditing = YES;
    [self presentViewController:picker animated:NO completion:nil];
    
}

#pragma Delegate method UIImagePickerControllerDelegate
//图像选取器的委托方法，选完图片后回调该方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    //当图片不为空时显示图片并保存图片
    if (image != nil) {
        //图片显示在界面上
        [iconButton setImage:image forState:UIControlStateNormal];
        
        imageData = UIImageJPEGRepresentation(image, 1.0);
        
    }
    //关闭相册界面
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    //保存头像
//    [self saveUsersIcon];
}


- (void)saveButtonClicked:(UIButton *)button
{
    NSLog(@"saveButtonClicked");
    
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
