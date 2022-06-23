//
//  TweetCellTableViewCell.h
//  twitter
//
//  Created by Farida Abdelmoneum on 6/22/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TweetCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *profilePic;
@property (weak, nonatomic) IBOutlet UILabel *author;
@property (weak, nonatomic) IBOutlet UILabel *tweetText;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *reply;
@property (weak, nonatomic) IBOutlet UILabel *retweet;
@property (weak, nonatomic) IBOutlet UILabel *likes;
@property (nonatomic, strong) TweetCellTableViewCell *tweet;
@end

NS_ASSUME_NONNULL_END
