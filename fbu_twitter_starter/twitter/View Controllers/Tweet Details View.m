//
//  Tweet Details View.m
//  twitter
//
//  Created by Farida Abdelmoneum on 6/23/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "Tweet Details View.h"
#import "Tweet.h"
#import "TweetCellTableViewCell.h"
#import "UIImageView+AFNetworking.h"
//#import "TimelineViewController.h"
@interface Tweet_Details_View ()
@property (weak, nonatomic) IBOutlet UILabel *tweetTedxt;
@property (weak, nonatomic) IBOutlet UILabel *userN;
@property (weak, nonatomic) IBOutlet UILabel *authorN;
@property (weak, nonatomic) IBOutlet UIImageView *profPic;

@end

@implementation Tweet_Details_View

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //self.tweetTedxt.text = tweet.text;
    //self.userN.text = tweet.user.screenName;
    //self.authorN.text = tweet.user.name;
    
}
- (IBAction)closeButton:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
