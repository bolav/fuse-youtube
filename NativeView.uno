using Uno;
using Uno.Collections;
using Fuse;
using Android.Base.Primitives;
public extern(Android) class NativeView : Android.android.view.View
{
	ujobject view;
	Java.Object viewObject;
	public NativeView(Android.android.content.Context arg0, Java.Object view) : base (Android.Base.JNI.GetDefaultObject(),Android.Base.JNI.GetDefaultType(), false, false) {
		viewObject = view;
	}

	public override void setOnFocusChangeListener(Android.android.view.ViewDLROnFocusChangeListener arg0) 
	{
	    // setOnFocusChangeListener_IMPL_22828(_subclassed, _javaObject, arg0);
	    debug_log "CAllign my class!!!";
	}
}
