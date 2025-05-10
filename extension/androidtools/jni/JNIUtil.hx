package extension.androidtools.jni;

import lime.system.JNI;

class JNIUtil
{
	/**
	 * Retrieves the absolute path from a given File object.
	 *
	 * @param handle A File object for which to retrieve the absolute path.
	 *
	 * @return The absolute path of the File object.
	 */
	public static function getAbsolutePath(handle:Null<Dynamic>):String
	{
		if (handle != null)
		{
			final getAbsolutePathMemberJNI:Null<Dynamic> = JNICache.createMemberMethod('java/io/File', 'getAbsolutePath', '()Ljava/lang/String;');

			if (getAbsolutePathMemberJNI != null)
			{
				final getAbsolutePathJNI:Null<Dynamic> = JNI.callMember(getAbsolutePathMemberJNI, handle, []);

				if (getAbsolutePathJNI != null)
					return getAbsolutePathJNI;
			}
		}

		return '';
	}
}
