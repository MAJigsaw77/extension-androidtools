package android;

import lime.system.JNI;

class Tools
{
	/**
	 * Return's the external storage directory (/storage/emulated/0/).
	 */
	public static function getExternalStorageDirectory():String
	{
		var getExternalStorageDirectory_jni = JNI.createStaticMethod("android/os/Environment", "getExternalStorageDirectory", "()Ljava/io/File;");
		var getAbsolutePath_jni = JNI.createMemberMethod("java/io/File", "getAbsolutePath", "()Ljava/lang/String;");
		return getAbsolutePath_jni(getExternalStorageDirectory_jni());
	}

	/**
	 * Return's the file you put as a file with url like from this (/storage/emulated/0/Documents/file.txt) to (file:///storage/emulated/0/Documents/file.txt).
	 */
	public static function getFileUrl(path:String):String
	{
		var getFileUrl_jni = JNI.createStaticMethod("org/haxe/extension/Tools", "getFileUrl", "(Ljava/lang/String;)Ljava/lang/String;");
		return getFileUrl_jni(path);
	}
}
