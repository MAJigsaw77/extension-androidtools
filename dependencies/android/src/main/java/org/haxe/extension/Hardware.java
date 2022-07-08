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

public class Hardware extends Extension
{
	public static Point size;

	private static KeyguardLock keyguardLock = null;

	public static final int ORIENTATION_UNSPECIFIED = 0;
	public static final int ORIENTATION_PORTRAIT = 1;
	public static final int ORIENTATION_LANDSCAPE = 2;
	private static int resumeOrientation = 0;

	public static void setRequestedOrientation(int SCREEN_ORIENTATION)
	{
		switch (SCREEN_ORIENTATION)
		{
			case ORIENTATION_PORTRAIT:
				Extension.mainActivity.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
				resumeOrientation = ActivityInfo.SCREEN_ORIENTATION_PORTRAIT;
				break;
			case ORIENTATION_LANDSCAPE:
				Extension.mainActivity.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE);
				resumeOrientation = ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE;
				break;
			default:
				Extension.mainActivity.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_UNSPECIFIED);
				resumeOrientation = ActivityInfo.SCREEN_ORIENTATION_UNSPECIFIED;
				break;
		}
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
		if (resumeOrientation != 0)
			Extension.mainActivity.setRequestedOrientation(resumeOrientation);
	}

	@Override
	public void onStart()
	{
		Display display = mainActivity.getWindowManager().getDefaultDisplay();
		size = new Point();
		display.getSize(size);
	}
}