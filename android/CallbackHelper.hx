package android;

import haxe.Json;
import haxe.Constraints.Function;
import lime.system.JNI;
import android.stuff.Permissions;

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
    private static var setCallback_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "setCallback", "(Lorg/haxe/lime/HaxeObject;)V");
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
    private static var objectToJson_jni = JNI.createStaticMethod("org.haxe.extension.AndroidTools", "objectToJson", "(Ljava/lang/Object;)Ljava/lang/String;");
    #end
}

enum abstract ExtensionEvent(String) from String to String {
    var onActivityResult = 'onActivityResult';
    var onRequestPermissionsResult = 'onRequestPermissionsResult';
}
