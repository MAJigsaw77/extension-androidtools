package android;

#if (!android && !native && macro)
#error 'extension-androidtools is not supported on your current platform'
#end

#if (openfl < '4.0.0')
import openfl.utils.JNI;
#else
import lime.system.JNI;
#end

/**
 * @author Saw (M.A. Jigsaw)
 */
#if (openfl < '4.0.0')
@:access(openfl.utils.JNI)
#else
@:access(lime.system.JNI)
#end
class Hardware
{
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
	 * Sets the phone brightness, max is 1 and min is 0.
	 */
	public static function setBrightness(brightness:Float):Void
	{
		var setbrightness_set_brightness_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Hardware', 'setBrightness', '(F)V');
		setbrightness_set_brightness_jni(brightness);
	}

	/**
	 * The Name of the function says what it does.
	 */
	public static function setScreenOrientation(screenOrientation:OrientationType):Void
	{
		if (screenOrientation != 0 && screenOrientation != 1 && screenOrientation != 1)
			screenOrientation = 0;

		var setRequestedOrientationNative:Dynamic = JNI.createStaticMethod('org/haxe/extension/Hardware', 'setRequestedOrientation', '(I)V');
		setRequestedOrientationNative(screenOrientation);
	}

	/**
	 * Makes a toast text.
	 */
	public static function toast(text:String, duration:ToastType):Void {
		if (duration != 1 && duration != 2)
			duration = 1;

		var toast_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Hardware', 'toast', '(Ljava/lang/String;I)V');
		toast_jni(text, duration);
	}

	/**
	 * Shares a text.
	 */
	public static function sendText(text:String, textType:IntentTextType):Void {
		var sendText_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Hardware', 'sendText', '(Ljava/lang/String;Ljava/lang/String;)V');
		sendText_jni(text, textType);
	}

	/**
	 * Launches a app.
	 */
	public static function launchApp(packageName:String):Void {
		var launchApp_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Hardware', 'launchApp', '(Ljava/lang/String;)V');
		launchApp_jni(packageName);
	}

	/**
	 * Runs a intent action.
	 */
	public static function runIntent(action:String, url:String):Void {
		var runIntent_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Hardware', 'runIntent', '(Ljava/lang/String;Ljava/lang/String;)V');
		runIntent_jni(action, url);
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

abstract IntentTextType(String) to String from String
{
	public static final PLAIN = 'text/plain';
	public static final RTF = 'text/rtf';
	public static final HTML = 'text/html';
	public static final JSON = 'text/json';
	public static final ANY = "text/*";
}

abstract ToastType(Int) to Int from Int
{
	public static final LENGTH_SHORT = 1;
	public static final LENGTH_LONG = 2;
}

abstract OrientationType(Int) to Int from Int
{
	public static final UNSPECIFIED = 0;
	public static final PORTRAIT = 1;
	public static final LANDSCAPE = 2;
}
