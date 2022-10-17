package android;

#if (!android && !native && macro)
#error 'extension-androidtools is not supported on your current platform'
#end
import lime.system.JNI;

/**
 * @author Mihai Alexandru (M.A. Jigsaw)
 */
#if !debug
@:fileXml('tags="haxe,release"')
@:noDebug
#end
@:access(lime.system.JNI)
class Hardware
{
	/**
	 * The Name of the function says what it does.
	 * 
	 * PORTRAIT = 0;
	 * LANDSCAPE = 1;
	 * UNSPECIFIED = 2;
	 */
	public static function setScreenOrientation(screenOrientation:Int):Void
	{
		var setRequestedOrientationNative:Dynamic = JNI.createStaticMethod('org/haxe/extension/Hardware', 'setRequestedOrientation', '(I)V');
		setRequestedOrientationNative(screenOrientation);
	}

	/**
	 * Sets the phone brightness, max is 1 and min is 0.
	 */
	public static function setBrightness(brightness:Float):Void
	{
		var setbrightness_set_brightness_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Hardware', 'setBrightness', '(F)V');
		setbrightness_set_brightness_jni(brightness);
	}

	/**
	 * Makes the Phone vibrate, the time is in miliseconds btw.
	 */
	public static function vibrate(inputValue:Int):Void
	{
		var vibrate_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Hardware', 'vibrate', '(I)V');
		vibrate_jni(inputValue);
	}

	/**
	 * The Name of the function says what it does.
	 */
	public static function wakeUp():Void
	{
		var wakeUp_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Hardware', 'wakeUp', '()V');
		wakeUp_jni();
	}

	/**
	 * Returns the full screen width.
	 */
	public static function getScreenWidth():Int
	{
		var get_screen_width_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Hardware', 'getScreenWidth', '()I');
		return get_screen_width_jni();
	}

	/**
	 * Returns the full screen height.
	 */
	public static function getScreenHeight():Int
	{
		var get_screen_height_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Hardware', 'getScreenHeight', '()I');
		return get_screen_height_jni();
	}
}
