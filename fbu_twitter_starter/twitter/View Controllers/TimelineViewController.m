//
//  TimelineViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TimelineViewController.h"
#import "APIManager.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "Tweet.h"
#import "TweetCellTableViewCell.h"
#import "User.h"
#import "UIImageView+AFNetworking.h"
#import "ComposeViewController.h"
#import "Tweet Details View.h"
#import "DateTools.h"

@interface TimelineViewController () <ComposeViewControllerDelegate,UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>
- (IBAction)didTapLogout:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *TableView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;


@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [self.TableView insertSubview:refreshControl atIndex:0];
    self.TableView.dataSource = self;
    self.TableView.delegate = self;
    self.TableView.rowHeight = UITableViewAutomaticDimension;
    
    // Get timeline
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
        if (tweets) {
            NSLog(@"😎😎😎 Successfully loaded home timeline");
            for (Tweet *tweet in tweets) {
                NSString *text = tweet.text;
                NSLog(@"%@", text);
                self.arrayOfTweets = (NSMutableArray *)tweets;
                [self.TableView reloadData];
                [self.refreshControl endRefreshing];
            }
        } else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([[segue identifier] isEqualToString:@"composeSegue"]){
        UINavigationController *navigationController = [segue destinationViewController];
        ComposeViewController *composeController = (ComposeViewController*)navigationController.topViewController;
        composeController.delegate = self;
    }
    if([[segue identifier] isEqualToString:@"detailsSegue"]){
        UINavigationController *navController = [segue destinationViewController];
        Tweet_Details_View *tweetDeetsController = (Tweet_Details_View*)navController.topViewController;
        UITableViewCell *tappedCell = sender;
        NSIndexPath *indexPath = [self.TableView indexPathForCell:tappedCell];
        Tweet *tweet = self.arrayOfTweets[indexPath.row];
        tweetDeetsController.tweet = tweet;
    }
}
- (void)didTweet:(Tweet *)tweet {
 [self.arrayOfTweets insertObject:tweet atIndex:0];
 [self.TableView reloadData];
}

- (IBAction)didTapLogout:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    appDelegate.window.rootViewController = loginViewController;
    [[APIManager shared] logout];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayOfTweets.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    TweetCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetCell"];
    Tweet *tweetI = self.arrayOfTweets[indexPath.item];
    cell.author.text = tweetI.user.name;
    cell.tweetText.text = tweetI.text;
    cell.date.text = tweetI.createdAtString;
    cell.userName.text = tweetI.user.screenName;
    cell.retweet.text = [NSString stringWithFormat: @"%d", tweetI.retweetCount];
    cell.likes.text = [NSString stringWithFormat: @"%d", tweetI.favoriteCount];
    cell.date.text = [tweetI.timeSince shortTimeAgoSinceNow];
    cell.tweetI = tweetI;
    
    NSString *URLString = tweetI.user.profilePicture;
    NSURL *url = [NSURL URLWithString:URLString];
    //NSData *urlData = [NSData dataWithContentsOfURL:url];
    
    cell.profilePic.image = nil;
    [cell.profilePic setImageWithURL:url];
    
    return cell;
}


@end
