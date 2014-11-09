//
//  CustomTableViewCell.m
//  UITableViewCustomCellExample
//
//  Created by Chris Milne on 11/9/14.
//  Copyright (c) 2014 ideo. All rights reserved.
//

#import "CustomTableViewCell.h"

#define ARC4RANDOM_MAX 0x100000000

static void *AVPlayerDemoPlaybackViewControllerStatusObservationContext = &AVPlayerDemoPlaybackViewControllerStatusObservationContext;

@implementation CustomTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(AVPlayer*)setupMoviePlayer:(NSString*)movieName {
    NSLog(@"setting up Movie: %@", movieName);
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:movieName ofType:@"mp4"]];
    self.mPlayer = [AVPlayer playerWithURL:url];
    [self.mPlayer addObserver:self forKeyPath:@"status" options:0 context:AVPlayerDemoPlaybackViewControllerStatusObservationContext];
    self.mPlayer.actionAtItemEnd = AVPlayerActionAtItemEndNone;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playerItemDidReachEnd:)
                                                 name:AVPlayerItemDidPlayToEndTimeNotification
                                               object:[self.mPlayer currentItem]];
    
    return self.mPlayer;
}

- (void)playerItemDidReachEnd:(NSNotification *)notification {
    NSLog(@"playerItemDidReachEnd");
    AVPlayerItem *p = [notification object];
    [p seekToTime:kCMTimeZero];
}

- (void)observeValueForKeyPath:(NSString*) path ofObject:(id)object change:(NSDictionary*)change context:(void*)context {
    NSLog(@"observeValueForKeyPath");
    // Auto play as soon as movie is loaded
    if (self.mPlayer.status == AVPlayerStatusReadyToPlay) {
        [self.mPlaybackView setPlayer:self.mPlayer];
        [self.mPlaybackView setCenter:CGPointMake(self.contentView.frame.size.width/2.0, self.contentView.frame.size.height/2.0)];
        [self playMovie];
    }
}

-(void)playMovie {
    NSLog(@"playMovie");
    //[self startMyMotionDetect];
    //[NSTimer scheduledTimerWithTimeInterval:ROTATION_DELAY target:self selector:@selector(doPhysics) userInfo:nil repeats:YES];
    
    /*
    float randomFloat = floorf(((float)arc4random() / ARC4RANDOM_MAX) * 12.0f);
    CMTime newTime = CMTimeMakeWithSeconds(randomFloat, 30);
    [self.mPlayer seekToTime:newTime];
    */
    [self.mPlayer play];
}

@end
