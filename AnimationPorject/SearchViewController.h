//
//  SearchViewController.h
//  AnimationPorject
//
//  Created by OKAR OU (EUCD-EUC-ISD-OOCLL/ZHA) on 10/22/15.
//  Copyright © 2015 区慧驹. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
#import <MJRefresh/MJRefresh.h>

@interface SearchViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIView *dynamicView;
@property (nonatomic, strong) UITableView *tableView;

@end
