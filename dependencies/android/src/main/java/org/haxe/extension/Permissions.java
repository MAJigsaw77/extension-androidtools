package org.haxe.extension;

import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.util.Log;
import org.haxe.extension.Extension;
import org.haxe.lime.HaxeObject;
import java.util.ArrayList;
import java.util.List;

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
public class Permissions extends Extension
{
	private static HaxeObject callback;
	
	public static void init(HaxeObject _callback)
	{
		callback = _callback;
	}

	public static String[] getGrantedPermissions()
	{
		List<String> granted = new ArrayList<String>();

		try
		{
			PackageInfo packInfo = Extension.mainContext.getPackageManager().getPackageInfo(Extension.mainContext.getPackageName(), PackageManager.GET_PERMISSIONS);
			for (int i = 0; i < packInfo.requestedPermissions.length; i++)
			{
				if ((packInfo.requestedPermissionsFlags[i] & PackageInfo.REQUESTED_PERMISSION_GRANTED) != 0)
					granted.add(packInfo.requestedPermissions[i]);
			}
		}
		catch (Exception e)
		{
			Log.e("Permissions", e.toString());
		}

		return granted.toArray(new String[granted.size()]);
	}
	
	public static void requestPermissions(String[] permissions, int requestCode)
	{
		Extension.mainActivity.requestPermissions(permissions, requestCode);
	}

	@Override
	public boolean onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults)
	{
		callback.call("onRequestPermissionsResult", new Object[] {requestCode, permissions, grantResults});
		return true;
	}
}
