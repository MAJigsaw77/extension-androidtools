package org.haxe.extension;

import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.util.Log;
import java.util.ArrayList;
import java.util.List;
import org.haxe.extension.Extension;
import org.haxe.lime.HaxeObject;

public class Permissions extends Extension {
    public static String[] getGrantedPermissions() {
        List<String> granted = new ArrayList<String>();

        try {
            PackageInfo packInfo =
                Extension.mainContext.getPackageManager().getPackageInfo(
                    Extension.mainContext.getPackageName(),
                    PackageManager.GET_PERMISSIONS);
            for (int i = 0; i < packInfo.requestedPermissions.length; i++) {
                if ((packInfo.requestedPermissionsFlags[i]
                        & PackageInfo.REQUESTED_PERMISSION_GRANTED)
                    != 0)
                    granted.add(packInfo.requestedPermissions[i]);
            }
        } catch (Exception e) {
            Log.e("Permissions", e.toString());
        }

        return granted.toArray(new String[granted.size()]);
    }

    public static void requestPermissions(
        String[] permissions, int requestCode) {
        Extension.mainActivity.requestPermissions(permissions, requestCode);
    }

    public boolean onRequestPermissionsResult(int requestCode, String permissions[], int[] grantResults) {
        return true;
    }
}