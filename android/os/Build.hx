package android.os;

#if (!android && !native && macro)
#error 'extension-androidtools is not supported on your current platform'
#end

import lime.system.JNI;

/**
 * @see https://developer.android.com/reference/android/os/Build
 * 
 * @author Mihai Alexandru (M.A. Jigsaw)
 */
#if !debug
@:fileXml('tags="haxe,release"')
@:noDebug
#end
@:access(lime.system.JNI)
class Build
{
	/**
	 * No Description.
	 */
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
	 * No Description.
	 */
	public static final HOST:String = JNI.createStaticField('android/os/Build', 'HOST', 'Ljava/lang/String;').get();

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

	/**
	 * No Description.
	 */
	public static final USER:String = JNI.createStaticField('android/os/Build', 'USER', 'Ljava/lang/String;').get();
}

class VERSION
{
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
	 * The SDK version of the software currently running on this hardware device.
	 */
	public static final SDK_INT:Int = JNI.createStaticField("android/os/Build$VERSION", 'SDK_INT', 'I').get();
}

enum abstract VERSION_CODES(Int) to Int from Int
{
	public static final BASE = 1;
	public static final BASE_1_1 = 2;
	public static final CUPCAKE = 3;
	public static final DONUT = 4;
	public static final ECLAIR = 5;
	public static final ECLAIR_0_1 = 6;
	public static final ECLAIR_MR1 = 7;
	public static final FROYO = 8;
	public static final GINGERBREAD = 9;
	public static final GINGERBREAD_MR1 = 10;
	public static final HONEYCOMB = 11;
	public static final HONEYCOMB_MR1 = 12;
	public static final HONEYCOMB_MR2 = 13;
	public static final ICE_CREAM_SANDWICH = 14;
	public static final ICE_CREAM_SANDWICH_MR1 = 15;
	public static final JELLY_BEAN = 16;
	public static final JELLY_BEAN_MR1 = 17;
	public static final JELLY_BEAN_MR2 = 18;
	public static final KITKAT = 19;
	public static final KITKAT_WATCH = 20;
	public static final LOLLIPOP = 21;
	public static final LOLLIPOP_MR1 = 22;
	public static final M = 23;
	public static final N = 24;
	public static final N_MR1 = 25;
	public static final O = 26;
	public static final O_MR1 = 27;
	public static final P = 28;
	public static final Q = 29;
	public static final R = 30;
	public static final S = 31;
	public static final S_V2 = 32;
	public static final TIRAMISU = 10000;
	public static final UPSIDE_DOWN_CAKE = 10000;
}
