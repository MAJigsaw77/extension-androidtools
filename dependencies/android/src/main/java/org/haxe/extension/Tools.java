package org.haxe.extension;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Bundle;
import android.os.Vibrator;
import android.util.ArrayMap;
import android.util.Log;
import android.view.View;
import android.view.WindowManager;
import android.widget.Toast;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import java.io.File;
import java.io.IOException;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import org.haxe.extension.Extension;
import org.haxe.lime.HaxeObject;

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
public class Tools extends Extension {

	public static final String LOG_TAG = "Tools";

	public static HaxeObject hobject;
	public static Gson gson = new GsonBuilder().setPrettyPrinting().serializeNulls().create();

	public static void requestPermissions(final String[] permissions, final int requestCode) {
		try {
			ActivityCompat.requestPermissions(Extension.mainActivity, permissions, requestCode);
		} catch (Exception e) {
			Log.e(LOG_TAG, e.toString());
		}
	}

	public static boolean checkSelfPermission(String permission) {
		try {
			return ContextCompat.checkSelfPermission(Extension.mainContext, permission) == PackageManager.PERMISSION_GRANTED;
		} catch (Exception e) {
			Log.e(LOG_TAG, e.toString());
		}

		return false;
	}
	
	public static boolean shouldShowRequestPermissionRationale(String permission) {
		try {
			return ActivityCompat.shouldShowRequestPermissionRationale(Extension.mainActivity, permission);
		} catch (Exception e) {
			Log.e(LOG_TAG, e.toString());
		}

		return false;
	}

	public static void makeText(final String message, final int duration) {
		Extension.mainActivity.runOnUiThread(new Runnable() {
			@Override
			public void run() {
				Toast.makeText(Extension.mainContext, message, duration).show();
			}
		});
	}

	public static void launchPackage(final String packageName, final int requestCode) {
		try {
			Intent intent = Extension.mainActivity.getPackageManager().getLaunchIntentForPackage(packageName);
			Extension.mainActivity.startActivityForResult(intent, requestCode);
		} catch (Exception e) {
			Log.e(LOG_TAG, e.toString());
		}
	}

	public static void openFileBrowser(final String action, final String type, final int requestCode) {
		try {
			Intent intent = new Intent(action);
			intent.addCategory(Intent.CATEGORY_OPENABLE);
			intent.setType(type != null ? type : "*/*");
			Extension.mainActivity.startActivityForResult(Intent.createChooser(intent, null), requestCode);
		} catch (Exception e) {
			Log.e(LOG_TAG, e.toString());
		}
	}

	public static boolean isRooted() {
		try {
			// Preform su to get root privledges  
			Process execute = Runtime.getRuntime().exec("su");
			execute.waitFor();

			if (execute.exitValue() != 255) {
				return true;
			}
		} catch (Exception e) {
			Log.e(LOG_TAG, e.toString());
		}

		return false;
	}

	public static void setBrightness(final float screenBrightness) {
		WindowManager.LayoutParams layout = Extension.mainActivity.getWindow().getAttributes();
		layout.screenBrightness = screenBrightness;
		Extension.mainActivity.getWindow().setAttributes(layout);
	}

	public static float getBrightness() {
		WindowManager.LayoutParams layout = Extension.mainActivity.getWindow().getAttributes();
		return layout.screenBrightness;
	}

	public static void vibrate(final int duration, final int period) {
		Vibrator vibrator = (Vibrator) Extension.mainContext.getSystemService(Context.VIBRATOR_SERVICE);

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

	public static File getFilesDir() {
		return Extension.mainContext.getFilesDir();
	}

	public static File getExternalFilesDir(final String type) {
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

	public static String getStringFromUri(Uri uri) {
		return uri.toString();
	}

	public static void initCallBack(HaxeObject hobject) {
		Tools.hobject = hobject;
	}

	private void callOnHaxe(final String name, final Object[] objects) {
		if (hobject != null) {
			hobject.call(name, objects);
		}
	}

	/**
	 * Called when an activity you launched exits, giving you the requestCode 
	 * you started it with, the resultCode it returned, and any additional data 
	 * from it.
	 */
	@Override
	public boolean onActivityResult(int requestCode, int resultCode, Intent data) {
		ArrayMap<String, Object> content = new ArrayMap<String, Object>();
		content.put("requestCode", requestCode);
		content.put("resultCode", resultCode);

		if (data != null && data.getData() != null) {
			ArrayMap<String, Object> d = new ArrayMap<String, Object>();
			d.put("uri", data.getData().toString());
			d.put("path", data.getData().getPath());
			content.put("data", d);
		}

		callOnHaxe("onActivityResult", new Object[] {
			gson.toJson(content)
		});
		return true;
	}

	/**
	 * Callback for the result from requesting permissions.
	 */
	@Override
	public boolean onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
		ArrayMap<String, Object> content = new ArrayMap<String, Object>();
		content.put("requestCode", requestCode);
		content.put("permissions", permissions);
		content.put("grantResults", grantResults);

		callOnHaxe("onRequestPermissionsResult", new Object[] {
			gson.toJson(content)
		});
		return true;
	}
}
