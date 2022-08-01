package android.os;

#if (!android && !native && macro)
#error 'extension-androidtools is not supported on your current platform'
#end

#if (openfl < '4.0.0')
import openfl.utils.JNI;
#else
import lime.system.JNI;
#end

/**
 * @see https://developer.android.com/reference/android/os/Environment
 * 
 * @author Saw (M.A. Jigsaw)
 */
class Environment
{
	/**
	 * Return the user data directory.
	 */
	public static function getDataDirectory():String
	{
		var getDataDirectory_jni:Dynamic = JNI.createStaticMethod('android/os/Environment', 'getDataDirectory', '()Ljava/io/File;');
		var getAbsolutePath_jni:Dynamic = JNI.createMemberMethod('java/io/File', 'getAbsolutePath', '()Ljava/lang/String;');
		return getAbsolutePath_jni(getDataDirectory_jni());
	}

	/**
	 * Return the download/cache content directory.
	 */
	public static function getDownloadCacheDirectory():String
	{
		var getDownloadCacheDirectory_jni:Dynamic = JNI.createStaticMethod('android/os/Environment', 'getDownloadCacheDirectory', '()Ljava/io/File;');
		var getAbsolutePath_jni:Dynamic = JNI.createMemberMethod('java/io/File', 'getAbsolutePath', '()Ljava/lang/String;');
		return getAbsolutePath_jni(getDownloadCacheDirectory_jni());
	}

	/**
	 * Return the primary shared/external storage directory.
	 */
	public static function getExternalStorageDirectory():String
	{
		var getExternalStorageDirectory_jni:Dynamic = JNI.createStaticMethod('android/os/Environment', 'getExternalStorageDirectory', '()Ljava/io/File;');
		var getAbsolutePath_jni:Dynamic = JNI.createMemberMethod('java/io/File', 'getAbsolutePath', '()Ljava/lang/String;');
		return getAbsolutePath_jni(getExternalStorageDirectory_jni());
	}

	/**
	 * Return root of the 'system' partition holding the core Android OS.
	 * Always present and mounted read-only.
	 */
	public static function getRootDirectory():String
	{
		var getDataDirectory_jni:Dynamic = JNI.createStaticMethod('android/os/Environment', 'getRootDirectory', '()Ljava/io/File;');
		var getAbsolutePath_jni:Dynamic = JNI.createMemberMethod('java/io/File', 'getAbsolutePath', '()Ljava/lang/String;');
		return getAbsolutePath_jni(getDataDirectory_jni());
	}

	/**
	 * Returns whether the primary shared/external storage media is emulated.
	 */
	public static function isExternalStorageEmulated():Bool
	{
		var isExternalStorageEmulated_jni:Dynamic = JNI.createStaticMethod('android/os/Environment', 'isExternalStorageEmulated', '()Z');
		return isExternalStorageEmulated_jni();
	}

	/**
	 * Returns whether the primary shared/external storage media is physically removable.
	 */
	public static function isExternalStorageRemovable():Bool
	{
		var isExternalStorageRemovable_jni:Dynamic = JNI.createStaticMethod('android/os/Environment', 'isExternalStorageRemovable', '()Z');
		return isExternalStorageRemovable_jni();
	}
}
