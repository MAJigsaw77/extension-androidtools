package android;

#if android
import lime.system.JNI;
#end

class Hardware {
	#if android
	public static function vibrate(inputValue:Int)
	{
		var vibrate_jni = JNI.createStaticMethod ("org.haxe.extension.Tools", "vibrate", "(I)V");
		vibrate_jni(inputValue);
	}

	public static function wakeUp():Void
	{
		var wakeUp_jni = JNI.createStaticMethod ("org.haxe.extension.Tools", "wakeUp", "()V");
		wakeUp_jni();
	}

	public static function getScreenWidth():Int
	{
		var get_screen_width_jni = JNI.createStaticMethod ("org.haxe.extension.Tools", "getScreenWidth", "()I");
		return get_screen_width_jni();
	}

	public static function getScreenHeight():Int
	{
		var get_screen_height_jni = JNI.createStaticMethod ("org.haxe.extension.Tools", "getScreenHeight", "()I");
		return get_screen_height_jni();
	}
	#end
}
