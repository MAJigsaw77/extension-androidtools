package android;

#if (!android && !native && macro)
#error 'extension-androidtools is not supported on your current platform'
#end
import lime.system.JNI;

/**
 * @author Mihai Alexandru (M.A. Jigsaw)
 */
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
	 * Returns `true` If the device have root.
	 * Returns `false` If the device doesn't have root or there`s a error while the process is runned.
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
	 * Returns whether the device is running Android TV.
	 */
	public static function isAndroidTV():Bool
	{
		return JNI.createStaticMethod('org/haxe/lime/GameActivity', 'isAndroidTV', '()Z')();
	}

	/**
	 * Returns whether the device is a Tablet.
	 */
	public static function isTablet():Bool
	{
		return JNI.createStaticMethod('org/haxe/lime/GameActivity', 'isTablet', '()Z')();
	}

	/**
	 * Returns whether the device is a ChromeBook.
	 */
	public static function isChromeBook():Bool
	{
		return JNI.createStaticMethod('org/haxe/lime/GameActivity', 'isChromeBook', '()Z')();
	}

	/**
	 * Returns whether the device is running in Dex Mode.
	 */
	public static function isDeXMode():Bool
	{
		return JNI.createStaticMethod('org/haxe/lime/GameActivity', 'isDeXMode', '()Z')();
	}
}
