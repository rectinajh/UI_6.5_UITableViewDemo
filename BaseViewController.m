//
//  BaseViewController.m
//  UI_6.5_class
//
//  Created by rimi on 15/6/5.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

-(void)dealloc
{//ARC中不能调super方法
    NSLog(@"%s",__func__);
}

- (void)initializeUserInterface
{
    //创建一个label用于显示标题
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:self.view.bounds];
    
    //设置文本
    titleLabel.text = self.title;
    //设置字体
    titleLabel.font = [UIFont systemFontOfSize:67];
    //设置对齐方式
    titleLabel.textAlignment = NSTextAlignmentCenter;
    //添加到父视图
    [self.view addSubview:titleLabel];

}



- (instancetype)initWithTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        self.title = title;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initializeUserInterface];
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
