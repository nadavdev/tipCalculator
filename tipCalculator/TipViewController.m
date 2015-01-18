//
//  TipViewController.m
//  tipCalculator
//
//  Created by Nadav Golbandi on 1/17/15.
//  Copyright (c) 2015 Nadav Golbandi. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControler;
- (IBAction)onTap:(id)sender;
- (void) updateValues;
-(void) onSettingsButton;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Tip Calculator";
    [self updateValues];
    [self.tipControler setSelectedSegmentIndex:1];
    //adding a setting button
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
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

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void) updateValues{
    float billAmount = [self.billTextField.text floatValue];
    NSArray* tipValues = @[@0.1,@0.15,@0.2];
    
    float tipAmount = billAmount * [tipValues[self.tipControler.selectedSegmentIndex] floatValue ];
    float totalAmount = billAmount + tipAmount;
    //setting the values to the labels
    self.amountLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

-(void) onSettingsButton{
        [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}


- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int deafultIndex = [defaults integerForKey:@"tip deafult index selection"];
    [self.tipControler setSelectedSegmentIndex:deafultIndex];
    [self updateValues];
    NSLog(@"Load the index from the store");
}

//- (void)viewDidAppear:(BOOL)animated {
//    NSLog(@"view did appear");
//}
//
//- (void)viewWillDisappear:(BOOL)animated {
//    NSLog(@"view will disappear");
//}
//
//- (void)viewDidDisappear:(BOOL)animated {
//    NSLog(@"view did disappear");
//}
@end
