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
	public static final BOARD:String = JNI.createStaticField("android/os/Build", "BOARD", "Ljava/lang/String;").get();

	/**
	 * The consumer-visible brand with which the product/hardware will be associated, if any.
	 */
	public static final BRAND:String = JNI.createStaticField("android/os/Build", "BRAND", "Ljava/lang/String;").get();

	/**
	 * The name of the industrial design.
	 */
	public static final DEVICE:String = JNI.createStaticField("android/os/Build", "DEVICE", "Ljava/lang/String;").get();

	/**
	 * No Description.
	 */
	public static final HOST:String = JNI.createStaticField("android/os/Build", "HOST", "Ljava/lang/String;").get();

	/**
	 * Either a changelist number, or a label like "M4-rc20".
	 */
	public static final ID:String = JNI.createStaticField("android/os/Build", "ID", "Ljava/lang/String;").get();

	/**
	 * The name of the overall product.
	 */
	public static final PRODUCT:String = JNI.createStaticField("android/os/Build", "PRODUCT", "Ljava/lang/String;").get();

	/**
	 * The manufacturer of the product/hardware.
	 */
	public static final MANUFACTURER:String = JNI.createStaticField("android/os/Build", "MANUFACTURER", "Ljava/lang/String;").get();

	/**
	 * The end-user-visible name for the end product.
	 */
	public static final MODEL:String = JNI.createStaticField("android/os/Build", "MODEL", "Ljava/lang/String;").get();

	/**
	 * No Description.
	 */
	public static final USER:String = JNI.createStaticField("android/os/Build", "USER", "Ljava/lang/String;").get();
}

class VERSION
{
	/**
	 * The internal value used by the underlying source control to represent this build.
	 * E.g., a perforce changelist number or a git hash.
	 */
	public static final INCREMENTAL:String = JNI.createStaticField("android/os/Build$VERSION", "INCREMENTAL", "Ljava/lang/String;").get();

	/**
	 * The user-visible version string.
	 */
	public static final RELEASE:String = JNI.createStaticField("android/os/Build$VERSION", "RELEASE", "Ljava/lang/String;").get();

	/**
	 * The user-visible SDK version of the framework in its raw String representation.
	 */
	@:deprecated("Use SDK_INT instead")
	public static final SDK:String = JNI.createStaticField("android/os/Build$VERSION", "SDK", "Ljava/lang/String;").get();

	/**
	 * The SDK version of the software currently running on this hardware device.
	 */
	public static final SDK_INT:Int = JNI.createStaticField("android/os/Build$VERSION", "SDK_INT", "I").get();
}
