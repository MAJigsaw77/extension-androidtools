package android;

import lime.system.JNI;

/**
 * @author Sirox
 */
class Root
{
	/**
	* Requests root access, if not rooted then nothing would happen when calling this
	*/
	public static function requestRootPerms():Void
	{
		var requestRootPerms_jni:Dynamic = JNI.createStaticMethod('android/haxe/extensions/Root', 'requestRootPerms', '()V');
		requestRootPerms_jni();
	}
}
