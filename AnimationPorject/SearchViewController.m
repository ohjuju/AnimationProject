//
//  SearchViewController.m
//  AnimationPorject
//
//  Created by OKAR OU (EUCD-EUC-ISD-OOCLL/ZHA) on 10/22/15.
//  Copyright © 2015 区慧驹. All rights reserved.
//

#import "SearchViewController.h"
#import "GradientViewController.h"

@interface SearchViewController ()

@property (nonatomic, strong) UIButton *lineBtn;
@property (nonatomic, strong) UIButton *vesselBtn;

@property (nonatomic, strong) UIView *lineDynamicView;
@property (nonatomic, strong) UIView *vesselDynamicView;

@property (nonatomic, strong) UIView *gradientView;

@property (nonatomic, strong) UIPanGestureRecognizer *recognizer;
@end

@implementation SearchViewController

@synthesize lineBtn;
@synthesize vesselBtn;

@synthesize lineDynamicView;
@synthesize vesselDynamicView;

@synthesize gradientView;

@synthesize recognizer;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"Demo";
    
    [self initTopView];
    [self initDynamicViewByDefault];
    [self initTableView];
    [self initGradientView];
    [gradientView setHidden:YES];
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
        make.size.mas_equalTo(CGSizeMake(150, 49));
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
        make.size.mas_equalTo(CGSizeMake(150, 49));
    }];
    
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = [UIColor lightGrayColor];
    [_topView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(0.5);
        make.left.right.bottom.equalTo(_topView);
    }];
}

- (void)initDynamicViewByDefault {
    _dynamicView = [UIView new];
    _dynamicView.alpha = 1.0f;
    _dynamicView.backgroundColor = [UIColor whiteColor];
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
        make.height.mas_equalTo(0.5);
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
        //        make.bottom.equalTo(_dynamicView).offset(1);
        make.height.mas_equalTo(150);
    }];
    //test
    UITextField *t1 = [UITextField new];
    [t1 setEnabled:NO];
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
    //    [b1 setBackgroundColor:[UIColor greenColor]];
    [b1 setBackgroundColor:[UIColor colorWithRed:102.0/255.0 green:161.0/255.0 blue:115.0/255.0 alpha:1.0f]];
    [b1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
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
        //        make.bottom.equalTo(_dynamicView).offset(1);
        make.height.mas_equalTo(200);
    }];
    //test
    UITextField *t2 = [UITextField new];
    [t2 setEnabled:NO];
    t2.placeholder = @"vessel";
    t2.borderStyle = UITextBorderStyleRoundedRect;
    [vesselDynamicView addSubview:t2];
    [t2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(vesselDynamicView).offset(10);
        make.right.equalTo(vesselDynamicView).offset(-10);
        make.height.mas_equalTo(50);
    }];
    UITextField *t3 = [UITextField new];
    [t3 setEnabled:NO];
    t3.placeholder = @"vessel";
    t3.borderStyle = UITextBorderStyleRoundedRect;
    [vesselDynamicView addSubview:t3];
    [t3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(t2.mas_bottom).offset(10);
        make.left.equalTo(vesselDynamicView).offset(10);
        make.right.equalTo(vesselDynamicView).offset(-10);
        make.height.mas_equalTo(50);
    }];
    
    UIButton *b2 = [UIButton buttonWithType:UIButtonTypeSystem];
    [b2 setTitle:@"Vessel" forState:UIControlStateNormal];
    //    [b2 setBackgroundColor:[UIColor greenColor]];
    [b2 setBackgroundColor:[UIColor colorWithRed:102.0/255.0 green:161.0/255.0 blue:115.0/255.0 alpha:1.0f]];
    [b2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [vesselDynamicView addSubview:b2];
    [b2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(t3.mas_bottom).offset(10);
        make.left.equalTo(vesselDynamicView).offset(10);
        make.right.equalTo(vesselDynamicView).offset(-10);
        make.height.mas_equalTo(50);
    }];
}

- (void)initTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    //refresh
    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        NSLog(@"mjrefresh");
        [_tableView reloadData];
        [_tableView.header endRefreshing];
    }];
    
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_dynamicView.mas_bottom);
        make.left.right.bottom.equalTo(self.view);
    }];
    
    [self initLongGestureRecognizer];
}

- (void)initGradientView {
    //layer
    gradientView = [UIView new];
//    gradientView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:gradientView];
    [self.view bringSubviewToFront:gradientView];
    [gradientView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_topView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(50);
    }];
    
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = CGRectMake(0, 0, self.view.bounds.size.width, 50);
    NSLog(@"%f",gradient.bounds.size.width);
