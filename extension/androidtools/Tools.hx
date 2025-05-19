package extension.androidtools;

#if (!android && !native)
#error 'extension-androidtools is not supported on your current platform'
#end
import extension.androidtools.jni.JNICache;
import lime.app.Event;
import lime.math.Rectangle;
import lime.system.JNI;
#if sys
import sys.io.Process;
#end

/**
 * Provides various utility functions for interacting with Android system features.
 * Includes methods for handling packages, app security, notifications, device features, and more.
 */
class Tools
{
	/**
	 * Installs a package from a given path.
	 *
	 * @param path The path to the package file to install.
	 * @return true if the installation was successful, false otherwise.
	 */
	public static function installPackage(path:String):Bool
	{
		final installPackageJNI:Null<Dynamic> = JNICache.createStaticMethod('org/haxe/extension/Tools', 'installPackage', '(Ljava/lang/String;)Z');

		return installPackageJNI != null && !installPackageJNI(path);
	}

	/**
	 * Enables app security, restricting access to sensitive data.
	 * This method may require specific permissions or system-level access.
	 */
	public static inline function enableAppSecure():Void
	{
		final enableAppSecureJNI:Null<Dynamic> = JNICache.createStaticMethod('org/haxe/extension/Tools', 'enableAppSecure', '()V');

		if (enableAppSecureJNI != null)
			enableAppSecureJNI();
	}

	/**
	 * Disables app security, allowing access to sensitive data.
	 * This method may require specific permissions or system-level access.
	 */
	public static inline function disableAppSecure():Void
	{
		final disableAppSecureJNI:Null<Dynamic> = JNICache.createStaticMethod('org/haxe/extension/Tools', 'disableAppSecure', '()V');

		if (disableAppSecureJNI != null)
			disableAppSecureJNI();
	}

	/**
	 * Launches another package (app) by its package name.
	 *
	 * @param packageName The package name of the app to launch.
	 * @param requestCode The request code to use when launching the app (default is 1).
	 */
	public static inline function launchPackage(packageName:String, requestCode:Int = 1):Void
	{
		final launchPackageJNI:Null<Dynamic> = JNICache.createStaticMethod('org/haxe/extension/Tools', 'launchPackage', '(Ljava/lang/String;I)V');

		if (launchPackageJNI != null)
			launchPackageJNI(packageName, requestCode);
	}

	/**
	 * Shows an alert dialog with optional positive and negative buttons.
	 *
	 * @param title The title of the dialog.
	 * @param message The message to display in the dialog.
	 * @param positiveButton Optional positive button data with name and callback function.
	 * @param negativeButton Optional negative button data with name and callback function.
	 */
	public static function showAlertDialog(title:String, message:String, ?positiveButton:ButtonData, ?negativeButton:ButtonData):Void
	{
		if (positiveButton == null)
			positiveButton = {name: null, func: null};

		if (negativeButton == null)
			negativeButton = {name: null, func: null};

		final showAlertDialogJNI:Null<Dynamic> = JNICache.createStaticMethod('org/haxe/extension/Tools', 'showAlertDialog',
			'(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/haxe/lime/HaxeObject;Ljava/lang/String;Lorg/haxe/lime/HaxeObject;)V');

		if (showAlertDialogJNI != null)
			showAlertDialogJNI(title, message, positiveButton.name, new ButtonListener(positiveButton.func), negativeButton.name,
				new ButtonListener(negativeButton.func));
	}

	#if sys
	/**
	 * Checks if the device is rooted.
	 *
	 * @return true if the device is rooted, false otherwise.
	 */
	public static function isRooted():Bool
	{
		final process:Process = new Process('su');

		final exitCode:Null<Int> = process.exitCode(true);

		return exitCode != null && exitCode != 255;
	}
	#end

	/**
	 * Checks if the device supports Dolby Atmos audio.
	 *
	 * @return true if Dolby Atmos is supported, false otherwise.
	 */
	public static inline function isDolbyAtmos():Bool
	{
		final isDolbyAtmosJNI:Null<Dynamic> = JNICache.createStaticMethod('org/haxe/extension/Tools', 'isDolbyAtmos', '()Z');
		return isDolbyAtmosJNI != null && isDolbyAtmosJNI();
	}

	/**
	 * Shows a notification on the device.
	 *
	 * @param title The title of the notification.
	 * @param message The message of the notification.
	 * @param channelID Optional channel ID for the notification.
	 * @param channelName Optional name for the notification channel.
	 * @param ID Optional ID for the notification (default is 1).
	 */
	public static inline function showNotification(title:String, message:String, ?channelID:String = 'unknown_channel',
			?channelName:String = 'Unknown Channel', ?ID:Int = 1):Void
	{
		final showNotificationJNI:Null<Dynamic> = JNICache.createStaticMethod('org/haxe/extension/Tools', 'showNotification',
			'(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V');
		if (showNotificationJNI != null)
			showNotificationJNI(title, message, channelID, channelName, ID);
	}

