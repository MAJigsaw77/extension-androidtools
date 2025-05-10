package extension.androidtools.os;

import lime.system.JNI.JNIStaticField;
#if (!android && !native)
#error 'extension-androidtools is not supported on your current platform'
#end
import extension.androidtools.jni.JNICache;

/**
 * Various info about the current build, extracted from system properties.
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
	public static var BOARD(get, never):String;

	private static function get_BOARD():String
	{
		final field:Null<Dynamic> = JNICache.createStaticField('android/os/Build', 'BOARD', 'Ljava/lang/String;');

		return field != null ? field.get() : '';
	}

	/**
	 * The system bootloader version number.
	 */
	public static var BOOTLOADER(get, never):String;

	private static function get_BOOTLOADER():String
	{
		final field:Null<Dynamic> = JNICache.createStaticField('android/os/Build', 'BOOTLOADER', 'Ljava/lang/String;');

		return field != null ? field.get() : '';
	}

	/**
	 * The consumer-visible brand with which the product/hardware will be associated, if any.
	 */
	public static var BRAND(get, never):String;

	private static function get_BRAND():String
	{
		final field:Null<Dynamic> = JNICache.createStaticField('android/os/Build', 'BRAND', 'Ljava/lang/String;');

		return field != null ? field.get() : '';
	}

	/**
	 * The name of the industrial design.
	 */
	public static var DEVICE(get, never):String;

	private static function get_DEVICE():String
	{
		final field:Null<Dynamic> = JNICache.createStaticField('android/os/Build', 'DEVICE', 'Ljava/lang/String;');

		return field != null ? field.get() : '';
	}

	/**
	 * Either a changelist number, or a label like 'M4-rc20'.
	 */
	public static var ID(get, never):String;

	private static function get_ID():String
	{
		final field:Null<Dynamic> = JNICache.createStaticField('android/os/Build', 'ID', 'Ljava/lang/String;');

		return field != null ? field.get() : '';
	}

	/**
	 * The name of the overall product.
	 */
	public static var PRODUCT(get, never):String;

	private static function get_PRODUCT():String
	{
		final field:Null<Dynamic> = JNICache.createStaticField('android/os/Build', 'PRODUCT', 'Ljava/lang/String;');

		return field != null ? field.get() : '';
	}

	/**
	 * The manufacturer of the product/hardware.
	 */
	public static var MANUFACTURER(get, never):String;

	private static function get_MANUFACTURER():String
	{
		final field:Null<Dynamic> = JNICache.createStaticField('android/os/Build', 'MANUFACTURER', 'Ljava/lang/String;');

		return field != null ? field.get() : '';
	}

	/**
	 * The name of the hardware (from the kernel command line or /proc).
	 */
	public static var HARDWARE(get, never):String;

	private static function get_HARDWARE():String
	{
		final field:Null<Dynamic> = JNICache.createStaticField('android/os/Build', 'HARDWARE', 'Ljava/lang/String;');

		return field != null ? field.get() : '';
	}

	/**
	 * The end-user-visible name for the end product.
	 */
	public static var MODEL(get, never):String;

	private static function get_MODEL():String
	{
		final field:Null<Dynamic> = JNICache.createStaticField('android/os/Build', 'MODEL', 'Ljava/lang/String;');

		return field != null ? field.get() : '';
	}

	/**
	 * The ODM partition fingerprint.
	 */
	public static var ODM_SKU(get, never):String;

	private static function get_ODM_SKU():String
	{
		if (VERSION.SDK_INT >= VERSION_CODES.S)
		{
			final field:Null<Dynamic> = JNICache.createStaticField('android/os/Build', 'ODM_SKU', 'Ljava/lang/String;');

			return field != null ? field.get() : '';
		}

		return UNKNOWN;
	}

	/**
	 * The SKU identifier.
	 */
	public static var SKU(get, never):String;

	private static function get_SKU():String
	{
		if (VERSION.SDK_INT >= VERSION_CODES.S)
		{
			final field:Null<Dynamic> = JNICache.createStaticField('android/os/Build', 'SKU', 'Ljava/lang/String;');

			return field != null ? field.get() : '';
		}

		return UNKNOWN;
	}

	/**
	 * The manufacturer of the SOC.
	 */
	public static var SOC_MANUFACTURER(get, never):String;

	private static function get_SOC_MANUFACTURER():String
	{
		if (VERSION.SDK_INT >= VERSION_CODES.S)
		{
			final field:Null<Dynamic> = JNICache.createStaticField('android/os/Build', 'SOC_MANUFACTURER', 'Ljava/lang/String;');

			return field != null ? field.get() : '';
		}

		return UNKNOWN;
	}

	/**
	 * The model name/number of the SOC.
	 */
	public static var SOC_MODEL(get, never):String;

	private static function get_SOC_MODEL():String
	{
		if (VERSION.SDK_INT >= VERSION_CODES.S)
		{
			final field:Null<Dynamic> = JNICache.createStaticField('android/os/Build', 'SOC_MODEL', 'Ljava/lang/String;');

			return field != null ? field.get() : '';
		}

		return UNKNOWN;
	}

	/**
	 * Comma-separated tags describing the build, like 'unsigned,debug'.
	 */
	public static var TAGS(get, never):String;

	private static function get_TAGS():String
	{
		final field:Null<Dynamic> = JNICache.createStaticField('android/os/Build', 'TAGS', 'Ljava/lang/String;');

		return field != null ? field.get() : '';
	}

	/**
	 * The type of build, like 'user' or 'eng'.
	 */
	public static var TYPE(get, never):String;

	private static function get_TYPE():String
	{
		final field:Null<Dynamic> = JNICache.createStaticField('android/os/Build', 'TYPE', 'Ljava/lang/String;');

		return field != null ? field.get() : '';
	}

	/**
	 * Hostname of the system where the build was compiled.
	 */
	public static var HOST(get, never):String;

	private static function get_HOST():String
	{
		final field:Null<Dynamic> = JNICache.createStaticField('android/os/Build', 'HOST', 'Ljava/lang/String;');

		return field != null ? field.get() : '';
	}

	/**
	 * The username of the builder.
	 */
	public static var USER(get, never):String;

	private static function get_USER():String
	{
		final field:Null<Dynamic> = JNICache.createStaticField('android/os/Build', 'USER', 'Ljava/lang/String;');

		return field != null ? field.get() : '';
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
	public static var BASE_OS(get, never):String;

	private static function get_BASE_OS():String
	{
		final field:Null<Dynamic> = JNICache.createStaticField("android/os/Build$VERSION", 'BASE_OS', 'Ljava/lang/String;');

		return field != null ? field.get() : '';
	}

	/**
	 * The current development codename, or the string 'REL' if this is a release build.
	 */
	public static var CODENAME(get, never):String;

	private static function get_CODENAME():String
	{
		final field:Null<Dynamic> = JNICache.createStaticField("android/os/Build$VERSION", 'CODENAME', 'Ljava/lang/String;');

		return field != null ? field.get() : '';
	}

	/**
	 * The internal value used by the underlying source control to represent this build.
	 */
	public static var INCREMENTAL(get, never):String;

	private static function get_INCREMENTAL():String
	{
		final field:Null<Dynamic> = JNICache.createStaticField("android/os/Build$VERSION", 'INCREMENTAL', 'Ljava/lang/String;');

		return field != null ? field.get() : '';
	}

	/**
	 * The media performance class of the device or 0 if none.
	 */
	public static var MEDIA_PERFORMANCE_CLASS(get, never):Int;

	private static function get_MEDIA_PERFORMANCE_CLASS():Int
	{
		if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S)
		{
			final field:Null<Dynamic> = JNICache.createStaticField("android/os/Build$VERSION", 'MEDIA_PERFORMANCE_CLASS', 'I');

			return field != null ? field.get() : 0;
		}

		return 0;
	}

	/**
	 * The user-visible version string.
	 */
	public static var RELEASE(get, never):String;

	private static function get_RELEASE():String
	{
		final field:Null<Dynamic> = JNICache.createStaticField("android/os/Build$VERSION", 'RELEASE', 'Ljava/lang/String;');

		return field != null ? field.get() : '';
	}

	/**
	 * The user-visible SDK version in raw String form.
	 */
	public static var SDK(get, never):String;

	private static function get_SDK():String
	{
		final field:Null<Dynamic> = JNICache.createStaticField("android/os/Build$VERSION", 'SDK', 'Ljava/lang/String;');

		return field != null ? field.get() : '';
	}

	/**
	 * The integer SDK version of the running software.
	 */
	public static var SDK_INT(get, never):Int;

	private static function get_SDK_INT():Int
	{
		final field:Null<Dynamic> = JNICache.createStaticField("android/os/Build$VERSION", 'SDK_INT', 'I');

		return field != null ? field.get() : 0;
	}

	/**
	 * The preview SDK version, 0 on production builds.
	 */
	public static var PREVIEW_SDK_INT(get, never):Int;

	private static function get_PREVIEW_SDK_INT():Int
	{
		final field:Null<Dynamic> = JNICache.createStaticField("android/os/Build$VERSION", 'PREVIEW_SDK_INT', 'I');

		return field != null ? field.get() : 0;
	}

	/**
	 * Version string for release or codename.
	 */
	public static var RELEASE_OR_CODENAME(get, never):String;

	private static function get_RELEASE_OR_CODENAME():String
	{
		if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R)
		{
			final field:Null<Dynamic> = JNICache.createStaticField("android/os/Build$VERSION", 'RELEASE_OR_CODENAME', 'Ljava/lang/String;');

			return field != null ? field.get() : '';
		}

		return 'unknown';
	}

	/**
	 * Version string shown to users (release or preview label).
	 */
	public static var RELEASE_OR_PREVIEW_DISPLAY(get, never):String;

	private static function get_RELEASE_OR_PREVIEW_DISPLAY():String
	{
		if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU)
		{
			final field:Null<Dynamic> = JNICache.createStaticField("android/os/Build$VERSION", 'RELEASE_OR_PREVIEW_DISPLAY', 'Ljava/lang/String;');

			return field != null ? field.get() : '';
		}

		return 'unknown';
	}

	/**
	 * Last applied security patch date.
	 */
	public static var SECURITY_PATCH(get, never):String;

	private static function get_SECURITY_PATCH():String
	{
		final field:Null<Dynamic> = JNICache.createStaticField("android/os/Build$VERSION", 'SECURITY_PATCH', 'Ljava/lang/String;');

		return field != null ? field.get() : '';
	}
}

