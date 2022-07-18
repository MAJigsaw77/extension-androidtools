package android.os;

import lime.system.JNI;

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
		var getDataDirectory_jni:Dynamic = getStaticMethod("getDataDirectory", "()Ljava/io/File;");
		var getAbsolutePath_jni:Dynamic = getMemberMethod("getAbsolutePath", "()Ljava/lang/String;");
		return getAbsolutePath_jni(getDataDirectory_jni());
	}

	/**
	 * Return the download/cache content directory.
	 */
	public static function getDownloadCacheDirectory():String
	{
		var getDownloadCacheDirectory_jni:Dynamic = getStaticMethod("getDownloadCacheDirectory", "()Ljava/io/File;");
		var getAbsolutePath_jni:Dynamic = getMemberMethod("getAbsolutePath", "()Ljava/lang/String;");
		return getAbsolutePath_jni(getDownloadCacheDirectory_jni());
	}

	/**
	 * Return the primary shared/external storage directory.
	 */
	public static function getExternalStorageDirectory():String
	{
		var getExternalStorageDirectory_jni:Dynamic = getStaticMethod("getExternalStorageDirectory", "()Ljava/io/File;");
		var getAbsolutePath_jni:Dynamic = getMemberMethod("getAbsolutePath", "()Ljava/lang/String;");
		return getAbsolutePath_jni(getExternalStorageDirectory_jni());
	}

	/**
	 * Returns whether the primary shared/external storage media is emulated.
	 */
	public static function isExternalStorageEmulated():Bool
	{
		var isExternalStorageEmulated_jni:Dynamic = getStaticMethod("isExternalStorageEmulated", "()Z");
		return isExternalStorageEmulated_jni();
	}

	/**
	 * Returns whether the primary shared/external storage media is physically removable.
	 */
	public static function isExternalStorageRemovable():Bool
	{
		var isExternalStorageRemovable_jni:Dynamic = getStaticMethod("isExternalStorageRemovable", "()Z");
		return isExternalStorageRemovable_jni();
	}

	private function getStaticMethod(memberName:String, signature:String):Dynamic
	{
		try
		{
			return JNI.createStaticMethod("android/os/Environment", memberName, signature);
		}
		catch(e:Dynamic)
		{
			Application.current.window.alert("JNI Return Error: " + e, "Environment from extension-androitools");
		}

		return null;
	}

	private function getMemberMethod(memberName:String, signature:String):Dynamic
	{
		try
		{
			return JNI.createMemberMethod("java/io/File", memberName, signature);
		}
		catch(e:Dynamic)
		{
			Application.current.window.alert("JNI Return Error: " + e, "Environment / Java.io.File from extension-androitools");
		}

		return null;
	}
}
