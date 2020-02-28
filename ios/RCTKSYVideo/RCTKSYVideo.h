//
//  RCTKSYVideo.h
//  RCTKSYVideo
//
//  Created by mayudong on 2017/11/27.
//  Copyright © 2017年 mayudong. All rights reserved.
//

#import <React/RCTView.h>
#import <UIKit/UIKit.h>

@class RCTEventDispatcher;

@interface RCTKSYVideo : UIView

@property (nonatomic, copy) RCTBubblingEventBlock onKSYVideoLoadStart;
@property (nonatomic, copy) RCTBubblingEventBlock onKSYVideoLoad;

@property (nonatomic, copy) RCTBubblingEventBlock onKSYVideoError;
@property (nonatomic, copy) RCTBubblingEventBlock onKSYVideoProgress;
@property (nonatomic, copy) RCTBubblingEventBlock onKSYVideoSeek;
@property (nonatomic, copy) RCTBubblingEventBlock onKSYVideoEnd;
@property (nonatomic, copy) RCTBubblingEventBlock onKSYVideoTouch;

@property (nonatomic, copy) RCTBubblingEventBlock onKSYReadyForDisplay;
@property (nonatomic, copy) RCTBubblingEventBlock onKSYPlaybackStalled;
@property (nonatomic, copy) RCTBubblingEventBlock onKSYPlaybackResume;

-(void) reload: (NSString *)url;
- (instancetype)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher NS_DESIGNATED_INITIALIZER;

@end
