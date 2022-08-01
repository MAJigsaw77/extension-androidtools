package org.haxe.extension;

import android.app.Activity;
import android.app.KeyguardManager;
import android.app.KeyguardManager.KeyguardLock;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.graphics.Point;
import android.net.Uri;
import android.os.PowerManager;
import android.os.PowerManager.WakeLock;
import android.os.Vibrator;
import android.view.Display;
import android.view.WindowManager;
import android.widget.Toast;
import java.io.File;
import org.haxe.extension.Extension;

public class Hardware extends Extension {
    private static KeyguardLock keyguardLock = null;
    private static Point size;
    private static int resumeOrientation = 0;

    public static void setRequestedOrientation(int SCREEN_ORIENTATION) {
        switch (SCREEN_ORIENTATION) {
            case 0:
                Extension.mainActivity.setRequestedOrientation(
                    ActivityInfo.SCREEN_ORIENTATION_UNSPECIFIED);
                resumeOrientation = ActivityInfo.SCREEN_ORIENTATION_UNSPECIFIED;
                break;
            case 1:
                Extension.mainActivity.setRequestedOrientation(
                    ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
                resumeOrientation = ActivityInfo.SCREEN_ORIENTATION_PORTRAIT;
                break;
            case 2:
                Extension.mainActivity.setRequestedOrientation(
                    ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE);
                resumeOrientation =
                    ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE;
                break;
        }
    }

    public static String fromFile(String path) {
        return Uri.fromFile(new File(path)).toString();
    }

    public static void toast(final String message, final int duration) {
        Extension.mainActivity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                switch (duration) {
                    case 1:
                        Toast.makeText(Extension.mainContext, message, Toast.LENGTH_SHORT).show();
                    case 2:
                        Toast.makeText(Extension.mainContext, message, Toast.LENGTH_LONG).show();
                }
            }
        });
    }

    public static void runIntent(final String subject, final String data, final int type) {
        Intent intent = null;

        switch (type) {
            case 0: // share
                intent = new Intent(Intent.ACTION_SEND);
                intent.setType("text/plain");
                intent.putExtra(Intent.EXTRA_SUBJECT, subject);
                intent.putExtra(Intent.EXTRA_TEXT, data);
                break;
            case 1: // open app
                intent = Extension.mainActivity.getPackageManager().getLaunchIntentForPackage(subject);
                break;
            case 2: // default
                intent = new Intent(subject);
                if (data != null)
                    intent.setData(Uri.parse(data));
                break;
        }

        Extension.mainActivity.startActivity(intent);
    }

    public static void setBrightness(float brightness) {
        WindowManager.LayoutParams layout =
            Extension.mainActivity.getWindow().getAttributes();
        layout.screenBrightness = brightness;
        Extension.mainActivity.getWindow().setAttributes(layout);
    }

    public static void vibrate(int duration) {
        ((Vibrator) mainContext.getSystemService(Context.VIBRATOR_SERVICE))
            .vibrate(duration);
    }

    public static void wakeUp() {
        PowerManager pm =
            (PowerManager) mainContext.getSystemService(Context.POWER_SERVICE);
        WakeLock wakeLock = pm.newWakeLock(PowerManager.SCREEN_BRIGHT_WAKE_LOCK
                | PowerManager.ACQUIRE_CAUSES_WAKEUP,
            "Hardware.class");
        wakeLock.acquire();
        wakeLock.release();
        wakeLock = null;

        KeyguardManager keyguardManager =
            (KeyguardManager) mainActivity.getSystemService(
                Activity.KEYGUARD_SERVICE);
        if (keyguardLock == null)
            keyguardLock =
                keyguardManager.newKeyguardLock(Activity.KEYGUARD_SERVICE);

        keyguardLock.disableKeyguard();
    }

    public static int getScreenHeight() {
        return size.y;
    }

    public static int getScreenWidth() {
        return size.x;
    }

    public boolean onActivityResult (int requestCode, int resultCode, Intent data) {
        return true;
    }

    @Override
    public void onDestroy() {
        if (keyguardLock != null) {
            keyguardLock.reenableKeyguard();
            keyguardLock = null;
        }
    }

    @Override
    public void onPause() {
        if (keyguardLock != null)
            keyguardLock.reenableKeyguard();
    }

    @Override
    public void onResume() {
        if (resumeOrientation != 0)
            Extension.mainActivity.setRequestedOrientation(resumeOrientation);
    }

    @Override
    public void onStart() {
        size = new Point();
        Display display = mainActivity.getWindowManager().getDefaultDisplay();
        display.getSize(size);
    }
}
