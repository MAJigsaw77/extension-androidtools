package android.os;

import lime.system.JNI;

/**
 * @see 	https://developer.android.com/reference/android/os/Environment
 * @author 	Saw (M.A. Jigsaw)
 */
class Environment
{
	/**
	 * Return the primary shared/external storage directory.
	 */
	public static function getExternalStorageDirectory():String
	{
		var getExternalStorageDirectory_jni = JNI.createStaticMethod("android/os/Environment", "getExternalStorageDirectory", "()Ljava/io/File;");
		var getAbsolutePath_jni = JNI.createMemberMethod("java/io/File", "getAbsolutePath", "()Ljava/lang/String;");
		return getAbsolutePath_jni(getExternalStorageDirectory_jni());
	}
}
