# AndroidTools

Extension For Haxe Android Only

Some Code Example

```haxe
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

// To go in app settings from the app
AndroidTools.goToSettings();

// Will make a text, to appear on your screen
AndroidTools.makeToast("Loool");

```

Look in AndroidTools.hx for more :)
