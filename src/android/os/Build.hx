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
	 * The name of the underlying board, like "goldfish".
	 * 
	 * Added in API level 1
	 */
	public static var BOARD:String = JNI.createStaticField("android/os/Build", "BOARD", "Ljava/lang/String;").get();

	/**
	 * The consumer-visible brand with which the product/hardware will be associated, if any.
	 * 
	 * Added in API level 1
	 */
	public static var BRAND:String = JNI.createStaticField("android/os/Build", "BRAND", "Ljava/lang/String;").get();

	/**
	 * The name of the industrial design.
	 * 
	 * Added in API level 1
	 */
	public static var DEVICE:String = JNI.createStaticField("android/os/Build", "DEVICE", "Ljava/lang/String;").get();

	/**
	 * No Description.
	 * 
	 * Added in API level 1
	 */
	public static var HOST:String = JNI.createStaticField("android/os/Build", "HOST", "Ljava/lang/String;").get();

	/**
	 * Either a changelist number, or a label like "M4-rc20".
	 * 
	 * Added in API level 1
	 */
	public static var ID:String = JNI.createStaticField("android/os/Build", "ID", "Ljava/lang/String;").get();

	/**
	 * The name of the overall product.
	 * 
	 * Added in API level 1
	 */
	public static var PRODUCT:String = JNI.createStaticField("android/os/Build", "PRODUCT", "Ljava/lang/String;").get();

	/**
	 * The manufacturer of the product/hardware.
	 * 
	 * Added in API level 4
	 */
	public static var MANUFACTURER:String = JNI.createStaticField("android/os/Build", "MANUFACTURER", "Ljava/lang/String;").get();

	/**
	 * The end-user-visible name for the end product.
	 * 
	 * Added in API level 1
	 */
	public static var MODEL:String = JNI.createStaticField("android/os/Build", "MODEL", "Ljava/lang/String;").get();

	/**
	 * No Description.
	 * 
	 * Added in API level 1
	 */
	public static var USER:String = JNI.createStaticField("android/os/Build", "USER", "Ljava/lang/String;").get();
}

class VERSION
{
	/**
	 * The internal value used by the underlying source control to represent this build. E.g., a perforce changelist number or a git hash.
	 * 
	 * Added in API level 1
	 */
	public static var INCREMENTAL:String = JNI.createStaticField("android/os/Build$VERSION", "INCREMENTAL", "Ljava/lang/String;").get();

	/**
	 * The user-visible version string.
	 * 
	 * Added in API level 1
	 */
	public static var RELEASE:String = JNI.createStaticField("android/os/Build$VERSION", "RELEASE", "Ljava/lang/String;").get();

	/**
	 * The SDK version of the software currently running on this hardware device.
	 * 
	 * Added in API level 1
	 * Deprecated in API level 15
	 */
	public static var SDK:Int = JNI.createStaticField("android/os/Build$VERSION", "SDK", "I").get();

	/**
	 * The SDK version of the software currently running on this hardware device.
	 * 
	 * Added in API level 4
	 */
	public static var SDK_INT:Int = JNI.createStaticField("android/os/Build$VERSION", "SDK_INT", "I").get();
}
