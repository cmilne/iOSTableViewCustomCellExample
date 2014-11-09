//
//  CustomTableViewCell.h
//  UITableViewCustomCellExample
//
//  Created by Chris Milne on 11/9/14.
//  Copyright (c) 2014 ideo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVPlayerDemoPlaybackView.h"
#import <AVFoundation/AVFoundation.h>

@interface CustomTableViewCell : UITableViewCell

@property (strong, nonatomic) AVPlayer* mPlayer;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet AVPlayerDemoPlaybackView *mPlaybackView;

- (void)observeValueForKeyPath:(NSString*) path ofObject:(id)object change:(NSDictionary*)change context:(void*)context;
- (AVPlayer*)setupMoviePlayer:(NSString*)movieName;
- (void)playerItemDidReachEnd:(NSNotification *)notification;

@end
