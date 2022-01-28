package android;

import lime.system.JNI;

class AndroidTools {

	public static var callback = new CallbackHelper();

	public static function requestPermission(perm:Permissions = Permissions.READ_EXTERNAL_STORAGE) {
		#if android
		request_permissions_jni([perm], 1);
		#end
	}

	public static function requestPermissions(perm:Array<Permissions>) {
		#if android
		request_permissions_jni(perm, 1);
		#end
	}

	public static function getGrantedPermissions():Array<Permissions> {
		#if android
		return getGrantedPermissions_jni();
		#end
		return null;
	}

	public static function openFileManager(dir:String, title:String = "select a file", type:String = "*/*", action:Intent = Intent.ACTION_GET_CONTENT, reqcode:Int = 0) {
		#if android
		return openFileManager_jni(action, dir, type, title, reqcode);
		#end
		return null;
	}

	// short dur - 0, long dur - 1
	public static function toast(text:String, duration:Int = 0) {
		#if android
		return toast_jni(text, duration);
		#end
		return null;
	}

	// try do not use this
	public static function getExternalStorageDirectory():String {
		#if android
		return getExternalStorageDirectory_jni();
		#end
		return null;
	}

	// app settings
	public static function goToSettings() {
		#if android
		return goToSettings_jni();
		#end
		return null;
	}
	
	public static function getSDKversion():Int {
		#if android
		return getSDKversion_jni();
		#end
		return 0;
	}

	#if android
	private static var request_permissions_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "requestPermissions", "([Ljava/lang/String;I)V");
	private static var getGrantedPermissions_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "getGrantedPermissions", "()[Ljava/lang/String;");
	private static var openFileManager_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "openFileManager", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V");
	private static var toast_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "toast", "(Ljava/lang/String;I)V");
	private static var getExternalStorageDirectory_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "getExternalStorageDirectory", "()Ljava/lang/String;");
	private static var goToSettings_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "goToSettings", "()V");
	private static var getSDKversion_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "getSDKversion", "()I");
	#end
}
