package android;

import lime.system.JNI;
import android.PermissionsList;

/**
 * Some functions (not all) ported from a java class to haxe using jni
 *
 * @author 	Saw (M.A. Jigsaw)
 */
class Permissions
{
	/**
	 * Checks whether the app already has the given permission.
	 */
	public static function getGrantedPermissions():Array<PermissionsList>
	{
		var getGrantedPermissionsJNI = JNI.createStaticMethod("org/haxe/extension/Permissions", "getGrantedPermissions", "()[Ljava/lang/String;");
		return getGrantedPermissionsJNI();
	}

	/**
	 * Displays a dialog requesting all of the given permissions at once.
	 * This dialog will be displayed even if the user already granted the permissions, allowing them to disable them if they like.
	 */
	public static function requestPermissions(permissions:Array<String>, requestCode:Int = 1):Void
	{
		var requestPermissionsJNI = JNI.createStaticMethod("org/haxe/extension/Permissions", "requestPermissions", "([Ljava/lang/String;I)V");
		requestPermissionsJNI(permissions, requestCode);
	}
}
