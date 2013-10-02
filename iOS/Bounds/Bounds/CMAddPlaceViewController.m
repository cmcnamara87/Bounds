//
//  CMAddPlaceViewController.m
//  Bounds
//
//  Created by Craig McNamara on 1/10/13.
//  Copyright (c) 2013 Craig McNamara. All rights reserved.
//

#import "CMAddPlaceViewController.h"
#import "CMPlaceResource.h"

@interface CMAddPlaceViewController ()

@end

@implementation CMAddPlaceViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addPlace:(id)sender {
    CMPlaceResource *place = [CMPlaceResource createWithData:@{@"name": @"test place", @"latitude":@1, @"longitude":@1, @"radius":@100}];
    [place save:^{
        NSLog(@"place saved");
    }];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
