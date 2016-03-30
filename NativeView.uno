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

		extern "INIT_JNI;";
		extern "CLASS_INIT(@{_javaClass},@{_Init():Call()});";
		extern "CACHE_METHOD(@{Button_24840_ID_c},@{_javaClass},\"<init>\",\"(Landroid/content/Context;)V\",GetMethodID,\"Id for fallback method android.widget.Button.<init> could not be cached\",71);";
		extern "jobject _obArg0 = ((!$0) ? NULL : @{Android.Base.Wrappers.IJWrapper:Of($0)._GetJavaObject():Call()});";
		extern "jobject result;";
		extern "jobject _tmp;";
		extern "_tmp = U_JNIVAR->NewObject(@{_javaClass}, @{Button_24840_ID_c}, _obArg0);";
		extern "@{Android.Base.JNI.CheckException(Android.Base.Primitives.JNIEnvPtr):Call(U_JNIVAR)};";
		_javaObject = extern<ujobject> "NEW_GLOBAL_REF(jobject,_tmp);";
		extern "jobject obj = @{Android.Base.Wrappers.IJWrapper:Of($1)._GetJavaObject():Call()};";
		_javaObject = extern<ujobject> "NEW_GLOBAL_REF(jobject,obj);";
		extern "U_JNIVAR->DeleteLocalRef(_tmp);";

	}
}
