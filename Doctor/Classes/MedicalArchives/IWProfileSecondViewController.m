//
//  IWProfileSecondViewController.m
//  Doctor
//
//  Created by 深水区 on 16/12/19.
//
//

#import "IWProfileSecondViewController.h"
#import "IMJIETagFrame.h"
#import "IMJIETagView.h"
@interface IWProfileSecondViewController ()<IMJIETagViewDelegate>

@property (nonatomic, strong) UIButton *saveButton;
@property (nonatomic, strong) UITextField *textField;

@end

@implementation IWProfileSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorRGBA(246, 246, 246, 1);

    
    /*
     "inquiry_user_info_name" = "姓名";
     "inquiry_user_info_relative" = "与本账户关系";
     "inquiry_user_info_gender" = "性别";
     "inquiry_user_info_community" = "社区";
     "inquiry_user_info_occupation" = "职业";
     "inquiry_user_info_education" = "文化程度";
     "inquiry_user_info_maritalStatus" = "婚姻状况";
     "inquiry_user_info_userCard" = "身份证";
     "inquiry_user_info_siStatus" = "社保";
     "inquiry_user_info_siPlace" = "所属区域";
     "inquiry_user_info_siCode" = "公积金编号";
     "inquiry_user_info_cellphone" = "手机号码";
     "inquiry_user_info_mail" = "邮箱";
     "inquiry_user_info_name_hint" = "请填真实姓名";
     "inquiry_user_info_no_hint" = "请填写身份证号";
     */
    
    if ([self.title isEqualToString: @"inquiry_user_info_relative"]) {
        NSArray *array = @[@"code4app",@"轻音少女",@"花季少女",@"我们仍未知道那天所看见的花的名字",@"华语",@"花有重开日",@"空之境界"];
        
        [self createTagViewWithTittleArray:array andType:0 andHiddenTextField:YES];
    
    }else
    {
        
    }
    

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    
    NSString *title = [NSString stringWithFormat:@"%@",NSLocalizedString(@"inquiry_user_info_relative", nil)];
    if ([self.title isEqualToString: title]) {
        NSArray *array = @[@"code4app",@"轻音少女",@"花季少女",@"我们仍未知道那天所看见的花的名字",@"华语",@"花有重开日",@"空之境界"];
        
        [self createTagViewWithTittleArray:array andType:0 andHiddenTextField:YES];
        
    }else
    {
        
    }

    
}

- (void)createTagViewWithTittleArray:(NSArray *)array andType:(int) type andHiddenTextField:(BOOL)hiddeTextField
{
    IMJIETagFrame *frame = [[IMJIETagFrame alloc] init];
    frame.tagsMinPadding = 4;
    frame.tagsMargin = 10;
    frame.tagsLineSpacing = 10;
    frame.tagsArray = array;
    
    IMJIETagView *tagView = [[IMJIETagView alloc] initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, frame.tagsHeight)];
    tagView.clickbool = YES;
    tagView.borderSize = 0.5;
    tagView.clickborderSize = 0.5;
    tagView.tagsFrame = frame;
    tagView.clickStart = type;
    //    tagView.clickString = @"华语";//单选  tagView.clickStart 为0
    //    tagView.clickArray = @[@"误解向",@"我们仍未知道那天所看见的花的名字"];//多选 tagView.clickStart 为1
    tagView.delegate = self;
    
    [self.view addSubview:tagView];
    
    if (hiddeTextField == YES) {
        [self setupSaveBtnWithTagViewHeight:frame.tagsHeight];

    }else{
        

        [self setupTextFieldAndSaveBurronWithTagViewHeight:frame.tagsHeight];

    }
    

    
}


- (void)setupSaveBtnWithTagViewHeight:(CGFloat)y
{
    UIView *bgview = [[UIView alloc] init];
    bgview.frame = CGRectMake(0, y + 20, self.view.frame.size.width, 130);
    [self.view addSubview:bgview];
    
    
    UITextField *textField = [[UITextField alloc]init];
    textField.frame = CGRectMake(10, 0, self.view.frame.size.width - 20, 40);
    textField.borderStyle =  UITextBorderStyleRoundedRect;
    textField.textAlignment = NSTextAlignmentLeft;
    textField.font = [UIFont systemFontOfSize:14];
    textField.backgroundColor = [UIColor whiteColor];
    textField.textColor = [UIColor grayColor];
    
    [bgview addSubview:textField];
    _textField = textField;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, _textField.frame.origin.y + 30, self.view.frame.size.width - 20, 40);
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"保存" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 10;
    
    NSArray *imageNameArray = @[@"t_btn_normal",@"t_btn_press"];
    for (int i = 0; i<2; i++) {
        // 加载图片
        UIImage *image = [UIImage imageNamed:imageNameArray[i]];
        // 设置端盖的值
        CGFloat top = image.size.height * 0.5;
        CGFloat left = image.size.width * 0.5;
        CGFloat bottom = image.size.height * 0.5;
        CGFloat right = image.size.width * 0.5;
        UIEdgeInsets edgeInsets = UIEdgeInsetsMake(top, left, bottom, right);
        // 拉伸图片
        UIImage *newImage = [image resizableImageWithCapInsets:edgeInsets];
        
        if (i == 0) {
            [button setBackgroundImage:newImage forState:UIControlStateNormal];
            
        }else
        {
            [button setBackgroundImage:newImage forState:UIControlStateHighlighted];
        }
    }
    
    [bgview addSubview:button];
    _saveButton=button;

    
    
    
}

- (void)setupTextFieldAndSaveBurronWithTagViewHeight:(CGFloat)y
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, y + 20, self.view.frame.size.width - 20, 40);
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"保存" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 10;
    
    NSArray *imageNameArray = @[@"t_btn_normal",@"t_btn_press"];
    for (int i = 0; i<2; i++) {
        // 加载图片
        UIImage *image = [UIImage imageNamed:imageNameArray[i]];
        // 设置端盖的值
        CGFloat top = image.size.height * 0.5;
        CGFloat left = image.size.width * 0.5;
        CGFloat bottom = image.size.height * 0.5;
        CGFloat right = image.size.width * 0.5;
        UIEdgeInsets edgeInsets = UIEdgeInsetsMake(top, left, bottom, right);
        // 拉伸图片
        UIImage *newImage = [image resizableImageWithCapInsets:edgeInsets];
        
        if (i == 0) {
            [button setBackgroundImage:newImage forState:UIControlStateNormal];
            
        }else
        {
            [button setBackgroundImage:newImage forState:UIControlStateHighlighted];
        }
    }
    
    [self.view addSubview:button];
    _saveButton=button;
    

}





//点击事件
-(void)buttonClicked:(UIButton *)button{
    NSLog(@"buttonClicked");
    
    
    
}




#pragma mark 选中
-(void)IMJIETagView:(NSArray *)tagArray{
    
    NSLog(@"%@",tagArray);
    
    for (int i = 0; i<tagArray.count; i++) {
        int n = [tagArray[i] intValue];
        
//        NSLog(@"%@",self.titleArray[n]);
        
        

    }
    
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
