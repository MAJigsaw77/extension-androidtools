package android.os;

#if (!android && !native && macro)
#error 'extension-androidtools is not supported on your current platform'
#end

import lime.system.JNI;

/**
 * @see https://developer.android.com/reference/android/os/Environment
 * 
 * @author Mihai Alexandru (M.A. Jigsaw)
 */
class Environment
{
	public static final BAD_REMOVAL:String = 'bad_removal';
	public static final CHECKING:String = 'checking';
	public static final MOUNTED:String = 'mounted';
	public static final MOUNTED_READ_ONLY:String = 'mounted_ro';
	public static final NOFS:String = 'nofs';
	public static final REMOVED:String = 'removed';
	public static final SHARED:String = 'shared';
	public static final UNMOUNTABLE:String = 'unmountable';
	public static final UNMOUNTED:String = 'unmounted';

	/**
	 * Return the user data directory.
	 */
	public static function getDataDirectory():String
	{
		var getDataDirectory_jni:Dynamic = JNI.createStaticMethod('android/os/Environment', 'getDataDirectory', '()Ljava/io/File;')();
		return JNI.createMemberMethod('java/io/File', 'getAbsolutePath', '()Ljava/lang/String;')(getDataDirectory_jni);
	}

	/**
	 * Return the download/cache content directory.
	 */
	public static function getDownloadCacheDirectory():String
	{
		var getDownloadCacheDirectory_jni:Dynamic = JNI.createStaticMethod('android/os/Environment', 'getDownloadCacheDirectory', '()Ljava/io/File;')();
		return JNI.createMemberMethod('java/io/File', 'getAbsolutePath', '()Ljava/lang/String;')(getDownloadCacheDirectory_jni);
	}

	/**
	 * Return the primary shared/external storage directory.
	 */
	public static function getExternalStorageDirectory():String
	{
		var getExternalStorageDirectory_jni:Dynamic = JNI.createStaticMethod('android/os/Environment', 'getExternalStorageDirectory', '()Ljava/io/File;')();
		return JNI.createMemberMethod('java/io/File', 'getAbsolutePath', '()Ljava/lang/String;')(getExternalStorageDirectory_jni);
	}

	/**
	 * Returns the current state of the primary shared/external storage media.
	 */
	public static function getExternalStorageState():String
	{
		return JNI.createStaticMethod('android/os/Environment', 'getExternalStorageState', '()Ljava/lang/String;')();
	}

	/**
	 * Return root of the 'system' partition holding the core Android OS.
	 * Always present and mounted read-only.
	 */
	public static function getRootDirectory():String
	{
		var getDataDirectory_jni:Dynamic = JNI.createStaticMethod('android/os/Environment', 'getRootDirectory', '()Ljava/io/File;')();
		return JNI.createMemberMethod('java/io/File', 'getAbsolutePath', '()Ljava/lang/String;')(getDataDirectory_jni);
	}

	/**
	 * Returns whether the primary shared/external storage media is emulated.
	 */
	public static function isExternalStorageEmulated():Bool
	{
		return JNI.createStaticMethod('android/os/Environment', 'isExternalStorageEmulated', '()Z')();
	}

	/**
	 * Returns whether the primary shared/external storage media is physically removable.
	 */
	public static function isExternalStorageRemovable():Bool
	{
		return JNI.createStaticMethod('android/os/Environment', 'isExternalStorageRemovable', '()Z')();
	}
}
