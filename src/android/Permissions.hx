package android;

import lime.system.JNI;
import android.PermissionsList;

/**
 * @author Saw (M.A. Jigsaw)
 */
class Permissions
{
	/**
	 * Checks whether the app already has the given permission.
	 * Returns the granted permissions.
	 */
	public static function getGrantedPermissions():Array<PermissionsList>
	{
		var getGrantedPermissionsJNI:Dynamic = JNI.createStaticMethod('android/haxe/extensions/Permissions', 'getGrantedPermissions', '()[Ljava/lang/String;');
		return getGrantedPermissionsJNI();
	}

	/**
	 * Displays a dialog requesting all of the given permissions at once.
	 * This dialog will be displayed even if the user already granted the permissions, allowing them to disable them if they like.
	 * 
	 * @param permissions the array of permissions.
	 * @param requestCode the code that should be requested.
	 */
	public static function requestPermissions(permissions:Array<String>, requestCode:Int = 1):Void
	{
		var requestPermissionsJNI:Dynamic = JNI.createStaticMethod('android/haxe/extensions/Permissions', 'requestPermissions', '([Ljava/lang/String;I)V');
		requestPermissionsJNI(permissions, requestCode);
	}
}
