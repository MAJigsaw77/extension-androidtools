package android.os;

#if (!android && !native)
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
	 * @return the user data directory.
	 */
	public static inline function getDataDirectory():String
	{
		return getAbsolutePath_jni(getDataDirectory_jni());
	}

	/**
	 * @return the download/cache content directory.
	 */
	public static inline function getDownloadCacheDirectory():String
	{
		return getAbsolutePath_jni(getDownloadCacheDirectory_jni());
	}

	/**
	 * @return the primary shared/external storage directory.
	 */
	public static inline function getExternalStorageDirectory():String
	{
		return getAbsolutePath_jni(getExternalStorageDirectory_jni());
	}

	/**
	 * @return the root directory where all external storage devices will be mounted.
	 */
	public static inline function getStorageDirectory():String
	{
		return getAbsolutePath_jni(getStorageDirectory_jni());
	}

	/**
	 * @return the current state of the primary shared/external storage media.
	 */
	public static inline function getExternalStorageState():String
	{
		return getExternalStorageState_jni();
	}

	/**
	 * @return root of the 'system' partition holding the core Android OS.
	 */
	public static inline function getRootDirectory():String
	{
		return getAbsolutePath_jni(getRootDirectory_jni());
	}

	/**
	 * @return whether the primary shared/external storage media is emulated.
	 */
	public static inline function isExternalStorageEmulated():Bool
	{
		return isExternalStorageEmulated_jni();
	}

	/**
	 * @return whether the calling app has All Files Access on the primary shared/external storage media.
	 */
	public static inline function isExternalStorageManager():Bool
	{
		return isExternalStorageManager_jni();
	}

	/**
	 * @return whether the shared/external storage media is a legacy view that includes files not owned by the app.
	 */
	public static inline function isExternalStorageLegacy():Bool
	{
		return isExternalStorageLegacy_jni();
	}

	/**
	 * @return whether the primary shared/external storage media is physically removable.
	 */
	public static inline function isExternalStorageRemovable():Bool
	{
		return isExternalStorageRemovable_jni();
	}

	@:noCompletion
	private static var getDataDirectory_jni:Dynamic = JNI.createStaticMethod('android/os/Environment', 'getDataDirectory', '()Ljava/io/File;');

	@:noCompletion
	private static var getDownloadCacheDirectory_jni:Dynamic = JNI.createStaticMethod('android/os/Environment', 'getDownloadCacheDirectory',
		'()Ljava/io/File;');

	@:noCompletion
	private static var getExternalStorageDirectory_jni:Dynamic = JNI.createStaticMethod('android/os/Environment', 'getExternalStorageDirectory',
		'()Ljava/io/File;');

	@:noCompletion
	private static var getStorageDirectory_jni:Dynamic = (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) ? JNI.createStaticMethod('android/os/Environment',
		'getStorageDirectory', '()Ljava/io/File;') : () -> return '/storage';

	@:noCompletion
	private static var getExternalStorageState_jni:Dynamic = JNI.createStaticMethod('android/os/Environment', 'getExternalStorageState',
		'()Ljava/lang/String;');

	@:noCompletion
	private static var getRootDirectory_jni:Dynamic = JNI.createStaticMethod('android/os/Environment', 'getRootDirectory', '()Ljava/io/File;');

	@:noCompletion
	private static var isExternalStorageManager_jni:Dynamic = (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) ? JNI.createStaticMethod('android/os/Environment',
		'isExternalStorageManager', '()Z') : () -> return true;

	@:noCompletion
	private static var isExternalStorageEmulated_jni:Dynamic = JNI.createStaticMethod('android/os/Environment', 'isExternalStorageEmulated', '()Z');

	@:noCompletion
	private static var isExternalStorageLegacy_jni:Dynamic = (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) ? JNI.createStaticMethod('android/os/Environment',
		'isExternalStorageLegacy', '()Z') : () -> return true;

	@:noCompletion
	private static var isExternalStorageRemovable_jni:Dynamic = JNI.createStaticMethod('android/os/Environment', 'isExternalStorageRemovable', '()Z');

	@:noCompletion
	private static var getAbsolutePath_jni:Dynamic = JNI.createMemberMethod('java/io/File', 'getAbsolutePath', '()Ljava/lang/String;');
}
