package android;

#if (!android && !native && macro)
#error 'extension-androidtools is not supported on your current platform'
#end
import lime.system.JNI;
import lime.utils.Log;

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
		return JNI.createStaticMethod('org/haxe/extension/Tools', 'isRooted', '()Z');
	}

	/**
	 * Returns whether the device is running Android TV.
	 */
	public static function isAndroidTV():Bool
	{
		return JNI.createStaticMethod('org/haxe/extension/Tools', 'isAndroidTV', '()Z');
	}

	/**
	 * Returns whether the device is a ChromeBook.
	 */
	public static function isChromeBook():Bool
	{
		return JNI.createStaticMethod('org/haxe/extension/Tools', 'isChromeBook', '()Z');
	}

	/**
	 * Sets brightness of the main window, max is 1 and min is 0.
	 */
	public static function setBrightness(screenBrightness:Float):Void
	{
		if (screenBrightness > 1)
			screenBrightness = 1;
		else if (screenBrightness < 0)
			screenBrightness = 0;

		JNI.createStaticMethod('org/haxe/extension/Tools', 'setBrightness', '(F)V')(screenBrightness);
	}

	/**
	 * Return the brightness of the main window.
	 */
	public static function getBrightness():Float
	{
		return JNI.createStaticMethod('org/haxe/extension/Tools', 'getBrightness', '()F');
	}
}
