package android.util;

#if (!android && !native && macro)
#error 'extension-androidtools is not supported on your current platform'
#end
import lime.system.JNI;

/**
 * @see https://developer.android.com/reference/android/util/Log
 * 
 * @author Mihai Alexandru (M.A. Jigsaw)
 */
class Log
{
	public static final ASSERT:Int = 8;
	public static final DEBUG:Int = 3;
	public static final ERROR:Int = 6;
	public static final INFO:Int = 4;
	public static final VERBOSE:Int = 2;
	public static final WARN:Int = 5;

	/**
	 * Send a `DEBUG` log message.
	 */
	public static function d(tag:String, msg:String):Int
	{
		return JNI.createStaticMethod('android/util/Log', 'd', '(Ljava/lang/String;Ljava/lang/String;)I')(tag, msg);
	}

	/**
	 * Send an `ERROR` log message.
	 */
	public static function e(tag:String, msg:String):Int
	{
		return JNI.createStaticMethod('android/util/Log', 'e', '(Ljava/lang/String;Ljava/lang/String;)I')(tag, msg);
	}

	/**
	 * Send an `INFO` log message.
	 */
	public static function i(tag:String, msg:String):Int
	{
		return JNI.createStaticMethod('android/util/Log', 'i', '(Ljava/lang/String;Ljava/lang/String;)I')(tag, msg);
	}

	/**
	 * Checks to see whether or not a log for the specified tag is loggable at the specified level.
	 */
	public static function isLoggable(tag:String, level:Int):Bool
	{
		return JNI.createStaticMethod('android/util/Log', 'isLoggable', '(Ljava/lang/String;I)Z')(tag, level);
	}

	/**
	 * Low-level logging call.
	 */
	public static function println(priority:Int, tag:String, msg:String):Int
	{
		return JNI.createStaticMethod('android/util/Log', 'println', '(ILjava/lang/String;Ljava/lang/String;)I')(priority, tag, msg);
	}

	/**
	 * Send a `VERBOSE` log message.
	 */
	public static function v(tag:String, msg:String):Int
	{
		return JNI.createStaticMethod('android/util/Log', 'v', '(Ljava/lang/String;Ljava/lang/String;)I')(tag, msg);
	}

	/**
	 * Send a `WARN` log message.
	 */
	public static function w(tag:String, msg:String):Int
	{
		return JNI.createStaticMethod('android/util/Log', 'w', '(Ljava/lang/String;Ljava/lang/String;)I')(tag, msg);
	}

	/**
	 * What a Terrible Failure: Report a condition that should never happen.
	 */
	public static function wtf(tag:String, msg:String):Int
	{
		return JNI.createStaticMethod('android/util/Log', 'wtf', '(Ljava/lang/String;Ljava/lang/String;)I')(tag, msg);
	}
}
