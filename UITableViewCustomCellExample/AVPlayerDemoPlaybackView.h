//
//  AVPlayerDemoPlaybackView.h
//  MultipleAVMoviePlayers
//
//  Created by Chris Milne on 11/6/14.
//  Copyright (c) 2014 ideo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AVPlayer;

@interface AVPlayerDemoPlaybackView : UIView

@property (nonatomic, retain) AVPlayer* player;

- (void)setPlayer:(AVPlayer*)player;
- (void)setVideoFillMode:(NSString *)fillMode;

@end
