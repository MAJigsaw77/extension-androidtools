package android.content;

#if (!android && !native && macro)
#error 'extension-androidtools is not supported on your current platform'
#end
import lime.system.JNI;

/**
 * @see https://developer.android.com/reference/android/content/Context
 *
 * @author Mihai Alexandru (M.A. Jigsaw)
 */
class Context
{
	public static function getFilesDir():String
	{
		var getFilesDir_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'getFilesDir', '()Ljava/io/File;');
		return JNI.createMemberMethod('java/io/File', 'getAbsolutePath', '()Ljava/lang/String;')(getFilesDir_jni());
	}

	public static function getExternalFilesDir(type:String = null):String
	{
		var getExternalFilesDir_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'getExternalFilesDir', '(Ljava/lang/String;)Ljava/io/File;');
		return JNI.createMemberMethod('java/io/File', 'getAbsolutePath', '()Ljava/lang/String;')(getExternalFilesDir_jni(type));
	}

	public static function getCacheDir():String
	{
		var getCacheDir_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'getCacheDir', '()Ljava/io/File;');
		return JNI.createMemberMethod('java/io/File', 'getAbsolutePath', '()Ljava/lang/String;')(getCacheDir_jni());
	}

	public static function getExternalCacheDir():String
	{
		var getExternalCacheDir_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'getExternalCacheDir', '()Ljava/io/File;');
		return JNI.createMemberMethod('java/io/File', 'getAbsolutePath', '()Ljava/lang/String;')(getExternalCacheDir_jni());
	}

	public static function getObbDir():String
	{
		var getObbDir_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'getObbDir', '()Ljava/io/File;');
		return JNI.createMemberMethod('java/io/File', 'getAbsolutePath', '()Ljava/lang/String;')(getObbDir_jni());
	}
}
