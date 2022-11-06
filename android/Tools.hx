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
class Tools
{
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
	public static function vibrate(duration:Int, period:Int = 0):Void
	{
		var vibrate_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'vibrate', '(II)V');
		vibrate_jni(duration, period);
	}
}
