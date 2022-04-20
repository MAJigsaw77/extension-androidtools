package android;

#if android
import lime.system.JNI;
import android.stuff.*;
#end

class AndroidTools {
	#if android
	public static var callback = new CallbackHelper();

	public static var sdkVersion:Int = JNI.createStaticField("android/os/Build$VERSION", "SDK_INT", "I").get();

	public static function requestPermission(perm:Permissions = Permissions.READ_EXTERNAL_STORAGE) {
		var request_permissions_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "requestPermissions", "([Ljava/lang/String;I)V");
		request_permissions_jni([perm], 1);
	}

	public static function requestPermissions(perm:Array<Permissions>) {
		var request_permissions_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "requestPermissions", "([Ljava/lang/String;I)V");
		request_permissions_jni(perm, 1);
	}

	public static function getGrantedPermissions():Array<Permissions> {
		var getGrantedPermissions_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "getGrantedPermissions", "()[Ljava/lang/String;");
		return getGrantedPermissions_jni();
	}

	public static function openFileManager(dir:String, title:String = "select a file", type:String = "*/*", action:Intent = Intent.ACTION_GET_CONTENT, reqcode:Int = 0) {
		var openFileManager_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "openFileManager", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V");
		return openFileManager_jni(action, dir, type, title, reqcode);
	}

	public static function getExternalStorageDirectory():String {
		var getExternalStorageDirectory_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "getExternalStorageDirectory", "()Ljava/lang/String;");
		return getExternalStorageDirectory_jni();
	}

	public static function appSettings(set:Settings = Settings.ACTION_APPLICATION_DETAILS_SETTINGS, reqcode:Int = 0) {
		var appSettings_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "appSettings", "(Ljava/lang/String;I)V");
		return appSettings_jni(set, reqcode);
	}

	public static function getFileUrl(path:String):String {
		var getFileUrl_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "getFileUrl", "(Ljava/lang/String;)Ljava/lang/String;");
		return getFileUrl_jni(path);
	}
	#end
}
