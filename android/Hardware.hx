package android;

#if android
import lime.system.JNI;
#end

class Hardware 
{
    #if android
    private static var vibrate_jni = JNI.createStaticMethod ("org.haxe.extension.Hardware", "vibrate", "(I)V");
    private static var wakeUp_jni = JNI.createStaticMethod ("org.haxe.extension.Hardware", "wakeUp", "()V");
    private static var get_screen_width_jni = JNI.createStaticMethod ("org.haxe.extension.Hardware", "getScreenWidth", "()I");
    private static var get_screen_height_jni = JNI.createStaticMethod ("org.haxe.extension.Hardware", "getScreenHeight", "()I");
    #end

    public static function vibrate(inputValue:Int)
    {
        #if android
        vibrate_jni(inputValue);
        #end
    }

    public static function wakeUp():Void
    {
        #if android
        wakeUp_jni();
        #end
    }

    public static function getScreenWidth():Int
    {
        var out = -1;
        #if android
        out = get_screen_width_jni();
        #end
        return out;
    }

    public static function getScreenHeight():Int
    {
        var out = -1;
        #if android
        out = get_screen_height_jni();
        #end
        return out;
    }
}
