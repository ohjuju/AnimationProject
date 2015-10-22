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
@property (nonatomic, strong) UILabel *testLabel3;
@property (nonatomic, strong) UILabel *testLabel4;

@property (nonatomic, strong) CAGradientLayer *gradient;
@property (nonatomic, strong) UIView *gradientView;

@property (nonatomic, strong) UIView *animationView;
@property (nonatomic, strong) UIView *stopView;

@property (nonatomic, strong) UIPanGestureRecognizer *recognizer;

@property (nonatomic, assign) CGFloat gestureMinimumTranslation;

@end

@implementation GenViewController

@synthesize startBtn;
@synthesize stopBtn;
@synthesize testLabel;
@synthesize testLabel1;
@synthesize testLabel2;
@synthesize testLabel3;
@synthesize testLabel4;

@synthesize gradient;
@synthesize gradientView;
@synthesize animationView;
@synthesize stopView;

@synthesize recognizer;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor grayColor]];
    
    self.navigationController.navigationBar.translucent = NO;
    
    self.title = @"BigSchedule";
    
    _testView = [UIView new];
    _testView.backgroundColor = [UIColor whiteColor];
    _testView.alpha = 1.0f;
    
    self.gestureMinimumTranslation = 20.0;
    
    //btn
    startBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [startBtn setTitle:@"Start" forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(start:) forControlEvents:UIControlEventTouchUpInside];
    [startBtn setBackgroundColor:[UIColor grayColor]];
    [_testView addSubview:startBtn];
    [startBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_testView).offset(10);
        make.left.equalTo(_testView).offset(10);
        make.size.mas_equalTo(CGSizeMake(150, 50));
    }];
    
    stopBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [stopBtn setTitle:@"Stop" forState:UIControlStateNormal];
    [stopBtn addTarget:self action:@selector(stop:) forControlEvents:UIControlEventTouchUpInside];
    [stopBtn setBackgroundColor:[UIColor grayColor]];
    [_testView addSubview:stopBtn];
    [stopBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_testView).offset(10);
        make.right.equalTo(_testView).offset(-10);
        make.size.mas_equalTo(CGSizeMake(150, 50));
    }];
    
    [self.view addSubview:_testView];
    [self.view bringSubviewToFront:_testView];
    [_testView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width, 70));
    }];
    
    [self initStartView];
    [self initStopView];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 1)];
    lineView.backgroundColor = [UIColor grayColor];
    _tableView.tableHeaderView = lineView;
    
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(animationView.mas_bottom);
        make.left.and.right.and.bottom.equalTo(self.view);
    }];
    
    recognizer = [UIPanGestureRecognizer new];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initStartView {
    animationView = [UIView new];
    animationView.backgroundColor = [UIColor whiteColor];
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 1)];
    topView.backgroundColor = [UIColor grayColor];
    [animationView addSubview:topView];
    
    testLabel = [UILabel new];
    testLabel.backgroundColor = [UIColor whiteColor];
    testLabel.text = @"testttttttttttttttttttt";
    testLabel.textAlignment = NSTextAlignmentCenter;
    testLabel.hidden = YES;
    [animationView addSubview:testLabel];
    [testLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(animationView);
        make.bottom.equalTo(animationView);
        make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width, 50));
    }];
    testLabel1 = [UILabel new];
    testLabel1.backgroundColor = [UIColor whiteColor];
    testLabel1.text = @"testttttttttttttttttttt";
    testLabel1.textAlignment = NSTextAlignmentCenter;
    testLabel1.hidden = YES;
    [animationView addSubview:testLabel1];
    [testLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(animationView);
        make.bottom.equalTo(animationView).offset(-50);
        make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width, 50));
    }];
    testLabel2 = [UILabel new];
    testLabel2.backgroundColor = [UIColor whiteColor];
    testLabel2.text = @"testttttttttttttttttttt";
    testLabel2.textAlignment = NSTextAlignmentCenter;
    testLabel2.hidden = YES;
    [animationView addSubview:testLabel2];
    [testLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(animationView);
        make.bottom.equalTo(animationView).offset(-100);
        make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width, 50));
    }];
    
    testLabel.alpha = 0.0f;
    testLabel1.alpha = 0.0f;
    testLabel2.alpha = 0.0f;
    
    [self.view addSubview:animationView];
    [animationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_testView.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width, 0));
    }];
}

