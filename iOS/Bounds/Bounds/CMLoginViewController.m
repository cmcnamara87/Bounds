//
//  CMLoginViewController.m
//  Bounds
//
//  Created by Craig McNamara on 15/09/13.
//  Copyright (c) 2013 Craig McNamara. All rights reserved.
//

#import "CMLoginViewController.h"
#import "CMUserResource.h"
#import "CMPlaceResource.h"

@interface CMLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameLabel;
@property (weak, nonatomic) IBOutlet UITextField *passwordLabel;

@end

@implementation CMLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)login:(id)sender {
    
//    [CMPlaceResource queryWithParameters:@{} success:^(NSMutableArray *resources) {
//    }];
    
    NSLog(@"Trying to login\n\n\n\n\n");
    [CMUserResource loginWithUsername:self.usernameLabel.text password:self.passwordLabel.text success:^(CMUserResource *user) {

    }];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
