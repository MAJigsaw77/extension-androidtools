package android.os;

#if (!android && !native)
#error 'extension-androidtools is not supported on your current platform'
#end
import lime.system.JNI;

class Build
{
	public static final TAG:String = 'Build';

	/**
	 * Value used for when a build property is unknown..
	 */
	public static final UNKNOWN:String = 'unknown';

	/**
	 * The name of the underlying board, like 'goldfish'.
	 */
	public static final BOARD:String = JNI.createStaticField('android/os/Build', 'BOARD', 'Ljava/lang/String;').get();

	/**
	 * The consumer-visible brand with which the product/hardware will be associated, if any.
	 */
	public static final BRAND:String = JNI.createStaticField('android/os/Build', 'BRAND', 'Ljava/lang/String;').get();

	/**
	 * The name of the industrial design.
	 */
	public static final DEVICE:String = JNI.createStaticField('android/os/Build', 'DEVICE', 'Ljava/lang/String;').get();

	/**
	 * Either a changelist number, or a label like 'M4-rc20'.
	 */
	public static final ID:String = JNI.createStaticField('android/os/Build', 'ID', 'Ljava/lang/String;').get();

	/**
	 * The name of the overall product.
	 */
	public static final PRODUCT:String = JNI.createStaticField('android/os/Build', 'PRODUCT', 'Ljava/lang/String;').get();

	/**
	 * The manufacturer of the product/hardware.
	 */
	public static final MANUFACTURER:String = JNI.createStaticField('android/os/Build', 'MANUFACTURER', 'Ljava/lang/String;').get();

	/**
	 * The end-user-visible name for the end product.
	 */
	public static final MODEL:String = JNI.createStaticField('android/os/Build', 'MODEL', 'Ljava/lang/String;').get();

	public static final HOST:String = JNI.createStaticField('android/os/Build', 'HOST', 'Ljava/lang/String;').get();

	public static final USER:String = JNI.createStaticField('android/os/Build', 'USER', 'Ljava/lang/String;').get();

	/**
	 * Returns the version string for the radio firmware.
	 * May return null (if, for instance, the radio is not currently on).
	 */
	public static inline function getRadioVersion():String
	{
		return getRadioVersion_jni();
	}

	@:noCompletion private static var getRadioVersion_jni:Dynamic = JNI.createStaticMethod('android/os/Build', 'getRadioVersion', '()Ljava/lang/String;');
}

class VERSION
{
	/**
	 * The current development codename, or the string "REL" if this is a release build.
	 */
	public static final CODENAME:String = JNI.createStaticField("android/os/Build$VERSION", 'CODENAME', 'Ljava/lang/String;').get();

	/**
	 * The internal value used by the underlying source control to represent this build.
	 * E.g., a perforce changelist number or a git hash.
	 */
	public static final INCREMENTAL:String = JNI.createStaticField("android/os/Build$VERSION", 'INCREMENTAL', 'Ljava/lang/String;').get();

	/**
	 * The user-visible version string.
	 */
	public static final RELEASE:String = JNI.createStaticField("android/os/Build$VERSION", 'RELEASE', 'Ljava/lang/String;').get();

	/**
	 * The user-visible SDK version of the framework in its raw String representation; use SDK_INT instead.
	 */
	public static final SDK:String = JNI.createStaticField("android/os/Build$VERSION", 'SDK', 'Ljava/lang/String;').get();

	/**
	 * The SDK version of the software currently running on this hardware device.
	 */
	public static final SDK_INT:Int = JNI.createStaticField("android/os/Build$VERSION", 'SDK_INT', 'I').get();
}

enum abstract VERSION_CODES(Int) from Int to Int
{
	var BASE = 1;
	var BASE_1_1 = 2;
	var CUPCAKE = 3;
	var DONUT = 4;
	var ECLAIR = 5;
	var ECLAIR_0_1 = 6;
	var ECLAIR_MR1 = 7;
	var FROYO = 8;
	var GINGERBREAD = 9;
	var GINGERBREAD_MR1 = 10;
	var HONEYCOMB = 11;
	var HONEYCOMB_MR1 = 12;
	var HONEYCOMB_MR2 = 13;
	var ICE_CREAM_SANDWICH = 14;
	var ICE_CREAM_SANDWICH_MR1 = 15;
	var JELLY_BEAN = 16;
	var JELLY_BEAN_MR1 = 17;
	var JELLY_BEAN_MR2 = 18;
	var KITKAT = 19;
	var KITKAT_WATCH = 20;
	var LOLLIPOP = 21;
	var LOLLIPOP_MR1 = 22;
	var M = 23;
	var N = 24;
	var N_MR1 = 25;
	var O = 26;
	var O_MR1 = 27;
	var P = 28;
	var Q = 29;
	var R = 30;
	var S = 31;
	var S_V2 = 32;
	var TIRAMISU = 33;
	var UPSIDE_DOWN_CAKE = 34;
}