	/**
	 * Retrieves the dimensions of any screen cutouts (e.g., notch, camera hole).
	 *
	 * @return An array of `Rectangle` objects representing the cutout areas.
	 */
	public static function getCutoutDimensions():Array<Rectangle>
	{
		final getCutoutDimensionsJNI:Null<Dynamic> = JNICache.createStaticMethod('org/haxe/extension/Tools', 'getCutoutDimensions',
			'()[Landroid/graphics/Rect;');

		if (getCutoutDimensionsJNI != null)
		{
			final rectangles:Array<Rectangle> = [];

			for (rectangle in cast(getCutoutDimensionsJNI(), Array<Dynamic>))
			{
				if (rectangle == null)
					continue;

				final topJNI:Null<JNIMemberField> = JNICache.createMemberField('android/graphics/Rect', 'top', 'I');
				final leftJNI:Null<JNIMemberField> = JNICache.createMemberField('android/graphics/Rect', 'left', 'I');
				final rightJNI:Null<JNIMemberField> = JNICache.createMemberField('android/graphics/Rect', 'right', 'I');
				final bottomJNI:Null<JNIMemberField> = JNICache.createMemberField('android/graphics/Rect', 'bottom', 'I');

				if (topJNI != null && leftJNI != null && rightJNI != null && bottomJNI != null)
				{
					final top:Int = topJNI.get(rectangle);
					final left:Int = leftJNI.get(rectangle);
					final right:Int = rightJNI.get(rectangle);
					final bottom:Int = bottomJNI.get(rectangle);

					rectangles.push(new Rectangle(left, top, right - left, bottom - top));
				}
			}

			return rectangles;
		}

		return [];
	}

	/**
	 * Sets the title of the current activity.
	 *
	 * @param title The new title to set for the activity.
	 * @return true if the title was successfully set, false otherwise.
	 */
	public static inline function setActivityTitle(title:String):Bool
	{
		final setActivityTitleJNI:Null<Dynamic> = JNICache.createStaticMethod('org/libsdl/app/SDLActivity', 'setActivityTitle', '(Ljava/lang/String;)Z');

		return setActivityTitleJNI != null && setActivityTitleJNI(title);
	}

	/**
	 * Minimizes the current window (if possible).
	 */
	public static inline function minimizeWindow():Void
	{
		final minimizeWindowJNI:Null<Dynamic> = JNICache.createStaticMethod('org/libsdl/app/SDLActivity', 'minimizeWindow', '()V');

		if (minimizeWindowJNI != null)
			minimizeWindowJNI();
	}

	/**
	 * Checks if the device is an Android TV.
	 *
	 * @return true if the device is an Android TV, false otherwise.
	 */
	public static inline function isAndroidTV():Bool
	{
		final isAndroidTVJNI:Null<Dynamic> = JNICache.createStaticMethod('org/libsdl/app/SDLActivity', 'isAndroidTV', '()Z');

		return isAndroidTVJNI != null && isAndroidTVJNI();
	}

	/**
	 * Checks if the device is a tablet.
	 *
	 * @return true if the device is a tablet, false otherwise.
	 */
	public static inline function isTablet():Bool
	{
		final isTabletJNI:Null<Dynamic> = JNICache.createStaticMethod('org/libsdl/app/SDLActivity', 'isTablet', '()Z');

		return isTabletJNI != null && isTabletJNI();
	}

	/**
	 * Checks if the device is a Chromebook.
	 *
	 * @return true if the device is a Chromebook, false otherwise.
	 */
	public static inline function isChromebook():Bool
	{
		final isChromebookJNI:Null<Dynamic> = JNICache.createStaticMethod('org/libsdl/app/SDLActivity', 'isChromebook', '()Z');

		return isChromebookJNI != null && isChromebookJNI();
	}

	/**
	 * Checks if the device is in Samsung DeX mode.
	 *
	 * @return true if the device is in DeX mode, false otherwise.
	 */
	public static inline function isDeXMode():Bool
	{
		final isDeXModeJNI:Null<Dynamic> = JNICache.createStaticMethod('org/libsdl/app/SDLActivity', 'isDeXMode', '()Z');

		return isDeXModeJNI != null && isDeXModeJNI();
	}
}

/**
 * Represents button data for use in alert dialogs.
 */
@:noCompletion
private typedef ButtonData =
{
	name:String,
	func:Void->Void
}

/**
 * Listener class for handling button click events in alert dialogs.
 */
@:noCompletion
private class ButtonListener #if (lime >= "8.0.0") implements JNISafety #end
{
	@:noCompletion
	private var onClickEvent:Event<Void->Void> = new Event<Void->Void>();

	public function new(clickCallback:Void->Void):Void
	{
		if (clickCallback != null)
			onClickEvent.add(clickCallback);
	}

	@:keep
	#if (lime >= "8.0.0")
	@:runOnMainThread
	#end
	public function onClick():Void
	{
		onClickEvent.dispatch();
	}
}
