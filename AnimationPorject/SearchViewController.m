//
//  SearchViewController.m
//  AnimationPorject
//
//  Created by OKAR OU (EUCD-EUC-ISD-OOCLL/ZHA) on 10/22/15.
//  Copyright © 2015 区慧驹. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@property (nonatomic, strong) UIButton *lineBtn;
@property (nonatomic, strong) UIButton *vesselBtn;

@property (nonatomic, strong) UIView *lineDynamicView;
@property (nonatomic, strong) UIView *vesselDynamicView;

@end

@implementation SearchViewController

@synthesize lineBtn;
@synthesize vesselBtn;

@synthesize lineDynamicView;
@synthesize vesselDynamicView;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"BigSchedule";
    
    [self initTopView];
    [self initDynamicViewByDefault];
    [self initTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - initView

- (void)initTopView {
    _topView = [UIView new];
    _topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_topView];
    [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(70);
    }];
    //lineBtn
    lineBtn = [UIButton buttonWithType: UIButtonTypeSystem];
    [lineBtn setTitle:@"Line" forState:UIControlStateNormal];
    [lineBtn setBackgroundColor:[UIColor whiteColor]];
    [lineBtn setTitleColor:[UIColor colorWithRed:102.0/255.0 green:161.0/255.0 blue:115.0/255.0 alpha:1.0f] forState:UIControlStateNormal];
    
    [lineBtn addTarget:self action:@selector(lineBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_topView addSubview:lineBtn];
    [lineBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_topView).offset(10);
        make.left.equalTo(_topView).offset(10);
        make.size.mas_equalTo(CGSizeMake(150, 50));
    }];
    
    //vesselBtn
    vesselBtn = [UIButton buttonWithType: UIButtonTypeSystem];
    [vesselBtn setTitle:@"Vessel" forState:UIControlStateNormal];
    [vesselBtn setBackgroundColor:[UIColor whiteColor]];
    [vesselBtn setTitleColor:[UIColor colorWithRed:102.0/255.0 green:161.0/255.0 blue:115.0/255.0 alpha:1.0f] forState:UIControlStateNormal];
    [vesselBtn addTarget:self action:@selector(vesselBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_topView addSubview:vesselBtn];
    [vesselBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_topView).offset(10);
        make.right.equalTo(_topView).offset(-10);
        make.size.mas_equalTo(CGSizeMake(150, 50));
    }];
}

- (void)initDynamicViewByDefault {
    _dynamicView = [UIView new];
    [self.view addSubview:_dynamicView];
    [_dynamicView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_topView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(0);
    }];
    [self initLineDynamicView];
    [self initVesselDynamicView];
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = [UIColor blackColor];
    [_dynamicView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.left.right.bottom.equalTo(_dynamicView);
    }];
    
    lineDynamicView.hidden = YES;
    vesselDynamicView.hidden = YES;
}

- (void)initLineDynamicView {
    lineDynamicView = [UIView new];
    [_dynamicView addSubview:lineDynamicView];
    [lineDynamicView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(_dynamicView);
        make.bottom.equalTo(_dynamicView).offset(1);
    }];
    //test
    UITextField *t1 = [UITextField new];
    t1.placeholder = @"line";
    t1.borderStyle = UITextBorderStyleRoundedRect;
    [lineDynamicView addSubview:t1];
    [t1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(lineDynamicView).offset(10);
        make.right.equalTo(lineDynamicView).offset(-10);
        make.height.mas_equalTo(50);
    }];
    UIButton *b1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [b1 setTitle:@"Line" forState:UIControlStateNormal];
    [b1 setBackgroundColor:[UIColor greenColor]];
    [lineDynamicView addSubview:b1];
    [b1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(t1.mas_bottom).offset(10);
        make.left.equalTo(lineDynamicView).offset(10);
        make.right.equalTo(lineDynamicView).offset(-10);
        make.height.mas_equalTo(50);
    }];
}

- (void)initVesselDynamicView {
    vesselDynamicView = [UIView new];
    [_dynamicView addSubview:vesselDynamicView];
    [vesselDynamicView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(_dynamicView);
        make.bottom.equalTo(_dynamicView).offset(1);
    }];
    //test
    UITextField *t2 = [UITextField new];
    t2.placeholder = @"vessel";
    t2.borderStyle = UITextBorderStyleRoundedRect;
    [vesselDynamicView addSubview:t2];
    [t2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(vesselDynamicView).offset(10);
        make.right.equalTo(vesselDynamicView).offset(-10);
        make.height.mas_equalTo(50);
    }];
    UIButton *b2 = [UIButton buttonWithType:UIButtonTypeSystem];
    [b2 setTitle:@"Vessel" forState:UIControlStateNormal];
    [b2 setBackgroundColor:[UIColor greenColor]];
    [vesselDynamicView addSubview:b2];
    [b2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(t2.mas_bottom).offset(10);
        make.left.equalTo(vesselDynamicView).offset(10);
        make.right.equalTo(vesselDynamicView).offset(-10);
        make.height.mas_equalTo(50);
    }];
}

- (void)initTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_dynamicView.mas_bottom);
        make.left.right.bottom.equalTo(self.view);
    }];
}

#pragma mark - view operation
- (void)increaseDynamicViewHeight {
    [_dynamicView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_topView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(150);
    }];
}

- (void)decreseDynamicViewHeight {
    [_dynamicView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_topView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(0);
    }];
}

#pragma mark - button event
- (void)vesselBtnClick:(UIButton *)btn {
    NSLog(@"vesselBtnClick");
    [UIView animateWithDuration:0.5f animations:^{
        [self increaseDynamicViewHeight];
        lineDynamicView.alpha = 0.0f;
        vesselDynamicView.alpha = 1.0f;
        [vesselBtn setBackgroundColor:[UIColor colorWithRed:102.0/255.0 green:161.0/255.0 blue:115.0/255.0 alpha:1.0f]];
        [vesselBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [lineBtn setBackgroundColor:[UIColor whiteColor]];
        [lineBtn setTitleColor:[UIColor colorWithRed:102.0/255.0 green:161.0/255.0 blue:115.0/255.0 alpha:1.0f] forState:UIControlStateNormal];
        [self.view layoutIfNeeded];
        [_dynamicView layoutIfNeeded];
    } completion:^(BOOL finished) {
        lineDynamicView.hidden = YES;
        vesselDynamicView.hidden = NO;
    }];
}

- (void)lineBtnClick:(UIButton *)btn {
    NSLog(@"lineBtnClick");
    [UIView animateWithDuration:0.5f animations:^{
        [self increaseDynamicViewHeight];
        lineDynamicView.alpha = 1.0f;
        vesselDynamicView.alpha = 0.0f;
        [lineBtn setBackgroundColor:[UIColor colorWithRed:102.0/255.0 green:161.0/255.0 blue:115.0/255.0 alpha:1.0f]];
        [lineBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [vesselBtn setBackgroundColor:[UIColor whiteColor]];
        [vesselBtn setTitleColor:[UIColor colorWithRed:102.0/255.0 green:161.0/255.0 blue:115.0/255.0 alpha:1.0f] forState:UIControlStateNormal];
        [self.view layoutIfNeeded];
        [_dynamicView layoutIfNeeded];
    } completion:^(BOOL finished) {
        lineDynamicView.hidden = NO;
        vesselDynamicView.hidden = YES;
    }];
}

#pragma mark - tableview datasource delegate and datasource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"test";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
