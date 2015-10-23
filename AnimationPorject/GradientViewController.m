//
//  GradientViewController.m
//  AnimationPorject
//
//  Created by OKAR OU (EUCD-EUC-ISD-OOCLL/ZHA) on 10/23/15.
//  Copyright © 2015 区慧驹. All rights reserved.
//

#import "GradientViewController.h"

@interface GradientViewController ()

@end

@implementation GradientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"GradientView";
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    CAGradientLayer *colorLayer = [CAGradientLayer layer];
    colorLayer.frame = (CGRect){CGPointZero, CGSizeMake(200, 200)};
    colorLayer.position = self.view.center;
    [self.view.layer insertSublayer:colorLayer atIndex:0];
    
    colorLayer.colors = @[(__bridge id)[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0  alpha:0.5].CGColor,
                          (__bridge id)[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0  alpha:0.3].CGColor,
                          (__bridge id)[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0  alpha:0.1].CGColor];
    colorLayer.locations = @[@(0.25),@(0.5),@(0.75)];
    colorLayer.startPoint = CGPointMake(0.5, 0);
    colorLayer.endPoint = CGPointMake(0.5, 1.0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
