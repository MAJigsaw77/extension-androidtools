package android;

#if (!android && !native && macro)
#error 'extension-androidtools is not supported on your current platform'
#end
import lime.system.JNI;

class Tools
{
	/**
	 * Launches a app by the `packageName`.
	 */
	public static function launchPackage(packageName:String, requestCode:Int = 1):Void
	{
		JNI.createStaticMethod('org/haxe/extension/Tools', 'launchPackage', '(Ljava/lang/String;I)V')(packageName, requestCode);
	}

	/**
	 * @returns `true` If the device have root.
	 */
	public static function isRooted():Bool
	{
		return JNI.createStaticMethod('org/haxe/extension/Tools', 'isRooted', '()Z')();
	}

	/**
	 * Sets Activity's Title by the `title`.
	 */
	public static function setActivityTitle(title:String):Bool
	{
		return JNI.createStaticMethod('org/haxe/lime/GameActivity', 'setActivityTitle', '(Ljava/lang/String;)Z')(title);
	}

	/**
	 * Minimizes app's window.
	 */
	public static function minimizeWindow():Void
	{
		JNI.createStaticMethod('org/haxe/lime/GameActivity', 'minimizeWindow', '()V')();
	}

	/**
	 * @returns whether the device is running Android TV.
	 */
	public static function isAndroidTV():Bool
	{
		return isAndroidTV_jni();
	}

	/**
	 * @returns whether the device is a Tablet.
	 */
	public static function isTablet():Bool
	{
		return isTablet_jni();
	}

	/**
	 * @returns whether the device is a ChromeBook.
	 */
	public static function isChromeBook():Bool
	{
		return isChromeBook_jni();
	}

	/**
	 * @returns whether the device is running in Dex Mode.
	 */
	public static function isDeXMode():Bool
	{
		return isDexMode_jni();
	}

	private static var isAndroidTV_jni:Dynamic = JNI.createStaticMethod('org/haxe/lime/GameActivity', 'isAndroidTV', '()Z');
	private static var isTablet_jni:Dynamic = JNI.createStaticMethod('org/haxe/lime/GameActivity', 'isTablet', '()Z');
	private static var isChromeBook_jni:Dynamic = JNI.createStaticMethod('org/haxe/lime/GameActivity', 'isChromeBook', '()Z');
	private static var isDexMode_jni:Dynamic = JNI.createStaticMethod('org/haxe/lime/GameActivity', 'isDeXMode', '()Z');
}
