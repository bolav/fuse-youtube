using Uno;
using Uno.UX;
using Uno.Collections;
using Fuse;
using Uno.Compiler.ExportTargetInterop;
using global::iOS.UIKit;

[ForeignInclude(Language.Java,
                "android.app.Activity")]
extern (Android)
public class YouTubeThumbnailImpl : Fuse.Android.Controls.Control<YouTubeThumbnail>
{
	global::Android.android.view.View _thumbview;
	Java.Object thumb;

	internal sealed override global::Android.android.view.View CreateInternal()
	{
		if (thumb == null)
		{
			thumb = CreateThumb();
			debug_log thumb;
			_thumbview = (global::Android.android.view.View)thumb;
		}

		//OnParamChanged(null,null);
		return _thumbview;
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
	ObjC.ID ytid;

	internal override UIView CreateInternal()
	{
		if (_view == null)
		{
			ytid = CreateView();
			_view = new iOS.UIKit.UIView(ytid);
		}
		return _view;
	}

	[Foreign(Language.ObjC)]
	public ObjC.ID CreateView ()
	@{
		YTPlayerView *ytpv = [[YTPlayerView alloc] init];
		return ytpv;
	@}

	[Foreign(Language.ObjC)]
	public void LoadVideoId (ObjC.ID ytpv, string videoid)
	@{
		[ytpv loadWithVideoId:videoid];
	@}

	protected override void Attach()
	{
		CreateInternal();
		LoadVideoId(ytid, SemanticControl.Id);
		SemanticControl.IdChanged += OnIdChanged;

	}

	protected override void Detach()
	{
		SemanticControl.IdChanged -= OnIdChanged;
	}

	public override float2 GetMarginSize( LayoutParams lp ) {
		return float2(30);
	}

	void OnIdChanged(object sender, ValueChangedArgs<string> args)
	{
		if (args.Value != null) {
			LoadVideoId(ytid, args.Value);
		}
	}


}


extern (!Mobile) public class YouTubeThumbnailImpl : Fuse.iOS.Controls.Control<YouTubeThumbnail> {}