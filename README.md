# extension-androidtools

Extension For Haxe Android Only

Some Code Example

```haxe
// Tools library
import android.Tools;

// To get a file url use this, path is the file
AndroidTools.getFileUrl(path);

// To use the Android SDK version
AndroidTools.sdkVersion

// To get the internal android storage directory
AndroidTools.getExternalStorageDirectory();

// Hardware library
import android.Hardware;

// To make the phone to vibrate
Hardware.vibrate(4000);// the number is the duration in milliseconds :)

// To get the screen Width
Hardware.getScreenWidth();

// To get the screen Height
Hardware.getScreenHeight();

// To wake up the phone
Hardware.wakeUp();

// To set the window brightness in android
Hardware.setBrightness(1);

// To set the window orientation in android
Hardware.setScreenOrientation(Hardware.ORIENTATION_PORTRAIT);
Hardware.setScreenOrientation(Hardware.ORIENTATION_LANDSCAPE);
Hardware.setScreenOrientation(Hardware.ORIENTATION_UNSPECIFIED);
```

Look in the source for more :)

Credits:

## Credits

- [Saw (M.A. Jigsaw)](https://github.com/jigsaw-4277821) - Coder of the library.
- [Lucky dog 7](https://github.com/luckydog7) - Creator of the original library.
- [Player-03](https://github.com/jigsaw-4277821) - Code's From his library (thanks for the ideas =3 btw).
- The contributors (if are).