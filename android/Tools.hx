package android;

#if (!android && !native && macro)
#error 'extension-androidtools is not supported on your current platform'
#end
import lime.system.JNI;

class Tools
{
	/**
	 * Adds the security flag to application's window.
	 */
	public static inline function enableAppSecure():Void
	{
		enableAppSecure_jni();
	}

	/**
	 * Clears the security flag from application's window.
	 */
	public static inline function disableAppSecure():Void
	{
		disableAppSecure_jni();
	}

	/**
	 * Launches a app by the `packageName`.
	 */
	public static inline function launchPackage(packageName:String, requestCode:Int = 1):Void
	{
		launchPackage_jni(packageName, requestCode);
	}

	/**
	 * Launches a app by the `packageName`.
	 */
	public static inline function showAlertDialog(title:String, message:String):Void
	{
		showAlertDialog_jni(title, message);
	}

	/**
	 * @returns `true` If the device have root.
	 */
	public static inline function isRooted():Bool
	{
		return isRooted_jni();
	}

	/**
	 * @returns `true` If the device has Dolby Atmos.
	 */
	public static inline function isDolbyAtmos():Bool
	{
		return isDolbyAtmos_jni();
	}

	/**
	 * Shows a minimal notification with a title and message.
	 */
	public static inline function showNotification(title:String, message:String, ?channelID:String = 'unknown_channel', ?channelName:String = 'Unknown Channel', ?ID:Int = 1):Void
	{
		showNotification_jni(title, message, channelID, channelName, ID);
	}

	/**
	 * Sets Activity's Title by the `title`.
	 */
	public static inline function setActivityTitle(title:String):Bool
	{
		return setActivityTitle_jni(title);
	}

	/**
	 * Minimizes app's window.
	 */
	public static inline function minimizeWindow():Void
	{
		minimizeWindow_jni();
	}

	/**
	 * @returns whether the device is running Android TV.
	 */
	public static inline function isAndroidTV():Bool
	{
		return isAndroidTV_jni();
	}

	/**
	 * @returns whether the device is a Tablet.
	 */
	public static inline function isTablet():Bool
	{
		return isTablet_jni();
	}

	/**
	 * @returns whether the device is a ChromeBook.
	 */
	public static inline function isChromeBook():Bool
	{
		return isChromeBook_jni();
	}

	/**
	 * @returns whether the device is running in Dex Mode.
	 */
	public static inline function isDeXMode():Bool
	{
		return isDexMode_jni();
	}

	@:noCompletion private static var enableAppSecure_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'enableAppSecure', '()V');
	@:noCompletion private static var disableAppSecure_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'disableAppSecure', '()V');
	@:noCompletion private static var launchPackage_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'launchPackage', '(Ljava/lang/String;I)V');
	@:noCompletion private static var showAlertDialog_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'showAlertDialog', '(Ljava/lang/String;Ljava/lang/String;)V');
	@:noCompletion private static var isRooted_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'isRooted', '()Z');
	@:noCompletion private static var isDolbyAtmos_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'isDolbyAtmos', '()Z');
	@:noCompletion private static var showNotification_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'showNotification', '(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V');
	@:noCompletion private static var setActivityTitle_jni:Dynamic = JNI.createStaticMethod('org/haxe/lime/GameActivity', 'setActivityTitle', '(Ljava/lang/String;)Z');
	@:noCompletion private static var minimizeWindow_jni:Dynamic = JNI.createStaticMethod('org/haxe/lime/GameActivity', 'minimizeWindow', '()V');
	@:noCompletion private static var isAndroidTV_jni:Dynamic = JNI.createStaticMethod('org/haxe/lime/GameActivity', 'isAndroidTV', '()Z');
	@:noCompletion private static var isTablet_jni:Dynamic = JNI.createStaticMethod('org/haxe/lime/GameActivity', 'isTablet', '()Z');
	@:noCompletion private static var isChromeBook_jni:Dynamic = JNI.createStaticMethod('org/haxe/lime/GameActivity', 'isChromeBook', '()Z');
	@:noCompletion private static var isDexMode_jni:Dynamic = JNI.createStaticMethod('org/haxe/lime/GameActivity', 'isDeXMode', '()Z');
}
