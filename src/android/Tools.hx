package android;

import lime.system.JNI;

/**
 * @author 	Saw (M.A. Jigsaw)
 */
class Tools
{
	/**
	 * Return's the file path you gave it but with a url like this (/storage/emulated/0/Documents/file.txt) to this (file:///storage/emulated/0/Documents/file.txt).
	 */
	public static function getFileUrl(path:String):String
	{
		var getFileUrl_jni = JNI.createStaticMethod("org/haxe/extension/Tools", "getFileUrl", "(Ljava/lang/String;)Ljava/lang/String;");
		return getFileUrl_jni(path);
	}
}
