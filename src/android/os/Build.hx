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
	public static final BOARD:String = getStaticField("BOARD", "Ljava/lang/String;");

	/**
	 * The consumer-visible brand with which the product/hardware will be associated, if any.
	 */
	public static final BRAND:String = getStaticField("BRAND", "Ljava/lang/String;");

	/**
	 * The name of the industrial design.
	 */
	public static final DEVICE:String = getStaticField("DEVICE", "Ljava/lang/String;");

	/**
	 * No Description.
	 */
	public static final HOST:String = getStaticField("HOST", "Ljava/lang/String;");

	/**
	 * Either a changelist number, or a label like "M4-rc20".
	 */
	public static final ID:String = getStaticField("ID", "Ljava/lang/String;");

	/**
	 * The name of the overall product.
	 */
	public static final PRODUCT:String = getStaticField("PRODUCT", "Ljava/lang/String;");

	/**
	 * The manufacturer of the product/hardware.
	 */
	public static final MANUFACTURER:String = getStaticField("MANUFACTURER", "Ljava/lang/String;");

	/**
	 * The end-user-visible name for the end product.
	 */
	public static final MODEL:String = getStaticField("MODEL", "Ljava/lang/String;");

	/**
	 * No Description.
	 */
	public static final USER:String = getStaticField("USER", "Ljava/lang/String;");

	private function getStaticField(memberName:String, signature:String):Dynamic
	{
		try
		{
			return JNI.createStaticField("android/os/Build", memberName, signature).get();
		}
		catch(e:Dynamic)
		{
			Application.current.window.alert("JNI Return Error: " + e, "Build from extension-androitools");
		}

		return null;
	}
}

class VERSION
{
	/**
	 * The internal value used by the underlying source control to represent this build.
	 * E.g., a perforce changelist number or a git hash.
	 */
	public static final INCREMENTAL:String = getStaticField"INCREMENTAL", "Ljava/lang/String;");

	/**
	 * The user-visible version string.
	 */
	public static final RELEASE:String = getStaticField("RELEASE", "Ljava/lang/String;");

	/**
	 * The SDK version of the software currently running on this hardware device.
	 */
	public static final SDK_INT:Int = getStaticField("SDK_INT", "I");

	private function getStaticField(memberName:String, signature:String):Dynamic
	{
		try
		{
			return JNI.createStaticField("android/os/Build$VERSION", memberName, signature).get();
		}
		catch(e:Dynamic)
		{
			Application.current.window.alert("JNI Return Error: " + e, "Build.VERISON from extension-androitools");
		}

		return null;
	}
}
