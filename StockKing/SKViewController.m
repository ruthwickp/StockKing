//
//  SKViewController.m
//  StockKing
//
//  Created by Ruthwick Pathireddy on 9/3/14.
//  Copyright (c) 2014 Darkking. All rights reserved.
//

#import "SKViewController.h"
#import "SKLoginViewController.h"
#import "SKSignUpViewController.h"

@interface SKViewController () <PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>
@property (nonatomic, strong) PFUser *currentUser;

@end

@implementation SKViewController

// Logs out any current user
- (void)viewDidLoad
{
    [super viewDidLoad];
    [PFUser logOut];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Displays login page if no user is logged in
    if (![PFUser currentUser]) {
        
        // Creates the login and sign up controller
        SKLoginViewController *loginViewController = [[SKLoginViewController alloc] init];
        SKSignUpViewController *signUpViewController = [[SKSignUpViewController alloc] init];
        
        // Customizes the sign up view controller
        signUpViewController.fields = PFSignUpFieldsUsernameAndPassword
        | PFSignUpFieldsSignUpButton
        | PFSignUpFieldsDismissButton;
        signUpViewController.delegate = self;
        
        // Customizes the login view controller
        loginViewController.signUpController = signUpViewController;
        loginViewController.fields = PFLogInFieldsLogInButton
        | PFLogInFieldsSignUpButton
        | PFLogInFieldsUsernameAndPassword;
        loginViewController.delegate = self;
        
        // Displays view controller
        [self presentViewController:loginViewController animated:NO completion:nil];
    }
    else {
        self.currentUser = [PFUser currentUser];
        NSLog(@"logged in");
    }
    
    
}

#pragma mark - PFLoginViewControllerDelegate

// Dismisses view controller when user logs in
- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - PFSignUpViewControllerDelegate

// Checks that the username and password are longer than
// 8 characters each
- (BOOL)signUpViewController:(PFSignUpViewController *)signUpController
           shouldBeginSignUp:(NSDictionary *)info
{
    NSString *username = info[@"username"];
    NSString *password = info[@"password"];
    
    // Checks username and password
    if ([username length] < 8) {
        [self alert:@"Username must be at least 8 characters."];
        return NO;
    }
    if ([password length] < 8) {
        [self alert:@"Password must be at least 8 characters."];
        return NO;
    }
    
    return YES;
}

// Shows an alert view containing the following message
- (void)alert:(NSString *)msg
{
    [[[UIAlertView alloc] initWithTitle:@"Sign Up Failed"
                                message:msg
                               delegate:nil
                      cancelButtonTitle:nil
                      otherButtonTitles:@"Ok", nil] show];
}

// Dismissed view controller when sign up is completed
- (void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
