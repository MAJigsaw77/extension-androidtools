package android;

#if (!android && !native && macro)
#error 'extension-androidtools is not supported on your current platform'
#end

#if (openfl < '4.0.0')
import openfl.utils.JNI;
#else
import lime.system.JNI;
#end
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
		var getGrantedPermissionsJNI:Dynamic = JNI.createStaticMethod('org/haxe/extension/Permissions', 'getGrantedPermissions', '()[Ljava/lang/String;');
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
		var requestPermissionsJNI:Dynamic = JNI.createStaticMethod('org/haxe/extension/Permissions', 'requestPermissions', '([Ljava/lang/String;I)V');
		requestPermissionsJNI(permissions, requestCode);
	}
}
