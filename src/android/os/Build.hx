package android.os;

import lime.system.JNI;

/**
 * @see https://developer.android.com/reference/android/os/Build
 * 
 * @author Saw (M.A. Jigsaw)
 */
class Build
{
	/**
	 * The name of the underlying board, like "goldfish".
	 */
	public static var BOARD:String = JNI.createStaticField("android/os/Build$VERSION", "BOARD", "Ljava/lang/String;");

	/**
	 * The consumer-visible brand with which the product/hardware will be associated, if any.
	 */
	public static var BRAND:String = JNI.createStaticField("android/os/Build$VERSION", "BRAND", "Ljava/lang/String;");

	/**
	 * The name of the industrial design.
	 */
	public static var DEVICE:String = JNI.createStaticField("android/os/Build", "DEVICE", "Ljava/lang/String;");

	/**
	 * No Description.
	 */
	public static var HOST:String = JNI.createStaticField("android/os/Build", "HOST", "Ljava/lang/String;");

	/**
	 * Either a changelist number, or a label like "M4-rc20".
	 */
	public static var ID:String = JNI.createStaticField("android/os/Build", "ID", "Ljava/lang/String;");

	/**
	 * The name of the overall product.
	 */
	public static var PRODUCT:String = JNI.createStaticField("android/os/Build", "PRODUCT", "Ljava/lang/String;");

	/**
	 * The manufacturer of the product/hardware.
	 */
	public static var MANUFACTURER:String = JNI.createStaticField("android/os/Build", "MANUFACTURER", "Ljava/lang/String;");

	/**
	 * The end-user-visible name for the end product.
	 */
	public static var MODEL:String = JNI.createStaticField("android/os/Build", "MODEL", "Ljava/lang/String;");

	/**
	 * No Description.
	 */
	public static var USER:String = JNI.createStaticField("android/os/Build", "USER", "Ljava/lang/String;");
}

class VERSION
{
	/**
	 * The internal value used by the underlying source control to represent this build.
	 * E.g., a perforce changelist number or a git hash.
	 */
	public static var INCREMENTAL:String = JNI.createStaticField("android/os/Build$VERSION", "INCREMENTAL", "Ljava/lang/String;");

	/**
	 * The user-visible version string.
	 */
	public static var RELEASE:String = JNI.createStaticField("android/os/Build$VERSION", "RELEASE", "Ljava/lang/String;");

	/**
	 * The SDK version of the software currently running on this hardware device.
	 */
	public static var SDK_INT:Int = JNI.createStaticField("android/os/Build$VERSION", "SDK_INT", "I");
}
