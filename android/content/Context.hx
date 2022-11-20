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
@:access(lime.system.JNI)
class Context
{
	public static function getFilesDir():String
	{
		var getFilesDir_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'getFilesDir', '()Ljava/io/File;');
		var getAbsolutePath_jni:Dynamic = JNI.createMemberMethod('java/io/File', 'getAbsolutePath', '()Ljava/lang/String;');
		return getAbsolutePath_jni(getFilesDir_jni());
	}

	public static function getExternalFilesDir(type:String = null):String
	{
		var getExternalFilesDir_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'getExternalFilesDir', '(Ljava/lang/String;)Ljava/io/File;');
		var getAbsolutePath_jni:Dynamic = JNI.createMemberMethod('java/io/File', 'getAbsolutePath', '()Ljava/lang/String;');
		return getAbsolutePath_jni(getExternalFilesDir_jni(type));
	}

	public static function getCacheDir():String
	{
		var getCacheDir_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'getCacheDir', '()Ljava/io/File;');
		var getAbsolutePath_jni:Dynamic = JNI.createMemberMethod('java/io/File', 'getAbsolutePath', '()Ljava/lang/String;');
		return getAbsolutePath_jni(getCacheDir_jni());
	}

	public static function getExternalCacheDir():String
	{
		var getExternalCacheDir_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'getExternalCacheDir', '()Ljava/io/File;');
		var getAbsolutePath_jni:Dynamic = JNI.createMemberMethod('java/io/File', 'getAbsolutePath', '()Ljava/lang/String;');
		return getAbsolutePath_jni(getExternalCacheDir_jni());
	}

	public static function getObbDir():String
	{
		var getObbDir_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'getObbDir', '()Ljava/io/File;');
		var getAbsolutePath_jni:Dynamic = JNI.createMemberMethod('java/io/File', 'getAbsolutePath', '()Ljava/lang/String;');
		return getAbsolutePath_jni(getObbDir_jni());
	}
}