- (void)initStopView {
    stopView = [UIView new];
    stopView.backgroundColor = [UIColor whiteColor];
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 1)];
    topView.backgroundColor = [UIColor grayColor];
    [stopView addSubview:topView];
    
    testLabel3 = [UILabel new];
    testLabel3.backgroundColor = [UIColor whiteColor];
    testLabel3.text = @"testttttttttttttttttttt11";
    testLabel3.textAlignment = NSTextAlignmentCenter;
    testLabel3.hidden = YES;
    [stopView addSubview:testLabel3];
    [testLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(animationView);
        make.bottom.equalTo(animationView);
        make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width, 50));
    }];
    testLabel4 = [UILabel new];
    testLabel4.backgroundColor = [UIColor whiteColor];
    testLabel4.text = @"testttttttttttttttttttt11";
    testLabel4.textAlignment = NSTextAlignmentCenter;
    testLabel4.hidden = YES;
    [stopView addSubview:testLabel4];
    [testLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(animationView);
        make.bottom.equalTo(animationView).offset(-50);
        make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width, 50));
    }];
    
    testLabel3.alpha = 0.0f;
    testLabel4.alpha = 0.0f;
    
    [self.view addSubview:stopView];
    [stopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_testView.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width, 0));
    }];
}

#pragma mark - gesture
- (void)handlePanRecognizer:(UIPanGestureRecognizer *)pan {
    CGPoint translation = [pan translationInView:_tableView];
//    NSLog(@"%f,%f",translation.x,translation.y);
//    CGFloat animationHeight = animationView.bounds.size.height - fabs(translation.y);
//    NSLog(@"animation height is : %f",animationHeight);
//    if (translation.y < 0 && animationHeight > 0) {
//        [animationView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(_testView.mas_bottom);
//            make.height.mas_equalTo(animationHeight);
//        }];
//    }
    if (fabs(translation.y) > self.gestureMinimumTranslation)
    {
        BOOL gestureVertical = NO;
        if (translation.x ==0.0) {
            gestureVertical = YES;
        } else {
            gestureVertical = (fabs(translation.y / translation.x) >5.0);
        }
        if (gestureVertical)
        {
            if (translation.y >0.0) {
                //down
            }else {
                //up
                CGFloat animationViewHeight = animationView.bounds.size.height - fabs(translation.y);
                CGFloat currentAnimationViewHeight = (animationViewHeight<0)?0:animationViewHeight;
                NSLog(@"currentAnimationViewHeight is :%f",currentAnimationViewHeight);
                [animationView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(_testView.mas_bottom);
                    make.height.mas_equalTo(currentAnimationViewHeight);
                }];
            }
        }
    }
}

