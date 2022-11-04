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
	/**
	 * Return the primary shared/external storage directory.
	 */
	public static function getFilesDir():String
	{
		var getFilesDir_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'getContextFilesDir', '()Ljava/io/File;');
		var getAbsolutePath_jni:Dynamic = JNI.createMemberMethod('java/io/File', 'getAbsolutePath', '()Ljava/lang/String;');
		return getAbsolutePath_jni(getFilesDir_jni());
	}
}
