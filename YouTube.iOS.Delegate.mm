//
//  Created by Bjørn-Olav Solum Strand on 22/03/16.
//
//

#import <Foundation/Foundation.h>
#import "YouTube.iOS.Delegate.h"
@{YouTubeThumbnailImpl:IncludeDirective}

@implementation iOSDelegate

- (void)playerView:(nonnull YTPlayerView *)playerView didChangeToState:(YTPlayerState)state {
	@{YouTubeThumbnailImpl:Of(self.fuseimpl).OnPlayerStateChanged(int):Call(state)};
}

- (void)playerViewDidBecomeReady:(nonnull YTPlayerView *)playerView {
	@{YouTubeThumbnailImpl:Of(self.fuseimpl).OnReady():Call()};
}

@end
