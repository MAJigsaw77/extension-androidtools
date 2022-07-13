package android.haxe.extensions;

import android.util.Log;

import java.lang.Runtime;
import org.haxe.extension.Extension;

public class Root extends Extension
{
	public static void requestRootPerms()
	{
		try {
			Process p = Runtime.getRuntime().exec("su");
			p.destroy();
		} catch (Exception e){
			Log.e("AndroidTools", "Failed to request root permission");
		}
	}
}
