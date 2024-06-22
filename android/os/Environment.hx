package android.os;

#if (!android && !native)
#error 'extension-androidtools is not supported on your current platform'
#end
import android.jni.JNICache;
import lime.system.JNI;

/**
 * This class provides access to environment variables and directories on the device
 * using JNI calls.
 */
class Environment
{
	/**
	 * Represents the state of external storage when it has been removed abruptly.
	 */
	public static final BAD_REMOVAL:String = 'bad_removal';

	/**
	 * Represents the state of external storage when it is being checked.
	 */
	public static final CHECKING:String = 'checking';

	/**
	 * Represents the state of external storage when it is mounted and writable.
	 */
	public static final MOUNTED:String = 'mounted';

	/**
	 * Represents the state of external storage when it is mounted as read-only.
	 */
	public static final MOUNTED_READ_ONLY:String = 'mounted_ro';

	/**
	 * Represents the state of external storage when no filesystem is found.
	 */
	public static final NOFS:String = 'nofs';

	/**
	 * Represents the state of external storage when it has been removed.
	 */
	public static final REMOVED:String = 'removed';

	/**
	 * Represents the state of shared storage.
	 */
	public static final SHARED:String = 'shared';

	/**
	 * Represents the state of external storage when it is unmountable.
	 */
	public static final UNMOUNTABLE:String = 'unmountable';

	/**
	 * Represents the state of external storage when it is unmounted.
	 */
	public static final UNMOUNTED:String = 'unmounted';

	/**
	 * Retrieves the absolute path of the user data directory.
	 *
	 * @return The absolute path of the user data directory.
	 */
	public static inline function getDataDirectory():String
	{
		return getAbsolutePath(JNICache.createStaticMethod('android.os.Environment', 'getDataDirectory', '()Ljava/io/File;')());
	}

	/**
	 * Retrieves the absolute path of the download/cache content directory.
	 *
	 * @return The absolute path of the download/cache content directory.
	 */
	public static inline function getDownloadCacheDirectory():String
	{
		return getAbsolutePath(JNICache.createStaticMethod('android.os.Environment', 'getDownloadCacheDirectory', '()Ljava/io/File;')());
	}

	/**
	 * Retrieves the absolute path of the primary shared/external storage directory.
	 *
	 * @return The absolute path of the primary shared/external storage directory.
	 */
	public static inline function getExternalStorageDirectory():String
	{
		return getAbsolutePath(JNICache.createStaticMethod('android.os.Environment', 'getExternalStorageDirectory', '()Ljava/io/File;')());
	}

	/**
	 * Retrieves the absolute path of the root directory where all external storage devices will be mounted.
	 *
	 * @return The absolute path of the root directory for external storage.
	 */
	public static inline function getStorageDirectory():String
	{
		return (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) ? getAbsolutePath(JNICache.createStaticMethod('android.os.Environment', 'getStorageDirectory',
			'()Ljava/io/File;')())  : '/storage';
	}

	/**
	 * Retrieves the current state of the primary shared/external storage media.
	 *
	 * @return The current state of the external storage media.
	 */
	public static inline function getExternalStorageState():String
	{
		return JNICache.createStaticMethod('android.os.Environment', 'getExternalStorageState', '()Ljava/lang/String;')();
	}

	/**
	 * Retrieves the absolute path of the root directory holding the core Android OS.
	 *
	 * @return The absolute path of the root directory of the Android OS.
	 */
	public static inline function getRootDirectory():String
	{
		return getAbsolutePath(JNICache.createStaticMethod('android.os.Environment', 'getRootDirectory', '()Ljava/io/File;')());
	}

	/**
	 * Checks if the primary shared/external storage media is emulated.
	 *
	 * @return true if the external storage is emulated, false otherwise.
	 */
	public static inline function isExternalStorageEmulated():Bool
	{
		return JNICache.createStaticMethod('android.os.Environment', 'isExternalStorageEmulated', '()Z')();
	}

	/**
	 * Checks if the calling app has All Files Access on the primary shared/external storage media.
	 *
	 * @return true if the app has All Files Access, false otherwise.
	 */
	public static inline function isExternalStorageManager():Bool
	{
		return JNICache.createStaticMethod('android.os.Environment', 'isExternalStorageManager', '()Z')();
	}

	/**
	 * Checks if the shared/external storage media is a legacy view that includes files not owned by the app.
	 *
	 * @return true if the external storage is a legacy view, false otherwise.
	 */
	public static inline function isExternalStorageLegacy():Bool
	{
		return JNICache.createStaticMethod('android.os.Environment', 'isExternalStorageLegacy', '()Z')();
	}

	/**
	 * Checks if the primary shared/external storage media is physically removable.
	 *
	 * @return true if the external storage is removable, false otherwise.
	 */
	public static inline function isExternalStorageRemovable():Bool
	{
		return JNICache.createStaticMethod('android.os.Environment', 'isExternalStorageRemovable', '()Z')();
	}

	/**
	 * Retrieves the absolute path from a given File object.
	 *
	 * @param file A File object for which to retrieve the absolute path.
	 *
	 * @return The absolute path of the File object.
	 */
	private static inline function getAbsolutePath(file:Dynamic):String
	{
		return JNI.callMember(JNICache.createMemberMethod('java/io/File', 'getAbsolutePath', '()Ljava/lang/String;'), file, []);
	}
}
