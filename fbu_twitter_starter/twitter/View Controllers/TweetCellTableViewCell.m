//
//  TweetCellTableViewCell.m
//  twitter
//
//  Created by Farida Abdelmoneum on 6/22/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "TweetCellTableViewCell.h"
#import "Tweet.h"
#import "TimelineViewController.h"
#import "APIManager.h"
//#import "DateTools.h"

@implementation TweetCellTableViewCell
- (IBAction)didTapFavorite:(id)sender {
    if(self.tweetI.favorited){
        self.tweetI.favorited = NO;
        self.tweetI.favoriteCount -= 1;
        [self.favButton setImage:[UIImage imageNamed:@"favor-icon"] forState:UIControlStateNormal];
    }else{
        self.tweetI.favorited = YES;
        self.tweetI.favoriteCount += 1;
        [self.favButton setImage:[UIImage imageNamed:@"favor-icon-red"] forState:UIControlStateNormal];
    }
  [[APIManager shared] favorite:self.tweetI completion:^(Tweet *tweet, NSError *error) {
         if(error){
              NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
         }
         else{
             NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
         }
     }];
    
    [self refreshData];
}
- (IBAction)didTapRetweet:(id)sender {
    if(self.tweetI.retweeted){
        self.tweetI.retweeted = NO;
        self.tweetI.retweetCount -= 1;
        [self.retweetedButton setImage:[UIImage imageNamed:@"retweet-icon"] forState:UIControlStateNormal];
    }else{
        self.tweetI.retweeted = YES;
        self.tweetI.retweetCount += 1;
        [self.retweetedButton setImage:[UIImage imageNamed:@"retweet-icon-green"] forState:UIControlStateNormal];
    }
  [[APIManager shared] favorite:self.tweetI completion:^(Tweet *tweet, NSError *error) {
         if(error){
              NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
         }
         else{
             NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
         }
     }];
    
    [self refreshData];
}

-(void)refreshData{
    self.likes.text = [NSString stringWithFormat:@"%d", self.tweetI.favoriteCount];
    self.retweet.text = [NSString stringWithFormat:@"%d", self.tweetI.retweetCount];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
