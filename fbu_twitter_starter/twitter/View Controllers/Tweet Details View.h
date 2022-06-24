//
//  Tweet Details View.h
//  twitter
//
//  Created by Farida Abdelmoneum on 6/23/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"
NS_ASSUME_NONNULL_BEGIN

@interface Tweet_Details_View : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) Tweet *tweet;
@end

NS_ASSUME_NONNULL_END
