//
//  ViewController.m
//  01-ViewAnimations
//
//  Created by 鞠凝玮 on 16/4/29.
//  Copyright © 2016年 Ju. All rights reserved.
//

#import "ViewController.h"
#import "UIView+YYAdd.h"

#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define RGBCOLOR(r, g, b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1]


@interface ViewController ()
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UITextField *nameField;
@property (nonatomic, strong)UITextField *passwordField;
@property (nonatomic, strong)UIButton *loginButton;

@property (nonatomic, strong)UIImageView *cloud1;
@property (nonatomic, strong)UIImageView *cloud2;
@property (nonatomic, strong)UIImageView *cloud3;
@property (nonatomic, strong)UIImageView *cloud4;

@property (nonatomic, strong)UIActivityIndicatorView *spinner;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImageView *backImg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    [backImg setImage:[UIImage imageNamed:@"bg-sunny"]];
    [self.view addSubview:backImg];
    
    self.cloud1 = [UIImageView new];
    [self.cloud1 setImage:[UIImage imageNamed:@"bg-sunny-cloud-1"]];
    self.cloud1.centerX = 0;
    self.cloud1.top = 80;
    [self.cloud1 sizeToFit];
    [self.view addSubview:self.cloud1];
    
    self.cloud2 = [UIImageView new];
    [self.cloud2 setImage:[UIImage imageNamed:@"bg-sunny-cloud-2"]];
    self.cloud2.centerX = ScreenWidth-100;
    self.cloud2.top = 120;
    [self.cloud2 sizeToFit];
    [self.view addSubview:self.cloud2];
    
    self.cloud3 = [UIImageView new];
    [self.cloud3 setImage:[UIImage imageNamed:@"bg-sunny-cloud-3"]];
    self.cloud3.centerX = 0;
    self.cloud3.top = 360;
    [self.cloud3 sizeToFit];
    [self.view addSubview:self.cloud3];
    
    self.cloud4 = [UIImageView new];
    [self.cloud4 setImage:[UIImage imageNamed:@"bg-sunny-cloud-4"]];
    self.cloud4.centerX = ScreenWidth-100;
    self.cloud4.top = 300;
    [self.cloud4 sizeToFit];
    [self.view addSubview:self.cloud4];

    
    self.titleLabel = [UILabel new];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.text = @"Bahama Lgin";
    [self.titleLabel sizeToFit];
    self.titleLabel.centerX = ScreenWidth/2;
    self.titleLabel.top = 80;
    [self.view addSubview:self.titleLabel];
    
    self.nameField = [UITextField new];
    self.nameField.font = [UIFont systemFontOfSize:15];
    self.nameField.layer.cornerRadius = 5;
    self.nameField.backgroundColor = [UIColor whiteColor];
    self.nameField.textColor = [UIColor lightGrayColor];
    self.nameField.placeholder = @" Username";
    self.nameField.width = ScreenWidth-80;
    self.nameField.height = 35;
    self.nameField.top = self.titleLabel.bottom+15;
    self.nameField.centerX = ScreenWidth/2;
    [self.view addSubview:self.nameField];
    
    self.passwordField = [UITextField new];
    self.passwordField.font = [UIFont systemFontOfSize:15];
    self.passwordField.layer.cornerRadius = 5;

    self.passwordField.backgroundColor = [UIColor whiteColor];

    self.passwordField.textColor = [UIColor lightGrayColor];
    self.passwordField.placeholder = @" Password";
    self.passwordField.width = ScreenWidth-80;
    self.passwordField.height = 35;
    self.passwordField.top = self.nameField.bottom+15;
    self.passwordField.centerX = ScreenWidth/2;
    [self.view addSubview:self.passwordField];
    
    self.loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.loginButton.size = CGSizeMake(180, 50);
    self.loginButton.top = self.passwordField.bottom+15;
    self.loginButton.centerX = ScreenWidth/2;
    self.loginButton.layer.cornerRadius = 8;
    self.loginButton.backgroundColor = RGBCOLOR(173, 206, 94);
    [self.loginButton setTitle:@"Log In" forState:UIControlStateNormal];
    self.loginButton.titleLabel.font = [UIFont boldSystemFontOfSize:28];
    [self.loginButton setTitleColor:RGBCOLOR(43, 99, 55) forState:UIControlStateNormal];
    [self.loginButton addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.loginButton];
    
    self.spinner = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(10, 15, 20, 20)];
    [self.loginButton addSubview:self.spinner];
    [self.spinner startAnimating];
    self.spinner.alpha = 0;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.titleLabel.centerX -= ScreenWidth;
    self.nameField.centerX -= ScreenWidth;
    self.passwordField.centerX -= ScreenWidth;
    
    self.cloud1.alpha = 0;
    self.cloud2.alpha = 0;
    self.cloud3.alpha = 0;
    self.cloud4.alpha = 0;

}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.titleLabel.centerX += ScreenWidth;
    }];
    
    [UIView animateWithDuration:1.0 delay:0.1 usingSpringWithDamping:0.4 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.nameField.centerX += ScreenWidth;

    } completion:nil];
    
    [UIView animateWithDuration:1.0 delay:0.2 usingSpringWithDamping:0.4 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.passwordField.centerX += ScreenWidth;
        
    } completion:nil];

    
//    [UIView animateWithDuration:0.5 delay:0.1 options:UIViewAnimationOptionCurveLinear animations:^{
//        self.nameField.centerX += ScreenWidth;
//
//    } completion:nil];
//    
//    [UIView animateWithDuration:0.5 delay:0.2 options:UIViewAnimationOptionCurveLinear animations:^{
//        self.passwordField.centerX += ScreenWidth;
//        
//    } completion:nil];
    
    [UIView animateWithDuration:0.8 delay:0.3 options:UIViewAnimationOptionCurveLinear animations:^{
        self.cloud1.alpha = 1.0;
        
    } completion:nil];

    [UIView animateWithDuration:0.8 delay:0.4 options:UIViewAnimationOptionCurveLinear animations:^{
        self.cloud2.alpha = 1.0;
        
    } completion:nil];

    [UIView animateWithDuration:0.8 delay:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
        self.cloud3.alpha = 1.0;
        
    } completion:nil];

    [UIView animateWithDuration:0.8 delay:0.6 options:UIViewAnimationOptionCurveLinear animations:^{
        self.cloud4.alpha = 1.0;
        
    } completion:nil];


}

- (void)login:(UIButton *)sender{

    [UIView animateWithDuration:0.3 delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.loginButton.centerY += 40;
        self.loginButton.backgroundColor = [UIColor colorWithRed:0.85 green:0.83 blue:0.45 alpha:1.0];
        self.spinner.alpha = 1;


    } completion:nil];
    
    [UIView animateWithDuration:1.5 delay:0.0 usingSpringWithDamping:0.2 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.loginButton.width = 280;
        self.loginButton.centerX = ScreenWidth/2;
        
    } completion:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
