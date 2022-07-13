package android;

import lime.system.JNI;

/**
 * @author Sirox
 */
class RootUtil
{
	/**
	* requests root access, if not rooted then nothing would happen when calling this
	*/
	public static function requestRootPerms():Void
	{
		var requestRootPerms_jni:Dynamic = JNI.createStaticMethod('android/haxe/extensions/RootUtil', 'requestRootPerms', '(V)V');
		requestRootPerms_jni();
	}
}
