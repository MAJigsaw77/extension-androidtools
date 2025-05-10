package extension.androidtools.content;

#if (!android && !native)
#error 'extension-androidtools is not supported on your current platform'
#end
import extension.androidtools.jni.JNICache;
import extension.androidtools.jni.JNIUtil;

/**
 * This class provides access to directories associated with the application context using JNI calls.
 */
class Context
{
	/**
	 * Retrieves the absolute path of the directory assigned to the application for storing private files.
	 *
	 * @return The absolute path of the private files directory.
	 */
	public static function getFilesDir():String
	{
		final getFilesDirJNI = JNICache.createStaticMethod('org.haxe.extension.Tools', 'getFilesDir', '()Ljava/io/File;');

		return getFilesDirJNI != null ? JNIUtil.getAbsolutePath(getFilesDirJNI()) : '';
	}

	/**
	 * Retrieves the absolute path of the directory assigned to the application for storing external files.
	 *
	 * @param type Optional type of subdirectory to retrieve (e.g., "Pictures", "Documents").
	 * @return The absolute path of the external files directory.
	 */
	public static function getExternalFilesDir(type:String = null):String
	{
		final getExternalFilesDirJNI = JNICache.createStaticMethod('org.haxe.extension.Tools', 'getExternalFilesDir', '(Ljava/lang/String;)Ljava/io/File;');

		return getExternalFilesDirJNI != null ? JNIUtil.getAbsolutePath(getExternalFilesDirJNI(type)) : '';
	}

	/**
	 * Retrieves the absolute paths of directories assigned to the application for storing external files.
	 * This can include multiple directories in cases where there are multiple external storage devices.
	 *
	 * @param type Optional type of subdirectory to retrieve (e.g., "Pictures", "Documents").
	 * @return An array of absolute paths of the external files directories.
	 */
	public static function getExternalFilesDirs(type:String = null):Array<String>
	{
		final getExternalFilesDirsJNI:Null<Dynamic> = JNICache.createStaticMethod('org.haxe.extension.Tools', 'getExternalFilesDirs',
			'(Ljava/lang/String;)[Ljava/io/File;');

		if (getExternalFilesDirsJNI != null)
		{
			final dirs:Array<String> = [];

			for (dir in cast(getExternalFilesDirsJNI(type), Array<Dynamic>))
				dirs.push(JNIUtil.getAbsolutePath(dir));

			return dirs;
		}

		return [];
	}

	/**
	 * Retrieves the absolute path of the directory assigned to the application for storing cached files.
	 *
	 * @return The absolute path of the cache directory.
	 */
	public static function getCacheDir():String
	{
		final getCacheDirJNI = JNICache.createStaticMethod('org.haxe.extension.Tools', 'getCacheDir', '()Ljava/io/File;');

		return getCacheDirJNI != null ? JNIUtil.getAbsolutePath(getCacheDirJNI()) : '';
	}

	/**
	 * Retrieves the absolute path of the directory assigned to the application for storing cached code.
	 *
	 * @return The absolute path of the code cache directory.
	 */
	public static function getCodeCacheDir():String
	{
		final getCodeCacheDirJNI = JNICache.createStaticMethod('org.haxe.extension.Tools', 'getCodeCacheDir', '()Ljava/io/File;');

		return getCodeCacheDirJNI != null ? JNIUtil.getAbsolutePath(getCodeCacheDirJNI()) : '';
	}

	/**
	 * Retrieves the absolute path of the directory assigned to the application for storing backup files that won't be backed up by the system.
	 *
	 * @return The absolute path of the no-backup files directory.
	 */
	public static function getNoBackupFilesDir():String
	{
		final getNoBackupFilesDirJNI = JNICache.createStaticMethod('org.haxe.extension.Tools', 'getNoBackupFilesDir', '()Ljava/io/File;');

		return getNoBackupFilesDirJNI != null ? JNIUtil.getAbsolutePath(getNoBackupFilesDirJNI()) : '';
	}

	/**
	 * Retrieves the absolute path of the directory assigned to the application for storing cached files on external storage.
	 *
	 * @return The absolute path of the external cache directory.
	 */
	public static function getExternalCacheDir():String
	{
		final getExternalCacheDirJNI = JNICache.createStaticMethod('org.haxe.extension.Tools', 'getExternalCacheDir', '()Ljava/io/File;');

		return getExternalCacheDirJNI != null ? JNIUtil.getAbsolutePath(getExternalCacheDirJNI()) : '';
	}

	/**
	 * Retrieves the absolute paths of directories assigned to the application for storing cached files on external storage.
	 * This can include multiple directories in cases where there are multiple external storage devices.
	 *
	 * @return An array of absolute paths of the external cache directories.
	 */
	public static function getExternalCacheDirs():Array<String>
	{
		final getExternalCacheDirsJNI:Null<Dynamic> = JNICache.createStaticMethod('org.haxe.extension.Tools', 'getExternalCacheDirs', '()[Ljava/io/File;');

		if (getExternalCacheDirsJNI != null)
		{
			final dirs:Array<String> = [];

			for (dir in cast(getExternalCacheDirsJNI(), Array<Dynamic>))
				dirs.push(JNIUtil.getAbsolutePath(dir));

			return dirs;
		}

		return [];
	}

	/**
	 * Retrieves the absolute path of the directory assigned to the application for storing expansion files (OBB files).
	 *
	 * @return The absolute path of the OBB directory.
	 */
	public static function getObbDir():String
	{
		final getObbDirJNI = JNICache.createStaticMethod('org.haxe.extension.Tools', 'getObbDir', '()Ljava/io/File;');

		return getObbDirJNI != null ? JNIUtil.getAbsolutePath(getObbDirJNI()) : '';
	}
}
