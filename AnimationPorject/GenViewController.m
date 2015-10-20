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
@property (nonatomic, strong) UIButton *stopBtn;

@property (nonatomic, strong) UILabel *testLabel;
@property (nonatomic, strong) UILabel *testLabel1;
@property (nonatomic, strong) UILabel *testLabel2;

@end

@implementation GenViewController

@synthesize startBtn;
@synthesize stopBtn;
@synthesize testLabel;
@synthesize testLabel1;
@synthesize testLabel2;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor grayColor]];
    
    self.navigationController.navigationBar.translucent = NO;
    
    self.title = @"BigSchedule";
    
    _testView = [UIView new];
    _testView.backgroundColor = [UIColor yellowColor];
    
    //btn
    startBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [startBtn setTitle:@"Start" forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(start:) forControlEvents:UIControlEventTouchUpInside];
    [startBtn setBackgroundColor:[UIColor greenColor]];
    [_testView addSubview:startBtn];
    [startBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_testView).offset(10);
        make.left.equalTo(_testView).offset(10);
        make.size.mas_equalTo(CGSizeMake(100, 50));
    }];
    
    stopBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [stopBtn setTitle:@"Stop" forState:UIControlStateNormal];
    [stopBtn addTarget:self action:@selector(stop:) forControlEvents:UIControlEventTouchUpInside];
    [stopBtn setBackgroundColor:[UIColor greenColor]];
    [_testView addSubview:stopBtn];
    [stopBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_testView).offset(10);
        make.right.equalTo(_testView).offset(-10);
        make.size.mas_equalTo(CGSizeMake(100, 50));
    }];
    
    testLabel = [UILabel new];
    testLabel.text = @"testttttttttttttttttttt";
    testLabel.textAlignment = NSTextAlignmentCenter;
    testLabel.hidden = YES;
    testLabel.alpha = 1.0f;
    [_testView addSubview:testLabel];
    [testLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_testView);
        make.bottom.equalTo(_testView);
        make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width, 50));
    }];
    
    testLabel1 = [UILabel new];
    testLabel1.text = @"testttttttttttttttttttt1";
    testLabel1.textAlignment = NSTextAlignmentCenter;
    testLabel1.hidden = YES;
    testLabel1.alpha = 1.0f;
    [_testView addSubview:testLabel1];
    [testLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_testView);
        make.bottom.equalTo(testLabel);
        make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width, 50));
    }];
    
    testLabel2 = [UILabel new];
    testLabel2.text = @"testttttttttttttttttttt2";
    testLabel2.textAlignment = NSTextAlignmentCenter;
    testLabel2.hidden = YES;
    testLabel2.alpha = 1.0f;
    [_testView addSubview:testLabel2];
    [testLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_testView);
        make.bottom.equalTo(testLabel2);
        make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width, 50));
    }];
    
    [self.view addSubview:_testView];
    [_testView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width, 70));
    }];
    
    UISwipeGestureRecognizer *swipeRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [swipeRecognizer setDirection:(UISwipeGestureRecognizerDirectionUp)];
    [self.view addGestureRecognizer:swipeRecognizer];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - button event
- (void)start:(UIButton *)btn {
    [UIView animateWithDuration:0.3f animations:^{
        [_testView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(200);
        }];
        startBtn.backgroundColor = [UIColor clearColor];
        stopBtn.backgroundColor = [UIColor greenColor];
        testLabel.alpha = 1.0f;
        [_testView layoutIfNeeded];
        [self.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        testLabel.hidden = NO;
    }];
}

- (void)stop:(UIButton *)btn {
    [UIView animateWithDuration:0.3f animations:^{
        [_testView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width, 70));
        }];
        startBtn.backgroundColor = [UIColor greenColor];
        stopBtn.backgroundColor = [UIColor clearColor];
//        testLabel.hidden = YES;
        testLabel.alpha = 0.0f;
        [_testView layoutIfNeeded];
        [self.view layoutIfNeeded];
    }];
    
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:0.3f];
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
//    testLabel.hidden = YES;
//    [_testView layoutIfNeeded];
//    [self.view layoutIfNeeded];
//    [UIView commitAnimations];
}

#pragma mark - GestureRecognizer Events
-(void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer {
    [UIView animateWithDuration:0.3f animations:^{
        [_testView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width, 70));
        }];
        startBtn.backgroundColor = [UIColor greenColor];
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
