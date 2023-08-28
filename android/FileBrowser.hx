package android;

#if (!android && !native && macro)
#error 'extension-androidtools is not supported on your current platform'
#end
import haxe.io.Mime;
import lime.system.JNI;

/**
 * @author Mihai Alexandru (M.A. Jigsaw)
 */
class FileBrowser
{
	public static final CREATE_DOCUMENT:String = 'android.intent.action.CREATE_DOCUMENT';
	public static final GET_CONTENT:String = 'android.intent.action.GET_CONTENT';

	/**
	 * Open the file browser.
	 */
	public static function open(action:String, type:Mime, requestCode:Int = 1):Void
	{
		if (action == null || (action != CREATE_DOCUMENT && action != GET_CONTENT))
			return;

		JNI.createStaticMethod('org/haxe/extension/Tools', 'openFileBrowser', '(Ljava/lang/String;Ljava/lang/String;I)V')(action, type, requestCode);
	}
}
