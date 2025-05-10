package extension.androidtools;

#if (!android && !native)
#error 'extension-androidtools is not supported on your current platform'
#end
import extension.androidtools.jni.JNICache;

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
		final getGrantedPermissionsJNI:Null<Dynamic> = JNICache.createStaticMethod('org/haxe/extension/Tools', 'requestPermissions', '([Ljava/lang/String;I)V');

		return getGrantedPermissionsJNI != null ? getGrantedPermissionsJNI() : [];
	}

	/**
	 * Requests a specific permission from the user via a dialog.
	 * 
	 * @param permissions The permissions to request. This should be in the format ['android.permission.PERMISSION_NAME'].
	 * @param requestCode The request code to associate with this permission request.
	 */
	public static inline function requestPermissions(permissions:Array<String>, requestCode:Int = 1):Void
	{
		final requestPermissionsJNI:Null<Dynamic> = JNICache.createStaticMethod('org/haxe/extension/Tools', 'requestPermissions', '([Ljava/lang/String;I)V');

		if (requestPermissionsJNI != null)
		{
			final nativePermissions:Array<String> = [];

			for (i in 0...permissions.length)
			{
				if (!permissions[i].startsWith('android.permission.'))
					nativePermissions[i] = 'android.permission.${permissions[i]}';
			}

			requestPermissionsJNI(nativePermissions, requestCode);
		}
	}
}
