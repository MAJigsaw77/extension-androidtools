package android;

abstract Intent(String) to String from String {
    // pick a file
    inline public static var ACTION_GET_CONTENT = "android.intent.action.GET_CONTENT";
    // same as ACTION_GET_CONTENT but uses other file picker, wired dont use
	inline public static var ACTION_PICK = "android.intent.action.PICK";
    // pick file but you can pick with all apps
    inline public static var ACTION_VIEW = "android.intent.action.VIEW";
    // pick folder
    inline public static var ACTION_SEND = "android.intent.action.SEND";
}