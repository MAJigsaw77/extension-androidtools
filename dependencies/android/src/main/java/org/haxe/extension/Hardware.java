package org.haxe.extension;

import android.os.Vibrator;
import android.os.PowerManager;
import android.os.PowerManager.WakeLock;
import android.graphics.Point;
import android.view.Display;
import android.content.res.AssetManager;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.Context;
import android.app.Activity;
import android.app.KeyguardManager;
import android.app.KeyguardManager.KeyguardLock;
import android.view.WindowManager;

import org.haxe.lime.HaxeObject;

import java.io.File;

/* 
	You can use the Android Extension class in order to hook
	into the Android activity lifecycle. This is not required
	for standard Java code, this is designed for when you need
	deeper integration.
	
	You can access additional references from the Extension class,
	depending on your needs:
	
	- Extension.assetManager (android.content.res.AssetManager)
	- Extension.callbackHandler (android.os.Handler)
	- Extension.mainActivity (android.app.Activity)
	- Extension.mainContext (android.content.Context)
	- Extension.mainView (android.view.View)
	
	You can also make references to static or instance methods
	and properties on Java classes. These classes can be included 
	as single files using <java path="to/File.java" /> within your
	project, or use the full Android Library Project format (such
	as this example) in order to include your own AndroidManifest
	data, additional dependencies, etc.
	
	These are also optional, though this example shows a static
	function for performing a single task, like returning a value
	back to Haxe from Java.
*/
public class Hardware extends Extension
{
	public static Point size;

	public static final int ORIENTATION_UNSPECIFIED = 0;
	public static final int ORIENTATION_PORTRAIT = 1;
	public static final int ORIENTATION_LANDSCAPE = 2;

	private static KeyguardLock keyguardLock = null;
	private static int fixedOrientation = 0;

	public static void setRequestedOrientation(int SCREEN_ORIENTATION)
	{
		int requestedOrientation;

		switch (SCREEN_ORIENTATION)
		{
			case ORIENTATION_PORTRAIT:
				requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_PORTRAIT;
				break;
			case ORIENTATION_LANDSCAPE:
				requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE;
				break;
			default:
				requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_UNSPECIFIED;
		}

		Extension.mainActivity.setRequestedOrientation(requestedOrientation);
		fixedOrientation = requestedOrientation;
	}

	public static void setBrightness(float brightness)
	{
		WindowManager.LayoutParams layout = Extension.mainActivity.getWindow().getAttributes();
		layout.screenBrightness = brightness;
		Extension.mainActivity.getWindow().setAttributes(layout);
	}

	public static void vibrate(int duration)
	{
		((Vibrator) mainContext.getSystemService(Context.VIBRATOR_SERVICE)).vibrate(duration);
	}

	public static void wakeUp()
	{
		PowerManager pm = (PowerManager) mainContext.getSystemService(Context.POWER_SERVICE);
		WakeLock wakeLock = pm.newWakeLock(PowerManager.SCREEN_BRIGHT_WAKE_LOCK | PowerManager.ACQUIRE_CAUSES_WAKEUP, "Hardware.class");
		wakeLock.acquire();
		wakeLock.release();
		wakeLock = null;

		KeyguardManager keyguardManager = (KeyguardManager) mainActivity.getSystemService(Activity.KEYGUARD_SERVICE); 
		if(keyguardLock == null)
			keyguardLock = keyguardManager.newKeyguardLock(Activity.KEYGUARD_SERVICE); 

		keyguardLock.disableKeyguard();
	}

	public static int getScreenHeight()
	{
		return size.y;
	}

	public static int getScreenWidth()
	{
		return size.x;
	}

	@Override
	public void onDestroy()
	{
		if(keyguardLock != null)
		{
			keyguardLock.reenableKeyguard();
			keyguardLock = null;
		}
	}

	@Override
	public void onPause()
	{
		if(keyguardLock != null)
			keyguardLock.reenableKeyguard();
	}

	@Override
	public void onResume()
	{
		if (fixedOrientation != 0)
			Extension.mainActivity.setRequestedOrientation(fixedOrientation);
	}

	@Override
	public void onStart()
	{
		Display display = mainActivity.getWindowManager().getDefaultDisplay();
		size = new Point();
		display.getSize(size);
	}
}