package android.os;

import lime.system.JNI;

class Build {
	/**
	 * The name of the underlying board, like "goldfish".
	 */
	public static var BOARD:String = JNI.createStaticField("android/os/Build", "BOARD", "Ljava/lang/String;").get();

	/**
	 * The system bootloader version number.
	 */
	public static var BOOTLOADER:String = JNI.createStaticField("android/os/Build", "BOOTLOADER", "Ljava/lang/String;").get();

	/**
	 * The consumer-visible brand with which the product/hardware will be associated, if any.
	 */
	public static var BRAND:String = JNI.createStaticField("android/os/Build", "BRAND", "Ljava/lang/String;").get();

	/**
	 * This field was deprecated in API level 21.
	 * Use SUPPORTED_ABIS instead.
	 */
	public static var CPU_ABI:String = JNI.createStaticField("android/os/Build", "CPU_ABI", "Ljava/lang/String;").get();

	/**
	 * This field was deprecated in API level 21.
	 * Use SUPPORTED_ABIS instead.
	 */
	public static var CPU_ABI2:String = JNI.createStaticField("android/os/Build", "CPU_ABI2", "Ljava/lang/String;").get();

	/**
	 * The name of the industrial design.
	 */
	public static var DEVICE:String = JNI.createStaticField("android/os/Build", "DEVICE", "Ljava/lang/String;").get();

	/**
	 * A build ID string meant for displaying to the user.
	 */
	public static var DISPLAY:String = JNI.createStaticField("android/os/Build", "DISPLAY", "Ljava/lang/String;").get();

	/**
	 * A string that uniquely identifies this build.
	 */
	public static var FINGERPRINT:String = JNI.createStaticField("android/os/Build", "FINGERPRINT", "Ljava/lang/String;").get();

	/**
	 * The name of the hardware (from the kernel command line or /proc).
	 */
	public static var HARDWARE:String = JNI.createStaticField("android/os/Build", "HARDWARE", "Ljava/lang/String;").get();

	/**
	 * No Description.
	 */
	public static var HOST:String = JNI.createStaticField("android/os/Build", "HOST", "Ljava/lang/String;").get();

	/**
	 * Either a changelist number, or a label like "M4-rc20".
	 */
	public static var ID:String = JNI.createStaticField("android/os/Build", "ID", "Ljava/lang/String;").get();

	/**
	 * The manufacturer of the product/hardware.
	 */
	public static var MANUFACTURER:String = JNI.createStaticField("android/os/Build", "MANUFACTURER", "Ljava/lang/String;").get();

	/**
	 * The end-user-visible name for the end product.
	 */
	public static var MODEL:String = JNI.createStaticField("android/os/Build", "MODEL", "Ljava/lang/String;").get();

	/**
	 * The SKU of the device as set by the original design manufacturer (ODM).
	 */
	public static var ODM_SKU:String = JNI.createStaticField("android/os/Build", "ODM_SKU", "Ljava/lang/String;").get();

	/**
	 * The name of the overall product.
	 */
	public static var PRODUCT:String = JNI.createStaticField("android/os/Build", "PRODUCT", "Ljava/lang/String;").get();

	/**
	 * This field was deprecated in API level 15.
	 * The radio firmware version is frequently not available when this class is initialized, leading to a blank or "unknown" value for this string.
	 * Use getRadioVersion() instead.
	 */
	public static var RADIO:String = JNI.createStaticField("android/os/Build", "RADIO", "Ljava/lang/String;").get();

	/**
	 * The SKU of the hardware (from the kernel command line).
	 */
	public static var SKU:String = JNI.createStaticField("android/os/Build", "SKU", "Ljava/lang/String;").get();

	/**
	 * The manufacturer of the device's primary system-on-chip.
	 */
	public static var SOC_MANUFACTURER:String = JNI.createStaticField("android/os/Build", "SOC_MANUFACTURER", "Ljava/lang/String;").get();

	/**
	 * The manufacturer of the device's primary system-on-chip.
	 */
	public static var SOC_MODEL:String = JNI.createStaticField("android/os/Build", "SOC_MODEL", "Ljava/lang/String;").get();

	/**
	 * An ordered list of 32 bit ABIs supported by this device.
	 */
	public static var SUPPORTED_32_BIT_ABIS:Array<String> = JNI.createStaticField("android/os/Build", "SUPPORTED_32_BIT_ABIS", "[Ljava/lang/String;").get();

	/**
	 * An ordered list of 64 bit ABIs supported by this device.
	 */
	public static var SUPPORTED_64_BIT_ABIS:Array<String> = JNI.createStaticField("android/os/Build", "SUPPORTED_64_BIT_ABIS", "[Ljava/lang/String;").get();

	/**
	 * An ordered list of ABIs supported by this device.
	 */
	public static var SUPPORTED_ABIS:Array<String> = JNI.createStaticField("android/os/Build", "SUPPORTED_ABIS", "[Ljava/lang/String;").get();

	/**
	 * Comma-separated tags describing the build, like "unsigned,debug".
	 */
	public static var TAGS:String = JNI.createStaticField("android/os/Build", "TAGS", "Ljava/lang/String;").get();

