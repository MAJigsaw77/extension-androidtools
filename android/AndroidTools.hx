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

	public static function toast(text:String) {
		#if android
		return toast_jni(text);
		#end
		return null;
	}

	// the best thing ever!!!
	public static function getExternalStorageDirectory():String {
		#if android
		return getExternalStorageDirectory_jni();
		#end
		return null;
	}

	// Again
	public static function getSDPath():String {
		#if android
		return getSDPath_jni();
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

	public static function getFileUrl(path:String):String {
		#if android
		return getFileUrl_jni(path);
                #end
	}

	public static function isHasSD():Bool {
		#if android
		return getIsHasSD_jni();
		#end
		return false;
	}

	public static function isFileExists(path:String):Bool {
		#if android
		return getIsFileExists_jni(path);
		#end
		return false;
	}

	public static function createFileOnSD(folder:String, filepath:String) {
		#if android
		return createFileOnSD_jni(folder, filepath);
		#end
		return null;
	}

	public static function createFoldersOnSD(folder:String) {
		#if android
		return createFoldersOnSD_jni(folder);
		#end
		return null;
	}

	public static function deleteFileOnSD(path:String) {
		#if android
		return deleteFileOnSD_jni(path);
		#end
		return null;
	}

	#if android
	private static var request_permissions_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "requestPermissions", "([Ljava/lang/String;I)V");
	private static var getGrantedPermissions_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "getGrantedPermissions", "()[Ljava/lang/String;");
	private static var openFileManager_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "openFileManager", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V");
	private static var toast_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "toast", "(Ljava/lang/String;)V");
	private static var getExternalStorageDirectory_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "getExternalStorageDirectory", "()Ljava/lang/String;");
	private static var getSDPath_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "getSDPath", "()Ljava/lang/String;");
	private static var goToSettings_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "goToSettings", "()V");
	private static var getSDKversion_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "getSDKversion", "()I");
        private static var getFileUrl_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "getFileUrl", "(Ljava/lang/String;)Ljava/lang/String;");
	private static var getIsHasSD_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "isHasSD", "()B");
	private static var getIsFileExists_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "isFileExists", "(Ljava/lang/String;)B");
	private static var createFileOnSD_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "createFileOnSD", "(Ljava/lang/String;Ljava/lang/String;)V");
	private static var createFoldersOnSD_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "createFoldersOnSD", "(Ljava/lang/String;)V");
	private static var deleteFileOnSD_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "isFileExists", "(Ljava/lang/String;)V");
	#end
}
