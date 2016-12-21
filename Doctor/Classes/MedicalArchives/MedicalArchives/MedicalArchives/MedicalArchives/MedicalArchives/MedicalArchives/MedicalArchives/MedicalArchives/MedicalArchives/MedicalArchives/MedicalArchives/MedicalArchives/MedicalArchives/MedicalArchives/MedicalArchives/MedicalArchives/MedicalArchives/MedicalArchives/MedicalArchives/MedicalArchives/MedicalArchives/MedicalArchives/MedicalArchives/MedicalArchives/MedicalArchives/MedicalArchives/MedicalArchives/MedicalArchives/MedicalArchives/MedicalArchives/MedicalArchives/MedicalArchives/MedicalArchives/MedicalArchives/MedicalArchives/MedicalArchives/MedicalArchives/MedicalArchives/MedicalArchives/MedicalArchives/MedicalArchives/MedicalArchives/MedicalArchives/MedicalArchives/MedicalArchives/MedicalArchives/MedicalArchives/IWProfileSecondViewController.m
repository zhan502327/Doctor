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

@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) UIButton *saveButton;




@end

@implementation IWProfileSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorRGBA(246, 246, 246, 1);

    //初始化数据
    [self initData];

    //创建标签视图
    [self createUI];
    
    
    
    
    self.type = 1;
}

- (void)initData
{
    NSArray *array = @[@"code4app",@"轻音少女",@"花季少女",@"我们仍未知道那天所看见的花的名字",@"华语",@"花有重开日",@"空之境界"];

    self.titleArray = array;
    
}

- (void)createUI{
    IMJIETagFrame *frame = [[IMJIETagFrame alloc] init];
    frame.tagsMinPadding = 4;
    frame.tagsMargin = 10;
    frame.tagsLineSpacing = 10;
    frame.tagsArray = self.titleArray;
    
    IMJIETagView *tagView = [[IMJIETagView alloc] initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, frame.tagsHeight)];
    tagView.clickbool = YES;
    tagView.borderSize = 0.5;
    tagView.clickborderSize = 0.5;
    tagView.tagsFrame = frame;
    tagView.clickStart = 1;
//    tagView.clickString = @"华语";//单选  tagView.clickStart 为0
//    tagView.clickArray = @[@"误解向",@"我们仍未知道那天所看见的花的名字"];//多选 tagView.clickStart 为1
    tagView.delegate = self;
    [self.view addSubview:tagView];
    
    [self setupSaveBtnWithFrame:frame];
    
}

#pragma mark - 创建saveBtn
- (void)setupSaveBtnWithFrame:(IMJIETagFrame *)frame
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, frame.tagsHeight + 20, self.view.frame.size.width - 20, 40);
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
        
        NSLog(@"%@",self.titleArray[n]);
        
        

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
