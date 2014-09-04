//
//  SKSignUpViewController.m
//  StockKing
//
//  Created by Ruthwick Pathireddy on 9/4/14.
//  Copyright (c) 2014 Darkking. All rights reserved.
//

#import "SKSignUpViewController.h"

@interface SKSignUpViewController ()

@end

@implementation SKSignUpViewController

#define REGISTER_TITLE @"stockking_register_title"

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Customizes color the sign up view controller and logo
    self.signUpView.backgroundColor = [UIColor whiteColor];
    self.signUpView.usernameField.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.7];
    self.signUpView.passwordField.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.7];
    self.signUpView.logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:REGISTER_TITLE]];
}


@end
