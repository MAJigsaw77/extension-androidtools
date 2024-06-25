package android.os;

#if (!android && !native)
#error 'extension-androidtools is not supported on your current platform'
#end
import android.jni.JNICache;

/**
 * Utility class providing access to various build-related information via JNI.
 */
class Build
{
	/**
	 * Tag for logging purposes.
	 */
	public static final TAG:String = 'Build';

	/**
	 * Value used when a build property is unknown.
	 */
	public static final UNKNOWN:String = 'unknown';

	/**
	 * The name of the underlying board, like 'goldfish'.
	 */
	public static final BOARD:String = JNICache.createStaticField('android/os/Build', 'BOARD', 'Ljava/lang/String;').get();

	/**
	 * The system bootloader version number.
	 */
	public static final BOOTLOADER:String = JNICache.createStaticField('android/os/Build', 'BOOTLOADER', 'Ljava/lang/String;').get();

	/**
	 * The consumer-visible brand with which the product/hardware will be associated, if any.
	 */
	public static final BRAND:String = JNICache.createStaticField('android/os/Build', 'BRAND', 'Ljava/lang/String;').get();

	/**
	 * The name of the industrial design.
	 */
	public static final DEVICE:String = JNICache.createStaticField('android/os/Build', 'DEVICE', 'Ljava/lang/String;').get();

	/**
	 * Either a changelist number, or a label like 'M4-rc20'.
	 */
	public static final ID:String = JNICache.createStaticField('android/os/Build', 'ID', 'Ljava/lang/String;').get();

	/**
	 * The name of the overall product.
	 */
	public static final PRODUCT:String = JNICache.createStaticField('android/os/Build', 'PRODUCT', 'Ljava/lang/String;').get();

	/**
	 * The manufacturer of the product/hardware.
	 */
	public static final MANUFACTURER:String = JNICache.createStaticField('android/os/Build', 'MANUFACTURER', 'Ljava/lang/String;').get();

	/**
	 * The name of the hardware (from the kernel command line or /proc).
	 */
	public static final HARDWARE:String = JNICache.createStaticField('android/os/Build', 'HARDWARE', 'Ljava/lang/String;').get();

	/**
	 * The end-user-visible name for the end product.
	 */
	public static final MODEL:String = JNICache.createStaticField('android/os/Build', 'MODEL', 'Ljava/lang/String;').get();

	/**
	 * The SKU of the device as set by the original design manufacturer (ODM).
	 * This is a runtime-initialized property set during startup to configure device services.
	 * If no value is set, this is reported as ``UNKNOWN``.
	 *
	 * The ODM SKU may have multiple variants for the same system SKU in case a manufacturer produces variants of the same design.
	 * For example, the same build may be released with variations in physical keyboard and/or display hardware, each with a different ODM SKU.
	 */
	public static final ODM_SKU:String = (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) ? JNICache.createStaticField('android/os/Build', 'ODM_SKU',
		'Ljava/lang/String;')
		.get() : UNKNOWN;

	/**
	 * The SKU of the hardware (from the kernel command line).
	 * The SKU is reported by the bootloader to configure system software features.
	 * If no value is supplied by the bootloader, this is reported as ``UNKNOWN``.
	 */
	public static final SKU:String = (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) ? JNICache.createStaticField('android/os/Build', 'SKU',
		'Ljava/lang/String;')
		.get() : UNKNOWN;

	/**
	 * The manufacturer of the device's primary system-on-chip.
	 */
	public static final SOC_MANUFACTURER:String = (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) ? JNICache.createStaticField('android/os/Build',
		'SOC_MANUFACTURER', 'Ljava/lang/String;')
		.get() : UNKNOWN;

	/**
	 * The model name of the device's primary system-on-chip.
	 */
	public static final SOC_MODEL:String = (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) ? JNICache.createStaticField('android/os/Build', 'SOC_MODEL',
		'Ljava/lang/String;')
		.get() : UNKNOWN;

	/**
	 * Comma-separated tags describing the build, like "unsigned,debug".
	 */
	public static final TAGS:String = JNICache.createStaticField('android/os/Build', 'TAGS', 'Ljava/lang/String;').get();

	/**
	 * The time at which the build was produced, given in milliseconds since the UNIX epoch.
	 */
	public static final TIME:Int = JNICache.createStaticField('android/os/Build', 'TIME', 'J').get();

	/**
	 * The type of build, like "user" or "eng".
	 */
	public static final TYPE:String = JNICache.createStaticField('android/os/Build', 'TYPE', 'Ljava/lang/String;').get();

	/**
	 * The hostname of the system.
	 */
	public static final HOST:String = JNICache.createStaticField('android/os/Build', 'HOST', 'Ljava/lang/String;').get();

	/**
	 * The user of the system.
	 */
	public static final USER:String = JNICache.createStaticField('android/os/Build', 'USER', 'Ljava/lang/String;').get();

	/**
	 * The version of the radio firmware, or null if not available.
	 */
	public static inline function getRadioVersion():String
	{
		return JNICache.createStaticMethod('android/os/Build', 'getRadioVersion', '()Ljava/lang/String;')();
	}

	/**
	 * Retrieves the hardware serial number, if available.
	 * Requires android.permission.READ_PRIVILEGED_PHONE_STATE.
	 */
	public static inline function getSerial():String
	{
		return JNICache.createStaticMethod('android/os/Build', 'getSerial', '()Ljava/lang/String;')();
	}
}

