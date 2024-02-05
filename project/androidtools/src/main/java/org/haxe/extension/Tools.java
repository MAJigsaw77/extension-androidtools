package org.haxe.extension;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.media.MediaCodecList;
import android.media.MediaFormat;
import android.net.Uri;
import android.os.BatteryManager;
import android.os.Build;
import android.util.ArrayMap;
import android.util.Log;
import android.view.WindowManager;
import android.widget.Toast;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
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
public class Tools extends Extension
{
	public static final String LOG_TAG = "Tools";

	public static HaxeObject hobject;

	public static Gson gson = new GsonBuilder().setPrettyPrinting().serializeNulls().create();

	public static String[] getGrantedPermissions()
	{
		List<String> granted = new ArrayList<String>();

		try
		{
			PackageInfo info = (PackageInfo) mainContext.getPackageManager().getPackageInfo(packageName, PackageManager.GET_PERMISSIONS);

			for (int i = 0; i < info.requestedPermissions.length; i++)
				if ((info.requestedPermissionsFlags[i] & PackageInfo.REQUESTED_PERMISSION_GRANTED) != 0)
					granted.add(info.requestedPermissions[i]);
		}
		catch (Exception e)
		{
			Log.e(LOG_TAG, e.toString());
		}

		return granted.toArray(new String[granted.size()]);
	}

	public static void makeToastText(final String message, final int duration, final int gravity, final int xOffset, final int yOffset)
	{
		mainActivity.runOnUiThread(new Runnable()
		{
			@Override
			public void run()
			{
				Toast toast = Toast.makeText(mainContext, message, duration);

				if (gravity >= 0)
					toast.setGravity(gravity, xOffset, yOffset);

				toast.show();
			}
		});
	}

	public static void enableAppSecure()
	{
		mainActivity.runOnUiThread(new Runnable()
		{
			@Override
			public void run()
			{
				try
				{
					mainActivity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_SECURE);
				}
				catch (Exception e)
				{
					Log.e(LOG_TAG, e.toString());
				}
			}
		});
	}

	public static void disableAppSecure()
	{
		mainActivity.runOnUiThread(new Runnable()
		{
			@Override
			public void run()
			{
				try
				{
					mainActivity.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_SECURE);
				}
				catch (Exception e)
				{
					Log.e(LOG_TAG, e.toString());
				}
			}
		});
	}

	public static void launchPackage(final String packageName, final int requestCode)
	{
		try
		{
			mainActivity.startActivityForResult(mainActivity.getPackageManager().getLaunchIntentForPackage(packageName), requestCode);
		}
		catch (Exception e)
		{
			Log.e(LOG_TAG, e.toString());
		}
	}

	public static void openFileBrowser(final String action, final String type, final int requestCode)
	{
		try
		{
			Intent intent = new Intent(action);
			intent.addCategory(Intent.CATEGORY_OPENABLE);
			intent.setType(type != null ? type : "*/*");

			mainActivity.startActivityForResult(Intent.createChooser(intent, null), requestCode);
		}
		catch (Exception e)
		{
			Log.e(LOG_TAG, e.toString());
		}
	}

	public static void requestSetting(final String setting, final int requestCode)
	{
		try
		{
			if (setting.startsWith("android.settings."))
			{
				Intent intent = new Intent(setting);
				intent.setData(Uri.fromParts("package", packageName, null));
				mainActivity.startActivityForResult(intent, requestCode);
			}
		}
		catch (Exception e)
		{
			Log.e(LOG_TAG, e.toString());
		}
	}

	public static boolean isRooted()
	{
		try
		{
			Process execute = Runtime.getRuntime().exec("su");

			execute.waitFor();

			if (execute.exitValue() != 255)
				return true;
		}
		catch (Exception e)
		{
			Log.e(LOG_TAG, e.toString());
		}

		return false;
	}

	public static boolean isDolbyAtmos()
	{
		try
		{
			MediaFormat format = new MediaFormat();

			format.setString(MediaFormat.KEY_MIME, "audio/eac3-joc"); // or "audio/ac4"

			MediaCodecList codecList = new MediaCodecList(MediaCodecList.ALL_CODECS);

			if (codecList.findDecoderForFormat(format) != null)
				return true;
		}
		catch (Exception e)
		{
			Log.e(LOG_TAG, e.toString());
		}

		return false;
	}

	public static void showNotification(final String title, final String message, final String channelID, final String channelName, final int ID)
	{
		mainActivity.runOnUiThread(new Runnable()
		{
			@Override
			public void run()
			{
				try
				{
					NotificationManager notificationManager = (NotificationManager) mainContext.getSystemService(Context.NOTIFICATION_SERVICE);

					if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O)
						notificationManager.createNotificationChannel(new NotificationChannel(channelID, channelName, NotificationManager.IMPORTANCE_DEFAULT));

					Notification.Builder builder = new Notification.Builder(mainContext, channelID);
					builder.setAutoCancel(true);
					builder.setContentTitle(title);
					builder.setContentText(message);
					builder.setDefaults(Notification.DEFAULT_ALL);
					builder.setSmallIcon(android.R.drawable.ic_dialog_info);
					builder.setWhen(System.currentTimeMillis());
					notificationManager.notify(ID, builder.build());
				}
				catch (Exception e)
				{
					Log.e(LOG_TAG, e.toString());
				}
			}
		});
	}

	public static File getFilesDir()
	{
		return mainContext.getFilesDir();
	}

	public static File getExternalFilesDir(final String type)
	{
		return mainContext.getExternalFilesDir(type);
	}

	public static File getCacheDir()
	{
		return mainContext.getCacheDir();
	}

	public static File getExternalCacheDir()
	{
		return mainContext.getExternalCacheDir();
	}

	public static File getObbDir()
	{
		return mainContext.getObbDir();
	}

	public static BatteryManager getBatteryManager()
	{
		return (BatteryManager) mainContext.getSystemService(Context.BATTERY_SERVICE);
	}

	public static void initCallBack(HaxeObject hobject)
	{
		Tools.hobject = hobject;
	}

	/**
	 * Called when an activity you launched exits, giving you the requestCode 
	 * you started it with, the resultCode it returned, and any additional data 
	 * from it.
	 */
	@Override
	public boolean onActivityResult(int requestCode, int resultCode, Intent data)
	{
		ArrayMap<String, Object> content = new ArrayMap<String, Object>();

		content.put("requestCode", requestCode);
		content.put("resultCode", resultCode);

		if (data != null && data.getData() != null)
		{
			ArrayMap<String, Object> d = new ArrayMap<String, Object>();

			d.put("uri", data.getData().toString());
			d.put("path", data.getData().getPath());

			content.put("data", d);
		}

		if (hobject != null)
		{
			hobject.call("onActivityResult", new Object[] {
				gson.toJson(content)
			});
		}

		return true;
	}

	/**
	 * Callback for the result from requesting permissions.
	 */
	@Override
	public boolean onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults)
	{
		ArrayMap<String, Object> content = new ArrayMap<String, Object>();

		content.put("requestCode", requestCode);
		content.put("permissions", permissions);
		content.put("grantResults", grantResults);

		if (hobject != null)
		{
			hobject.call("onRequestPermissionsResult", new Object[] {
				gson.toJson(content)
			});
		}

		return true;
	}
}
