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

@property (nonatomic, strong) UIPanGestureRecognizer *recognizer;
@end

@implementation SearchViewController

@synthesize lineBtn;
@synthesize vesselBtn;

@synthesize lineDynamicView;
@synthesize vesselDynamicView;

@synthesize recognizer;

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
    [self.view bringSubviewToFront:_topView];
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
    _dynamicView.alpha = 1.0f;
    [self.view addSubview:_dynamicView];
    [_dynamicView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_topView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(0);
    }];
    [self initLineDynamicView];
    [self initVesselDynamicView];
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = [UIColor lightGrayColor];
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
    lineDynamicView.alpha = 1.0f;
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
    vesselDynamicView.alpha = 1.0f;
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

#pragma mark - Gesture
- (void)initGestureRecognizer {
    //addgensure
    recognizer = [UIPanGestureRecognizer new];
    [_tableView addGestureRecognizer:recognizer];
    [recognizer addTarget:self action:@selector(tableViewDidPan:)];
}

- (void)removeGestureRecognizer {
    for (UIPanGestureRecognizer *rec in _tableView.gestureRecognizers) {
        if ([rec isEqual:recognizer]) {
            [_tableView removeGestureRecognizer:rec];
        }
    }
}

- (void)tableViewDidPan:(UIPanGestureRecognizer *)rec {
    
    CGFloat const gestureMinimumTranslation = 10.0f;
    
    CGPoint translation = [rec translationInView:_tableView];
    if (fabs(translation.y) > gestureMinimumTranslation)
    {
        if (translation.y >0.0) {
            //down
        }else {
            //up
            //                CGFloat animationViewHeight = animationView.bounds.size.height - fabs(translation.y);
            //                CGFloat currentAnimationViewHeight = (animationViewHeight<0)?0:animationViewHeight;
            //                NSLog(@"currentAnimationViewHeight is :%f",currentAnimationViewHeight);
            //                [animationView mas_updateConstraints:^(MASConstraintMaker *make) {
            //                    make.top.equalTo(_testView.mas_bottom);
            //                    make.height.mas_equalTo(currentAnimationViewHeight);
            //                }];
            
            //                CGFloat dynamicViewOrginY = _dynamicView.bounds.origin.y - fabs(translation.y);
            
            //if user upward > gestureMinimumTranslation,_dynamicView will hidden.
            if (fabs(translation.y) > gestureMinimumTranslation && rec.state == UIGestureRecognizerStateEnded) {
                [UIView animateWithDuration:0.2f animations:^{
                    [self decreseDynamicViewHeight];
                    _dynamicView.alpha = 0.0f;
                    lineDynamicView.alpha = 0.0f;
                    vesselDynamicView.alpha = 0.0f;
                    [lineBtn setBackgroundColor:[UIColor whiteColor]];
                    [lineBtn setTitleColor:[UIColor colorWithRed:102.0/255.0 green:161.0/255.0 blue:115.0/255.0 alpha:1.0f] forState:UIControlStateNormal];
                    [vesselBtn setBackgroundColor:[UIColor whiteColor]];
                    [vesselBtn setTitleColor:[UIColor colorWithRed:102.0/255.0 green:161.0/255.0 blue:115.0/255.0 alpha:1.0f] forState:UIControlStateNormal];
                    
                    [self.view layoutIfNeeded];
                    [_dynamicView layoutIfNeeded];
                    [lineDynamicView layoutIfNeeded];
                    [vesselDynamicView layoutIfNeeded];
                } completion:^(BOOL finished) {
                    [_dynamicView setHidden:YES];
                    [self removeGestureRecognizer];
                    [_tableView setScrollEnabled:YES];
                    lineBtn.enabled = YES;
                    vesselBtn.enabled = YES;
                }];
            } else if (rec.state == UIGestureRecognizerStateBegan || rec.state == UIGestureRecognizerStateChanged) {
                
                //                [_tableView setScrollEnabled:YES];
                
                //when pan, what we need do:
                //  1.change dynamicView orgin
                //  2.add a blur view
                //  3.when translation.y == dynamic.height, blurView dismiss
                NSLog(@"orgin y is : %f",fabs(translation.y));
                //                if (translation.y <= _dynamicView.bounds.size.height) {
                //                    [_dynamicView mas_updateConstraints:^(MASConstraintMaker *make) {
                //                        make.top.equalTo(_topView).offset(translation.y);
                //                    }];
                //                    _dynamicView.alpha = 0.0f;
                //                }else {
                //                    [_dynamicView mas_updateConstraints:^(MASConstraintMaker *make) {
                //                        make.top.equalTo(_topView).offset(_dynamicView.bounds.size.height);
                //                    }];
                //                    _dynamicView.alpha = 0.0f;
                //                }
            }
        }
    }
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
    
    vesselBtn.enabled = NO;
    lineBtn.enabled = YES;
    
    _dynamicView.hidden = NO;
    lineDynamicView.hidden = YES;
    vesselDynamicView.hidden = NO;
    [UIView animateWithDuration:0.5f animations:^{
        [self increaseDynamicViewHeight];
        lineDynamicView.alpha = 0.0f;
        vesselDynamicView.alpha = 1.0f;
        _dynamicView.alpha = 1.0f;
        [vesselBtn setBackgroundColor:[UIColor colorWithRed:102.0/255.0 green:161.0/255.0 blue:115.0/255.0 alpha:1.0f]];
        [vesselBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [lineBtn setBackgroundColor:[UIColor whiteColor]];
        [lineBtn setTitleColor:[UIColor colorWithRed:102.0/255.0 green:161.0/255.0 blue:115.0/255.0 alpha:1.0f] forState:UIControlStateNormal];
        [self.view layoutIfNeeded];
        [_dynamicView layoutIfNeeded];
        [lineDynamicView layoutIfNeeded];
        [vesselDynamicView layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self removeGestureRecognizer];
        [self initGestureRecognizer];
        //            [_tableView setScrollEnabled:NO];
    }];
}

- (void)lineBtnClick:(UIButton *)btn {
    NSLog(@"lineBtnClick");
    
    vesselBtn.enabled = YES;
    lineBtn.enabled = NO;
    
    _dynamicView.hidden = NO;
    lineDynamicView.hidden = NO;
    vesselDynamicView.hidden = YES;
    [UIView animateWithDuration:0.5f animations:^{
        [self increaseDynamicViewHeight];
        lineDynamicView.alpha = 1.0f;
        vesselDynamicView.alpha = 0.0f;
        _dynamicView.alpha = 1.0f;
        [lineBtn setBackgroundColor:[UIColor colorWithRed:102.0/255.0 green:161.0/255.0 blue:115.0/255.0 alpha:1.0f]];
        [lineBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [vesselBtn setBackgroundColor:[UIColor whiteColor]];
        [vesselBtn setTitleColor:[UIColor colorWithRed:102.0/255.0 green:161.0/255.0 blue:115.0/255.0 alpha:1.0f] forState:UIControlStateNormal];
        [self.view layoutIfNeeded];
        [_dynamicView layoutIfNeeded];
        [lineDynamicView layoutIfNeeded];
        [vesselDynamicView layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self removeGestureRecognizer];
        [self initGestureRecognizer];
        //            [_tableView setScrollEnabled:NO];
    }];
    
}

#pragma mark - tableview datasource delegate and datasource
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == _tableView && _dynamicView.bounds.size.height > 0) {
        if (!recognizer) {
            [self initGestureRecognizer];
        }
        //        [_tableView setScrollEnabled:NO];
    }
}

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
    cell.textLabel.text = [NSString stringWithFormat:@"test %ld",(long)indexPath.row];
    cell.showsReorderControl = YES;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//    return YES;
//}
//
//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView setEditing:YES animated:YES];
//    return UITableViewCellEditingStyleDelete;
//}
//
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView setEditing:NO animated:YES];
//}
//
//- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
//    return YES;
//}
//
//- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
//    return NO;
//}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
