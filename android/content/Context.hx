package android.content;

#if (!android && !native && macro)
#error 'extension-androidtools is not supported on your current platform'
#end
import lime.system.JNI;

/**
 * @author Mihai Alexandru (M.A. Jigsaw)
 */
#if !debug
@:fileXml('tags="haxe,release"')
@:noDebug
#end
@:access(lime.system.JNI)
class Context
{
	public static function getFilesDir():String
	{
		var getFilesDir_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'getFilesDir', '()Ljava/io/File;');
		var getAbsolutePath_jni:Dynamic = JNI.createMemberMethod('java/io/File', 'getAbsolutePath', '()Ljava/lang/String;');
		return getAbsolutePath_jni(getFilesDir_jni());
	}

	public static function getExternalFilesDir(type:String):String
	{
		var getExternalFilesDir_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'getExternalFilesDir', '(Ljava/lang/String;)Ljava/io/File;');
		var getAbsolutePath_jni:Dynamic = JNI.createMemberMethod('java/io/File', 'getAbsolutePath', '()Ljava/lang/String;');
		return getAbsolutePath_jni(getExternalFilesDir_jni(type));
	}
}
