package;

import lime.system.JNI;

/**
 * Some functions (not all) ported from java to haxe using jni
 *
 * @see 	https://developer.android.com/reference/android/os/Environment
 * @author 	Saw (M.A. Jigsaw)
 */
class Environment
{
	/**
	 * Standard directory in which to place any audio files that should be in the list of alarms that the user can select (not as regular music).
	 */
	public static var DIRECTORY_ALARMS:String = JNI.createStaticField("android/os/Environment", "DIRECTORY_ALARMS", "Ljava/lang/String;").get();

	/**
	 * Standard directory in which to place any audio files that should be in the list of audiobooks that the user can select (not as regular music).
	 */
	public static var DIRECTORY_AUDIOBOOKS:String = JNI.createStaticField("android/os/Environment", "DIRECTORY_AUDIOBOOKS", "Ljava/lang/String;").get();

	/**
	 * The traditional location for pictures and videos when mounting the device as a camera.
	 */
	public static var DIRECTORY_DCIM:String = JNI.createStaticField("android/os/Environment", "DIRECTORY_DCIM", "Ljava/lang/String;").get();

	/**
	 * Standard directory in which to place documents that have been created by the user.
	 */
	public static var DIRECTORY_DOCUMENTS:String = JNI.createStaticField("android/os/Environment", "DIRECTORY_DOCUMENTS", "Ljava/lang/String;").get();

	/**
	 * Standard directory in which to place files that have been downloaded by the user.
	 */
	public static var DIRECTORY_DOWNLOADS:String = JNI.createStaticField("android/os/Environment", "DIRECTORY_DOWNLOADS", "Ljava/lang/String;").get();

	/**
	 * Standard directory in which to place movies that are available to the user.
	 */
	public static var DIRECTORY_MOVIES:String = JNI.createStaticField("android/os/Environment", "DIRECTORY_MOVIES", "Ljava/lang/String;").get();

	/**
	 * Standard directory in which to place any audio files that should be in the regular list of music for the user.
	 */
	public static var DIRECTORY_MUSIC:String = JNI.createStaticField("android/os/Environment", "DIRECTORY_MUSIC", "Ljava/lang/String;").get();

	/**
	 * Standard directory in which to place any audio files that should be in the list of notifications that the user can select (not as regular music).
	 */
	public static var DIRECTORY_NOTIFICATIONS:String = JNI.createStaticField("android/os/Environment", "DIRECTORY_NOTIFICATIONS", "Ljava/lang/String;").get();

	/**
	 * Standard directory in which to place pictures that are available to the user.
	 */
	public static var DIRECTORY_PICTURES:String = JNI.createStaticField("android/os/Environment", "DIRECTORY_PICTURES", "Ljava/lang/String;").get();

	/**
	 * Standard directory in which to place pictures that are available to the user.
	 */
	public static var DIRECTORY_PICTURES:String = JNI.createStaticField("android/os/Environment", "DIRECTORY_PICTURES", "Ljava/lang/String;").get();

	/**
	 * Standard directory in which to place any audio files that should be in the list of podcasts that the user can select (not as regular music).
	 */
	public static var DIRECTORY_PODCASTS:String = JNI.createStaticField("android/os/Environment", "DIRECTORY_PODCASTS", "Ljava/lang/String;").get();

	/**
	 * Standard directory in which to place any audio files that should be in the list of voice recordings recorded by voice recorder apps that the user can select (not as regular music).
	 */
	public static var DIRECTORY_RECORDINGS:String = JNI.createStaticField("android/os/Environment", "DIRECTORY_RECORDINGS", "Ljava/lang/String;").get();

	/**
	 * Standard directory in which to place any audio files that should be in the list of ringtones that the user can select (not as regular music).
	 */
	public static var DIRECTORY_RINGTONES:String = JNI.createStaticField("android/os/Environment", "DIRECTORY_RINGTONES", "Ljava/lang/String;").get();

	/**
	 * Standard directory in which to place screenshots that have been taken by the user.
	 */
	public static var DIRECTORY_SCREENSHOTS:String = JNI.createStaticField("android/os/Environment", "DIRECTORY_SCREENSHOTS", "Ljava/lang/String;").get();

	/**
	 * Return the primary shared/external storage directory.
	 */
	public static function getExternalStorageDirectory():String
	{
		var getExternalStorageDirectory_jni = JNI.createStaticMethod("android/os/Environment", "getExternalStorageDirectory", "()Ljava/io/File;");
		var getAbsolutePath_jni = JNI.createMemberMethod("java/io/File", "getAbsolutePath", "()Ljava/lang/String;");
		return getAbsolutePath_jni(getExternalStorageDirectory_jni());
	}

	/**
	 * Get a top-level shared/external storage directory for placing files of a particular type.
	 * This is where the user will typically place and manage their own files, so you should be careful about what you put here to ensure you don't erase their files or get in the way of their own organization.
	 *
	 * @param type The type of storage directory to return. Should be one of DIRECTORY_MUSIC, DIRECTORY_PODCASTS, DIRECTORY_RINGTONES, DIRECTORY_ALARMS, DIRECTORY_NOTIFICATIONS, DIRECTORY_PICTURES, DIRECTORY_MOVIES, DIRECTORY_DOWNLOADS, DIRECTORY_DCIM, or DIRECTORY_DOCUMENTS. May not be null.
	 */
	public static function getExternalStoragePublicDirectory(type:String):String
	{
		var getExternalStoragePublicDirectory_jni = JNI.createStaticMethod("android/os/Environment", "getExternalStoragePublicDirectory",
			"(Ljava/lang/String;)Ljava/io/File;");
		var getAbsolutePath_jni = JNI.createMemberMethod("java/io/File", "getAbsolutePath", "()Ljava/lang/String;");
		return getAbsolutePath_jni(getExternalStoragePublicDirectory_jni(type));
	}
}