//    gradient.colors = [NSArray arrayWithObjects:
//                       (id)[[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0  alpha:1.0] CGColor],
//                       (id)[[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0  alpha:0.8] CGColor], nil];
//    gradient.startPoint = CGPointMake(0.5, 0.0); // default; bottom of the view
//    gradient.endPoint = CGPointMake(0.5, 1.0);   // default; top of the view
    gradient.position = self.view.center;
    gradient.colors = @[(__bridge id)[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0  alpha:0.9].CGColor,
                          (__bridge id)[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0  alpha:0.7].CGColor,
                          (__bridge id)[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0  alpha:0.5].CGColor];
    gradient.locations = @[@(0.25),@(0.5),@(0.75)];
    gradient.startPoint = CGPointMake(0.5, 0.0);
    gradient.endPoint = CGPointMake(0.5, 1.0);

    [gradientView.layer insertSublayer:gradient atIndex:0];
}

- (UIView *)customSnapshotFromView:(UIView *)inputView {
    
    UIView *snapshot = [inputView snapshotViewAfterScreenUpdates:YES];
    snapshot.layer.masksToBounds = NO;
    snapshot.layer.cornerRadius = 0.0;
    snapshot.layer.shadowOffset = CGSizeMake(-5.0, 0.0);
    snapshot.layer.shadowRadius = 5.0;
    snapshot.layer.shadowOpacity = 0.4;
    
    return snapshot;
}

#pragma mark - Gesture
- (void)initPanGestureRecognizer {
    recognizer = [UIPanGestureRecognizer new];
    [_tableView addGestureRecognizer:recognizer];
    [recognizer addTarget:self action:@selector(tableViewDidPan:)];
}

- (void)removePanGestureRecognizer {
    for (UIPanGestureRecognizer *rec in _tableView.gestureRecognizers) {
        if ([rec isEqual:recognizer]) {
            [_tableView removeGestureRecognizer:rec];
        }
    }
}

- (void)initLongGestureRecognizer {
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]
                                               initWithTarget:self action:@selector(longPressGestureRecognized:)];
    [self.tableView addGestureRecognizer:longPress];
}

- (void)longPressGestureRecognized:(UILongPressGestureRecognizer *)rec {
    
    UILongPressGestureRecognizer *longPress = (UILongPressGestureRecognizer *)rec;
    UIGestureRecognizerState state = longPress.state;
    
    CGPoint location = [longPress locationInView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:location];
    
    static UIView *snapshot = nil;        ///< A snapshot of the row user is moving.
    static NSIndexPath *sourceIndexPath = nil; ///< Initial index path, where gesture begins.
    
    switch (state) {
        case UIGestureRecognizerStateBegan: {
            if (indexPath) {
                sourceIndexPath = indexPath;
                
                UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
                
                // Take a snapshot of the selected row using helper method.
                snapshot = [self customSnapshotFromView:cell];
                
                // Add the snapshot as subview, centered at cell's center...
                __block CGPoint center = cell.center;
                snapshot.center = center;
                snapshot.alpha = 0.0;
                [self.tableView addSubview:snapshot];
                [UIView animateWithDuration:0.25 animations:^{
                    
                    // Offset for gesture location.
                    center.y = location.y;
                    snapshot.center = center;
                    snapshot.transform = CGAffineTransformMakeScale(1.05, 1.05);
                    snapshot.alpha = 0.98;
                    
                    // Black out.
                    cell.backgroundColor = [UIColor whiteColor];
                } completion:nil];
            }
            break;
        }
        case UIGestureRecognizerStateChanged: {
            CGPoint center = snapshot.center;
            center.y = location.y;
            snapshot.center = center;
            
            // Is destination valid and is it different from source?
            if (indexPath && ![indexPath isEqual:sourceIndexPath]) {
                
                // ... update data source.
                //                [self.objects exchangeObjectAtIndex:indexPath.row withObjectAtIndex:sourceIndexPath.row];
                
                // ... move the rows.
                [self.tableView moveRowAtIndexPath:sourceIndexPath toIndexPath:indexPath];
                
                // ... and update source so it is in sync with UI changes.
                sourceIndexPath = indexPath;
            }
            break;
        }
        default: {
            // Clean up.
            UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:sourceIndexPath];
            [UIView animateWithDuration:0.25 animations:^{
                
                snapshot.center = cell.center;
                snapshot.transform = CGAffineTransformIdentity;
                snapshot.alpha = 0.0;
                
                // Undo the black-out effect we did.
                cell.backgroundColor = [UIColor whiteColor];
                
            } completion:^(BOOL finished) {
                
                [snapshot removeFromSuperview];
                snapshot = nil;
                
            }];
            sourceIndexPath = nil;
            break;
        }
    }
}

