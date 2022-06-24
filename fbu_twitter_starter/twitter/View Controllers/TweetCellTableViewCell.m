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
    self.tweetI.favorited = YES;
    self.tweetI.favoriteCount += 1;
    
    [[APIManager shared] favorite:self.tweetI completion:^(Tweet *tweet, NSError *error) {
         if(error){
              NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
         }
         else{
             NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
         }
     }];
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
