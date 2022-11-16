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

	public static final USER:String = JNI.createStaticField('android/os/Build', 'USER', 'Ljava/lang/String;').get();

	/**
	 * Returns the version string for the radio firmware.
	 * May return null (if, for instance, the radio is not currently on).
	 */
	public static function getRadioVersion():String
	{
		var getRadioVersion_jni:Dynamic = JNI.createStaticMethod('android/os/Build', 'getRadioVersion', '()Ljava/lang/String;');
		return getRadioVersion_jni();
	}
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
	public static final TIRAMISU:Int = 10000;
	public static final UPSIDE_DOWN_CAKE:Int = 10000;
}
