package android.os;

import lime.system.JNI;

/**
 * Some functions (not all) ported from java to haxe using jni
 *
 * @see 	https://developer.android.com/reference/android/os/Build
 * @author 	Saw (M.A. Jigsaw)
 */
class Build
{
	/**
	 * The consumer-visible brand with which the product/hardware will be associated, if any.
	 */
	public static var BRAND:String = JNI.createStaticField("android/os/Build", "BRAND", "Ljava/lang/String;").get();

	/**
	 * The name of the industrial design.
	 */
	public static var DEVICE:String = JNI.createStaticField("android/os/Build", "DEVICE", "Ljava/lang/String;").get();

	/**
	 * The manufacturer of the product/hardware.
	 */
	public static var MANUFACTURER:String = JNI.createStaticField("android/os/Build", "MANUFACTURER", "Ljava/lang/String;").get();

	/**
	 * The end-user-visible name for the end product.
	 */
	public static var MODEL:String = JNI.createStaticField("android/os/Build", "MODEL", "Ljava/lang/String;").get();

	/**
	 * The user-visible version string.
	 */
	public static var RELEASE:String = JNI.createStaticField("android/os/Build$VERSION", "RELEASE", "Ljava/lang/String;").get();

	/**
	 * The SDK version of the software currently running on this hardware device.
	 */
	public static var SDK_INT:Int = JNI.createStaticField("android/os/Build$VERSION", "SDK_INT", "I").get();
}
