package;

import lime.system.JNI;

/**
 * @see https://docs.oracle.com/javase/7/docs/api/java/lang/System.html
 * 
 * @author Saw (M.A. Jigsaw)
 */
class System
{
	/**
	 * Terminates the currently running Java Virtual Machine.
	 * The argument serves as a status code; by convention, a nonzero status code indicates abnormal termination.
	 * 
	 * @param status exit status.
	 */
	public static function exit(status:Int):Void
	{
		var exit_jni:Dynamic = JNI.createStaticMethod("java/lang/System", "exit", "(I)V");
		exit_jni(status);
	}

	/**
	 * Runs the garbage collector.
	 */
	public static function gc():Void
	{
		var gc_jni:Dynamic = JNI.createStaticMethod("java/lang/System", "gc", "()V");
		gc_jni();
	}

	/**
	 * Gets the value of the specified environment variable.
	 * 
	 * @param name the name of the environment variable.
	 */
	public static function getEnv(name:String):String
	{
		var getenv_jni:Dynamic = JNI.createStaticMethod("java/lang/System", "getenv", "(Ljava/lang/String;)Ljava/lang/String;");
		return getenv_jni(name);
	}

	/**
	 * Loads a code file with the specified filename from the local file system as a dynamic library.
	 * The filename argument must be a complete path name.
	 * 
	 * @param filename the name of the library.
	 */
	public static function load(libname:String):Void
	{
		var load_jni:Dynamic = JNI.createStaticMethod("java/lang/System", "load", "(Ljava/lang/String;)V");
		load_jni(filename);
	}

	/**
	 * Loads the system library specified by the libname argument.
	 * 
	 * @param libname the name of the library.
	 */
	public static function loadLibrary(libname:String):Void
	{
		var loadLibrary_jni:Dynamic = JNI.createStaticMethod("java/lang/System", "loadLibrary", "(Ljava/lang/String;)V");
		loadLibrary_jni(libname);
	}
}
