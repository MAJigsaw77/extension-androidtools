package android.haxe.extensions;

import java.lang.Runtime;
import android.os.Process;

public class RootUtil extends Extension
{
	public static Void requestRootPerms()
	{
		Process request;
		request = Runtime.getRuntime().exec("su");
	}
}