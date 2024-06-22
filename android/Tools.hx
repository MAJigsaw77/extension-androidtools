package android;

#if (!android && !native)
#error 'extension-androidtools is not supported on your current platform'
#end
import android.Permissions;
import haxe.io.Path;
import lime.app.Event;
import lime.system.JNI;
import lime.utils.Log;
import android.jni.JNICache;

class Tools
{
	/**
	 * Prompt the user to install a specific APK file.
	 */
	public static function installPackage(path:String):Void
	{
		if (!JNICache.createStaticMethod('org/haxe/extension/Tools', 'installPackage', '(Ljava/lang/String;)Z')(path))
			Log.warn('"REQUEST_INSTALL_PACKAGES" permission and "Install apps from external sources" setting must be granted to this app in order to install a ${Path.extension(path).toUpperCase()} file.');
	}

	/**
	 * Adds the security flag to application's window.
	 */
	public static inline function enableAppSecure():Void
	{
		JNICache.createStaticMethod('org/haxe/extension/Tools', 'enableAppSecure', '()V')();
	}

	/**
	 * Clears the security flag from application's window.
	 */
	public static inline function disableAppSecure():Void
	{
		JNICache.createStaticMethod('org/haxe/extension/Tools', 'disableAppSecure', '()V')();
	}

	/**
	 * Launches an app by the `packageName`.
	 */
	public static inline function launchPackage(packageName:String, requestCode:Int = 1):Void
	{
		JNICache.createStaticMethod('org/haxe/extension/Tools', 'launchPackage', '(Ljava/lang/String;I)V')(packageName, requestCode);
	}

	/**
	 * Shows an alert dialog with optional buttons.
	 */
	public static function showAlertDialog(title:String, message:String, ?positiveButton:ButtonData, ?negativeButton:ButtonData):Void
	{
		if (positiveButton == null)
			positiveButton = {name: null, func: null};

		if (negativeButton == null)
			negativeButton = {name: null, func: null};

		JNICache.createStaticMethod('org/haxe/extension/Tools', 'showAlertDialog',
			'(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/haxe/lime/HaxeObject;Ljava/lang/String;Lorg/haxe/lime/HaxeObject;)V')(title, message,
				positiveButton.name, new ButtonListener(positiveButton.func), negativeButton.name, new ButtonListener(negativeButton.func));
	}

	/**
	 * @return `true` if the device is rooted.
	 */
	public static inline function isRooted():Bool
	{
		return JNICache.createStaticMethod('org/haxe/extension/Tools', 'isRooted', '()Z')();
	}

	/**
	 * @return `true` if the device has Dolby Atmos.
	 */
	public static inline function isDolbyAtmos():Bool
	{
		return JNICache.createStaticMethod('org/haxe/extension/Tools', 'isDolbyAtmos', '()Z')();
	}

	/**
	 * Shows a minimal notification with a title and message.
	 */
	public static inline function showNotification(title:String, message:String, ?channelID:String = 'unknown_channel',
			?channelName:String = 'Unknown Channel', ?ID:Int = 1):Void
	{
		JNICache.createStaticMethod('org/haxe/extension/Tools', 'showNotification',
			'(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V')(title, message, channelID, channelName, ID);
	}

	/**
	 * Sets Activity's Title by the `title`.
	 */
	public static inline function setActivityTitle(title:String):Bool
	{
		return JNICache.createStaticMethod('org/libsdl/app/SDLActivity', 'setActivityTitle', '(Ljava/lang/String;)Z')(title);
	}

	/**
	 * Minimizes app's window.
	 */
	public static inline function minimizeWindow():Void
	{
		JNICache.createStaticMethod('org/libsdl/app/SDLActivity', 'minimizeWindow', '()V')();
	}

	/**
	 * @return whether the device is running Android TV.
	 */
	public static inline function isAndroidTV():Bool
	{
		return JNICache.createStaticMethod('org/libsdl/app/SDLActivity', 'isAndroidTV', '()Z')();
	}

	/**
	 * @return whether the device is a Tablet.
	 */
	public static inline function isTablet():Bool
	{
		return JNICache.createStaticMethod('org/libsdl/app/SDLActivity', 'isTablet', '()Z')();
	}

	/**
	 * @return whether the device is a ChromeBook.
	 */
	public static inline function isChromebook():Bool
	{
		return JNICache.createStaticMethod('org/libsdl/app/SDLActivity', 'isChromebook', '()Z')();
	}

	/**
	 * @return whether the device is running in Dex Mode.
	 */
	public static inline function isDeXMode():Bool
	{
		return JNICache.createStaticMethod('org/libsdl/app/SDLActivity', 'isDeXMode', '()Z')();
	}
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
