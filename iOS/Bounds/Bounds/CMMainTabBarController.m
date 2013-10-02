//
//  CMMainTabBarController.m
//  Bounds
//
//  Created by Craig McNamara on 23/09/13.
//  Copyright (c) 2013 Craig McNamara. All rights reserved.
//

#import "CMMainTabBarController.h"
#import "CMLoginManager.h"

@interface CMMainTabBarController ()

@end

@implementation CMMainTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated {
    NSLog(@"\n\n TAB BAR APPEARED");
    if(![[CMLoginManager loginManager] currentUser]) {
        [self performSegueWithIdentifier:@"Show Login" sender:self];
    }

    [super viewDidAppear:animated];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
