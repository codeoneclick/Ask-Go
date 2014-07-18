//
//  AGAccountViewController.m
//  Ask&Go
//
//  Created by sergey.sergeev on 7/17/14.
//  Copyright (c) 2014 sergey.sergeev. All rights reserved.
//

#import "AGAccountViewController.h"
#import <FacebookSDK/FacebookSDK.h>

@interface AGAccountViewController () <FBLoginViewDelegate>

@property (weak, nonatomic) IBOutlet FBProfilePictureView *accountImage;
@property (weak, nonatomic) IBOutlet FBLoginView *fbLoginButton;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UITextField *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *surnameLabel;
@property (weak, nonatomic) IBOutlet UITextField *nicknameLabel;
@property (weak, nonatomic) IBOutlet UITextField *emailLabel;

@end

@implementation AGAccountViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.fbLoginButton setReadPermissions:@[@"public_profile", @"email", @"user_friends"]];
    [self.fbLoginButton setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user
{
    self.accountImage.profileID = user.objectID;
    [self.nameLabel setText:user.first_name];
    [self.surnameLabel setText:user.last_name];
    [self.nicknameLabel setText:user.username];
    [self.emailLabel setText:[user objectForKey:@"email"]];
}

@end
