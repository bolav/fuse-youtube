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
			debug_log "Thumb is:";
			debug_log thumb;
			_thumbview = new NativeView(Android.android.app.Activity.GetAppActivity(), thumb);
			// _thumbview = new global::Android.android.widget.Button(Android.android.app.Activity.GetAppActivity());
		}

		//OnParamChanged(null,null);
		return _thumbview;
	}

	/*
	+
+dependencies {
+	compile files('src/main/libs/YouTubeAndroidPlayerApi.jar')
+}
	*/

	[Require("Gradle.Dependencies.Compile","files('src/main/libs/YouTubeAndroidPlayerApi.jar')")]
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

[ForeignInclude(Language.ObjC, "YouTube.iOS.Delegate.h")]
[Require("Source.Import","YTPlayerView.h")]
extern (iOS)
public class YouTubeThumbnailImpl : Fuse.iOS.Controls.Control<YouTubeThumbnail> {

	iOS.UIKit.UIView _view;
	ObjC.ID ytid;
	ObjC.ID _delegate;

	internal override UIView CreateInternal()
	{
		if (_view == null)
		{
			_delegate = CreateDelegate();
			ytid = CreateView();
			SetDelegate(ytid, _delegate);
			_view = new iOS.UIKit.UIView(ytid);
		}
		return _view;
	}

	[Foreign(Language.ObjC)]
	public ObjC.ID CreateDelegate ()
	@{
		iOSDelegate *d = [[iOSDelegate alloc] init];
		[d setFuseimpl:_this];
		return d;
	@}

	[Foreign(Language.ObjC)]
	public ObjC.ID CreateView ()
	@{
		YTPlayerView *ytpv = [[YTPlayerView alloc] init];
		return ytpv;
	@}

	[Foreign(Language.ObjC)]
	public void SetDelegate (ObjC.ID ytp, ObjC.ID del)
	@{
		[ytp setDelegate:del];
	@}

	[Require("Entity","YouTubeThumbnailImpl.OnReady()")]
	[Require("Entity","YouTubeThumbnailImpl.OnPlayerStateChanged(int)")]
	[Foreign(Language.ObjC)]
	public void LoadVideoId (ObjC.ID ytpv, string videoid)
	@{
		[ytpv loadWithVideoId:videoid];
	@}

	[Foreign(Language.ObjC)]
	public void Play (ObjC.ID ytpv)
	@{
		[ytpv playVideo];
	@}

	protected override void Attach()
	{
		CreateInternal();
		LoadVideoId(ytid, SemanticControl.Id);
		SemanticControl.IdChanged += OnIdChanged;
		SemanticControl.StateChanged += OnStateChanged;

	}

	protected override void Detach()
	{
		SemanticControl.IdChanged -= OnIdChanged;
		SemanticControl.StateChanged -= OnStateChanged;
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

	void OnPlayerStateChanged(int state)
	{
		debug_log("State changed to  " +state);
		SemanticControl.SetState(state, this);
	}

	void OnReady()
	{
		SemanticControl.SetState(101, this);
		// Play(ytid);
	}

	void OnStateChanged(object sender, ValueChangedArgs<int> args)
	{
		if (args.Origin != this) {
			if (args.Value == 1002) {
				Play(ytid);
			}
			else {
				debug_log("We should change player state to " +args.Value);
			}
		}
	}


}


extern (!Mobile) public class YouTubeThumbnailImpl : Fuse.iOS.Controls.Control<YouTubeThumbnail> {}