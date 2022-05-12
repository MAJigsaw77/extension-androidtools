package android;

#if android
import lime.system.JNI;
import haxe.Json;
import haxe.Constraints.Function;
import android.stuff.*;
#end

class AndroidTools {
	#if android
	public static var callback = new CallbackHelper();

	public static var sdkVersion:Int = JNI.createStaticField("android/os/Build$VERSION", "SDK_INT", "I").get();

	public static function requestPermission(perm:Permissions = Permissions.READ_EXTERNAL_STORAGE):Void {
		var request_permissions_jni = JNI.createStaticMethod("org.haxe.extension.Tools", "requestPermissions", "([Ljava/lang/String;I)V");
		request_permissions_jni([perm], 1);
	}

	public static function requestPermissions(perm:Array<Permissions>):Void {
		var request_permissions_jni = JNI.createStaticMethod("org.haxe.extension.Tools", "requestPermissions", "([Ljava/lang/String;I)V");
		request_permissions_jni(perm, 1);
	}

	public static function getGrantedPermissions():Array<Permissions> {
		var getGrantedPermissions_jni = JNI.createStaticMethod("org.haxe.extension.Tools", "getGrantedPermissions", "()[Ljava/lang/String;");
		return getGrantedPermissions_jni();
	}

	public static function getExternalStorageDirectory():String {
		var getExternalStorageDirectory_jni = JNI.createStaticMethod("org.haxe.extension.Tools", "getExternalStorageDirectory", "()Ljava/lang/String;");
		return getExternalStorageDirectory_jni();
	}

	public static function openFileManager(dir:String, title:String = "select a file", type:String = "*/*", action:Intent = Intent.ACTION_GET_CONTENT, reqcode:Int = 0) {
		var openFileManager_jni = JNI.createStaticMethod("org.haxe.extension.Tools", "openFileManager", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V");
		return openFileManager_jni(action, dir, type, title, reqcode);
	}

	public static function appSettings(set:Settings = Settings.ACTION_APPLICATION_DETAILS_SETTINGS, reqcode:Int = 0) {
		var appSettings_jni = JNI.createStaticMethod("org.haxe.extension.Tools", "appSettings", "(Ljava/lang/String;I)V");
		return appSettings_jni(set, reqcode);
	}

	public static function getFileUrl(path:String):String {
		var getFileUrl_jni = JNI.createStaticMethod("org.haxe.extension.Tools", "getFileUrl", "(Ljava/lang/String;)Ljava/lang/String;");
		return getFileUrl_jni(path);
	}

    public static function setBrightness(brightness:Float):Void {
        var setbrightness_set_brightness_jni = JNI.createStaticMethod("org.haxe.extension.SetBrightness", "setBrightness", "(F)V");
        setbrightness_set_brightness_jni(brightness);
    }
	#end
}

class CallbackHelper {
    public var listener:Map<String, Array<Function>>;
    
    public function new() {
        listener = new Map();
        listener.set(ExtensionEvent.onActivityResult, new Array());
        listener.set(ExtensionEvent.onRequestPermissionsResult, new Array());

        #if android
        setCallback_jni(this);
        #end
    }

    public function onActivityResult(requestCode:Int, resultCode:Int, ?data:Dynamic){
        for (func in listener.get(ExtensionEvent.onActivityResult)){
            func(requestCode, resultCode, new JavaObject(data));
        }
    }
    public function onRequestPermissionsResult(requestCode:Int, permissions:Array<Permissions>, grantResults:Array<Int>){
        for (func in listener.get(ExtensionEvent.onRequestPermissionsResult)){
            func(requestCode, permissions, grantResults);
        }
    }

    public function addEventListener(event:ExtensionEvent, func:Function){
        listener.get(event).push(func);
    }

    public function removeEventListener(event:ExtensionEvent, func:Function){
        listener.get(event).remove(func);
    }

    #if android
    private static var setCallback_jni = JNI.createStaticMethod("org.haxe.extension.Tools", "setCallback", "(Lorg/haxe/lime/HaxeObject;)V");
    #end
}

class JavaObject {
    
    @:noCompletion public var jobject:Dynamic;
    public var data:Dynamic;

    public function new(obj:Dynamic){
        jobject = obj;
        #if android
        data = Json.parse(objectToJson_jni(obj)); // dont working for now
        #end
    }

    public function compare(jobj:Dynamic){
        if (Std.isOfType(jobj, JavaObject))
            return untyped this.jobject == untyped jobj.jobject;
        return untyped this.jobject == untyped jobj;
    }

    #if android
    private static var objectToJson_jni = JNI.createStaticMethod("org.haxe.extension.Tools", "objectToJson", "(Ljava/lang/Object;)Ljava/lang/String;");
    #end
}

enum abstract ExtensionEvent(String) from String to String {
    var onActivityResult = 'onActivityResult';
    var onRequestPermissionsResult = 'onRequestPermissionsResult';
}
