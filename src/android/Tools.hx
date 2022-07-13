package android;

import lime.system.JNI;

/**
 * @author Saw (M.A. Jigsaw)
 */
class Tools
{
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