	/**
	 * The type of build, like "user" or "eng".
	 */
	public static var TYPE:String = JNI.createStaticField("android/os/Build", "TYPE", "Ljava/lang/String;").get();

	/**
	 * No Description.
	 */
	public static var USER:String = JNI.createStaticField("android/os/Build", "USER", "Ljava/lang/String;").get();

	/**
	 * Returns the version string for the radio firmware.
	 */
	public static function getRadioVersion():String
	{
		var getRadioVersion_jni = JNI.createStaticMethod("android/os/Build", "getRadioVersion", "()Ljava/lang/String;");
		return getRadioVersion_jni();
	}

	/**
	 * Gets the hardware serial number, if available.
	 */
	public static function getSerial():String
	{
		var getSerial_jni = JNI.createStaticMethod("android/os/Build", "getSerial", "()Ljava/lang/String;");
		return getSerial_jni();
	}
}

class VERSION {
	/**
	 * The base OS build the product is based on.
	 */
	public static var BASE_OS:String = JNI.createStaticField("android/os/Build$VERSION", "BASE_OS", "Ljava/lang/String;").get();

	/**
	 * The current development codename, or the string "REL" if this is a release build.
	 */
	public static var CODENAME:String = JNI.createStaticField("android/os/Build$VERSION", "CODENAME", "Ljava/lang/String;").get();

	/**
	 * The internal value used by the underlying source control to represent this build.
	 */
	public static var INCREMENTAL:String = JNI.createStaticField("android/os/Build$VERSION", "INCREMENTAL", "Ljava/lang/String;").get();

	/**
	 * The media performance class of the device or 0 if none.
	 */
	public static var MEDIA_PERFORMANCE_CLASS:Int = JNI.createStaticField("android/os/Build$VERSION", "MEDIA_PERFORMANCE_CLASS", "Ljava/lang/String;").get();

	/**
	 * The developer preview revision of a prerelease SDK.
	 */
	public static var PREVIEW_SDK_INT:Int = JNI.createStaticField("android/os/Build$VERSION", "PREVIEW_SDK_INT", "Ljava/lang/String;").get();

	/**
	 * The user-visible version string.
	 */
	public static var RELEASE:String = JNI.createStaticField("android/os/Build$VERSION", "RELEASE", "Ljava/lang/String;").get();

	/**
	 * The version string.
	 */
	public static var RELEASE_OR_CODENAME:String = JNI.createStaticField("android/os/Build$VERSION", "RELEASE_OR_CODENAME", "Ljava/lang/String;").get();

	/**
	 * The version string we show to the user; may be RELEASE or a descriptive string if not a final release build.
	 */
	public static var RELEASE_OR_PREVIEW_DISPLAY:String = JNI.createStaticField("android/os/Build$VERSION", "RELEASE_OR_PREVIEW_DISPLAY", "Ljava/lang/String;").get();

	/**
	 * This field was deprecated in API level 15. Use SDK_INT to easily get this as an integer.
	 */
	public static var SDK:String = JNI.createStaticField("android/os/Build$VERSION", "SDK", "Ljava/lang/String;").get();

	/**
	 * The SDK version of the software currently running on this hardware device.
	 */
	public static var SDK_INT:Int = JNI.createStaticField("android/os/Build$VERSION", "SDK_INT", "I").get();

	/**
	 * The user-visible security patch level.
	 */
	public static var SECURITY_PATCH:String = JNI.createStaticField("android/os/Build$VERSION", "SECURITY_PATCH", "Ljava/lang/String;").get();
}

class VERSION_CODES {
	/**
	 * The original, first, version of Android.
	 */
	public static var BASE:Int = JNI.createStaticField("android/os/Build$VERSION_CODES", "BASE", "I").get();

	/**
	 * First Android update.
	 */
	public static var BASE_1_1:Int = JNI.createStaticField("android/os/Build$VERSION_CODES", "BASE_1_1", "I").get();

	/**
	 * C.
	 */
	public static var CUPCAKE:Int = JNI.createStaticField("android/os/Build$VERSION_CODES", "CUPCAKE", "I").get();

	/**
	 * Magic version number for a current development build, which has not yet turned into an official release.
	 */
	public static var CUR_DEVELOPMENT:Int = JNI.createStaticField("android/os/Build$VERSION_CODES", "CUR_DEVELOPMENT", "I").get();

	/**
	 * D.
	 */
	public static var DONUT:Int = JNI.createStaticField("android/os/Build$VERSION_CODES", "DONUT", "I").get();

	/**
	 * E.
	 */
	public static var ECLAIR:Int = JNI.createStaticField("android/os/Build$VERSION_CODES", "ECLAIR", "I").get();

	/**
	 * E incremental update.
	 */
	public static var ECLAIR_0_1:Int = JNI.createStaticField("android/os/Build$VERSION_CODES", "ECLAIR_0_1", "I").get();

	/**
	 * E MR1.
	 */
	public static var ECLAIR_MR1:Int = JNI.createStaticField("android/os/Build$VERSION_CODES", "ECLAIR_MR1", "I").get();

