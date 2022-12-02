package android.net;

#if (!android && !native && macro)
#error 'extension-androidtools is not supported on your current platform'
#end
import lime.system.JNI;

/**
 * @see https://developer.android.com/reference/android/net/Uri
 * 
 * @author Mihai Alexandru (M.A. Jigsaw)
 */
class Uri
{
	/**
	 * Decodes '%'-escaped octets in the given string using the UTF-8 scheme.
	 * Replaces invalid octets with the unicode replacement character ('\\uFFFD').
	 * 
	 * @param s encoded string to decode
	 */
	public static function decode(s:String):String
	{
		var decode_jni:Dynamic = JNI.createStaticMethod('android/net/Uri', 'decode', '(Ljava/lang/String;)Ljava/lang/String;');
		return decode_jni(s);
	}

	/**
	 * Encodes characters in the given string as '%'-escaped octets using the UTF-8 scheme.
	 * Leaves letters ('A-Z', 'a-z'), numbers ('0-9'), and unreserved characters ('_-!.~'()*') intact.
	 * Encodes all other characters.
	 * 
	 * @param s string to encode
	 * @param allow set of additional characters to allow in the encoded form, null if no characters should be skipped
	 */
	public static function encode(s:String, allow:String):String
	{
		var encode_jni:Dynamic = JNI.createStaticMethod('android/net/Uri', 'encode', '(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;');
		return encode_jni(s, allow);
	}

	/**
	 * Creates a Uri from a file. The URI has the form 'file://'. Encodes path characters with the exception of '/'.
	 * Example: 'file:///tmp/android.txt'.
	 *
	 * @param path
	 */
	public static function fromFile(path:String):String
	{
		var file_jni:Dynamic = JNI.createStaticMethod('java/io/File', '<init>', '(Ljava/lang/String;)V');
		var fromFile_jni:Dynamic = JNI.createStaticMethod('android/net/Uri', 'fromFile', '(Ljava/io/File;)Landroid/net/Uri;');

		var getStringFromUri_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'getStringFromUri', '(Landroid/net/Uri;)Ljava/lang/String;');
		return getStringFromUri_jni(fromFile_jni(file_jni(path)));
	}

	/**
	 * Creates an opaque Uri from the given components.
	 * Encodes the ssp which means this method cannot be used to create hierarchical URIs.
	 *
	 * @param scheme
	 * @param ssp
	 * @param fragment
	 */
	public static function fromParts(scheme:String, ssp:String, fragment:String):String
	{
		var fromParts_jni:Dynamic = JNI.createStaticMethod('android/net/Uri', 'fromParts', '(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;');

		var getStringFromUri_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'getStringFromUri', '(Landroid/net/Uri;)Ljava/lang/String;');
		return getStringFromUri_jni(fromParts_jni(scheme, ssp, fragment));
	}
}
