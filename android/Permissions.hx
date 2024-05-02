package android;

#if (!android && !native)
#error 'extension-androidtools is not supported on your current platform'
#end
import lime.system.JNI;

using StringTools;

class Permissions
{
	/**
	 * Checks whether the app already has the given permission.
	 *
	 * @return the granted permissions.
	 */
	public static inline function getGrantedPermissions():Array<String>
	{
		return getGrantedPermissions_jni();
	}

	/**
	 * Displays a dialog requesting the given permission.
	 * 
	 * @param permission the permission.
	 * @param requestCode the code that should be requested.
	 */
	public static inline function requestPermission(permission:String, requestCode:Int = 1):Void
	{
		requestPermission_jni(!permission.startsWith('android.permission.') ? 'android.permission.$permission' : permission, requestCode);
	}

	@:noCompletion
	private static var getGrantedPermissions_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'getGrantedPermissions', '()[Ljava/lang/String;');

	@:noCompletion
	private static var requestPermission_jni:Dynamic = JNI.createStaticMethod('org/haxe/lime/GameActivity', 'requestPermission', '(Ljava/lang/String;I)V');
}