	/**
	 * F.
	 */
	public static var FROYO:Int = JNI.createStaticField("android/os/Build$VERSION_CODES", "FROYO", "I").get();

	/**
	 * G.
	 */
	public static var GINGERBREAD:Int = JNI.createStaticField("android/os/Build$VERSION_CODES", "GINGERBREAD", "I").get();

	/**
	 * G MR1.
	 */
	public static var GINGERBREAD_MR1:Int = JNI.createStaticField("android/os/Build$VERSION_CODES", "GINGERBREAD_MR1", "I").get();

	/**
	 * H.
	 */
	public static var HONEYCOMB:Int = JNI.createStaticField("android/os/Build$VERSION_CODES", "HONEYCOMB", "I").get();

	/**
	 * H MR1.
	 */
	public static var HONEYCOMB_MR1:Int = JNI.createStaticField("android/os/Build$VERSION_CODES", "HONEYCOMB_MR1", "I").get();

	/**
	 * H MR2.
	 */
	public static var HONEYCOMB_MR2:Int = JNI.createStaticField("android/os/Build$VERSION_CODES", "HONEYCOMB_MR2", "I").get();

	/**
	 * I.
	 */
	public static var ICE_CREAM_SANDWICH:Int = JNI.createStaticField("android/os/Build$VERSION_CODES", "ICE_CREAM_SANDWICH", "I").get();

	/**
	 * I MR1.
	 */
	public static var ICE_CREAM_SANDWICH_MR1:Int = JNI.createStaticField("android/os/Build$VERSION_CODES", "ICE_CREAM_SANDWICH_MR1", "I").get();

	/**
	 * J.
	 */
	public static var JELLY_BEAN:Int = JNI.createStaticField("android/os/Build$VERSION_CODES", "JELLY_BEAN", "I").get();

	/**
	 * J MR1.
	 */
	public static var JELLY_BEAN_MR1:Int = JNI.createStaticField("android/os/Build$VERSION_CODES", "JELLY_BEAN_MR1", "I").get();

	/**
	 * J MR2.
	 */
	public static var JELLY_BEAN_MR2:Int = JNI.createStaticField("android/os/Build$VERSION_CODES", "JELLY_BEAN_MR2", "I").get();

	/**
	 * K.
	 */
	public static var KITKAT:Int = JNI.createStaticField("android/os/Build$VERSION_CODES", "KITKAT", "I").get();

	/**
	 * K for watches.
	 */
	public static var KITKAT_WATCH:Int = JNI.createStaticField("android/os/Build$VERSION_CODES", "KITKAT_WATCH", "I").get();

	/**
	 * L.
	 */
	public static var LOLLIPOP:Int = JNI.createStaticField("android/os/Build$VERSION_CODES", "LOLLIPOP", "I").get();

	/**
	 * L MR1..
	 */
	public static var LOLLIPOP_MR1:Int = JNI.createStaticField("android/os/Build$VERSION_CODES", "LOLLIPOP_MR1", "I").get();

	/**
	 * M.
	 */
	public static var M:Int = JNI.createStaticField("android/os/Build$VERSION_CODES", "M", "I").get();

	/**
	 * N
	 */
	public static var N:Int = JNI.createStaticField("android/os/Build$VERSION_CODES", "N", "I").get();

	/**
	 * N MR1.
	 */
	public static var N_MR1:Int = JNI.createStaticField("android/os/Build$VERSION_CODES", "N_MR1", "I").get();

	/**
	 * O.
	 */
	public static var O:Int = JNI.createStaticField("android/os/Build$VERSION_CODES", "O", "I").get();

	/**
	 * O MR1.
	 */
	public static var O_MR1:Int = JNI.createStaticField("android/os/Build$VERSION_CODES", "O_MR1", "I").get();

	/**
	 * P.
	 */
	public static var P:Int = JNI.createStaticField("android/os/Build$VERSION_CODES", "P", "I").get();

	/**
	 * Q.
	 */
	public static var Q:Int = JNI.createStaticField("android/os/Build$VERSION_CODES", "Q", "I").get();

	/**
	 * R.
	 */
	public static var R:Int = JNI.createStaticField("android/os/Build$VERSION_CODES", "R", "I").get();

	/**
	 * S.
	 */
	public static var S:Int = JNI.createStaticField("android/os/Build$VERSION_CODES", "S", "I").get();

	/**
	 * S V2.
	 */
	public static var S_V2:Int = JNI.createStaticField("android/os/Build$VERSION_CODES", "S_V2", "I").get();

	/**
	 * Tiramisu.
	 */
	public static var TIRAMISU:Int = JNI.createStaticField("android/os/Build$VERSION_CODES", "TIRAMISU", "I").get();
}

class Partition {
	/**
	 * The name identifying the system partition.
	 */
	public static var PARTITION_NAME_SYSTEM:String = JNI.createStaticField("android/os/Build$VERSION", "PARTITION_NAME_SYSTEM", "Ljava/lang/String;").get();
}