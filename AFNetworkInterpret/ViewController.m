//
//  ViewController.m
//  AFNetworkInterpret
//
//  Created by Harley Huang on 1/5/2020.
//  Copyright © 2020 HarleyHuang. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()
@property(nonatomic, retain)UIButton *testBtn;
@end

@implementation ViewController
- (UIButton *)testBtn {
    if (!_testBtn) {
        _testBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 50, 100, 100, 60)];
        [_testBtn setTitle:@"测试" forState:UIControlStateNormal];
        _testBtn.backgroundColor = UIColor.purpleColor;
        [_testBtn addTarget:self action:@selector(afnetworkTextClickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _testBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (@available(iOS 13.0, *)) {
        self.view.backgroundColor = UIColor.systemGroupedBackgroundColor;
    } else {
        self.view.backgroundColor = UIColor.groupTableViewBackgroundColor;
    }
    
    [self.view addSubview:self.testBtn];
}


- (void) afnetworkTextClickAction:(UIButton *)sender {
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]init];
    [manager GET:@"http://localhost" parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}


@end
