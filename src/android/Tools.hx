package android;

import lime.system.JNI;

/**
 * Some functions (not all) ported from a java class to haxe using jni
 *
 * @author 	Saw (M.A. Jigsaw)
 */
class Tools
{
	/**
	 * Return's the file you put as a file with url like from this (/storage/emulated/0/Documents/file.txt) to (file:///storage/emulated/0/Documents/file.txt).
	 */
	public static function getFileUrl(path:String):String
	{
		var getFileUrl_jni = JNI.createStaticMethod("org/haxe/extension/Tools", "getFileUrl", "(Ljava/lang/String;)Ljava/lang/String;");
		return getFileUrl_jni(path);
	}
}
