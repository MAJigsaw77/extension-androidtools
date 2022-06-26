package android.os;

import lime.system.JNI;

class Build {
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