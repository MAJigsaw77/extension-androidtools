package android.os;

#if (!android && !native)
#error 'extension-androidtools is not supported on your current platform'
#end
import lime.system.JNI;

class BatteryManager
{
	public static final BATTERY_PROPERTY_CHARGE_COUNTER:Int = 1;
	public static final BATTERY_PROPERTY_CURRENT_NOW:Int = 2;
	public static final BATTERY_PROPERTY_CURRENT_AVERAGE:Int = 3;
	public static final BATTERY_PROPERTY_CAPACITY:Int = 4;
	public static final BATTERY_PROPERTY_ENERGY_COUNTER:Int = 5;

	@:noCompletion
	private var constructor:Dynamic;

	public function new():Void
	{
		constructor = getBatteryManager_jni();
	}

	public function isCharging():Bool
	{
		return JNI.callMember(JNI.createMemberMethod('android/os/BatteryManager', 'isCharging', '()Z'), constructor, []);
	}

	public function getProperty(id:Int):Int
	{
		return JNI.callMember(JNI.createMemberMethod('android/os/BatteryManager', 'getIntProperty', '(I)I'), constructor, [id]);
	}

	@:noCompletion
	private static var getBatteryManager_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Tools', 'getBatteryManager', '()Landroid/os/BatteryManager;');
}
