package android.haxe.extensions;

import java.lang.Process;
import java.lang.Runtime;
import org.haxe.extension.Extension;

public class Root extends Extension
{
	public static void requestRootPerms()
	{
		Process request = Runtime.getRuntime().exec("su");
	}
}
