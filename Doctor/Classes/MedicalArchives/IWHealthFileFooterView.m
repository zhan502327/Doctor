//
//  IWHealthFileFooterView.m
//  Doctor
//
//  Created by 深水区 on 16/12/18.
//
//

#import "IWHealthFileFooterView.h"

#define buttonWeath (self.frame.size.width / 3)
#define buttonHeight self.frame.size.height


@implementation IWHealthFileFooterView


- (instancetype)init
{
    
    self = [super init];
    if (self) {
        
        [self initSubViews];
        
        
    }
    return self;
}

- (void)initSubViews{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
    [self addSubview:view];
    
    
    NSArray *imageArray = @[@"jkcs_btn_normal",@"baogao_btn_normal",@"xx_btn_normal"];
    NSArray *imageHLArray = @[@"jkcs_btn_press",@"baogao_btn_press",@"xx_btn_press"];

    NSArray *nameArray = @[@"健康监测",@"病例/报告",@"医疗信息"];
    
    for (int i = 0; i<3; i++) {
        
        UIButton *button = [[UIButton alloc] init];
        button.backgroundColor = [UIColor whiteColor];
        button.frame = CGRectMake(buttonWeath * i, 0, buttonWeath, buttonHeight);
        [button setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:imageHLArray[i]] forState:UIControlStateHighlighted];
        [button setTitle:nameArray[i] forState:UIControlStateNormal];
        
        
        [view addSubview:button];

        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}



@end
