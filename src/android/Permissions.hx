package android;

import lime.app.Event;
import lime.system.JNI;
import android.PermissionsList;

/**
 * Some functions (not all) ported from a java class to haxe using jni
 *
 * @author 	Saw (M.A. Jigsaw)
 */
class Permissions
{
	public static var onRequestPermissionsResult:Int->Array<String>->Array<Int>->Void;

	/**
	 * Initialize the callbacks if aren't already.
	 */
	static var initialized:Bool = false;

	private static function init()
	{
		if (!initialized)
		{
			var callBackJNI = JNI.createStaticMethod("org/haxe/extension/Permissions", "init", "(Lorg/haxe/lime/HaxeObject;)V");
			callBackJNI(new CallBack());
			initialized = true;
		}
	}

	/**
	 * Checks whether the app already has the given permission.
	 */
	public static function getGrantedPermissions():Array<PermissionsList>
	{
		var getGrantedPermissionsJNI = JNI.createStaticMethod("org/haxe/extension/Permissions", "getGrantedPermissions", "()[Ljava/lang/String;");
		return getGrantedPermissionsJNI();
	}

	/**
	 * Displays a dialog requesting the given permission. This dialog will be displayed even if the user already granted the permission, allowing them to disable it if they like.
	 */
	public static function requestPermission(permission:String, requestCode:Int = 1):Void
	{
		init();

		var requestPermissionsJNI = JNI.createStaticMethod("org/haxe/extension/Permissions", "requestPermissions", "([Ljava/lang/String;I)V");
		requestPermissionsJNI([permission], requestCode);
	}

	/**
	 * Displays a dialog requesting all of the given permissions at once.
	 * This dialog will be displayed even if the user already granted the permissions, allowing them to disable them if they like.
	 */
	public static function requestPermissions(permissions:Array<String>, requestCode:Int = 1):Void
	{
		init();

		var requestPermissionsJNI = JNI.createStaticMethod("org/haxe/extension/Permissions", "requestPermissions", "([Ljava/lang/String;I)V");
		requestPermissionsJNI(permissions, requestCode);
	}
}

class CallBack
{
	public function new() {}

	public function onRequestPermissionsResult(requestCode:Int, permissions:Array<String>, grantResults:Array<Int>):Void
	{
		if (Permissions.onRequestPermissionsResult != null)
			Permissions.onRequestPermissionsResult(requestCode, permissions, grantResults);
	}
}
