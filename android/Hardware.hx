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
	 */
	public static function setScreenOrientation(screenOrientation:Int):Void
	{
		var setRequestedOrientationNative:Dynamic = JNI.createStaticMethod('org/haxe/extension/Hardware', 'setRequestedOrientation', '(I)V');
		setRequestedOrientationNative(screenOrientation);
	}

	/**
	 * Makes a toast text.
	 */
	public static function toast(text:String, duration:Int):Void {
		var toast_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Hardware', 'toast', '(Ljava/lang/String;I)V');
		toast_jni(text, duration);
	}

	/**
	 * Shares a text.
	 */
	public static function sendText(text:String, textType:String):Void {
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

enum abstract IntentTextType(String) to String from String
{
	public static final PLAIN = 'text/plain';
	public static final RTF = 'text/rtf';
	public static final HTML = 'text/html';
	public static final JSON = 'text/json';
	public static final ANY = "text/*";
}

enum abstract ToastType(Int) to Int from Int
{
	public static final LENGTH_SHORT = 0;
	public static final LENGTH_LONG = 1;
}

enum abstract OrientationType(Int) to Int from Int
{
	public static final PORTRAIT = 0;
	public static final LANDSCAPE = 1;
	public static final UNSPECIFIED = 2;
}
