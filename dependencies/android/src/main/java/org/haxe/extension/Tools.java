package org.haxe.extension;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Vibrator;
import android.util.Log;
import android.view.View;
import android.view.WindowManager;
import android.widget.Toast;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.haxe.extension.Extension;

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
	as single files using < java path="to/File.java" /> within your
	project, or use the full Android Library Project format (such
	as this example) in order to include your own AndroidManifest
	data, additional dependencies, etc.

	These are also optional, though this example shows a static
	function for performing a single task, like returning a value
	back to Haxe from Java.
*/
public class Tools extends Extension {

	public static String[] getGrantedPermissions() {
		List<String> granted = new ArrayList<String>();

		try {
			PackageInfo packInfo = Extension.mainContext.getPackageManager().getPackageInfo(
				Extension.mainContext.getPackageName(), PackageManager.GET_PERMISSIONS);

			for (int i = 0; i < packInfo.requestedPermissions.length; i++) {
				if ((packInfo.requestedPermissionsFlags[i] & PackageInfo.REQUESTED_PERMISSION_GRANTED) != 0) {
					granted.add(packInfo.requestedPermissions[i]);
				}
			}
		} catch (Exception e) {
			Log.e("Tools", e.toString());
		}

		return granted.toArray(new String[granted.size()]);
	}

	public static void requestPermissions(String[] permissions, int requestCode) {
		Extension.mainActivity.requestPermissions(permissions, requestCode);
	}

	public static void makeText(final String message, final int duration) {
		Extension.mainActivity.runOnUiThread(new Runnable() {
			@Override
			public void run() {
				Toast.makeText(Extension.mainContext, message, duration).show();
			}
		});
	}

	public static void launchPackage(final String packageName) {
		Extension.mainActivity.startActivity(Extension.mainActivity.getPackageManager().getLaunchIntentForPackage(packageName));
	}

	public static boolean isRooted() {
		try {
			// Preform su to get root privledges  
			Process process = Runtime.getRuntime().exec("su");
			process.waitFor();
			if (process.exitValue() != 255) {
				return true;
			}
		} catch (IOException e) {
			Log.e("Tools", e.toString());
		} catch (InterruptedException e) {
			Log.e("Tools", e.toString());
		}

		return false;
	}

	public static void setBrightness(float screenBrightness) {
		WindowManager.LayoutParams attributes = Extension.mainActivity.getWindow().getAttributes();
		attributes.screenBrightness = screenBrightness;
		Extension.mainActivity.getWindow().setAttributes(layout);
	}

	public static float getBrightness() {
		WindowManager.LayoutParams attributes = Extension.mainActivity.getWindow().getAttributes();
		return attributes.screenBrightness;
	}

	public static void vibrate(int duration, int period) {
		Vibrator vibrator = (Vibrator) Extension.mainContext.getSystemService(Context.VIBRATOR_SERVICE);

		// maybe some devices doesn't have a vibrator idk.
		if (vibrator.hasVibrator()) {
			if (period == 0) {
				vibrator.vibrate(duration);
			} else {
				int periodMS = (int) Math.ceil(period / 2);
				int count = (int) Math.ceil((duration / period) * 2);
				long[] pattern = new long[count];

				for (int i = 0; i < count; i++) {
					pattern[i] = periodMS;
				}

				vibrator.vibrate(pattern, -1);
			}
		}
	}

	public static String getStringFromUri(Uri uri) {
		return uri.toString(); // this is abstract, I can't call this in jni.
	}

	public static File getFilesDir() {
		return Extension.mainContext.getFilesDir();
	}

	public static File getExternalFilesDir(String type) {
		return Extension.mainContext.getExternalFilesDir(type);
	}

	public static File getCacheDir() {
		return Extension.mainContext.getCacheDir();
	}

	public static File getExternalCacheDir() {
		return Extension.mainContext.getExternalCacheDir();
	}

	public static File getObbDir() {
		return Extension.mainContext.getObbDir();
	}

	public static Activity getMainActivity() {
		return Extension.mainActivity;
	}

	public static Context getMainContext() {
		return Extension.mainContext;
	}

	public static View getMainView() {
		return Extension.mainView;
	}

	/**
	 * Called when an activity you launched exits, giving you the requestCode 
	 * you started it with, the resultCode it returned, and any additional data 
	 * from it.
	 */
	public boolean onActivityResult(int requestCode, int resultCode, Intent data) {
		return true;
	}

	/**
	 * Callback for the result from requesting permissions.
	 */
	public boolean onRequestPermissionsResult(int requestCode, String permissions[], int[] grantResults) {
		return true;
	}
}
