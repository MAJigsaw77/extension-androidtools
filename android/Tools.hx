package android;

#if (!android && !native)
#error 'extension-androidtools is not supported on your current platform'
#end
import android.jni.JNICache;
import android.Permissions;
import haxe.io.Path;
import lime.app.Event;
import lime.system.JNI;
import lime.utils.Log;

/**
 * A utility class for interacting with native Android functionality via JNI.
 */
class Tools
{
	/**
	 * Prompt the user to install a specific APK file.
	 *
	 * @param path The absolute path to the APK file.
	 */
	public static function installPackage(path:String):Void
	{
		if (!JNICache.createStaticMethod('org/haxe/extension/Tools', 'installPackage', '(Ljava/lang/String;)Z')(path))
			Log.warn('"REQUEST_INSTALL_PACKAGES" permission and "Install apps from external sources" setting must be granted to this app in order to install a '
				+ Path.extension(path).toUpperCase()
				+ ' file.');
	}

	/**
	 * Adds the security flag to the application's window.
	 */
	public static inline function enableAppSecure():Void
	{
		JNICache.createStaticMethod('org/haxe/extension/Tools', 'enableAppSecure', '()V')();
	}

	/**
	 * Clears the security flag from the application's window.
	 */
	public static inline function disableAppSecure():Void
	{
		JNICache.createStaticMethod('org/haxe/extension/Tools', 'disableAppSecure', '()V')();
	}

	/**
	 * Launches an application by its package name.
	 *
	 * @param packageName The package name of the application to launch.
	 * @param requestCode The request code to pass along with the launch request.
	 */
	public static inline function launchPackage(packageName:String, requestCode:Int = 1):Void
	{
		JNICache.createStaticMethod('org/haxe/extension/Tools', 'launchPackage', '(Ljava/lang/String;I)V')(packageName, requestCode);
	}

	/**
	 * Shows an alert dialog with optional positive and negative buttons.
	 *
	 * @param title The title of the alert dialog.
	 * @param message The message content of the alert dialog.
	 * @param positiveButton Optional data for the positive button.
	 * @param negativeButton Optional data for the negative button.
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
	 * Checks if the device is rooted.
	 *
	 * @return `true` if the device is rooted; `false` otherwise.
	 */
	public static inline function isRooted():Bool
	{
		return JNICache.createStaticMethod('org/haxe/extension/Tools', 'isRooted', '()Z')();
	}

	/**
	 * Checks if the device has Dolby Atmos support.
	 *
	 * @return `true` if the device has Dolby Atmos support; `false` otherwise.
	 */
	public static inline function isDolbyAtmos():Bool
	{
		return JNICache.createStaticMethod('org/haxe/extension/Tools', 'isDolbyAtmos', '()Z')();
	}

	/**
	 * Shows a minimal notification with a title and message.
	 *
	 * @param title The title of the notification.
	 * @param message The message content of the notification.
	 * @param channelID Optional ID of the notification channel.
	 * @param channelName Optional name of the notification channel.
	 * @param ID Optional unique ID for the notification.
	 */
	public static inline function showNotification(title:String, message:String, ?channelID:String = 'unknown_channel',
			?channelName:String = 'Unknown Channel', ?ID:Int = 1):Void
	{
		JNICache.createStaticMethod('org/haxe/extension/Tools', 'showNotification',
			'(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V')(title, message, channelID, channelName, ID);
	}

	/**
	 * Sets the activity's title.
	 *
	 * @param title The title to set for the activity.
	 * @return `true` if the title was successfully set; `false` otherwise.
	 */
	public static inline function setActivityTitle(title:String):Bool
	{
		return JNICache.createStaticMethod('org/libsdl/app/SDLActivity', 'setActivityTitle', '(Ljava/lang/String;)Z')(title);
	}

	/**
	 * Minimizes the application's window.
	 */
	public static inline function minimizeWindow():Void
	{
		JNICache.createStaticMethod('org/libsdl/app/SDLActivity', 'minimizeWindow', '()V')();
	}

	/**
	 * Checks if the device is running Android TV.
	 *
	 * @return `true` if the device is running Android TV; `false` otherwise.
	 */
	public static inline function isAndroidTV():Bool
	{
		return JNICache.createStaticMethod('org/libsdl/app/SDLActivity', 'isAndroidTV', '()Z')();
	}

	/**
	 * Checks if the device is a tablet.
	 *
	 * @return `true` if the device is a tablet; `false` otherwise.
	 */
	public static inline function isTablet():Bool
	{
		return JNICache.createStaticMethod('org/libsdl/app/SDLActivity', 'isTablet', '()Z')();
	}

	/**
	 * Checks if the device is a Chromebook.
	 *
	 * @return `true` if the device is a Chromebook; `false` otherwise.
	 */
	public static inline function isChromebook():Bool
	{
		return JNICache.createStaticMethod('org/libsdl/app/SDLActivity', 'isChromebook', '()Z')();
	}

	/**
	 * Checks if the device is running in DeX Mode.
	 *
	 * @return `true` if the device is running in DeX Mode; `false` otherwise.
	 */
	public static inline function isDeXMode():Bool
	{
		return JNICache.createStaticMethod('org/libsdl/app/SDLActivity', 'isDeXMode', '()Z')();
	}
}

/**
 * Data structure for defining button properties in an alert dialog.
 */
@:noCompletion
private typedef ButtonData =
{
	name:String,
	// The name or label of the button.
	func:Void->Void
	// The callback function to execute when the button is clicked.
}

/**
 * Listener class for handling button click events in an alert dialog.
 */
@:noCompletion
private class ButtonListener #if (lime >= "8.0.0") implements JNISafety #end
{
	private var onClickEvent:Event<Void->Void> = new Event<Void->Void>();

	/**
	 * Creates a new button listener with a specified callback function.
	 *
	 * @param clickCallback The function to execute when the button is clicked.
	 */
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
