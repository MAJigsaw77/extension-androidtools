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
class Intent
{
	public static final PLAIN:String = 'text/plain';
	public static final RTF:String = 'text/rtf';
	public static final HTML:String = 'text/html';
	public static final JSON:String = 'text/json';
	public static final ANY:String = "text/*";

	/**
	 * Shares a text.
	 */
	public static function sendText(text:String, textType:String):Void
	{
		var sendText_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Hardware', 'sendText', '(Ljava/lang/String;Ljava/lang/String;)V');
		sendText_jni(text, textType);
	}

	/**
	 * Launches a app.
	 */
	public static function launchApp(packageName:String):Void
	{
		var launchApp_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Hardware', 'launchApp', '(Ljava/lang/String;)V');
		launchApp_jni(packageName);
	}

	/**
	 * Runs a intent action.
	 */
	public static function runIntent(action:String, url:String):Void
	{
		var runIntent_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Hardware', 'runIntent', '(Ljava/lang/String;Ljava/lang/String;)V');
		runIntent_jni(action, url);
	}
}
