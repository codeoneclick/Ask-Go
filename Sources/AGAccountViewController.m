//
//  AGAccountViewController.m
//  Ask&Go
//
//  Created by sergey.sergeev on 7/17/14.
//  Copyright (c) 2014 sergey.sergeev. All rights reserved.
//

#import "AGAccountViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import "AGDatabaseFacade.h"

@interface AGAccountViewController () <FBLoginViewDelegate>

@property (weak, nonatomic) IBOutlet FBProfilePictureView *accountImage;
@property (weak, nonatomic) IBOutlet FBLoginView *fbLoginButton;
@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *genderLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *birthdayLabel;
@property (weak, nonatomic) IBOutlet UIButton *locationButton;
@property (weak, nonatomic) IBOutlet UIButton *friendsButton;

@property (nonatomic, strong) id<AGDatabaseAccessor> databaseAccessor;
@property (nonatomic, strong) id<AGDatabaseImporter> databaseImporter;

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
    
    self.databaseAccessor = [AGDatabaseFacade sharedInstance];
    self.databaseImporter = [AGDatabaseFacade sharedInstance];
    
    [self.fbLoginButton setReadPermissions:@[@"public_profile", @"email", @"user_friends", @"user_birthday", @"user_location"]];
    [self.fbLoginButton setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user
{
    [self.databaseImporter updateUserProfile:@{@"fbId": user.objectID,
                                               @"firstName": user.first_name,
                                               @"secondName": user.last_name,
                                               @"gender": [user objectForKey:@"gender"],
                                               @"email": [user objectForKey:@"email"],
                                               @"birthday": user.birthday,
                                               @"location": user.location.name }];
    
    NSDictionary *profile = [self.databaseAccessor retriveUserProfile:@{@"fbId": user.objectID}];
    
    self.accountImage.profileID = [profile objectForKey:@"fbId"];
    self.firstNameLabel.text = [profile objectForKey:@"firstName"];
    self.secondNameLabel.text = [profile objectForKey:@"secondName"];
    self.genderLabel.text = [profile objectForKey:@"gender"];
    self.birthdayLabel.text = [profile objectForKey:@"birthday"];
    self.emailLabel.text = [user objectForKey:@"email"];
    self.locationButton.titleLabel.numberOfLines = 2;
    [self.locationButton setTitle:[profile objectForKey:@"location"] forState:UIControlStateNormal];
}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView
{
    self.accountImage.profileID = nil;
    self.firstNameLabel.text = @"First name";
    self.secondNameLabel.text = @"Second name";
    self.genderLabel.text = @"Gender";
    self.birthdayLabel.text = @"Birthday";
    self.emailLabel.text = @"Email";
    self.locationButton.titleLabel.numberOfLines = 2;
    [self.locationButton setTitle:@"Location" forState:UIControlStateNormal];
}

@end