/**
 * Utility class providing Android version-related constants and information.
 */
class VERSION
{
	/**
	 * The base OS build the product is based on.
	 */
	public static final BASE_OS:String = JNICache.createStaticField("android/os/Build$VERSION", 'BASE_OS', 'Ljava/lang/String;').get();

	/**
	 * The current development codename, or the string "REL" if this is a release build.
	 */
	public static final CODENAME:String = JNICache.createStaticField("android/os/Build$VERSION", 'CODENAME', 'Ljava/lang/String;').get();

	/**
	 * The internal value used by the underlying source control to represent this build.
	 * E.g., a perforce changelist number or a git hash.
	 */
	public static final INCREMENTAL:String = JNICache.createStaticField("android/os/Build$VERSION", 'INCREMENTAL', 'Ljava/lang/String;').get();

	/**
	 * The media performance class of the device or 0 if none.
	 * If this value is not 0, the device conforms to the media performance class definition of the SDK version of this value.
	 * This value never changes while a device is booted, but it may increase when the hardware manufacturer provides an OTA update.
	 * Possible non-zero values are defined in ``Build.VERSION_CODES`` starting with ``Build.VERSION_CODES.R``.
	 */
	public static final MEDIA_PERFORMANCE_CLASS:Int = (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) ? JNICache.createStaticField("android/os/Build$VERSION",
		'MEDIA_PERFORMANCE_CLASS', 'I')
		.get() : 0;

	/**
	 * The user-visible version string.
	 */
	public static final RELEASE:String = JNICache.createStaticField("android/os/Build$VERSION", 'RELEASE', 'Ljava/lang/String;').get();

	/**
	 * The user-visible SDK version of the framework in its raw String representation; use SDK_INT instead.
	 */
	public static final SDK:String = JNICache.createStaticField("android/os/Build$VERSION", 'SDK', 'Ljava/lang/String;').get();

	/**
	 * The SDK version of the software currently running on this hardware device.
	 */
	public static final SDK_INT:Int = JNICache.createStaticField("android/os/Build$VERSION", 'SDK_INT', 'I').get();

	/**
	 * The developer preview revision of a prerelease SDK.
	 * This value will always be 0 on production platform builds/devices.
	 */
	public static final PREVIEW_SDK_INT:Int = JNICache.createStaticField("android/os/Build$VERSION", 'PREVIEW_SDK_INT', 'I').get();

	/**
	 * The version string.
	 * May be ``RELEASE`` or ``CODENAME`` if not a final release build.
	 */
	public static final RELEASE_OR_CODENAME:String = (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) ? JNICache.createStaticField("android/os/Build$VERSION",
		'RELEASE_OR_CODENAME', 'Ljava/lang/String;')
		.get() : "unknown";

	/**
	 * The user-visible version string shown to the user.
	 * May be ``RELEASE`` or a descriptive string if not a final release build.
	 */
	public static final RELEASE_OR_PREVIEW_DISPLAY:String = (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) ? JNICache.createStaticField("android/os/Build$VERSION",
		'RELEASE_OR_PREVIEW_DISPLAY', 'Ljava/lang/String;')
		.get() : "unknown";

	/**
	 * The user-visible security patch level.
	 * This value represents the date when the device most recently applied a security patch.
	 */
	public static final SECURITY_PATCH:String = JNICache.createStaticField("android/os/Build$VERSION", 'SECURITY_PATCH', 'Ljava/lang/String;').get();
}

/**
 * Constants for Android SDK version codes.
 */
class VERSION_CODES
{
	public static final BASE:Int = 1;
	public static final BASE_1_1:Int = 2;
	public static final CUPCAKE:Int = 3;
	public static final DONUT:Int = 4;
	public static final ECLAIR:Int = 5;
	public static final ECLAIR_0_1:Int = 6;
	public static final ECLAIR_MR1:Int = 7;
	public static final FROYO:Int = 8;
	public static final GINGERBREAD:Int = 9;
	public static final GINGERBREAD_MR1:Int = 10;
	public static final HONEYCOMB:Int = 11;
	public static final HONEYCOMB_MR1:Int = 12;
	public static final HONEYCOMB_MR2:Int = 13;
	public static final ICE_CREAM_SANDWICH:Int = 14;
	public static final ICE_CREAM_SANDWICH_MR1:Int = 15;
	public static final JELLY_BEAN:Int = 16;
	public static final JELLY_BEAN_MR1:Int = 17;
	public static final JELLY_BEAN_MR2:Int = 18;
	public static final KITKAT:Int = 19;
	public static final KITKAT_WATCH:Int = 20;
	public static final LOLLIPOP:Int = 21;
	public static final LOLLIPOP_MR1:Int = 22;
	public static final M:Int = 23;
	public static final N:Int = 24;
	public static final N_MR1:Int = 25;
	public static final O:Int = 26;
	public static final O_MR1:Int = 27;
	public static final P:Int = 28;
	public static final Q:Int = 29;
	public static final R:Int = 30;
	public static final S:Int = 31;
	public static final S_V2:Int = 32;
	public static final TIRAMISU:Int = 33;
	public static final UPSIDE_DOWN_CAKE:Int = 34;
	public static final VANILLA_ICE_CREAM:Int = 35;
}
