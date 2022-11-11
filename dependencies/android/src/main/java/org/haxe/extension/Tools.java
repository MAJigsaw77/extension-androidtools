package org.haxe.extension;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.util.Log;
import android.graphics.Point;
import android.net.Uri;
import android.os.PowerManager;
import android.os.PowerManager.WakeLock;
import android.os.Vibrator;
import android.view.Display;
import android.view.WindowManager;
import android.widget.Toast;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.util.Base64;

import org.haxe.extension.Extension;
import org.haxe.lime.HaxeObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class Tools extends Extension {

	public static String[] getGrantedPermissions() {
		List<String> granted = new ArrayList<String>();

		try {
			PackageInfo packInfo = Extension.mainContext.getPackageManager().getPackageInfo(
				Extension.mainContext.getPackageName(), PackageManager.GET_PERMISSIONS);

			for (int i = 0; i < packInfo.requestedPermissions.length; i++) {
				if ((packInfo.requestedPermissionsFlags[i] & PackageInfo.REQUESTED_PERMISSION_GRANTED) != 0) granted.add(packInfo.requestedPermissions[i]);
			}
		} catch (Exception e) {
			Log.e("Tools", e.toString());
		}

		return granted.toArray(new String[granted.size()]);
	}

	public static void requestPermissions(
		String[] permissions, int requestCode) {
		Extension.mainActivity.requestPermissions(permissions, requestCode);
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

	public static String fromFile(File file) {
		return Uri.fromFile(file).toString();
	}

	public static void showToast(Toast toast) {
		Extension.mainActivity.runOnUiThread(new Runnable() {
			@Override
			public void run() {
				toast.show();
			}
		});
	}

	public static void cancelToast(Toast toast) {
		Extension.mainActivity.runOnUiThread(new Runnable() {
			@Override
			public void run() {
				toast.cancel();
			}
		});
	}

	public static void sendText(final String data, final String textType) {
		Intent sendIntent = new Intent();
		sendIntent.setAction(Intent.ACTION_SEND);
		sendIntent.putExtra(Intent.EXTRA_TEXT, data);
		sendIntent.setType(textType);
		Extension.mainActivity.startActivity(Intent.createChooser(sendIntent, null));
	}

	public static void launchApp(final String packageName) {
		Extension.mainActivity.startActivity(Extension.mainActivity.getPackageManager().getLaunchIntentForPackage(packageName));
	}

	public static void runIntent(final String action, final String uri) {
		Intent intent = new Intent(action);

		if (uri != null)
			intent.setData(Uri.parse(uri));
		Extension.mainActivity.startActivity(intent);
	}

	public static void setBrightness(float brightness) {
		WindowManager.LayoutParams layout = Extension.mainActivity.getWindow().getAttributes();
		layout.screenBrightness = brightness;
		Extension.mainActivity.getWindow().setAttributes(layout);
	}

	public static void vibrate(int duration, int period) {
		Vibrator vibrator = (Vibrator) Extension.mainContext.getSystemService(Context.VIBRATOR_SERVICE);

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
