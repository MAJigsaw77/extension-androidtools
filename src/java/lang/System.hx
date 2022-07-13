package;

import lime.system.JNI;

/**
 * @author Saw (M.A. Jigsaw)
 */
class System
{
	/**
	 * Runs the garbage collector.
	 */
	public static function exit(status:Int):Void
	{
		var gc_jni:Dynamic = JNI.createStaticMethod('java/lang/System', 'gc', '(I)V');
		return gc_jni(status);
	}

	/**
	 * Runs the garbage collector.
	 */
	public static function gc():Void
	{
		var gc_jni:Dynamic = JNI.createStaticMethod('java/lang/System', 'gc', '()V');
		return gc_jni();
	}

	/**
	 * Gets the value of the specified environment variable.
	 * 
	 * @param name the name of the environment variable.
	 */
	public static function getEnv(name:String):String
	{
		var getenv_jni:Dynamic = JNI.createStaticMethod('java/lang/System', 'getenv', '(Ljava/lang/String;)Ljava/lang/String;');
		return getenv_jni(name);
	}

	/**
	 * Loads the system library specified by the libname argument.
	 * 
	 * @param libname the name of the library.
	 */
	public static function loadLibrary(libname:String):Void
	{
		var loadLibrary_jni:Dynamic = JNI.createStaticMethod('java/lang/System', 'loadLibrary', '(Ljava/lang/String;)V');
		loadLibrary_jni(libname);
	}
}