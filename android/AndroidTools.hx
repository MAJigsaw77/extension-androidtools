package android;

#if android
import lime.system.JNI;
import android.stuff.*;
#end

class AndroidTools {
	#if android
	public static var callback = new CallbackHelper();

	public static function requestPermission(perm:Permissions = Permissions.READ_EXTERNAL_STORAGE) {
		request_permissions_jni([perm], 1);
	}

	public static function requestPermissions(perm:Array<Permissions>) {
		request_permissions_jni(perm, 1);
	}

	public static function getGrantedPermissions():Array<Permissions> {
		return getGrantedPermissions_jni();
	}

	public static function openFileManager(dir:String, title:String = "select a file", type:String = "*/*", action:Intent = Intent.ACTION_GET_CONTENT, reqcode:Int = 0) {
		return openFileManager_jni(action, dir, type, title, reqcode);
	}

	public static function getExternalStorageDirectory():String {
		return getExternalStorageDirectory_jni();
	}

	public static function appSettings(set:Settings = Settings.ACTION_APPLICATION_DETAILS_SETTINGS, reqcode:Int = 0) {
		return appSettings_jni(set, reqcode);
	}
	
	public static function getSDKversion():Int {
		return getSDKversion_jni();
	}

	public static function getFileUrl(path:String):String {
		return getFileUrl_jni(path);
	}

	private static var request_permissions_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "requestPermissions", "([Ljava/lang/String;I)V");
	private static var getGrantedPermissions_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "getGrantedPermissions", "()[Ljava/lang/String;");
	private static var openFileManager_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "openFileManager", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V");
	private static var getExternalStorageDirectory_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "getExternalStorageDirectory", "()Ljava/lang/String;");
	private static var getSDKversion_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "getSDKversion", "()I");
	private static var getFileUrl_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "getFileUrl", "(Ljava/lang/String;)Ljava/lang/String;");
	private static var appSettings_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "appSettings", "(Ljava/lang/String;I)V");
	#end
}
