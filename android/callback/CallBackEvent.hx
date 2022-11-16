package android.callback;

import openfl.events.Event;

class CallBackEvent extends Event
{
	public static inline var ACTIVITY_RESULT:String = 'activity_result';
	public static inline var REQUEST_PERMISSIONS_RESULT:String = 'request_permissions_result';

	public var content:Dynamic;

	public function new(type:String, content:Dynamic)
	{
		super(type);

		this.content = content;
	}
}
