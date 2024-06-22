package android;

#if (!android && !native)
#error 'extension-androidtools is not supported on your current platform'
#end
import android.jni.JNICache;

using StringTools;

/**
 * Utility class for handling Android permissions via JNI.
 */
class Permissions
{
	/**
	 * Retrieves the list of permissions granted to the application.
	 *
	 * @return An array of granted permissions.
	 */
	public static inline function getGrantedPermissions():Array<String>
	{
		return JNICache.createStaticMethod('org/haxe/extension/Tools', 'getGrantedPermissions', '()[Ljava/lang/String;')();
	}

	/**
	 * Requests a specific permission from the user via a dialog.
	 *
	 * @param permission The permission to request. This should be in the format 'android.permission.PERMISSION_NAME'.
	 * @param requestCode The request code to associate with this permission request.
	 */
	public static inline function requestPermission(permission:String, requestCode:Int = 1):Void
	{
		JNICache.createStaticMethod('org/haxe/lime/GameActivity', 'requestPermission',
			'(Ljava/lang/String;I)V')(!permission.startsWith('android.permission.') ? 'android.permission.$permission' : permission, requestCode);
	}
}
