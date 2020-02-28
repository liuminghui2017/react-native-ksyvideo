//
//  RCTKSYVideoManager.m
//  RCTKSYVideo
//
//  Created by mayudong on 2017/11/27.
//  Copyright © 2017年 mayudong. All rights reserved.
//

#import "RCTKSYVideoManager.h"
#import "RCTKSYVideo.h"
#import <React/RCTUIManager.h>
#import <React/RCTLog.h>

@implementation RCTKSYVideoManager

RCT_EXPORT_MODULE()

@synthesize bridge = _bridge;

- (UIView *)view
{
    return [[RCTKSYVideo alloc] initWithEventDispatcher:self.bridge.eventDispatcher];
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_VIEW_PROPERTY(src, NSDictionary);
RCT_EXPORT_VIEW_PROPERTY(seek, float);
RCT_EXPORT_VIEW_PROPERTY(timeout, NSDictionary);
RCT_EXPORT_VIEW_PROPERTY(bufferTime, float);
RCT_EXPORT_VIEW_PROPERTY(bufferSize, float);
RCT_EXPORT_VIEW_PROPERTY(resizeMode, NSString);
RCT_EXPORT_VIEW_PROPERTY(repeat, BOOL);
RCT_EXPORT_VIEW_PROPERTY(paused, BOOL);
RCT_EXPORT_VIEW_PROPERTY(muted, BOOL);
RCT_EXPORT_VIEW_PROPERTY(mirror, BOOL);
RCT_EXPORT_VIEW_PROPERTY(volume, float);
RCT_EXPORT_VIEW_PROPERTY(degree, int);
RCT_EXPORT_VIEW_PROPERTY(playInBackground, BOOL);
//RCT_EXPORT_VIEW_PROPERTY(playWhenInactive, BOOL);


RCT_EXPORT_VIEW_PROPERTY(onKSYVideoTouch, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onKSYVideoLoadStart, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onKSYVideoLoad, RCTBubblingEventBlock);

RCT_EXPORT_VIEW_PROPERTY(onKSYVideoError, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onKSYVideoProgress, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onKSYVideoSeek, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onKSYVideoEnd, RCTBubblingEventBlock);

RCT_EXPORT_VIEW_PROPERTY(onKSYReadyForDisplay, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onKSYPlaybackStalled, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onKSYPlaybackResume, RCTBubblingEventBlock);



//供js调用的函数，暂时没有实现
RCT_EXPORT_METHOD(saveBitmap:(nonnull NSNumber*) reactTag){
}
RCT_EXPORT_METHOD(recordVideo:(nonnull NSNumber*) reactTag){
}
RCT_EXPORT_METHOD(stopRecordVideo:(nonnull NSNumber*) reactTag){
}
RCT_EXPORT_METHOD(reload:(nonnull NSNumber*) reactTag withUrl: (NSString *) url) {
      [self.bridge.uiManager addUIBlock:^(RCTUIManager *uiManager, NSDictionary<NSNumber *,UIView *> *viewRegistry) {
        RCTKSYVideo *view = viewRegistry[reactTag];
        if (!view || ![view isKindOfClass:[RCTKSYVideo class]]) {
            RCTLogError(@"Cannot find NativeView with tag #%@", reactTag);
            return;
        }
          [view reload:url];
    }];
}

@end
