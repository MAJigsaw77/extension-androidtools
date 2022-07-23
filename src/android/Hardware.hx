package android;

#if (!android && !native && macro)
#error "extension-androidtools is not supported on your current platform"
#end

#if (openfl < "4.0.0")
import openfl.utils.JNI;
#else
import lime.system.JNI;
#end

/**
 * @author Saw (M.A. Jigsaw)
 */
class Hardware
{
	public static final ORIENTATION_UNSPECIFIED:Int = 0;
	public static final ORIENTATION_PORTRAIT:Int = 1;
	public static final ORIENTATION_LANDSCAPE:Int = 2;

	/**
	 * Makes the Phone vibrate, the time is in miliseconds btw.
	 */
	public static function vibrate(inputValue:Int):Void
	{
		var vibrate_jni:Dynamic = JNI.createStaticMethod("android/haxe/extensions/Hardware", "vibrate", "(I)V");
		vibrate_jni(inputValue);
	}

	/**
	 * The Name of the function says what it does.
	 */
	public static function wakeUp():Void
	{
		var wakeUp_jni:Dynamic = JNI.createStaticMethod("android/haxe/extensions/Hardware", "wakeUp", "()V");
		wakeUp_jni();
	}

	/**
	 * Sets the phone brightness, max is 1 and min is 0.
	 */
	public static function setBrightness(brightness:Float):Void
	{
		var setbrightness_set_brightness_jni:Dynamic = JNI.createStaticMethod("android/haxe/extensions/Hardware", "setBrightness", "(F)V");
		setbrightness_set_brightness_jni(brightness);
	}

	/**
	 * The Name of the function says what it does.
	 */
	public static function setScreenOrientation(screenOrientation:Int):Void
	{
		var setRequestedOrientationNative:Dynamic = JNI.createStaticMethod("android/haxe/extensions/Hardware", "setRequestedOrientation", "(I)V");
		setRequestedOrientationNative(screenOrientation);
	}

	/**
	 * Returns the full screen width.
	 */
	public static function getScreenWidth():Int
	{
		var get_screen_width_jni:Dynamic = JNI.createStaticMethod("android/haxe/extensions/Hardware", "getScreenWidth", "()I");
		return get_screen_width_jni();
	}

	/**
	 * Returns the full screen height.
	 */
	public static function getScreenHeight():Int
	{
		var get_screen_height_jni:Dynamic = JNI.createStaticMethod("android/haxe/extensions/Hardware", "getScreenHeight", "()I");
		return get_screen_height_jni();
	}
}
