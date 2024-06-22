package android;

#if (!android && !native)
#error 'extension-androidtools is not supported on your current platform'
#end
import android.jni.JNICache;

using StringTools;

/**
 * A utility class for interacting with Android settings via JNI.
 */
class Settings
{
	/** 
	 * Requests a specific Android setting using JNI.
	 *
	 * @param setting The name of the setting. If it does not start with 'android.settings.',
	 *                it will be prefixed with that string automatically.
	 * @param requestCode The request code to be passed to the JNI method.
	 */
	public static inline function requestSetting(setting:String, requestCode:Int = 1):Void
	{
		JNICache.createStaticMethod('org/haxe/extension/Tools', 'requestSetting',
			'(Ljava/lang/String;I)V')(!setting.startsWith('android.settings.') ? 'android.settings.$setting' : setting, requestCode);
	}
}
