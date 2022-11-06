package org.haxe.extension;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.util.Log;
import android.widget.EditText;
import java.util.ArrayList;
import java.util.List;
import org.haxe.extension.Extension;
import org.haxe.lime.HaxeObject;

public class Dialog extends Extension {
    public static Drawable getDrawable(String bmpData) {
        int result = bmpData.length();
        byte[] bmpByteArray = Base64.decode(bmpData, Base64.DEFAULT);
        result = bmpByteArray.length;

        try {
            return new BitmapDrawable(BitmapFactory.decodeByteArray(
                bmpByteArray, 0, bmpByteArray.length));
        } catch (IllegalArgumentException e) {
            Log.e("Dialog", e.toString());
            return null;
        }
    }

    public static void setButton(AlertDialog.Builder builder,
        final HaxeObject hobj, String text, boolean ispositive) {
        DialogInterface.OnClickListener cb =
            new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialog, int whichButton) {
                    hobj.call("onClick", new Object[] {dialog, whichButton});
                }
            };

        if (ispositive)
            builder.setPositiveButton(text, cb);
        else
            builder.setNegativeButton(text, cb);
    }

    public static Object createBuilder() {
        return new AlertDialog.Builder(Extension.mainContext);
    }

    public static EditText createEditText() {
        return new EditText(Extension.mainContext);
    }

    public static void showDialog(final Object obj) {
        Extension.mainActivity.runOnUiThread(new Runnable() {
            public void run() {
                ((AlertDialog.Builder) obj).show();
            }
        });
    }
}
