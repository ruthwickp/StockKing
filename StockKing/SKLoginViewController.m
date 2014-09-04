//
//  SKLoginViewController.m
//  StockKing
//
//  Created by Ruthwick Pathireddy on 9/4/14.
//  Copyright (c) 2014 Darkking. All rights reserved.
//

#import "SKLoginViewController.h"

@interface SKLoginViewController ()

@end

@implementation SKLoginViewController

#define LOGO_IMAGE @"stockking_title"

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Customizes the view controller's background color and logo
    self.view.backgroundColor = [UIColor whiteColor];
    self.logInView.usernameField.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.7];
    self.logInView.passwordField.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.7];
    self.logInView.logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:LOGO_IMAGE]];

}
@end