/**
 * Constants for Android SDK version codes.
 */
class VERSION_CODES
{
	public static var BASE:Int = 1;
	public static var BASE_1_1:Int = 2;
	public static var CUPCAKE:Int = 3;
	public static var DONUT:Int = 4;
	public static var ECLAIR:Int = 5;
	public static var ECLAIR_0_1:Int = 6;
	public static var ECLAIR_MR1:Int = 7;
	public static var FROYO:Int = 8;
	public static var GINGERBREAD:Int = 9;
	public static var GINGERBREAD_MR1:Int = 10;
	public static var HONEYCOMB:Int = 11;
	public static var HONEYCOMB_MR1:Int = 12;
	public static var HONEYCOMB_MR2:Int = 13;
	public static var ICE_CREAM_SANDWICH:Int = 14;
	public static var ICE_CREAM_SANDWICH_MR1:Int = 15;
	public static var JELLY_BEAN:Int = 16;
	public static var JELLY_BEAN_MR1:Int = 17;
	public static var JELLY_BEAN_MR2:Int = 18;
	public static var KITKAT:Int = 19;
	public static var KITKAT_WATCH:Int = 20;
	public static var LOLLIPOP:Int = 21;
	public static var LOLLIPOP_MR1:Int = 22;
	public static var M:Int = 23;
	public static var N:Int = 24;
	public static var N_MR1:Int = 25;
	public static var O:Int = 26;
	public static var O_MR1:Int = 27;
	public static var P:Int = 28;
	public static var Q:Int = 29;
	public static var R:Int = 30;
	public static var S:Int = 31;
	public static var S_V2:Int = 32;
	public static var TIRAMISU:Int = 33;
	public static var UPSIDE_DOWN_CAKE:Int = 34;
	public static var VANILLA_ICE_CREAM:Int = 35;
}
