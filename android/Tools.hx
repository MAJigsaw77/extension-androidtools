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
	 * Shares a text.
	 */
	public static function sendText(text:String, textType:String):Void
	{
		var sendText_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'sendText', '(Ljava/lang/String;Ljava/lang/String;)V');
		sendText_jni(text, textType);
	}

	/**
	 * Launches a app.
	 */
	public static function launchApp(packageName:String):Void
	{
		var launchApp_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'launchApp', '(Ljava/lang/String;)V');
		launchApp_jni(packageName);
	}

	/**
	 * Sets the phone brightness, max is 1 and min is 0.
	 */
	public static function setBrightness(brightness:Float):Void
	{
		if (brightness > 1)
			brightness = 1;
		else if (brightness < 0)
			brightness = 0;

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
