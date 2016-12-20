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

@property (nonatomic, strong) NSMutableArray *titleArray;
@property (nonatomic, weak) UIButton *saveButton;
@property (nonatomic, strong) IMJIETagFrame *tagViewFrame;




@end

@implementation IWProfileSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorRGBA(246, 246, 246, 1);

    //初始化数据
    [self initData];

    //创建标签视图
    [self createUI];
    

    //懒加载
    [self saveButton];
    
}

- (void)initData
{
    self.titleArray = [NSMutableArray arrayWithCapacity:0];
    NSArray *array = @[@"code4app",@"轻音少女",@"花季少女",@"我们仍未知道那天所看见的花的名字",@"华语",@"花有重开日",@"空之境界"];
    [self.titleArray addObjectsFromArray:array];
    
    
}

- (void)createUI{
    IMJIETagFrame *frame = [[IMJIETagFrame alloc] init];
    frame.tagsMinPadding = 4;
    frame.tagsMargin = 10;
    frame.tagsLineSpacing = 10;
    frame.tagsArray = self.titleArray;
    self.tagViewFrame = frame;
    
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
    
    
}

#pragma mark - 懒加载控件

-(UIButton *)saveButton{
    if (_saveButton == nil) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor=[UIColor clearColor];
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:@"保存" forState:UIControlStateNormal];
        [self.view addSubview:button];
        _saveButton=button;
    }
    return _saveButton;
}
//点击事件
-(void)buttonClicked:(UIButton *)button{
}

#pragma mark 选中
-(void)IMJIETagView:(NSArray *)tagArray{
    
    NSLog(@"%@",tagArray);
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