#pragma mark - tableview delegate and datasource
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    if (scrollView == self.tableView && scrollView.contentOffset.x == 0) {
//        CGFloat y = scrollView.contentOffset.y;
//        static CGFloat previousOffsetY = 0;
//        if (self.animationView.bounds.size.height > 0) {
//            [self.tableView setScrollEnabled:NO];
//            //scroll down
//            if (y > 0) {
//                if (self.animationView.bounds.size.height <= 0) {
//                    return;
//                }
//                CGFloat offset = y - previousOffsetY;
////                CGFloat bottomY = self.animationView.bounds.origin.y + self.animationView.bounds.size.height - fabs(y - previousOffsetY);
////                bottomY = bottomY >= 0 ? bottomY : 0;
//                
////                CGFloat height = bottomY - self.animationView.bounds.origin.y;
//                CGFloat height = self.animationView.bounds.size.height - offset;
//                
//                if (height >0 ) {
//                    [self.animationView mas_updateConstraints:^(MASConstraintMaker *make) {
//                        make.top.equalTo(_testView.mas_bottom);
//                        make.height.mas_equalTo(height);
//                    }];
//                }
//                previousOffsetY = y;
//                //                if (self.animationView.bounds.origin.y + self.animationView.bounds.size.height <= 0) {
//                //                    return;
//                //                }
//                //                CGFloat bottomY = self.animationView.bounds.origin.y + self.animationView.bounds.size.height - fabs(y - previousOffsetY);
//                //                bottomY = bottomY >= 0 ? bottomY : 0;
//                //                CGFloat height = bottomY - self.animationView.bounds.origin.y;
//                //                [self.animationView mas_updateConstraints:^(MASConstraintMaker *make) {
//                //                    make.top.equalTo(_testView.mas_bottom);
//                //                    make.height.mas_equalTo(height);
//                //                }];
//                //                previousOffsetY = y;
//                //                // 如果一直不松手滑动，重复向上向下滑动时，如果没有设置还原为0，则会出现马上到顶的情况。
//                //                if (previousOffsetY >= height) {
//                //                    previousOffsetY = 0;
//                //                }
//            }
//            
//        }
//        
//    }
//    
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.textLabel.text = @"test";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark - blur
- (void) insertTransparentGradient {
    gradientView = [[UIView alloc] init];
//    gradientView.backgroundColor = [UIColor whiteColor];
    gradient = [CAGradientLayer layer];
    CGFloat screenWidth  =[[UIScreen mainScreen] bounds].size.width;
    gradient.frame = CGRectMake(0, 0, screenWidth,50);
    gradient.colors = [NSArray arrayWithObjects:
                       (id)[[UIColor colorWithRed:255/255 green:255/255 blue:255/255  alpha:1.0] CGColor],
                       (id)[[UIColor colorWithRed:255/255 green:255/255 blue:255/255  alpha:0.3] CGColor], nil];
    gradient.startPoint = CGPointMake(0.5, 0.0); // default; bottom of the view
    gradient.endPoint = CGPointMake(0.5, 1.0);   // default; top of the view
    [gradientView.layer insertSublayer:gradient atIndex:0];
    [self.view addSubview:gradientView];
    [self.view bringSubviewToFront:gradientView];
    [gradientView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.and.bottom.equalTo(animationView);
    }];
}

#pragma mark - button event
- (void)start:(UIButton *)btn {
    [UIView animateWithDuration:0.2f animations:^{
        [animationView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_testView.mas_bottom);
            make.height.mas_equalTo(150);
        }];
        startBtn.backgroundColor = [UIColor clearColor];
        stopBtn.backgroundColor = [UIColor grayColor];
        
        testLabel.hidden = NO;
        testLabel1.hidden = NO;
        testLabel2.hidden = NO;
        testLabel.alpha = 1.0f;
        testLabel1.alpha = 1.0f;
        testLabel2.alpha = 1.0f;
        
        [_testView layoutIfNeeded];
        [animationView layoutIfNeeded];
        [self.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
//        testLabel.hidden = NO;
        if (animationView.bounds.size.height > 0) {
            [_tableView setScrollEnabled:NO];
        }else {
            [_tableView setScrollEnabled:YES];
        }
        [_tableView addGestureRecognizer:recognizer];
        [recognizer addTarget:self action:@selector(handlePanRecognizer:)];
    }];
}

- (void)stop:(UIButton *)btn {
    [UIView animateWithDuration:1.0f animations:^{
        [animationView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(_testView.bounds.size.height);
            make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width, 0));
        }];
        startBtn.backgroundColor = [UIColor grayColor];
        stopBtn.backgroundColor = [UIColor clearColor];
        
        testLabel.alpha = 0.0f;
        testLabel1.alpha = 0.0f;
        testLabel2.alpha = 0.0f;
        gradientView.alpha = 0.0f;
        
        [_testView layoutIfNeeded];
        [animationView layoutIfNeeded];
        [testLabel layoutIfNeeded];
        [testLabel1 layoutIfNeeded];
        [testLabel2 layoutIfNeeded];
        
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        [gradientView removeFromSuperview];
        
        if (animationView.bounds.size.height > 0) {
            [_tableView setScrollEnabled:NO];
        }else {
            [_tableView setScrollEnabled:YES];
        }
        
        [_tableView removeGestureRecognizer:recognizer];
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
