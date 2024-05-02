package android.callback;

#if (!android && !native)
#error 'extension-androidtools is not supported on your current platform'
#end
import android.callback.CallBackEvent;
import haxe.Json;
import lime.app.Event;
import lime.system.JNI;

using StringTools;

class CallBack
{
	public static var onActivityResult(default, null):Event<Dynamic->Void>;
	public static var onRequestPermissionsResult(default, null):Event<Dynamic->Void>;

	@:noCompletion
	private static var initialized:Bool = false;

	public static function init():Void
	{
		if (initialized)
			return;

		onActivityResult = new Event<Dynamic->Void>();
		onRequestPermissionsResult = new Event<Dynamic->Void>();

		initCallBack_jni(new CallBackHandler());

		initialized = true;
	}

	@:noCompletion
	private static var initCallBack_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'initCallBack', '(Lorg/haxe/lime/HaxeObject;)V');
}

@:noCompletion
private class CallBackHandler #if (lime >= "8.0.0") implements JNISafety #end
{
	public function new():Void {}

	#if (lime >= "8.0.0")
	@:runOnMainThread
	#end
	public function onActivityResult(content:String):Void
	{
		if (content == null || content.length <= 0)
			return;

		if (CallBack.onActivityResult != null)
			CallBack.onActivityResult.dispatch(Json.parse(content.trim()));
	}

	#if (lime >= "8.0.0")
	@:runOnMainThread
	#end
	public function onRequestPermissionsResult(content:String):Void
	{
		if (content == null || content.length <= 0)
			return;

		if (CallBack.onRequestPermissionsResult != null)
			CallBack.onRequestPermissionsResult.dispatch(Json.parse(content.trim()));
	}
}
