package android;

#if (!android && !native && macro)
#error 'extension-androidtools is not supported on your current platform'
#end
import lime.system.JNI;
import openfl.events.Event;
import openfl.events.EventDispatcher;
import haxe.Json;
import haxe.Timer;

/**
 * @author Mihai Alexandru (M.A. Jigsaw)
 */
#if !debug
@:fileXml('tags="haxe,release"')
@:noDebug
#end
@:access(lime.system.JNI)
class CallBack
{
	private static var dispatcher:EventDispatcher = new EventDispatcher();
	private static var cleanUpJobs:Array<Dynamic> = [];
	private static var initialized:Bool = false;

	public static function init():Void
	{
		if (initialized)
			return;

		var initCallBack_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'initCallBack', '(Lorg/haxe/lime/HaxeObject;)V');
		initCallBack_jni(new CallBackHandler());

		initialized = true;
	}

	public static function cleanUp():Void
	{		
		for (job in cleanUpJobs)
			Reflect.callMethod(null, job, []);

		cleanUpJobs = [];
		initialized = false;
	}

	public static function addEventListener(type:String, listener:Dynamic, useCapture:Bool = false, priority:Int = 0, useWeakReference:Bool = false):Void
	{
		dispatcher.addEventListener(type, listener, useCapture, priority, useWeakReference);
		cleanUpJobs.push(dispatcher.removeEventListener.bind(type, listener, useCapture));
	}

	public static function removeEventListener(type:String, listener:Dynamic, capture:Bool = false):Void
		dispatcher.removeEventListener(type, listener, capture);

	public static function dispatchEvent(event:Event):Bool
	{
		Timer.delay(function()
		{
			dispatcher.dispatchEvent(event);
		}, 0);

		return true;
	}

	public static function hasEventListener(type:String):Bool
		return dispatcher.hasEventListener(type);
}

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

class CallBackHandler
{
	public function new() {}

	public function onActivityResult(content:String):Void
	{
		var daEvent:CallBackEvent = new CallBackEvent(CallBackEvent.ACTIVITY_RESULT, Json.parse(content));		
		CallBack.dispatchEvent(daEvent);
	}

	public function onRequestPermissionsResult(content:String):Void
	{
		var daEvent:CallBackEvent = new CallBackEvent(CallBackEvent.REQUEST_PERMISSIONS_RESULT, Json.parse(content));		
		CallBack.dispatchEvent(daEvent);
	}
}

