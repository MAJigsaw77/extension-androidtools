package android;

import lime.system.JNI;

/**
 * Some functions (not all) ported from a java class to haxe using jni
 *
 * @author 	Saw (M.A. Jigsaw)
 */
class Hardware
{
	public static inline var ORIENTATION_UNSPECIFIED:Int = 0;
	public static inline var ORIENTATION_PORTRAIT:Int = 1;
	public static inline var ORIENTATION_LANDSCAPE:Int = 2;

	/**
	 * Makes the Phone vibrate, the time is in miliseconds btw.
	 */
	public static function vibrate(inputValue:Int):Void
	{
		var vibrate_jni = JNI.createStaticMethod("org/haxe/extension/Hardware", "vibrate", "(I)V");
		vibrate_jni(inputValue);
	}

	/**
	 * The Name of the function says what it does.
	 */
	public static function wakeUp():Void
	{
		var wakeUp_jni = JNI.createStaticMethod("org/haxe/extension/Hardware", "wakeUp", "()V");
		wakeUp_jni();
	}

	/**
	 * Sets the phone brightness, max is 1 and min is 0.
	 */
	public static function setBrightness(brightness:Float):Void
	{
		var setbrightness_set_brightness_jni = JNI.createStaticMethod("org/haxe/extension/Hardware", "setBrightness", "(F)V");
		setbrightness_set_brightness_jni(brightness);
	}

	/**
	 * The Name of the function says what it does.
	 */
	public static function setScreenOrientation(screenOrientation:Int):Void
	{
		var setRequestedOrientationNative = JNI.createStaticMethod("org/haxe/extension/Hardware", "setRequestedOrientation", "(I)V");
		setRequestedOrientationNative(screenOrientation);
	}

	/**
	 * Returns the full screen width.
	 */
	public static function getScreenWidth():Int
	{
		var get_screen_width_jni = JNI.createStaticMethod("org/haxe/extension/Hardware", "getScreenWidth", "()I");
		return get_screen_width_jni();
	}

	/**
	 * Returns the full screen height.
	 */
	public static function getScreenHeight():Int
	{
		var get_screen_height_jni = JNI.createStaticMethod("org/haxe/extension/Hardware", "getScreenHeight", "()I");
		return get_screen_height_jni();
	}
}
