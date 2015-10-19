//
//  GenViewController.m
//  AnimationPorject
//
//  Created by 区慧驹 on 15/10/18.
//  Copyright © 2015年 区慧驹. All rights reserved.
//

#import "GenViewController.h"

@interface GenViewController ()

@property (nonatomic, strong) UIView *testView;
@property (nonatomic, strong) UIButton *startBtn;
@property (nonatomic, strong) UILabel *testLabel;

@end

@implementation GenViewController

@synthesize startBtn;
@synthesize testLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    _testView = [UIView new];
    _testView.backgroundColor = [UIColor yellowColor];
    
    //btn
    startBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [startBtn setTitle:@"Start" forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(start:) forControlEvents:UIControlEventTouchUpInside];
    [startBtn setBackgroundColor:[UIColor redColor]];
    [_testView addSubview:startBtn];
    [startBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_testView).offset(10);
        make.left.equalTo(_testView).offset(10);
        make.size.mas_equalTo(CGSizeMake(100, 50));
    }];
    
    testLabel = [UILabel new];
    testLabel.text = @"test";
    testLabel.textAlignment = NSTextAlignmentCenter;
    testLabel.hidden = YES;
    [_testView addSubview:testLabel];
    [testLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_testView);
        make.top.equalTo(_testView).offset(200);
        make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width, 50));
    }];
    
    [self.view addSubview:_testView];
    [_testView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(50);
        make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width, 200));
    }];
    
    UISwipeGestureRecognizer *recognizer;
    
    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionUp)];
    [[self view] addGestureRecognizer:recognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - button event
- (void)start:(UIButton *)btn {

    [UIView animateWithDuration:0.5f animations:^{
        [_testView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.centerX.equalTo(self.view);
//            make.top.equalTo(self.view).offset(50);
//            make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width, 300));
            make.height.mas_equalTo(300);
        }];
        startBtn.backgroundColor = [UIColor clearColor];
        [_testView layoutIfNeeded];
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        testLabel.hidden = NO;
    }];

}

-(void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer {
    [UIView animateWithDuration:1.0f animations:^{
        [_testView mas_updateConstraints:^(MASConstraintMaker *make) {
            //        make.centerX.equalTo(self.view);
            //        make.top.equalTo(self.view).offset(50);
            make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width, 200));
        }];
        startBtn.backgroundColor = [UIColor redColor];
        testLabel.hidden = YES;
        [_testView layoutIfNeeded];
        [self.view layoutIfNeeded];
    }];
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
