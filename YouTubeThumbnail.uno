using Uno;
using Uno.UX;
using Uno.Collections;
using Fuse;
using Fuse.Controls;
public class YouTubeThumbnail : Panel
{
	public YouTubeThumbnail () {
		var impl = new YouTubeThumbnailImpl();
		Children.Add(impl);
	}
	string _id_val;
	public string Id {
		get {
			return _id_val;
		}
		set {
			var s = _id_val;
			_id_val = value;
			OnIdChanged(value, s);
		} 
	}
	public string Text { get; set; }

	public event ValueChangedHandler<String> IdChanged;

	void OnIdChanged(string value, string orig)
	{
		if (IdChanged != null)
			IdChanged(this, new ValueChangedArgs<string>(value, orig));
	}


	public event ValueChangedHandler<int> StateChanged;

	[UXValueChangedEvent("SetState", "StateChanged")]
	public int State {
	        get;
	        set;
	}

	public void SetState(int value, object origin)
	{
	        State = value;
	        OnStateChanged(value, origin);
	}

	void OnStateChanged(int value, object orig)
	{
		if (StateChanged != null)
			StateChanged(this, new ValueChangedArgs<int>(value, orig));
	}

}
