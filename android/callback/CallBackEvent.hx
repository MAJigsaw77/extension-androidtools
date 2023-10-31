package android.callback;

import openfl.events.Event;

class CallBackEvent extends Event
{
	public static inline final ACTIVITY_RESULT:String = 'activity_result';
	public static inline final REQUEST_PERMISSIONS_RESULT:String = 'request_permissions_result';

	public var content:Dynamic;

	public function new(type:String, content:Dynamic):Void
	{
		super(type);

		this.content = content;
	}
}
