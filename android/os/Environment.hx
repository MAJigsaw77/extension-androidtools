package android.os;

#if (!android && !native && macro)
#error 'extension-androidtools is not supported on your current platform'
#end
import lime.system.JNI;

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
	public static inline function getDataDirectory():String
	{
		return getAbsolutePath_jni(getDataDirectory_jni());
	}

	/**
	 * Return the download/cache content directory.
	 */
	public static inline function getDownloadCacheDirectory():String
	{
		return getAbsolutePath_jni(getDownloadCacheDirectory_jni());
	}

	/**
	 * Return the primary shared/external storage directory.
	 */
	public static inline function getExternalStorageDirectory():String
	{
		return getAbsolutePath_jni(getExternalStorageDirectory_jni());
	}

	/**
	 * Returns the current state of the primary shared/external storage media.
	 */
	public static inline function getExternalStorageState():String
	{
		return getExternalStorageState_jni();
	}

	/**
	 * Return root of the 'system' partition holding the core Android OS.
	 * Always present and mounted read-only.
	 */
	public static inline function getRootDirectory():String
	{
		return getAbsolutePath_jni(getRootDirectory_jni());
	}

	/**
	 * Returns whether the calling app has All Files Access on the primary shared/external storage media.
	 */
	public static inline function isExternalStorageManager():Bool
	{
		return isExternalStorageManager_jni();
	}

	@:noCompletion private static var getDataDirectory_jni:Dynamic = JNI.createStaticMethod('android/os/Environment', 'getDataDirectory', '()Ljava/io/File;');
	@:noCompletion private static var getDownloadCacheDirectory_jni:Dynamic = JNI.createStaticMethod('android/os/Environment', 'getDownloadCacheDirectory', '()Ljava/io/File;');
	@:noCompletion private static var getExternalStorageDirectory_jni:Dynamic = JNI.createStaticMethod('android/os/Environment', 'getExternalStorageDirectory', '()Ljava/io/File;');
	@:noCompletion private static var getExternalStorageState_jni:Dynamic = JNI.createStaticMethod('android/os/Environment', 'getExternalStorageState', '()Ljava/lang/String;');
	@:noCompletion private static var getRootDirectory_jni:Dynamic = JNI.createStaticMethod('android/os/Environment', 'getRootDirectory', '()Ljava/io/File;');
	@:noCompletion private static var isExternalStorageManager_jni:Dynamic = JNI.createStaticMethod('android/os/Environment', 'isExternalStorageManager', '()Z');
	@:noCompletion private static var getAbsolutePath_jni:Dynamic = JNI.createMemberMethod('java/io/File', 'getAbsolutePath', '()Ljava/lang/String;');
}
