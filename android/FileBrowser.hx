package android;

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
class FileBrowser
{
	public static final CREATE_DOCUMENT:String = 'android.intent.action.CREATE_DOCUMENT';
	public static final GET_CONTENT:String = 'android.intent.action.GET_CONTENT';

	/**
	 * Open the file browser.
	 */
	public static function open(action:String, type:String = '*/*', requestCode:Int = 1):Void
	{
		if (action == null || (action != CREATE_DOCUMENT && action != GET_CONTENT))
			return;

		var openFileBrowser_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'openFileBrowser', '(Ljava/lang/String;Ljava/lang/String;I)V');
		openFileBrowser_jni(action, type, requestCode);
	}
}
