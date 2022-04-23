package org.haxe.extension;

import android.os.Vibrator;
import android.graphics.Point;
import android.view.Display;

import android.app.Activity;
import android.content.res.AssetManager;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.view.View;

import android.app.KeyguardManager;
import android.app.KeyguardManager.KeyguardLock;
import android.os.PowerManager;
import android.os.PowerManager.WakeLock;

public class Hardware extends Extension 
{
    public static Point size;

    private static KeyguardLock keyguardLock=null;

    public static void vibrate(int duration)
    {
        ((Vibrator) mainContext.getSystemService(Context.VIBRATOR_SERVICE)).vibrate(duration);
    }

    public static void wakeUp()
    {
        PowerManager pm = (PowerManager) mainContext.getSystemService(Context.POWER_SERVICE);
        WakeLock wakeLock = pm.newWakeLock(PowerManager.SCREEN_BRIGHT_WAKE_LOCK |
        PowerManager.ACQUIRE_CAUSES_WAKEUP, "Hardware.class");
        wakeLock.acquire();
        wakeLock.release();
        wakeLock = null;

        KeyguardManager keyguardManager = (KeyguardManager) mainActivity.getSystemService(Activity.KEYGUARD_SERVICE); 
        if(keyguardLock == null)
        {
            keyguardLock = keyguardManager.newKeyguardLock(Activity.KEYGUARD_SERVICE); 
        }
        keyguardLock.disableKeyguard();
    }

    public static int getScreenHeight()
    {
        return size.y;
    }

    public static int getScreenWidth()
    {
        return size.x;
    }

    /**
    * Perform any final cleanup before an activity is destroyed.
    */
    public void onDestroy () 
    {
        if(keyguardLock != null)
        {
            keyguardLock.reenableKeyguard();
            keyguardLock = null;
        }
    }

    /**
    * Called as part of the activity lifecycle when an activity is going into
    * the background, but has not (yet) been killed.
    */
    public void onPause () 
    {
        if(keyguardLock != null)
        {
            keyguardLock.reenableKeyguard();
        }
    }

    /**
    * Called after {@link #onCreate} &mdash; or after {@link #onRestart} when  
    * the activity had been stopped, but is now again being displayed to the 
    * user.
    */
    public void onStart () 
    {
        Display display = mainActivity.getWindowManager().getDefaultDisplay();
        size = new Point();
        display.getSize(size);
    }
}
