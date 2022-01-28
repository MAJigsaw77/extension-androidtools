package android;
// same as Manifest.permission in java
abstract Permissions(String) to String from String {
    inline public static var ACCEPT_HANDOVER = "android.permission.ACCEPT_HANDOVER";
    inline public static var ACCESS_CHECKIN_PROPERTIES = "android.permission.ACCESS_CHECKIN_PROPERTIES";
    inline public static var ACCESS_COARSE_LOCATION = "android.permission.ACCESS_COARSE_LOCATION";
    inline public static var ACCESS_FINE_LOCATION = "android.permission.ACCESS_FINE_LOCATION";
    inline public static var ACCESS_LOCATION_EXTRA_COMMANDS = "android.permission.ACCESS_LOCATION_EXTRA_COMMANDS";
    inline public static var ACCESS_NETWORK_STATE = "android.permission.ACCESS_NETWORK_STATE";
    inline public static var ACCESS_NOTIFICATION_POLICY = "android.permission.ACCESS_NOTIFICATION_POLICY";
    inline public static var ACCESS_WIFI_STATE = "android.permission.ACCESS_WIFI_STATE";
    inline public static var ACCOUNT_MANAGER = "android.permission.ACCOUNT_MANAGER";
    inline public static var ADD_VOICEMAIL = "com.android.voicemail.permission.ADD_VOICEMAIL";
    inline public static var ANSWER_PHONE_CALLS = "android.permission.ANSWER_PHONE_CALLS";
    inline public static var BATTERY_STATS = "android.permission.BATTERY_STATS";
    inline public static var BIND_ACCESSIBILITY_SERVICE = "android.permission.BIND_ACCESSIBILITY_SERVICE";
    inline public static var BIND_APPWIDGET = "android.permission.BIND_APPWIDGET";
    inline public static var BIND_AUTOFILL_SERVICE = "android.permission.BIND_AUTOFILL_SERVICE";
    
    /** @/deprecated */
    inline public static var BIND_CARRIER_MESSAGING_SERVICE = "android.permission.BIND_CARRIER_MESSAGING_SERVICE";
    inline public static var BIND_CARRIER_SERVICES = "android.permission.BIND_CARRIER_SERVICES";
    inline public static var BIND_CHOOSER_TARGET_SERVICE = "android.permission.BIND_CHOOSER_TARGET_SERVICE";
    inline public static var BIND_CONDITION_PROVIDER_SERVICE = "android.permission.BIND_CONDITION_PROVIDER_SERVICE";
    inline public static var BIND_DEVICE_ADMIN = "android.permission.BIND_DEVICE_ADMIN";
    inline public static var BIND_DREAM_SERVICE = "android.permission.BIND_DREAM_SERVICE";
    inline public static var BIND_INCALL_SERVICE = "android.permission.BIND_INCALL_SERVICE";
    inline public static var BIND_INPUT_METHOD = "android.permission.BIND_INPUT_METHOD";
    inline public static var BIND_MIDI_DEVICE_SERVICE = "android.permission.BIND_MIDI_DEVICE_SERVICE";
    inline public static var BIND_NFC_SERVICE = "android.permission.BIND_NFC_SERVICE";
    inline public static var BIND_NOTIFICATION_LISTENER_SERVICE = "android.permission.BIND_NOTIFICATION_LISTENER_SERVICE";
    inline public static var BIND_PRINT_SERVICE = "android.permission.BIND_PRINT_SERVICE";
    inline public static var BIND_QUICK_SETTINGS_TILE = "android.permission.BIND_QUICK_SETTINGS_TILE";
    inline public static var BIND_REMOTEVIEWS = "android.permission.BIND_REMOTEVIEWS";
    inline public static var BIND_SCREENING_SERVICE = "android.permission.BIND_SCREENING_SERVICE";
    inline public static var BIND_TELECOM_CONNECTION_SERVICE = "android.permission.BIND_TELECOM_CONNECTION_SERVICE";
    inline public static var BIND_TEXT_SERVICE = "android.permission.BIND_TEXT_SERVICE";
    inline public static var BIND_TV_INPUT = "android.permission.BIND_TV_INPUT";
    inline public static var BIND_VISUAL_VOICEMAIL_SERVICE = "android.permission.BIND_VISUAL_VOICEMAIL_SERVICE";
    inline public static var BIND_VOICE_INTERACTION = "android.permission.BIND_VOICE_INTERACTION";
    inline public static var BIND_VPN_SERVICE = "android.permission.BIND_VPN_SERVICE";
    inline public static var BIND_VR_LISTENER_SERVICE = "android.permission.BIND_VR_LISTENER_SERVICE";
    inline public static var BIND_WALLPAPER = "android.permission.BIND_WALLPAPER";
    inline public static var BLUETOOTH = "android.permission.BLUETOOTH";
    inline public static var BLUETOOTH_ADMIN = "android.permission.BLUETOOTH_ADMIN";
    inline public static var BLUETOOTH_PRIVILEGED = "android.permission.BLUETOOTH_PRIVILEGED";
    inline public static var BODY_SENSORS = "android.permission.BODY_SENSORS";
    inline public static var BROADCAST_PACKAGE_REMOVED = "android.permission.BROADCAST_PACKAGE_REMOVED";
    inline public static var BROADCAST_SMS = "android.permission.BROADCAST_SMS";
    inline public static var BROADCAST_STICKY = "android.permission.BROADCAST_STICKY";
    inline public static var BROADCAST_WAP_PUSH = "android.permission.BROADCAST_WAP_PUSH";
    inline public static var CALL_PHONE = "android.permission.CALL_PHONE";
    inline public static var CALL_PRIVILEGED = "android.permission.CALL_PRIVILEGED";
    inline public static var CAMERA = "android.permission.CAMERA";
    inline public static var CAPTURE_AUDIO_OUTPUT = "android.permission.CAPTURE_AUDIO_OUTPUT";
    inline public static var CAPTURE_SECURE_VIDEO_OUTPUT = "android.permission.CAPTURE_SECURE_VIDEO_OUTPUT";
    inline public static var CAPTURE_VIDEO_OUTPUT = "android.permission.CAPTURE_VIDEO_OUTPUT";
    inline public static var CHANGE_COMPONENT_ENABLED_STATE = "android.permission.CHANGE_COMPONENT_ENABLED_STATE";
    inline public static var CHANGE_CONFIGURATION = "android.permission.CHANGE_CONFIGURATION";
    inline public static var CHANGE_NETWORK_STATE = "android.permission.CHANGE_NETWORK_STATE";
    inline public static var CHANGE_WIFI_MULTICAST_STATE = "android.permission.CHANGE_WIFI_MULTICAST_STATE";
    inline public static var CHANGE_WIFI_STATE = "android.permission.CHANGE_WIFI_STATE";
    inline public static var CLEAR_APP_CACHE = "android.permission.CLEAR_APP_CACHE";
    inline public static var CONTROL_LOCATION_UPDATES = "android.permission.CONTROL_LOCATION_UPDATES";
    inline public static var DELETE_CACHE_FILES = "android.permission.DELETE_CACHE_FILES";
    inline public static var DELETE_PACKAGES = "android.permission.DELETE_PACKAGES";
    inline public static var DIAGNOSTIC = "android.permission.DIAGNOSTIC";
    inline public static var DISABLE_KEYGUARD = "android.permission.DISABLE_KEYGUARD";
    inline public static var DUMP = "android.permission.DUMP";
    inline public static var EXPAND_STATUS_BAR = "android.permission.EXPAND_STATUS_BAR";
    inline public static var FACTORY_TEST = "android.permission.FACTORY_TEST";
    inline public static var FOREGROUND_SERVICE = "android.permission.FOREGROUND_SERVICE";
    inline public static var GET_ACCOUNTS = "android.permission.GET_ACCOUNTS";
    inline public static var GET_ACCOUNTS_PRIVILEGED = "android.permission.GET_ACCOUNTS_PRIVILEGED";
    inline public static var GET_PACKAGE_SIZE = "android.permission.GET_PACKAGE_SIZE";
    
    /** @/deprecated */
    inline public static var GET_TASKS = "android.permission.GET_TASKS";
    inline public static var GLOBAL_SEARCH = "android.permission.GLOBAL_SEARCH";
    inline public static var INSTALL_LOCATION_PROVIDER = "android.permission.INSTALL_LOCATION_PROVIDER";
    inline public static var INSTALL_PACKAGES = "android.permission.INSTALL_PACKAGES";
    inline public static var INSTALL_SHORTCUT = "com.android.launcher.permission.INSTALL_SHORTCUT";
    inline public static var INSTANT_APP_FOREGROUND_SERVICE = "android.permission.INSTANT_APP_FOREGROUND_SERVICE";
    inline public static var INTERNET = "android.permission.INTERNET";
    inline public static var KILL_BACKGROUND_PROCESSES = "android.permission.KILL_BACKGROUND_PROCESSES";
    inline public static var LOCATION_HARDWARE = "android.permission.LOCATION_HARDWARE";
    inline public static var MANAGE_DOCUMENTS = "android.permission.MANAGE_DOCUMENTS";
    inline public static var MANAGE_OWN_CALLS = "android.permission.MANAGE_OWN_CALLS";
    inline public static var MASTER_CLEAR = "android.permission.MASTER_CLEAR";
    inline public static var MEDIA_CONTENT_CONTROL = "android.permission.MEDIA_CONTENT_CONTROL";
    inline public static var MODIFY_AUDIO_SETTINGS = "android.permission.MODIFY_AUDIO_SETTINGS";
    inline public static var MODIFY_PHONE_STATE = "android.permission.MODIFY_PHONE_STATE";
    inline public static var MOUNT_FORMAT_FILESYSTEMS = "android.permission.MOUNT_FORMAT_FILESYSTEMS";
    inline public static var MOUNT_UNMOUNT_FILESYSTEMS = "android.permission.MOUNT_UNMOUNT_FILESYSTEMS";
    inline public static var NFC = "android.permission.NFC";
    inline public static var NFC_TRANSACTION_EVENT = "android.permission.NFC_TRANSACTION_EVENT";
    inline public static var PACKAGE_USAGE_STATS = "android.permission.PACKAGE_USAGE_STATS";
    
    /** @/deprecated */
    inline public static var PERSISTENT_ACTIVITY = "android.permission.PERSISTENT_ACTIVITY";
    inline public static var PROCESS_OUTGOING_CALLS = "android.permission.PROCESS_OUTGOING_CALLS";
    inline public static var READ_CALENDAR = "android.permission.READ_CALENDAR";
    inline public static var READ_CALL_LOG = "android.permission.READ_CALL_LOG";
    inline public static var READ_CONTACTS = "android.permission.READ_CONTACTS";
    inline public static var READ_EXTERNAL_STORAGE = "android.permission.READ_EXTERNAL_STORAGE";
    inline public static var READ_FRAME_BUFFER = "android.permission.READ_FRAME_BUFFER";
    
    /** @/deprecated */
    inline public static var READ_INPUT_STATE = "android.permission.READ_INPUT_STATE";
    inline public static var READ_LOGS = "android.permission.READ_LOGS";
    inline public static var READ_PHONE_NUMBERS = "android.permission.READ_PHONE_NUMBERS";
    inline public static var READ_PHONE_STATE = "android.permission.READ_PHONE_STATE";
    inline public static var READ_SMS = "android.permission.READ_SMS";
    inline public static var READ_SYNC_SETTINGS = "android.permission.READ_SYNC_SETTINGS";
    inline public static var READ_SYNC_STATS = "android.permission.READ_SYNC_STATS";
    inline public static var READ_VOICEMAIL = "com.android.voicemail.permission.READ_VOICEMAIL";
    inline public static var REBOOT = "android.permission.REBOOT";
    inline public static var RECEIVE_BOOT_COMPLETED = "android.permission.RECEIVE_BOOT_COMPLETED";
    inline public static var RECEIVE_MMS = "android.permission.RECEIVE_MMS";
    inline public static var RECEIVE_SMS = "android.permission.RECEIVE_SMS";
    inline public static var RECEIVE_WAP_PUSH = "android.permission.RECEIVE_WAP_PUSH";
    inline public static var RECORD_AUDIO = "android.permission.RECORD_AUDIO";
    inline public static var REORDER_TASKS = "android.permission.REORDER_TASKS";
    inline public static var REQUEST_COMPANION_RUN_IN_BACKGROUND = "android.permission.REQUEST_COMPANION_RUN_IN_BACKGROUND";
    inline public static var REQUEST_COMPANION_USE_DATA_IN_BACKGROUND = "android.permission.REQUEST_COMPANION_USE_DATA_IN_BACKGROUND";
    inline public static var REQUEST_DELETE_PACKAGES = "android.permission.REQUEST_DELETE_PACKAGES";
    inline public static var REQUEST_IGNORE_BATTERY_OPTIMIZATIONS = "android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS";
    inline public static var REQUEST_INSTALL_PACKAGES = "android.permission.REQUEST_INSTALL_PACKAGES";
    
    /** @/deprecated */
    inline public static var RESTART_PACKAGES = "android.permission.RESTART_PACKAGES";
    inline public static var SEND_RESPOND_VIA_MESSAGE = "android.permission.SEND_RESPOND_VIA_MESSAGE";
    inline public static var SEND_SMS = "android.permission.SEND_SMS";
    inline public static var SET_ALARM = "com.android.alarm.permission.SET_ALARM";
    inline public static var SET_ALWAYS_FINISH = "android.permission.SET_ALWAYS_FINISH";
    inline public static var SET_ANIMATION_SCALE = "android.permission.SET_ANIMATION_SCALE";
    inline public static var SET_DEBUG_APP = "android.permission.SET_DEBUG_APP";
   
    /** @/deprecated */
    inline public static var SET_PREFERRED_APPLICATIONS = "android.permission.SET_PREFERRED_APPLICATIONS";
    inline public static var SET_PROCESS_LIMIT = "android.permission.SET_PROCESS_LIMIT";
    inline public static var SET_TIME = "android.permission.SET_TIME";
    inline public static var SET_TIME_ZONE = "android.permission.SET_TIME_ZONE";
    inline public static var SET_WALLPAPER = "android.permission.SET_WALLPAPER";
    inline public static var SET_WALLPAPER_HINTS = "android.permission.SET_WALLPAPER_HINTS";
    inline public static var SIGNAL_PERSISTENT_PROCESSES = "android.permission.SIGNAL_PERSISTENT_PROCESSES";
    inline public static var STATUS_BAR = "android.permission.STATUS_BAR";
    inline public static var SYSTEM_ALERT_WINDOW = "android.permission.SYSTEM_ALERT_WINDOW";
    inline public static var TRANSMIT_IR = "android.permission.TRANSMIT_IR";
    inline public static var UNINSTALL_SHORTCUT = "com.android.launcher.permission.UNINSTALL_SHORTCUT";
    inline public static var UPDATE_DEVICE_STATS = "android.permission.UPDATE_DEVICE_STATS";
    inline public static var USE_BIOMETRIC = "android.permission.USE_BIOMETRIC";
    
    /** @/deprecated */
    inline public static var USE_FINGERPRINT = "android.permission.USE_FINGERPRINT";
    inline public static var USE_SIP = "android.permission.USE_SIP";
    inline public static var VIBRATE = "android.permission.VIBRATE";
    inline public static var WAKE_LOCK = "android.permission.WAKE_LOCK";
    inline public static var WRITE_APN_SETTINGS = "android.permission.WRITE_APN_SETTINGS";
    inline public static var WRITE_CALENDAR = "android.permission.WRITE_CALENDAR";
    inline public static var WRITE_CALL_LOG = "android.permission.WRITE_CALL_LOG";
    inline public static var WRITE_CONTACTS = "android.permission.WRITE_CONTACTS";
    inline public static var WRITE_EXTERNAL_STORAGE = "android.permission.WRITE_EXTERNAL_STORAGE";
    inline public static var WRITE_GSERVICES = "android.permission.WRITE_GSERVICES";
    inline public static var WRITE_SECURE_SETTINGS = "android.permission.WRITE_SECURE_SETTINGS";
    inline public static var WRITE_SETTINGS = "android.permission.WRITE_SETTINGS";
    inline public static var WRITE_SYNC_SETTINGS = "android.permission.WRITE_SYNC_SETTINGS";
    inline public static var WRITE_VOICEMAIL = "com.android.voicemail.permission.WRITE_VOICEMAIL";
}