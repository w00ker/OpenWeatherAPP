//
//  LoginViewController.h
//  OpenWeatherProject
//
//  Created by Admin on 27.02.17.
//  Copyright © 2017 SashaBudz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignInViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *signInButton;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

- (IBAction)signInUser:(id)sender;
- (IBAction)signUpUser:(id)sender;

@end
