package android.widget;

#if (!android && !native)
#error 'extension-androidtools is not supported on your current platform'
#end
import lime.system.JNI;

class Toast
{
	public static final LENGTH_SHORT:Int = 0;
	public static final LENGTH_LONG:Int = 1;

	/**
	 * Makes a toast text.
	 */
	public static inline function makeText(text:String, duration:Int, ?gravity:Int = -1, ?xOffset:Int = 0, ?yOffset:Int = 0):Void
	{
		makeText_jni(text, duration, gravity, xOffset, yOffset);
	}

	@:noCompletion
	private static var makeText_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'makeToastText', '(Ljava/lang/String;IIII)V');
}
