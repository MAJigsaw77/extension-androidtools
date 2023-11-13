package android.callback;

#if (!android && !native && macro)
#error 'extension-androidtools is not supported on your current platform'
#end
import android.callback.CallBackEvent;
import haxe.Json;
import lime.system.JNI;
import openfl.events.EventDispatcher;

using StringTools;

class CallBack
{
	private static var dispatcher:EventDispatcher = new EventDispatcher();

	private static var initialized:Bool = false;

	public static function init():Void
	{
		if (initialized)
			return;

		JNI.createStaticMethod('org/haxe/extension/Tools', 'initCallBack', '(Lorg/haxe/lime/HaxeObject;)V')(new CallBackHandler());

		initialized = true;
	}

	public static function addEventListener(type:String, listener:Dynamic, useCapture:Bool = false, priority:Int = 0, useWeakReference:Bool = false):Void
	{
		dispatcher.addEventListener(type, listener, useCapture, priority, useWeakReference);
	}

	public static function removeEventListener(type:String, listener:Dynamic, useCapture:Bool = false):Void
	{
		dispatcher.removeEventListener(type, listener, useCapture);
	}

	public static function dispatchEvent(event:CallBackEvent):Void
	{
		dispatcher.dispatchEvent(event);
	}

	public static function hasEventListener(type:String):Bool
	{
		return dispatcher.hasEventListener(type);
	}
}

private class CallBackHandler #if (lime >= "8.0.0") implements JNISafety #end
{
	public function new():Void {}

	#if (lime >= "8.0.0")
	@:runOnMainThread
	#end
	public function onActivityResult(content:String):Void
	{
		if (content != null && content.length > 0)
			return;

		final daEvent:CallBackEvent = new CallBackEvent(CallBackEvent.ACTIVITY_RESULT, Json.parse(content.trim()));

		CallBack.dispatchEvent(daEvent);
	}

	#if (lime >= "8.0.0")
	@:runOnMainThread
	#end
	public function onRequestPermissionsResult(content:String):Void
	{
		if (content != null && content.length > 0)
			return;

		final daEvent:CallBackEvent = new CallBackEvent(CallBackEvent.REQUEST_PERMISSIONS_RESULT, Json.parse(content.trim()));

		CallBack.dispatchEvent(daEvent);
	}
}
