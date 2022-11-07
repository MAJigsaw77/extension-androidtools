package android.content;

#if (!android && !native && macro)
#error 'extension-androidtools is not supported on your current platform'
#end
import openfl.display.BitmapData;
import openfl.display.PNGEncoderOptions;
import openfl.utils.ByteArray;
import haxe.crypto.Base64;
import lime.system.JNI;

/**
 * @author Mihai Alexandru (M.A. Jigsaw)
 */
#if !debug
@:fileXml('tags="haxe,release"')
@:noDebug
#end
@:access(lime.system.JNI)
class Context
{
	public static function getFilesDir():String
	{
		var getFilesDir_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'getFilesDir', '()Ljava/io/File;');
		var getAbsolutePath_jni:Dynamic = JNI.createMemberMethod('java/io/File', 'getAbsolutePath', '()Ljava/lang/String;');
		return getAbsolutePath_jni(getFilesDir_jni());
	}

	public static function getExternalFilesDir(type:String):String
	{
		var getExternalFilesDir_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'getExternalFilesDir', '(Ljava/lang/String;)Ljava/io/File;');
		var getAbsolutePath_jni:Dynamic = JNI.createMemberMethod('java/io/File', 'getAbsolutePath', '()Ljava/lang/String;');
		return getAbsolutePath_jni(getExternalFilesDir_jni(type));
	}

	public static function setWallpaper(bitmap:BitmapData):Void
	{
		var getBitmap_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'getBitmap', '(Ljava/lang/String;)Landroid.graphics.Bitmap;');
		var setWallpaper_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'setWallpaper', '(Landroid.graphics.Bitmap;)V');

		var bytes:ByteArray = bitmap.encode(bitmap.rect, new PNGEncoderOptions());
		bytes.position = 0;

		setWallpaper_jni(getBitmap(Base64.encode(bytes)));
		bytes.clear();
	}

	public static function getWallpaper():BitmapData
	{
		var getBitmapToBase64_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'getBitmapToBase64', '(Landroid.graphics.Bitmap;)Ljava/lang/String;');
		var getWallpaper_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'getWallpaper', '()Landroid.graphics.Bitmap;');
		return BitmapData.fromBase64(getBitmapToBase64(getWallpaper()));
	}
}
