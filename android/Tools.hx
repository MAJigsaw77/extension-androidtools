package android;

#if (!android && !native)
#error 'extension-androidtools is not supported on your current platform'
#end
import android.Permissions;
import haxe.io.Path;
import lime.app.Event;
import lime.system.JNI;
import lime.utils.Log;

class Tools
{
	/**
	 * Prompt the user to install a specific APK file.
	 */
	public static function installPackage(path:String):Void
	{
		if (!installPackage_jni(path))
			Log.warn('"REQUEST_INSTALL_PACKAGES" permission and "Install apps from external sources" setting must be granted to this app in order to install a ${Path.extension(path).toUpperCase()} file.');
	}

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
	public static function showAlertDialog(title:String, message:String, ?positiveButton:ButtonData, ?negativeButton:ButtonData):Void
	{
		if (positiveButton == null)
			positiveButton = {name: null, func: null};

		if (negativeButton == null)
			negativeButton = {name: null, func: null};

		showAlertDialog_jni(title, message, positiveButton.name, new ButtonListener(positiveButton.func), negativeButton.name,
			new ButtonListener(negativeButton.func));
	}

	/**
	 * @return `true` If the device have root.
	 */
	public static inline function isRooted():Bool
	{
		return isRooted_jni();
	}

	/**
	 * @return `true` If the device has Dolby Atmos.
	 */
	public static inline function isDolbyAtmos():Bool
	{
		return isDolbyAtmos_jni();
	}

	/**
	 * Shows a minimal notification with a title and message.
	 */
	public static inline function showNotification(title:String, message:String, ?channelID:String = 'unknown_channel',
			?channelName:String = 'Unknown Channel', ?ID:Int = 1):Void
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
	 * @return whether the device is running Android TV.
	 */
	public static inline function isAndroidTV():Bool
	{
		return isAndroidTV_jni();
	}

	/**
	 * @return whether the device is a Tablet.
	 */
	public static inline function isTablet():Bool
	{
		return isTablet_jni();
	}

	/**
	 * @return whether the device is a ChromeBook.
	 */
	public static inline function isChromebook():Bool
	{
		return isChromebook_jni();
	}

	/**
	 * @return whether the device is running in Dex Mode.
	 */
	public static inline function isDeXMode():Bool
	{
		return isDexMode_jni();
	}

	@:noCompletion
	private static var installPackage_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'installPackage', '(Ljava/lang/String;)Z');

	@:noCompletion
	private static var enableAppSecure_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'enableAppSecure', '()V');

	@:noCompletion
	private static var disableAppSecure_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'disableAppSecure', '()V');

	@:noCompletion
	private static var launchPackage_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'launchPackage', '(Ljava/lang/String;I)V');

	@:noCompletion
	private static var showAlertDialog_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'showAlertDialog',
		'(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/haxe/lime/HaxeObject;Ljava/lang/String;Lorg/haxe/lime/HaxeObject;)V');

	@:noCompletion
	private static var isRooted_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'isRooted', '()Z');

	@:noCompletion
	private static var isDolbyAtmos_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'isDolbyAtmos', '()Z');

	@:noCompletion
	private static var showNotification_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'showNotification',
		'(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V');

	@:noCompletion
	private static var setActivityTitle_jni:Dynamic = JNI.createStaticMethod('org/libsdl/app/SDLActivity', 'setActivityTitle', '(Ljava/lang/String;)Z');

	@:noCompletion
	private static var minimizeWindow_jni:Dynamic = JNI.createStaticMethod('org/libsdl/app/SDLActivity', 'minimizeWindow', '()V');

	@:noCompletion
	private static var isAndroidTV_jni:Dynamic = JNI.createStaticMethod('org/libsdl/app/SDLActivity', 'isAndroidTV', '()Z');

	@:noCompletion
	private static var isTablet_jni:Dynamic = JNI.createStaticMethod('org/libsdl/app/SDLActivity', 'isTablet', '()Z');

	@:noCompletion
	private static var isChromebook_jni:Dynamic = JNI.createStaticMethod('org/libsdl/app/SDLActivity', 'isChromebook', '()Z');

	@:noCompletion
	private static var isDexMode_jni:Dynamic = JNI.createStaticMethod('org/libsdl/app/SDLActivity', 'isDeXMode', '()Z');
}

@:noCompletion
private typedef ButtonData =
{
	name:String,
	func:Void->Void
}

@:noCompletion
private class ButtonListener #if (lime >= "8.0.0") implements JNISafety #end
{
	private var onClickEvent:Event<Void->Void> = new Event<Void->Void>();

	public function new(clickCallback:Void->Void):Void
	{
		if (clickCallback != null)
			onClickEvent.add(clickCallback);
	}

	#if (lime >= "8.0.0")
	@:runOnMainThread
	#end
	public function onClick():Void
	{
		onClickEvent.dispatch();
	}
}
