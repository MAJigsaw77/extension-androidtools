package org.haxe.extension;

import android.app.AlertDialog;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.Context;
import android.content.DialogInterface;
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
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;
import androidx.core.content.FileProvider;
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
	public static HaxeObject cbObject;
	public static Gson gson;

	/**
	 * Initializes the callback object for handling Haxe callbacks.
	 *
	 * @param cbObject The HaxeObject instance to handle callbacks.
	 */
	public static void initCallBack(final HaxeObject cbObject)
	{
		Tools.cbObject = cbObject;
	}

	/**
	 * Retrieves the list of permissions that have been granted to the application.
	 *
	 * @return An array of strings representing granted permissions.
	 */
	public static String[] getGrantedPermissions()
	{
		List<String> granted = new ArrayList<String>();

		try
		{
			final PackageInfo info = (PackageInfo) mainContext.getPackageManager().getPackageInfo(packageName, PackageManager.GET_PERMISSIONS);

			for (int i = 0; i < info.requestedPermissions.length; i++)
			{
				if ((info.requestedPermissionsFlags[i] & PackageInfo.REQUESTED_PERMISSION_GRANTED) != 0)
					granted.add(info.requestedPermissions[i]);
			}
		}
		catch (Exception e)
		{
			Log.e(LOG_TAG, e.toString());
		}

		return granted.toArray(new String[granted.size()]);
	}

	/**
	 * Displays a toast message on the screen.
	 *
	 * @param message The message to display.
	 * @param duration The duration of the toast message.
	 * @param gravity The gravity of the toast message.
	 * @param xOffset The horizontal offset from the gravity point.
	 * @param yOffset The vertical offset from the gravity point.
	 */
	public static void makeToastText(final String message, final int duration, final int gravity, final int xOffset, final int yOffset)
	{
		mainActivity.runOnUiThread(new Runnable()
		{
			@Override
			public void run()
			{
				try
				{
					final Toast toast = Toast.makeText(mainContext, message, duration);

					if (gravity >= 0)
						toast.setGravity(gravity, xOffset, yOffset);

					toast.show();
				}
				catch (Exception e)
				{
					Log.e(LOG_TAG, e.toString());
				}
			}
		});
	}

	/**
	 * Shows an alert dialog with optional positive and negative buttons.
	 *
	 * @param title The title of the alert dialog (optional).
	 * @param message The message to display in the alert dialog.
	 * @param positiveLabel The label for the positive button (optional).
	 * @param positiveObject The HaxeObject to call when the positive button is clicked (optional).
	 * @param negativeLabel The label for the negative button (optional).
	 * @param negativeObject The HaxeObject to call when the negative button is clicked (optional).
	 */
	public static void showAlertDialog(final String title, final String message, final String positiveLabel, final HaxeObject positiveObject, final String negativeLabel, final HaxeObject negativeObject)
	{
		final Object lock = new Object();

		mainActivity.runOnUiThread(new Runnable()
		{
			@Override
			public void run()
			{
				try
				{
					final AlertDialog.Builder builder = new AlertDialog.Builder(mainContext, android.R.style.Theme_Material_Dialog_Alert);

					if (title != null)
						builder.setTitle(title);

					builder.setCancelable(false);

					TextView messageView = new TextView(mainContext);
					messageView.setPadding(20, 20, 20, 20);
					messageView.setText(message);

					ScrollView scrollView = new ScrollView(mainContext);
					scrollView.setLayoutParams(new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, 300));
					scrollView.addView(messageView);

					builder.setView(scrollView);

					if (positiveLabel != null)
					{
						builder.setPositiveButton(positiveLabel, new DialogInterface.OnClickListener()
						{
							@Override
							public void onClick(DialogInterface dialog, int which)
							{
								dialog.dismiss();

								if (positiveObject != null)
									positiveObject.call("onClick", new Object[]{});
							}
						});
					}

					if (negativeLabel != null)
					{
						builder.setNegativeButton(negativeLabel, new DialogInterface.OnClickListener()
						{
							@Override
							public void onClick(DialogInterface dialog, int which)
							{
								dialog.dismiss();

								if (negativeObject != null)
									negativeObject.call("onClick", new Object[]{});
							}
						});
					}

					final AlertDialog dialog = builder.create();
					dialog.setOnDismissListener(new DialogInterface.OnDismissListener()
					{
						@Override
						public void onDismiss(DialogInterface dialog)
						{
							synchronized (lock)
							{
								lock.notify();
							}
						}
					});
					dialog.show();
				}
				catch (Exception e)
				{
					Log.e(LOG_TAG, e.toString());
				}
			}
		});

		synchronized (lock)
		{
			try
			{
				lock.wait();
			}
			catch (InterruptedException e)
			{
				Log.e(LOG_TAG, e.toString());
			}
		}
	}

	/**
	 * Installs an application package from the specified path.
	 *
	 * @param path The path to the application package (.apk file).
	 * @return true if the installation was successful, false otherwise.
	 */
	public static boolean installPackage(final String path)
	{
		try
		{
			boolean retVal = true;

			if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O)
				retVal = mainContext.getPackageManager().canRequestPackageInstalls();

			final File file = new File(path);

			if (file.exists())
			{
				Intent intent = new Intent(Intent.ACTION_VIEW);
				intent.setDataAndType(Build.VERSION.SDK_INT >= Build.VERSION_CODES.N ? FileProvider.getUriForFile(mainContext, packageName + ".provider", file) : Uri.fromFile(file), "application/vnd.android.package-archive");
				intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
				intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
				mainContext.startActivity(intent);
			}
			else
				Log.e(LOG_TAG, "Attempted to install an application package from " + file.getAbsolutePath() + " but the file doesn't exist.");

			return retVal;
		}
		catch (Exception e)
		{
			Log.e(LOG_TAG, e.toString());

			return false;
		}
	}

	/**
	 * Enables secure mode for the application window.
	 */
	public static void enableAppSecure()
	{
		mainActivity.runOnUiThread(new Runnable() {
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

	/**
	 * Disables secure mode for the application window.
	 */
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

	/**
	 * Launches an application package by its package name.
	 *
	 * @param packageName The package name of the application to launch.
	 * @param requestCode The request code to identify the request.
	 */
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

	/**
	 * Requests a specific system setting.
	 *
	 * @param setting The setting to request.
	 * @param requestCode The request code to identify the request.
	 */
	public static void requestSetting(final String setting, final int requestCode)
	{
		try
		{
			final Intent intent = new Intent(setting);
			intent.setData(Uri.fromParts("package", packageName, null));
			mainActivity.startActivityForResult(intent, requestCode);
		}
		catch (Exception e)
		{
			Log.e(LOG_TAG, e.toString());
		}
	}

	/**
	 * Checks whether the device is rooted.
	 *
	 * @return true if the device is rooted, false otherwise.
	 */
	public static boolean isRooted()
	{
		try
		{
			final Process execute = Runtime.getRuntime().exec("su");

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

	/**
	 * Checks whether Dolby Atmos is supported on the device.
	 *
	 * @return true if Dolby Atmos is supported, false otherwise.
	 */
	public static boolean isDolbyAtmos()
	{
		try
		{
			final MediaFormat format = new MediaFormat();

			format.setString(MediaFormat.KEY_MIME, "audio/eac3-joc"); // or "audio/ac4"

			final MediaCodecList codecList = new MediaCodecList(MediaCodecList.ALL_CODECS);

			if (codecList.findDecoderForFormat(format) != null)
				return true;
		}
		catch (Exception e)
		{
			Log.e(LOG_TAG, e.toString());
		}

		return false;
	}

	/**
	 * Shows a notification on the device.
	 *
	 * @param title The title of the notification.
	 * @param message The message text of the notification.
	 * @param channelID The ID of the notification channel.
	 * @param channelName The name of the notification channel.
	 * @param ID The ID of the notification.
	 */
	public static void showNotification(final String title, final String message, final String channelID, final String channelName, final int ID)
	{
		mainActivity.runOnUiThread(new Runnable()
		{
			@Override
			public void run()
			{
				try
				{
					final NotificationManager notificationManager = (NotificationManager) mainContext.getSystemService(Context.NOTIFICATION_SERVICE);

					if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O)
						notificationManager.createNotificationChannel(new NotificationChannel(channelID, channelName, NotificationManager.IMPORTANCE_DEFAULT));

					final Notification.Builder builder = new Notification.Builder(mainContext, channelID);
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

	/**
	 * Retrieves the application's private files directory.
	 *
	 * @return A File object representing the application's private files directory.
	 */
	public static File getFilesDir()
	{
		return mainContext.getFilesDir();
	}

	/**
	 * Retrieves the primary external storage directory for an application.
	 *
	 * @param type The type of files directory to return. May be null for the primary files directory.
	 * @return A File object representing the primary external storage directory for the application.
	 */
	public static File getExternalFilesDir(final String type)
	{
		return mainContext.getExternalFilesDir(type);
	}

	/**
	 * Retrieves absolute paths to application-specific directories on all shared/external storage devices.
	 *
	 * @param type The type of files directory to return. May be null for the primary files directory.
	 * @return An array of File objects representing the absolute paths to application-specific directories on all shared/external storage devices.
	 */
	public static File[] getExternalFilesDirs(final String type)
	{
		return mainContext.getExternalFilesDirs(type);
	}

	/**
	 * Retrieves the application's cache directory.
	 *
	 * @return A File object representing the application's cache directory.
	 */
	public static File getCacheDir()
	{
		return mainContext.getCacheDir();
	}

	/**
	 * Retrieves the primary external storage directory for the application's cache files.
	 *
	 * @return A File object representing the primary external storage directory for the application's cache files.
	 */
	public static File getExternalCacheDir()
	{
		return mainContext.getExternalCacheDir();
	}

	/**
	 * Retrieves absolute paths to application-specific cache directories on all shared/external storage devices.
	 *
	 * @return An array of File objects representing the absolute paths to application-specific cache directories on all shared/external storage devices.
	 */
	public static File[] getExternalCacheDirs()
	{
		return mainContext.getExternalCacheDirs();
	}

	/**
	 * Retrieves the application's code cache directory.
	 *
	 * @return A File object representing the application's code cache directory.
	 */
	public static File getCodeCacheDir()
	{
		return mainContext.getCodeCacheDir();
	}

	/**
	 * Retrieves the application's directory for storing files that should not be backed up to the cloud.
	 *
	 * @return A File object representing the application's directory for storing files that should not be backed up to the cloud.
	 */
	public static File getNoBackupFilesDir()
	{
		return mainContext.getNoBackupFilesDir();
	}

	/**
	 * Retrieves the application's OBB (Opaque Binary Blob) directory.
	 *
	 * @return A File object representing the application's OBB directory.
	 */
	public static File getObbDir()
	{
		return mainContext.getObbDir();
	}

	/**
	 * Retrieves absolute paths to application-specific OBB directories on all shared/external storage devices.
	 *
	 * @return An array of File objects representing the absolute paths to application-specific OBB directories on all shared/external storage devices.
	 */
	public static File[] getObbDirs()
	{
		return mainContext.getObbDirs();
	}

	/**
	 * Retrieves the BatteryManager system service for managing battery-related information.
	 *
	 * @return A BatteryManager object for managing battery-related information.
	 */
	public static BatteryManager getBatteryManager()
	{
		return (BatteryManager) mainContext.getSystemService(Context.BATTERY_SERVICE);
	}

	@Override
	public boolean onActivityResult(int requestCode, int resultCode, Intent data)
	{
		if (cbObject != null)
		{
			final ArrayMap<String, Object> content = new ArrayMap<String, Object>();

			content.put("requestCode", requestCode);
			content.put("resultCode", resultCode);

			if (data != null && data.getData() != null)
				content.put("uri", data.getData().toString());

			if (gson == null)
				gson = new GsonBuilder().setPrettyPrinting().serializeNulls().create();

			cbObject.call("onActivityResult", new Object[]{gson.toJson(content)});
		}

		return true;
	}

	@Override
	public boolean onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults)
	{
		if (cbObject != null)
		{
			final ArrayMap<String, Object> content = new ArrayMap<String, Object>();

			content.put("requestCode", requestCode);
			content.put("permissions", permissions);
			content.put("grantResults", grantResults);

			if (gson == null)
				gson = new GsonBuilder().setPrettyPrinting().serializeNulls().create();

			cbObject.call("onRequestPermissionsResult", new Object[]{gson.toJson(content)});
		}

		return true;
	}
}
