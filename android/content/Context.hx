package android.content;

#if (!android && !native)
#error 'extension-androidtools is not supported on your current platform'
#end
import lime.system.JNI;

class Context
{
	public static inline function getFilesDir():String
	{
		return getAbsolutePath_jni(getFilesDir_jni());
	}

	public static inline function getExternalFilesDir(type:String = null):String
	{
		return getAbsolutePath_jni(getExternalFilesDir_jni(type));
	}

	public static inline function getCacheDir():String
	{
		return getAbsolutePath_jni(getCacheDir_jni());
	}

	public static inline function getCodeCacheDir():String
	{
		return getAbsolutePath_jni(getCodeCacheDir_jni());
	}

	public static inline function getNoBackupFilesDir():String
	{
		return getAbsolutePath_jni(getNoBackupFilesDir_jni());
	}

	public static inline function getExternalCacheDir():String
	{
		return getAbsolutePath_jni(getExternalCacheDir_jni());
	}

	public static inline function getObbDir():String
	{
		return getAbsolutePath_jni(getObbDir_jni());
	}

	@:noCompletion
	private static var getFilesDir_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'getFilesDir', '()Ljava/io/File;');

	@:noCompletion
	private static var getExternalFilesDir_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'getExternalFilesDir',
		'(Ljava/lang/String;)Ljava/io/File;');

	@:noCompletion
	private static var getCacheDir_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'getCacheDir', '()Ljava/io/File;');

	@:noCompletion
	private static var getCodeCacheDir_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'getCodeCacheDir', '()Ljava/io/File;');

	@:noCompletion
	private static var getNoBackupFilesDir_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'getNoBackupFilesDir', '()Ljava/io/File;');

	@:noCompletion
	private static var getExternalCacheDir_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'getExternalCacheDir', '()Ljava/io/File;');

	@:noCompletion
	private static var getObbDir_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'getObbDir', '()Ljava/io/File;');

	@:noCompletion
	private static var getAbsolutePath_jni:Dynamic = JNI.createMemberMethod('java/io/File', 'getAbsolutePath', '()Ljava/lang/String;');
}
