package android;

#if (!android && !native)
#error 'extension-androidtools is not supported on your current platform'
#end
import lime.system.JNI;

using StringTools;

class Settings
{
	/** 
	 * @param setting the setting.
	 * @param requestCode the code that should be requested.
	 */
	public static inline function requestSetting(setting:String, requestCode:Int = 1):Void
	{
		requestSetting_jni(!setting.startsWith('android.settings.') ? 'android.settings.$setting' : setting, requestCode);
	}

	@:noCompletion
	private static var requestSetting_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'requestSetting', '(Ljava/lang/String;I)V');
}
