# extension-androidtools

Extension For Haxe Android Only

Some Code Example

```haxe
import android.AndroidTools;

// To request permission
AndroidTools.requestPermission(Permissions.READ_EXTERNAL_STORAGE);

// To request multiple permissions
AndroidTools.requestPermissions([Permissions.READ_EXTERNAL_STORAGE, Permissions.WRITE_EXTERNAL_STORAGE]);

// To get granted permissions(string) array use this
AndroidTools.getGrantedPermissions();

// To get a file url use this, path is the file
AndroidTools.getFileUrl(path);

// To get the Android SDK version
AndroidTools.getSDKversion();

// To get the internal android storage directory
AndroidTools.getExternalStorageDirectory();

// Hardware library
import android.Hardware;

// To make the phone to vibrate
Hardware.vibrate(4);// the number is the duration :)

// To get the screen Width
Hardware.getScreenWidth();

// To get the screen Height
Hardware.getScreenHeight();

// To wake up the phone
Hardware.wakeUp();
```

Look in the source for more :)
