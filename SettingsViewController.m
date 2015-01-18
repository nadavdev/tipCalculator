//
//  SettingsViewController.m
//  tipCalculator
//
//  Created by Nadav Golbandi on 1/17/15.
//  Copyright (c) 2015 Nadav Golbandi. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipControler;

- (IBAction)defaultTipControler:(id)sender;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int deafultIndex = [defaults integerForKey:@"tip deafult index selection"];
    [self.defaultTipControler setSelectedSegmentIndex:deafultIndex];
    NSLog(@"Load the index from the store");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)defaultTipControler:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:[sender selectedSegmentIndex] forKey:@"tip deafult index selection"];
    [defaults synchronize];
    NSLog(@"index has been stored");
}
@end
