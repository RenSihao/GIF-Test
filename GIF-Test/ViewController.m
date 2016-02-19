//
//  ViewController.m
//  GIF-Test
//
//  Created by RenSihao on 16/2/19.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "ViewController.h"
#import "GifView.h"

/**
 注意 导入GifView.h 因为是采用MRC 所以需要设置 -fno-objc-arc
 GifView 使用完毕 需要在适当的时候 执行 stopGif 方法 否则会内存泄露
 */

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController () <UIScrollViewDelegate>


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    /********************** 下面是三种测试效果 ************************/
//    
//    //方式一：显示本地Gif图片
//    //将图片转为NSData数据
//    NSData *localData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"1" ofType:@"gif"]];
//    //创建一个第三方的View显示图片
//    GifView *dataView = [[GifView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_WIDTH / 16 * 9) data:localData];
//    [self.view addSubview:dataView];
//    
//    
//    //方式二：显示本地Gif图片
//    //得到图片的路径
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"2" ofType:@"gif"];
//    //创建一个第三方的View显示图片
//    GifView *dataView2 = [[GifView alloc] initWithFrame:CGRectMake(200, 300, 150, 100) filePath:path];
//    [self.view addSubview:dataView2];
//    
//    
//    //方式三：显示从网络获取的Gif图片
//    // 网络图片
//    NSData *urlData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://pic19.nipic.com/20120222/8072717_124734762000_2.gif"]];
//    //创建一个第三方的View显示图片
//    GifView *dataViewWeb = [[GifView alloc] initWithFrame:CGRectMake(20, 420, 280, 100) data:urlData];
//    [self.view addSubview:dataViewWeb];
    
    
    
    /*****************   三个GIF 滚动 *********************/
    
    //初始化scrollerView
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_WIDTH / 16 * 9)];
    
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.contentOffset = CGPointMake(0, 0);
    scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 3, SCREEN_WIDTH / 16 * 9);
    scrollView.showsHorizontalScrollIndicator = NO;
    
    //创建三个GIF并添加
    for (NSInteger i=0; i<3; i++)
    {
        NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%ld", i+1] ofType:@"gif"]];
        
        GifView *gifView = [[GifView alloc] initWithFrame:CGRectMake(i * SCREEN_WIDTH, 64, SCREEN_WIDTH, SCREEN_WIDTH / 16 * 9) data:data];
        
        [scrollView addSubview:gifView];
    }
    
    [self.view addSubview:scrollView];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
