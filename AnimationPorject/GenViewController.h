//
//  GenViewController.h
//  AnimationPorject
//
//  Created by 区慧驹 on 15/10/18.
//  Copyright © 2015年 区慧驹. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Masonry/Masonry.h>

@interface GenViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end