- (void)tableViewDidPan:(UIPanGestureRecognizer *)rec {
    
    //    CGFloat const gestureMinimumTranslation = 50.0f;
    
    CGPoint translation = [rec translationInView:_tableView];
    if (translation.y >0.0) {
        //down
    }else {
        //up
        
        /*
         * when upward,we should do this:
         * 1.if upward a short distance(10<x<20),let view decrease animation
         * 2.else,let view decrease height with the pan, and the buton color change.
         * 3.add a blur view when long distance.
         */
        
        //if user upward > gestureMinimumTranslation,_dynamicView will hidden.
        if (rec.state == UIGestureRecognizerStateEnded && 10.0f < fabs(translation.y) < 20.0f) {
            
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
                [self removePanGestureRecognizer];
                [_tableView setScrollEnabled:YES];
                lineBtn.enabled = YES;
                vesselBtn.enabled = YES;
//                [self removeGradientView];
                gradientView.hidden = YES;
            }];
        } else if (rec.state == UIGestureRecognizerStateBegan || rec.state == UIGestureRecognizerStateChanged) {
            if (translation.y <= _dynamicView.bounds.size.height) {
                [_dynamicView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(_topView.mas_bottom).offset(translation.y);
                }];
                [self.view bringSubviewToFront:_topView];
                if (_dynamicView.bounds.size.height > 0) {
                    
                    gradientView.hidden = NO;
//                    CGFloat alphaPresentFlag = 1-fabs(translation.y/_dynamicView.bounds.size.height);
                    //                        _dynamicView.alpha = alphaPresentFlag;
                    
                    CGFloat colorPresentFlag = fabs(translation.y/_dynamicView.bounds.size.height);
                    
                    /*
                     *this is the btn color change with the pan.
                     */
                    UIColor *btnChangeWithAnimationBackgroundColor = [UIColor colorWithRed:(102.0+(255.0-102.0)*colorPresentFlag)/255.0 green:(161.0+(255.0-161.0)*colorPresentFlag)/255.0 blue:(115.0+(255.0-115.0)*colorPresentFlag)/255.0 alpha:1.0f];
                    UIColor *btnChangeWithAnimationTitleColor = [UIColor colorWithRed:(255.0-(255.0-102.0)*colorPresentFlag)/255.0 green:(255.0-(255.0-161.0)*colorPresentFlag)/255.0 blue:(255.0-(255.0-115.0)*colorPresentFlag)/255.0 alpha:1.0f];
                    
                    //background color trun green to white,title turn white to green.
                    if (lineDynamicView.hidden == NO) {
                        [lineBtn setBackgroundColor:btnChangeWithAnimationBackgroundColor];
                        [lineBtn setTitleColor:btnChangeWithAnimationTitleColor forState:UIControlStateNormal];
                    }else {
                        [vesselBtn setBackgroundColor:btnChangeWithAnimationBackgroundColor];
                        [vesselBtn setTitleColor:btnChangeWithAnimationTitleColor forState:UIControlStateNormal];
                    }
                    
                    //gradientView hidden
                    if (_dynamicView.bounds.size.height - translation.y < gradientView.bounds.size.height) {
                        gradientView.hidden = YES;
                    }
                    
                    [self.view layoutIfNeeded];
                    [_dynamicView layoutIfNeeded];
                }
            } else {
                [self decreseDynamicViewHeight];
            }
        }
    }
}

#pragma mark - view operation
- (void)increaseDynamicViewHeightTo:(CGFloat)height {
    [_dynamicView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_topView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(height+1);
    }];
}

- (void)decreseDynamicViewHeight {
    [_dynamicView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_topView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(0);
    }];
}

- (void)removeGradientView {
    for (UIView *v in self.view.subviews) {
        if ([v isEqual:gradientView]) {
            [v removeFromSuperview];
        }
    }
//    [gradientView removeFromSuperview];
}

#pragma mark - button event
- (void)vesselBtnClick:(UIButton *)btn {
    vesselBtn.enabled = NO;
    lineBtn.enabled = YES;
    
    _dynamicView.hidden = NO;
    lineDynamicView.hidden = YES;
    vesselDynamicView.hidden = NO;
    [UIView animateWithDuration:0.5f animations:^{
        [self increaseDynamicViewHeightTo:vesselDynamicView.bounds.size.height];
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
        [self removePanGestureRecognizer];
        [self initPanGestureRecognizer];
        [_tableView setScrollEnabled:NO];
    }];
}

- (void)lineBtnClick:(UIButton *)btn {
    vesselBtn.enabled = YES;
    lineBtn.enabled = NO;
    
    _dynamicView.hidden = NO;
    lineDynamicView.hidden = NO;
    vesselDynamicView.hidden = YES;
    [UIView animateWithDuration:0.5f animations:^{
        [self increaseDynamicViewHeightTo:lineDynamicView.bounds.size.height];
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
        [self removePanGestureRecognizer];
        [self initPanGestureRecognizer];
        [_tableView setScrollEnabled:NO];
    }];
}

#pragma mark - tableview datasource delegate and datasource
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == _tableView) {
        if ( _dynamicView.bounds.size.height > 0) {
            if (!recognizer) {
                [self initPanGestureRecognizer];
            }
            [_tableView setScrollEnabled:NO];
        }
//        else {
//            [self removeGradientView];
//        }
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
    [self.navigationController pushViewController:[GradientViewController new] animated:YES];
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
