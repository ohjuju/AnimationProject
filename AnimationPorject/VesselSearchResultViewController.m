////
////  VesselSearchResultViewController.m
////  BigSchedule
////
////  Created by NOAH LI (EUCD-EUC-ISD-OOCLL/ZHA) on 10/12/15.
////  Copyright © 2015 oocl. All rights reserved.
////
//
//#import "VesselSearchResultViewController.h"
//
//#define MAS_SHORTHAND
////define this constant if you want to enable auto-boxing for default syntax
//#define MAS_SHORTHAND_GLOBALS
//#import "Masonry.h"
//
//@interface VesselSearchResultViewController ()
//@property (strong, nonatomic)  UIWebView *mapWebView;
//@property (strong, nonatomic)  UIWebView *vesselRouteWebView;
//
//@property (strong, nonatomic) UIView *vesselRouteView;
//@property (strong, nonatomic) UIView *vesselRouteTitleView;
//
//@property (strong, nonatomic) UIView *transparentView;
//@property (strong, nonatomic) UIView *totalTransparentView;
//@property (strong, nonatomic) UIView *titleTransparentView;
//@property (assign, nonatomic) CGFloat totalScrollHeight;
//
//@property (assign, nonatomic) BOOL isVesselRouteWebViewOnTop;
//@property (assign, nonatomic) BOOL isVesselRouteWebViewOnBottom;
//
//@property (assign, nonatomic) CGPoint lastLocation;
//@property (assign, nonatomic) CGFloat lastHeight;
//
//@property (strong, nonatomic) CAGradientLayer *maskLayer;
//
//@property (strong, nonatomic) UIImageView *loadingView;
//@property (strong, nonatomic) UIView *flowViewForLoading;
//@end
//
//@implementation VesselSearchResultViewController
//
//static CGFloat vesselRouteHeightInBottom = 160;
//static CGFloat titleHeight = 85;
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    self.edgesForExtendedLayout = UIRectEdgeNone;
//    [self drawView];
//    
//    NSString *vesselMapUrl = [CommonUtils getUrlFromBundleForKey:@"VesselMapUrl"];
//    vesselMapUrl = [vesselMapUrl stringByAppendingString:[NSString stringWithFormat:@"?vesselGid=%@",_vessel.vesselGid]];
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:vesselMapUrl]];
//    
//    [AFHttpFunction setCookieForWeb:[CommonUtils getUrlFromBundleForKey:@"host"]];
//    _mapWebView.scrollView.delegate = self;
//    [_mapWebView loadRequest:request];
//    _lastHeight = vesselRouteHeightInBottom;
//    _isVesselRouteWebViewOnBottom = YES;
//    
//    
//    if (!_vesselSchedule.criteria.vesselName || !_vesselSchedule.criteria.carrierName) {
//        _vesselRouteView.hidden = YES;
//        _transparentView.hidden = YES;
//    }
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleLanguageChange) name:NOTIFICATION_LANGUAGLE_CHANGE object:nil];
//}
//
//-(void)handleLanguageChange{
//    [self.webView reload];
//    self.navigationItem.title = [CommonUtils getLocalizedString:@"VESSEL_SCHEDULE_DETAIL_TITLE"];
//}
//
//-(void)dealloc{
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//}
//
//-(void) drawView{
//    _mapWebView = [[UIWebView alloc] init];
//    [self.view addSubview:_mapWebView];
//    [_mapWebView makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
//    }];
//    _mapWebView.delegate = self;
//    _mapWebView.scrollView.scrollsToTop = NO;
//    
//    self.webView.scrollView.delegate = self;
//    
//    _titleTransparentView = [[UIView alloc] init];
//    [self.view addSubview:_titleTransparentView];
//    [_titleTransparentView makeConstraints:^(MASConstraintMaker *make) {
//        make.top.leading.trailing.equalTo(self.view);
//        make.height.equalTo(titleHeight);
//    }];
//    _titleTransparentView.backgroundColor = [UIColor colorWithHex:0x000000 alpha:0];
//    _titleTransparentView.userInteractionEnabled = NO;
//    
//    _totalTransparentView = [[UIView alloc] init];
//    [self.view addSubview:_totalTransparentView];
//    [_totalTransparentView makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.leading.trailing.equalTo(self.view);
//        make.top.equalTo(_titleTransparentView.bottom);
//    }];
//    _totalTransparentView.backgroundColor = [UIColor colorWithHex:0x000000 alpha:0];
//    _totalTransparentView.userInteractionEnabled = NO;
//    
//    UIView *transparentView = [[UIView alloc] init];
//    [self.view addSubview:transparentView];
//    [transparentView makeConstraints:^(MASConstraintMaker *make) {
//        make.height.equalTo(vesselRouteHeightInBottom+50);
//        make.leading.trailing.bottom.equalTo(self.view);
//    }];
//    _transparentView = transparentView;
//    _transparentView.backgroundColor = [UIColor clearColor];
//    _transparentView.userInteractionEnabled = NO;
//    [self insertTransparentGradient];
//    
//    CGFloat originY = [[UIScreen mainScreen] bounds].size.height - 64 - 44 - vesselRouteHeightInBottom;
//    
//    UIView *vesselRouteView = [[UIView alloc] initWithFrame:CGRectMake(0, originY, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height-44 -64)];
//    [self.view addSubview:vesselRouteView];
//    _vesselRouteView = vesselRouteView;
//    
//    UIView *vesselRouteTitleView = [[UIView alloc] init];
//    [vesselRouteView addSubview:vesselRouteTitleView];
//    [vesselRouteTitleView makeConstraints:^(MASConstraintMaker *make) {
//        make.top.leading.trailing.equalTo(vesselRouteView);
//        make.height.equalTo(titleHeight);
//    }];
//    vesselRouteTitleView.backgroundColor = [UIColor clearColor];
//    _vesselRouteTitleView = vesselRouteTitleView;
//    
//    UISwipeGestureRecognizer *swipeUpGR  = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeUp:)];
//    [_vesselRouteTitleView addGestureRecognizer:swipeUpGR];
//    
//    UILabel *carrierLabel = [[UILabel alloc] init];
//    [vesselRouteTitleView addSubview:carrierLabel];
//    [carrierLabel makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.equalTo(vesselRouteTitleView.leading).offset(16);
//        make.top.equalTo(vesselRouteTitleView).offset(30);
//    }];
//    carrierLabel.textColor = [UIColor colorWithHex:0xffffff alpha:0.55];
//    carrierLabel.font = [UIFont systemFontOfSize:14];
//    carrierLabel.text = _vesselSchedule.criteria.carrierName;
//    
//    UILabel *vesselNameLabel = [[UILabel alloc] init];
//    [vesselRouteTitleView addSubview:vesselNameLabel];
//    [vesselNameLabel makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(carrierLabel.bottom).offset(5);
//        make.leading.equalTo(carrierLabel);
//    }];
//    vesselNameLabel.textColor = [UIColor colorWithHex:0xffffff alpha:1.0];
//    vesselNameLabel.font = [UIFont systemFontOfSize:21];
//    vesselNameLabel.text = _vesselSchedule.criteria.vesselName;
//
//    _vesselRouteWebView = self.webView;
//    [vesselRouteView addSubview:_vesselRouteWebView];
//    [_vesselRouteWebView remakeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(vesselRouteTitleView.bottom);
//        make.leading.trailing.equalTo(vesselRouteView);
//        make.bottom.equalTo(vesselRouteView);
//    }];
//    _vesselRouteWebView.opaque = NO;
//    _vesselRouteWebView.backgroundColor = [UIColor clearColor];
//    _vesselRouteWebView.delegate =self;
//    _vesselRouteView.backgroundColor = [UIColor clearColor];
//    
//    CAGradientLayer *maskLayer = [CAGradientLayer layer];
//    
//    CGColorRef outerColor = [UIColor colorWithWhite:1.0 alpha:0.0].CGColor;
//    CGColorRef innerColor = [UIColor colorWithWhite:1.0 alpha:1.0].CGColor;
//    
//    float renderMaskStartPt = 0;
//    float renderMaskEndPt = 30.0/[UIScreen mainScreen].bounds.size.height;
//    
//    maskLayer.colors = [NSArray arrayWithObjects:(__bridge id)outerColor,(__bridge id)innerColor, nil];
//    maskLayer.locations = [NSArray arrayWithObjects:[NSNumber numberWithFloat:renderMaskStartPt],
//                                [NSNumber numberWithFloat:renderMaskEndPt], nil];
//    
//    maskLayer.bounds = CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height);
//    maskLayer.anchorPoint = CGPointZero;
//    _maskLayer = maskLayer;
//    
//    UIView *flowViewForLoading = [[UIView alloc] init];
//    [self.view addSubview:flowViewForLoading];
//    [flowViewForLoading makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view).offset(-70);
//        make.centerX.equalTo(self.view);
//        make.width.height.equalTo(50);
//    }];
//    _flowViewForLoading = flowViewForLoading;
//    
//    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loading_flow_bg"]];
//    [flowViewForLoading addSubview:backgroundView];
//    [backgroundView autoCenterInSuperview];
//    
//    UIImageView *loadFlowView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
//    NSArray *flowImages = [NSArray arrayWithObjects:[UIImage imageNamed:@"loading_0"],[UIImage imageNamed:@"loading_1"],[UIImage imageNamed:@"loading_2"],[UIImage imageNamed:@"loading_3"],[UIImage imageNamed:@"loading_4"],[UIImage imageNamed:@"loading_5"],[UIImage imageNamed:@"loading_6"],[UIImage imageNamed:@"loading_7"], nil];
//    loadFlowView.animationImages = flowImages;
//    loadFlowView.animationDuration = 1.6;
//    loadFlowView.animationRepeatCount = 0;
//    [backgroundView addSubview:loadFlowView];
//    [loadFlowView autoCenterInSuperview];
//    
//    _loadingView = loadFlowView;
//}
//
//-(void)viewWillAppear:(BOOL)animated{
//    self.navigationItem.title = [CommonUtils getLocalizedString:@"VESSEL_SCHEDULE_DETAIL_TITLE"];
//    
//    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
//    }
//}
//
//-(void)viewWillDisappear:(BOOL)animated{
//    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
//    }
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
////Transparent Gradient Layer
//- (void) insertTransparentGradient {
//    CAGradientLayer *gradient = [CAGradientLayer layer];
////    CGFloat screenHeight =[[UIScreen mainScreen] bounds].size.height;
//    CGFloat screenWidth  =[[UIScreen mainScreen] bounds].size.width;
//    gradient.frame = CGRectMake(0, 0, screenWidth,vesselRouteHeightInBottom+50);
//    gradient.colors = [NSArray arrayWithObjects:
//                       (id)[[UIColor colorWithWhite: 0.0 alpha:0.0] CGColor],
//                       (id)[[UIColor colorWithWhite: 0.0 alpha:0.7] CGColor], nil];
//    gradient.startPoint = CGPointMake(0.5, 0.0); // default; bottom of the view
//    gradient.endPoint = CGPointMake(0.5, 1.0);   // default; top of the view
//    [_transparentView.layer insertSublayer:gradient atIndex:0];
//}
//
//#pragma mark scrollview delegate
//-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
//    
//}
//
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    CGFloat yOffset = scrollView.contentOffset.y;
//    if (yOffset==-64) {
//        return;
//    }
//    
//    CGRect frame = _vesselRouteView.frame;
//    frame.origin.y -= yOffset;
//    if (frame.origin.y<=0) {
//        if (!self.webView.layer.mask) {
//            self.webView.layer.mask = _maskLayer;
//        }
//        frame.origin.y=0;
//    }else{
//        if (self.webView.layer.mask) {
//            self.webView.layer.mask = nil;
//        }
//        if(frame.origin.y>=self.view.frame.size.height-vesselRouteHeightInBottom){
//            frame.origin.y=self.view.frame.size.height-vesselRouteHeightInBottom;
//        }else{
//            CGFloat alpha = (1-frame.origin.y/(self.view.frame.size.height-vesselRouteHeightInBottom))*0.85;
//            _totalTransparentView.backgroundColor = [UIColor colorWithHex:0x000000 alpha:alpha];
//            _titleTransparentView.backgroundColor = [UIColor colorWithHex:0x000000 alpha:alpha];
//            scrollView.contentOffset = CGPointMake(0, 0);
//        }
//    }
//    _vesselRouteView.frame = frame;
//}
//
//-(void)scrollViewDidScrollToTop:(UIScrollView *)scrollView{
//    _totalTransparentView.backgroundColor = [UIColor colorWithHex:0x000000 alpha:0.85];
//    _titleTransparentView.backgroundColor = [UIColor colorWithHex:0x000000 alpha:0.85];
//    if (self.webView.layer.mask) {
//        self.webView.layer.mask = nil;
//    }
//}
//
//-(void)handleSwipeUp:(UISwipeGestureRecognizer *)recognizer{
//   
//    CGPoint location = [recognizer locationInView:self.view];
//     NSLog(@"location in view is %f",location.y);
//}
//
//- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
//    UITouch *touch = [[event allTouches] anyObject];
//    if ([touch.view isEqual: self.view] || touch.view == nil) {
//        return;
//    }
//    
//    _lastLocation = [touch locationInView: self.view];
//}
//
//-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    UITouch *touch = [[event allTouches] anyObject];
//    if ([touch.view isEqual: self.view]) {
//        return;
//    }
//    
//    CGPoint location = [touch locationInView: self.view];
//    CGFloat yDisplacement = location.y - _lastLocation.y;
//    
//    CGRect frame = _vesselRouteView.frame;
//    frame.origin.y += yDisplacement;
//    
//    if (frame.origin.y<0) {
//        frame.origin.y=0;
//    }
//    if(frame.origin.y>=self.view.frame.size.height-vesselRouteHeightInBottom){
//        frame.origin.y=self.view.frame.size.height-vesselRouteHeightInBottom;
//    }else{
//        CGFloat alpha = (1-frame.origin.y/(self.view.frame.size.height-vesselRouteHeightInBottom))*0.85;
//        _totalTransparentView.backgroundColor = [UIColor colorWithHex:0x000000 alpha:alpha];
//        _titleTransparentView.backgroundColor = [UIColor colorWithHex:0x000000 alpha:alpha];
//    }
//    _vesselRouteView.frame = frame;
//    _lastLocation=location;
//}
///*
//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}
//*/
//
//-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
//    if (webView==_mapWebView) {
//         [_loadingView startAnimating];
//        [_flowViewForLoading remakeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.view).offset(30);
//            make.centerX.equalTo(self.view);
//            make.width.height.equalTo(50);
//        }];
//        
//        [UIView animateWithDuration:0.3 animations:^{
//            [self.view layoutIfNeeded];
//        }];
//    }
//    
//    return YES;
//}
//
//-(void)webViewDidFinishLoad:(UIWebView *)webView{
//    NSLog(@"web view did start load");
//    if (webView == self.webView) {
//        NSDictionary *language = @{
//                                   @"service" : [CommonUtils getLocalizedString:@"VESSEL_SCHEDULE_DETAIL_SERVICE"],
//                                   @"ETD" : [CommonUtils getLocalizedString:@"VESSEL_SCHEDULE_DETAIL_ETD"],
//                                   @"ETA" : [CommonUtils getLocalizedString:@"VESSEL_SCHEDULE_DETAIL_ETA"],
//                                   @"ATD" : [CommonUtils getLocalizedString:@"VESSEL_SCHEDULE_DETAIL_ATA"],
//                                   @"ATA" : [CommonUtils getLocalizedString:@"VESSEL_SCHEDULE_DETAIL_ATD"]
//                                   };
//        
//        NSMutableDictionary *dataDictionary = [NSMutableDictionary dictionaryWithDictionary:[MTLJSONAdapter JSONDictionaryFromModel:_vesselSchedule error:nil]];
//        [dataDictionary setObject:language forKey:@"language"];
//        
//        NSString *jsonString = [CommonUtils objectToJson:dataDictionary];
//        jsonString = [jsonString stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
//        jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\'" withString:@"\\'"];
//        
//        NSString *limitedWidth = @"150px";
//        CGFloat viewWidth = self.view.frame.size.width;
//        //for support iPhone4(s) and iPhone5(s)
//        if (viewWidth==320) {
//            limitedWidth = @"120px";
//        }else if(viewWidth == 414){
//            limitedWidth = @"170px";
//        }else if (viewWidth == 375){
//            limitedWidth = @"150px";
//        }
//        
//        [self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"VesselScheduleDetailModule.initPage('%@','%@')",jsonString,limitedWidth]];
//    }
//    if (webView == _mapWebView) {
//        [_flowViewForLoading remakeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.view).offset(-70);
//            make.centerX.equalTo(self.view);
//            make.width.height.equalTo(50);
//        }];
//        
//        [UIView animateWithDuration:0.3 animations:^{
//            [self.view layoutIfNeeded];
//        }];
//    }
//}
//
//-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
//    [UIAlertView bk_showAlertViewWithTitle:[CommonUtils getLocalizedString:@"CO_ALERT_UNKNOWN_ERROR"] message:nil cancelButtonTitle:[CommonUtils getLocalizedString:@"CO_ALERT_OK"] otherButtonTitles:nil handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
//        [self.navigationController popViewControllerAnimated:YES];
//    }];
//    NSLog(@"call webview fail in vessel tracking with error: %@",error);
//}
//
//@end
