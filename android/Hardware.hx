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
		if (screenOrientation != 0 && screenOrientation != 1 && screenOrientation != 2)
			return;

		var setRequestedOrientation_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'setRequestedOrientation', '(I)V');
		setRequestedOrientation_jni(screenOrientation);
	}

	/**
	 * Sets the phone brightness, max is 1 and min is 0.
	 */
	public static function setBrightness(brightness:Float):Void
	{
		if (brightness > 1 && brightness < 0)
			return;

		var setbrightness_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'setBrightness', '(F)V');
		setbrightness_jni(brightness);
	}

	/**
	 * Makes the Device to vibrate, the time is in miliseconds btw.
	 */
	public static function vibrate(inputValue:Int):Void
	{
		var vibrate_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'vibrate', '(I)V');
		vibrate_jni(inputValue);
	}

	/**
	 * The Name of the function says what it does.
	 */
	public static function wakeUp():Void
	{
		var wakeUp_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'wakeUp', '()V');
		wakeUp_jni();
	}
}
