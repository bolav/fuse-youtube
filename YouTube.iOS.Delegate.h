//  Created by Bjørn-Olav Solum Strand on 22/03/16.

#import <Foundation/Foundation.h>
#include <uObjC.Foreign.h>
#import <YTPlayerView.h>

@interface iOSDelegate : NSObject<YTPlayerViewDelegate>

@property (nonatomic, retain) id<UnoObject> fuseimpl;

- (void)playerView:(nonnull YTPlayerView *)playerView didChangeToState:(YTPlayerState)state;
- (void)playerViewDidBecomeReady:(nonnull YTPlayerView *)playerView;

@end
