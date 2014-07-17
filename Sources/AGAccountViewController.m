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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)loginWithFacebookBtnAction:(id)sender
{
    FBLoginView *loginView = [[FBLoginView alloc] init];
    [loginView setReadPermissions:@[@"public_profile", @"email", @"user_friends"]];
    
    // Set this loginUIViewController to be the loginView button's delegate
    loginView.delegate = self;
    
    // Align the button in the center horizontally
    loginView.frame = CGRectOffset(loginView.frame,
                                   (self.view.center.x - (loginView.frame.size.width / 2)),
                                   5);
    
    // Align the button in the center vertically
    loginView.center = self.view.center;
    
    // Add the button to the view
    [self.view addSubview:loginView];
}

@end
