//
//  ComposeViewController.m
//  twitter
//
//  Created by Farida Abdelmoneum on 6/23/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"

@interface ComposeViewController ()
- (IBAction)closeB:(id)sender;
- (IBAction)tweetB:(id)sender;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)tweetB:(id)sender {
}

- (IBAction)closeB:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}
@end
