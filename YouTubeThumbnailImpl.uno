using Uno;
using Uno.Collections;
using Fuse;
using Uno.Compiler.ExportTargetInterop;

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


extern (!Mobile) public class YouTubeThumbnailImpl : Fuse.iOS.Controls.Control<YouTubeThumbnail> {}