using Uno;
using Uno.Collections;
using Fuse;
using Uno.Compiler.ExportTargetInterop;
using global::iOS.UIKit;

[ForeignInclude(Language.Java,
                "android.app.Activity")]
extern (Android)
public class YouTubeThumbnailImpl : Fuse.Android.Controls.Control<YouTubeThumbnail>
{
	global::Android.android.widget.Button _buttonView;
	Java.Object thumb;

	internal sealed override global::Android.android.view.View CreateInternal()
	{
		if (thumb == null)
		{
			thumb = CreateThumb();
			debug_log thumb;
			_buttonView = new global::Android.android.widget.Button(Android.android.app.Activity.GetAppActivity());
			_buttonView.setHorizontallyScrolling(false);
			_buttonView.setEllipsize(null);
		}

		//OnParamChanged(null,null);
		return _buttonView;
	}

	[Foreign(Language.Java)]
	public Java.Object CreateThumb () 
	@{
		Activity a = com.fuse.Activity.getRootActivity();
		return new com.google.android.youtube.player.YouTubeThumbnailView(a);
	@}

	protected override void Attach()
	{
	}

	protected override void Detach()
	{
	}
}

[ForeignInclude(Language.ObjC, "YTPlayerView.h")]
extern (iOS)
public class YouTubeThumbnailImpl : Fuse.iOS.Controls.Control<YouTubeThumbnail> {

	iOS.UIKit.UIView _view;

	internal override UIView CreateInternal()
	{
		if (_view == null)
		{
			ObjC.ID ytid = CreateImpl();
			_view = new iOS.UIKit.UIView(ytid);
		}
		return _view;
	}

	[Foreign(Language.ObjC)]
	public ObjC.ID CreateImpl () 
	@{
		// YTPlayerView *ytpv = [[YTPlayerView alloc] init];
		YTPlayerView *ytpv = [YTPlayerView loadWithVideoId:@"M7lc1UVf-VE"];
		return ytpv;
		// return nil;
	@}

	protected override void Attach()
	{
		// CreateInternal();
	}

	protected override void Detach()
	{
	}
}


extern (!Mobile) public class YouTubeThumbnailImpl : Fuse.iOS.Controls.Control<YouTubeThumbnail> {}