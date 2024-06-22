package android.os;

#if (!android && !native)
#error 'extension-androidtools is not supported on your current platform'
#end
import android.jni.JNICache;
import lime.system.JNI;

/**
 * Utility class for accessing battery information using JNI.
 */
class BatteryManager
{
	/**
	 * Constant representing the battery property: Charge counter.
	 */
	public static final BATTERY_PROPERTY_CHARGE_COUNTER:Int = 1;

	/**
	 * Constant representing the battery property: Current now.
	 */
	public static final BATTERY_PROPERTY_CURRENT_NOW:Int = 2;

	/**
	 * Constant representing the battery property: Average current.
	 */
	public static final BATTERY_PROPERTY_CURRENT_AVERAGE:Int = 3;

	/**
	 * Constant representing the battery property: Capacity.
	 */
	public static final BATTERY_PROPERTY_CAPACITY:Int = 4;

	/**
	 * Constant representing the battery property: Energy counter.
	 */
	public static final BATTERY_PROPERTY_ENERGY_COUNTER:Int = 5;

	@:noCompletion
	private var constructor:Dynamic;

	/**
	 * Constructs a new instance of BatteryManager.
	 */
	public function new():Void
	{
		constructor = JNICache.createStaticMethod('org/haxe/extension/Tools', 'getBatteryManager', '()Landroid/os/BatteryManager;')();
	}

	/**
	 * Checks whether the device is currently charging.
	 *
	 * @return `true` if the device is charging, otherwise `false`.
	 */
	public function isCharging():Bool
	{
		return JNI.callMember(JNICache.createMemberMethod('android/os/BatteryManager', 'isCharging', '()Z'), constructor, []);
	}

	/**
	 * Retrieves the specified battery property value.
	 *
	 * @param id The ID of the battery property to retrieve.
	 * @return The value of the specified battery property.
	 */
	public function getProperty(id:Int):Int
	{
		return JNI.callMember(JNICache.createMemberMethod('android/os/BatteryManager', 'getIntProperty', '(I)I'), constructor, [id]);
	}
}
