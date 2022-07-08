package org.haxe.extension;

import android.net.Uri;
import java.io.File;

public class Tools extends Extension
{
	public static String getFileUrl(String path)
	{
		return Uri.fromFile(new File(path)).toString();
	}
}
