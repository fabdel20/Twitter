//
//  ComposeViewController.m
//  twitter
//
//  Created by Farida Abdelmoneum on 6/23/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "Tweet.h"
#import "TimelineViewController.h"
#import "APIManager.h"
#import "AFNetworking/UIImageView+AFNetworking.h"
@interface ComposeViewController () <UITextViewDelegate>
- (IBAction)closeB:(id)sender;
- (IBAction)tweetB:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *tweetText;

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
    [[APIManager shared]postStatusWithText:@"This is my tweet 😀" completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error composing Tweet: %@", error.localizedDescription);
            }
            else{
                [self.delegate didTweet:tweet];
                [self dismissViewControllerAnimated:true completion:nil];
                NSLog(@"Compose Tweet Success!");
            }
        }];
}

- (IBAction)closeB:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}
@end
