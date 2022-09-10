package android;

#if (!android && !native && macro)
#error 'extension-androidtools is not supported on your current platform'
#end

import lime.system.JNI;

/**
 * @author Mihai Alexandru (M.A. Jigsaw)
 */
#if !debug
@:fileXml('tags="haxe,release"')
@:noDebug
#end
@:access(lime.system.JNI)
class Permissions
{
	public static final ACCEPT_HANDOVER:String = 'android.permission.ACCEPT_HANDOVER';
	public static final ACCESS_BACKGROUND_LOCATION:String = 'android.permission.ACCESS_BACKGROUND_LOCATION';
	public static final ACCESS_BLOBS_ACROSS_USERS:String = 'android.permission.ACCESS_BLOBS_ACROSS_USERS';
	public static final ACCESS_CHECKIN_PROPERTIES:String = 'android.permission.ACCESS_CHECKIN_PROPERTIES';
	public static final ACCESS_COARSE_LOCATION:String = 'android.permission.ACCESS_COARSE_LOCATION';
	public static final ACCESS_FINE_LOCATION:String = 'android.permission.ACCESS_FINE_LOCATION';
	public static final ACCESS_LOCATION_EXTRA_COMMANDS:String = 'android.permission.ACCESS_LOCATION_EXTRA_COMMANDS';
	public static final ACCESS_MEDIA_LOCATION:String = 'android.permission.ACCESS_MEDIA_LOCATION';
	public static final ACCESS_NETWORK_STATE:String = 'android.permission.ACCESS_NETWORK_STATE';
	public static final ACCESS_NOTIFICATION_POLICY:String = 'android.permission.ACCESS_NOTIFICATION_POLICY';
	public static final ACCESS_SUPPLEMENTAL_APIS:String = 'android.permission.ACCESS_SUPPLEMENTAL_APIS';
	public static final ACCESS_WIFI_STATE:String = 'android.permission.ACCESS_WIFI_STATE';
	public static final ACCOUNT_MANAGER:String = 'android.permission.ACCOUNT_MANAGER';
	public static final ACTIVITY_RECOGNITION:String = 'android.permission.ACTIVITY_RECOGNITION';
	public static final ADD_VOICEMAIL:String = 'android.permission.ADD_VOICEMAIL';
	public static final ANSWER_PHONE_CALLS:String = 'android.permission.ANSWER_PHONE_CALLS';
	public static final BATTERY_STATS:String = 'android.permission.BATTERY_STATS';
	public static final BIND_ACCESSIBILITY_SERVICE:String = 'android.permission.BIND_ACCESSIBILITY_SERVICE';
	public static final BIND_APPWIDGET:String = 'android.permission.BIND_APPWIDGET';
	public static final BIND_AUTOFILL_SERVICE:String = 'android.permission.BIND_AUTOFILL_SERVICE';
	public static final BIND_CALL_REDIRECTION_SERVICE:String = 'android.permission.BIND_CALL_REDIRECTION_SERVICE';
	public static final BIND_CARRIER_MESSAGING_CLIENT_SERVICE:String = 'android.permission.BIND_CARRIER_MESSAGING_CLIENT_SERVICE';
	public static final BIND_CARRIER_MESSAGING_SERVICE:String = 'android.permission.BIND_CARRIER_MESSAGING_SERVICE';
	public static final BIND_CARRIER_SERVICES:String = 'android.permission.BIND_CARRIER_SERVICES';
	public static final BIND_CHOOSER_TARGET_SERVICE:String = 'android.permission.BIND_CHOOSER_TARGET_SERVICE';
	public static final BIND_COMPANION_DEVICE_SERVICE:String = 'android.permission.BIND_COMPANION_DEVICE_SERVICE';
	public static final BIND_CONDITION_PROVIDER_SERVICE:String = 'android.permission.BIND_CONDITION_PROVIDER_SERVICE';
	public static final BIND_CONTROLS:String = 'android.permission.BIND_CONTROLS';
	public static final BIND_DEVICE_ADMIN:String = 'android.permission.BIND_DEVICE_ADMIN';
	public static final BIND_DREAM_SERVICE:String = 'android.permission.BIND_DREAM_SERVICE';
	public static final BIND_INCALL_SERVICE:String = 'android.permission.BIND_INCALL_SERVICE';
	public static final BIND_INPUT_METHOD:String = 'android.permission.BIND_INPUT_METHOD';
	public static final BIND_MIDI_DEVICE_SERVICE:String = 'android.permission.BIND_MIDI_DEVICE_SERVICE';
	public static final BIND_NFC_SERVICE:String = 'android.permission.BIND_NFC_SERVICE';
	public static final BIND_NOTIFICATION_LISTENER_SERVICE:String = 'android.permission.BIND_NOTIFICATION_LISTENER_SERVICE';
	public static final BIND_PRINT_SERVICE:String = 'android.permission.BIND_PRINT_SERVICE';
	public static final BIND_QUICK_ACCESS_WALLET_SERVICE:String = 'android.permission.BIND_QUICK_ACCESS_WALLET_SERVICE';
	public static final BIND_QUICK_SETTINGS_TILE:String = 'android.permission.BIND_QUICK_SETTINGS_TILE';
	public static final BIND_REMOTEVIEWS:String = 'android.permission.BIND_REMOTEVIEWS';
	public static final BIND_SCREENING_SERVICE:String = 'android.permission.BIND_SCREENING_SERVICE';
	public static final BIND_TELECOM_CONNECTION_SERVICE:String = 'android.permission.BIND_TELECOM_CONNECTION_SERVICE';
	public static final BIND_TEXT_SERVICE:String = 'android.permission.BIND_TEXT_SERVICE';
	public static final BIND_TV_INPUT:String = 'android.permission.BIND_TV_INPUT';
	public static final BIND_TV_INTERACTIVE_APP:String = 'android.permission.BIND_TV_INTERACTIVE_APP';
	public static final BIND_VISUAL_VOICEMAIL_SERVICE:String = 'android.permission.BIND_VISUAL_VOICEMAIL_SERVICE';
	public static final BIND_VOICE_INTERACTION:String = 'android.permission.BIND_VOICE_INTERACTION';
	public static final BIND_VPN_SERVICE:String = 'android.permission.BIND_VPN_SERVICE';
	public static final BIND_VR_LISTENER_SERVICE:String = 'android.permission.BIND_VR_LISTENER_SERVICE';
	public static final BIND_WALLPAPER:String = 'android.permission.BIND_WALLPAPER';
	public static final BLUETOOTH:String = 'android.permission.BLUETOOTH';
	public static final BLUETOOTH_ADMIN:String = 'android.permission.BLUETOOTH_ADMIN';
	public static final BLUETOOTH_ADVERTISE:String = 'android.permission.BLUETOOTH_ADVERTISE';
	public static final BLUETOOTH_CONNECT:String = 'android.permission.BLUETOOTH_CONNECT';
	public static final BLUETOOTH_PRIVILEGED:String = 'android.permission.BLUETOOTH_PRIVILEGED';
	public static final BLUETOOTH_SCAN:String = 'android.permission.BLUETOOTH_SCAN';
	public static final BODY_SENSORS:String = 'android.permission.BODY_SENSORS';
	public static final BODY_SENSORS_BACKGROUND:String = 'android.permission.BODY_SENSORS_BACKGROUND';
	public static final BROADCAST_PACKAGE_REMOVED:String = 'android.permission.BROADCAST_PACKAGE_REMOVED';
	public static final BROADCAST_SMS:String = 'android.permission.BROADCAST_SMS';
	public static final BROADCAST_STICKY:String = 'android.permission.BROADCAST_STICKY';
	public static final BROADCAST_WAP_PUSH:String = 'android.permission.BROADCAST_WAP_PUSH';
	public static final CALL_COMPANION_APP:String = 'android.permission.CALL_COMPANION_APP';
	public static final CALL_PHONE:String = 'android.permission.CALL_PHONE';
	public static final CALL_PRIVILEGED:String = 'android.permission.CALL_PRIVILEGED';
	public static final CAMERA:String = 'android.permission.CAMERA';
	public static final CAPTURE_AUDIO_OUTPUT:String = 'android.permission.CAPTURE_AUDIO_OUTPUT';
	public static final CHANGE_COMPONENT_ENABLED_STATE:String = 'android.permission.CHANGE_COMPONENT_ENABLED_STATE';
	public static final CHANGE_CONFIGURATION:String = 'android.permission.CHANGE_CONFIGURATION';
	public static final CHANGE_NETWORK_STATE:String = 'android.permission.CHANGE_NETWORK_STATE';
	public static final CHANGE_WIFI_MULTICAST_STATE:String = 'android.permission.CHANGE_WIFI_MULTICAST_STATE';
	public static final CHANGE_WIFI_STATE:String = 'android.permission.CHANGE_WIFI_STATE';
	public static final CLEAR_APP_CACHE:String = 'android.permission.CLEAR_APP_CACHE';
	public static final CONTROL_LOCATION_UPDATES:String = 'android.permission.CONTROL_LOCATION_UPDATES';
	public static final DELETE_CACHE_FILES:String = 'android.permission.DELETE_CACHE_FILES';
	public static final DELETE_PACKAGES:String = 'android.permission.DELETE_PACKAGES';
	public static final DELIVER_COMPANION_MESSAGES:String = 'android.permission.DELIVER_COMPANION_MESSAGES';
	public static final DIAGNOSTIC:String = 'android.permission.DIAGNOSTIC';
	public static final DISABLE_KEYGUARD:String = 'android.permission.DISABLE_KEYGUARD';
	public static final DUMP:String = 'android.permission.DUMP';
	public static final EXPAND_STATUS_BAR:String = 'android.permission.EXPAND_STATUS_BAR';
	public static final FACTORY_TEST:String = 'android.permission.FACTORY_TEST';
	public static final FOREGROUND_SERVICE:String = 'android.permission.FOREGROUND_SERVICE';
	public static final GET_ACCOUNTS:String = 'android.permission.GET_ACCOUNTS';
	public static final GET_ACCOUNTS_PRIVILEGED:String = 'android.permission.GET_ACCOUNTS_PRIVILEGED';
	public static final GET_PACKAGE_SIZE:String = 'android.permission.GET_PACKAGE_SIZE';
	public static final GET_TASKS:String = 'android.permission.GET_TASKS';
	public static final GLOBAL_SEARCH:String = 'android.permission.GLOBAL_SEARCH';
	public static final HIDE_OVERLAY_WINDOWS:String = 'android.permission.HIDE_OVERLAY_WINDOWS';
	public static final HIGH_SAMPLING_RATE_SENSORS:String = 'android.permission.HIGH_SAMPLING_RATE_SENSORS';
	public static final INSTALL_LOCATION_PROVIDER:String = 'android.permission.INSTALL_LOCATION_PROVIDER';
	public static final INSTALL_PACKAGES:String = 'android.permission.INSTALL_PACKAGES';
	public static final INSTALL_SHORTCUT:String = 'android.permission.INSTALL_SHORTCUT';
	public static final INSTANT_APP_FOREGROUND_SERVICE:String = 'android.permission.INSTANT_APP_FOREGROUND_SERVICE';
	public static final INTERACT_ACROSS_PROFILES:String = 'android.permission.INTERACT_ACROSS_PROFILES';
	public static final INTERNET:String = 'android.permission.INTERNET';
	public static final KILL_BACKGROUND_PROCESSES:String = 'android.permission.KILL_BACKGROUND_PROCESSES';
	public static final LAUNCH_MULTI_PANE_SETTINGS_DEEP_LINK:String = 'android.permission.LAUNCH_MULTI_PANE_SETTINGS_DEEP_LINK';
	public static final LOADER_USAGE_STATS:String = 'android.permission.LOADER_USAGE_STATS';
	public static final LOCATION_HARDWARE:String = 'android.permission.LOCATION_HARDWARE';
	public static final MANAGE_DOCUMENTS:String = 'android.permission.MANAGE_DOCUMENTS';
	public static final MANAGE_EXTERNAL_STORAGE:String = 'android.permission.MANAGE_EXTERNAL_STORAGE';
	public static final MANAGE_MEDIA:String = 'android.permission.MANAGE_MEDIA';
	public static final MANAGE_ONGOING_CALLS:String = 'android.permission.MANAGE_ONGOING_CALLS';
	public static final MANAGE_OWN_CALLS:String = 'android.permission.MANAGE_OWN_CALLS';
	public static final MANAGE_WIFI_AUTO_JOIN:String = 'android.permission.MANAGE_WIFI_AUTO_JOIN';
	public static final MANAGE_WIFI_INTERFACES:String = 'android.permission.MANAGE_WIFI_INTERFACES';
	public static final MASTER_CLEAR:String = 'android.permission.MASTER_CLEAR';
	public static final MEDIA_CONTENT_CONTROL:String = 'android.permission.MEDIA_CONTENT_CONTROL';
	public static final MODIFY_AUDIO_SETTINGS:String = 'android.permission.MODIFY_AUDIO_SETTINGS';
	public static final MODIFY_PHONE_STATE:String = 'android.permission.MODIFY_PHONE_STATE';
	public static final MOUNT_FORMAT_FILESYSTEMS:String = 'android.permission.MOUNT_FORMAT_FILESYSTEMS';
	public static final MOUNT_UNMOUNT_FILESYSTEMS:String = 'android.permission.MOUNT_UNMOUNT_FILESYSTEMS';
	public static final NEARBY_WIFI_DEVICES:String = 'android.permission.NEARBY_WIFI_DEVICES';
	public static final NFC:String = 'android.permission.NFC';
	public static final NFC_PREFERRED_PAYMENT_INFO:String = 'android.permission.NFC_PREFERRED_PAYMENT_INFO';
	public static final NFC_TRANSACTION_EVENT:String = 'android.permission.NFC_TRANSACTION_EVENT';
	public static final OVERRIDE_WIFI_CONFIG:String = 'android.permission.OVERRIDE_WIFI_CONFIG';
	public static final PACKAGE_USAGE_STATS:String = 'android.permission.PACKAGE_USAGE_STATS';
	public static final PERSISTENT_ACTIVITY:String = 'android.permission.PERSISTENT_ACTIVITY';
	public static final POST_NOTIFICATIONS:String = 'android.permission.POST_NOTIFICATIONS';
	public static final PROCESS_OUTGOING_CALLS:String = 'android.permission.PROCESS_OUTGOING_CALLS';
	public static final QUERY_ALL_PACKAGES:String = 'android.permission.QUERY_ALL_PACKAGES';
	public static final READ_ASSISTANT_APP_SEARCH_DATA:String = 'android.permission.READ_ASSISTANT_APP_SEARCH_DATA';
	public static final READ_BASIC_PHONE_STATE:String = 'android.permission.READ_BASIC_PHONE_STATE';
	public static final READ_CALENDAR:String = 'android.permission.READ_CALENDAR';
	public static final READ_CALL_LOG:String = 'android.permission.READ_CALL_LOG';
	public static final READ_CONTACTS:String = 'android.permission.READ_CONTACTS';
	public static final READ_EXTERNAL_STORAGE:String = 'android.permission.READ_EXTERNAL_STORAGE';
	public static final READ_HOME_APP_SEARCH_DATA:String = 'android.permission.READ_HOME_APP_SEARCH_DATA';
	public static final READ_INPUT_STATE:String = 'android.permission.READ_INPUT_STATE';
	public static final READ_LOGS:String = 'android.permission.READ_LOGS';
	public static final READ_MEDIA_AUDIO:String = 'android.permission.READ_MEDIA_AUDIO';
	public static final READ_MEDIA_IMAGE:String = 'android.permission.READ_MEDIA_IMAGE';
	public static final READ_MEDIA_VIDEO:String = 'android.permission.READ_MEDIA_VIDEO';
	public static final READ_NEARBY_STREAMING_POLICY:String = 'android.permission.READ_NEARBY_STREAMING_POLICY';
	public static final READ_PHONE_NUMBERS:String = 'android.permission.READ_PHONE_NUMBERS';
	public static final READ_PHONE_STATE:String = 'android.permission.READ_PHONE_STATE';
	public static final READ_PRECISE_PHONE_STATE:String = 'android.permission.READ_PRECISE_PHONE_STATE';
	public static final READ_SMS:String = 'android.permission.READ_SMS';
	public static final READ_SYNC_SETTINGS:String = 'android.permission.READ_SYNC_SETTINGS';
	public static final READ_SYNC_STATS:String = 'android.permission.READ_SYNC_STATS';
	public static final READ_VOICEMAIL:String = 'android.permission.READ_VOICEMAIL';
	public static final REBOOT:String = 'android.permission.REBOOT';
	public static final RECEIVE_BOOT_COMPLETED:String = 'android.permission.RECEIVE_BOOT_COMPLETED';
	public static final RECEIVE_MMS:String = 'android.permission.RECEIVE_MMS';
	public static final RECEIVE_SMS:String = 'android.permission.RECEIVE_SMS';
	public static final RECEIVE_WAP_PUSH:String = 'android.permission.RECEIVE_WAP_PUSH';
	public static final RECORD_AUDIO:String = 'android.permission.RECORD_AUDIO';
	public static final REORDER_TASKS:String = 'android.permission.REORDER_TASKS';
	public static final REQUEST_COMPANION_PROFILE_APP_STREAMING:String = 'android.permission.REQUEST_COMPANION_PROFILE_APP_STREAMING';
	public static final REQUEST_COMPANION_PROFILE_AUTOMOTIVE_PROJECTION:String = 'android.permission.REQUEST_COMPANION_PROFILE_AUTOMOTIVE_PROJECTION';
	public static final REQUEST_COMPANION_PROFILE_COMPUTER:String = 'android.permission.REQUEST_COMPANION_PROFILE_COMPUTER';
	public static final REQUEST_COMPANION_PROFILE_WATCH:String = 'android.permission.REQUEST_COMPANION_PROFILE_WATCH';
	public static final REQUEST_COMPANION_RUN_IN_BACKGROUND:String = 'android.permission.REQUEST_COMPANION_RUN_IN_BACKGROUND';
	public static final REQUEST_COMPANION_SELF_MANAGED:String = 'android.permission.REQUEST_COMPANION_SELF_MANAGED';
	public static final REQUEST_COMPANION_START_FOREGROUND_SERVICES_FROM_BACKGROUND:String = 'android.permission.REQUEST_COMPANION_START_FOREGROUND_SERVICES_FROM_BACKGROUND';
	public static final REQUEST_COMPANION_USE_DATA_IN_BACKGROUND:String = 'android.permission.REQUEST_COMPANION_USE_DATA_IN_BACKGROUND';
	public static final REQUEST_DELETE_PACKAGES:String = 'android.permission.REQUEST_DELETE_PACKAGES';
	public static final REQUEST_IGNORE_BATTERY_OPTIMIZATIONS:String = 'android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS';
	public static final REQUEST_INSTALL_PACKAGES:String = 'android.permission.REQUEST_INSTALL_PACKAGES';
	public static final REQUEST_OBSERVE_COMPANION_DEVICE_PRESENCE:String = 'android.permission.REQUEST_OBSERVE_COMPANION_DEVICE_PRESENCE';
	public static final REQUEST_PASSWORD_COMPLEXITY:String = 'android.permission.REQUEST_PASSWORD_COMPLEXITY';
	public static final RESTART_PACKAGES:String = 'android.permission.RESTART_PACKAGES';
	public static final SCHEDULE_EXACT_ALARM:String = 'android.permission.SCHEDULE_EXACT_ALARM';
	public static final SEND_RESPOND_VIA_MESSAGE:String = 'android.permission.SEND_RESPOND_VIA_MESSAGE';
	public static final SEND_SMS:String = 'android.permission.SEND_SMS';
	public static final SET_ALARM:String = 'android.permission.SET_ALARM';
	public static final SET_ALWAYS_FINISH:String = 'android.permission.SET_ALWAYS_FINISH';
	public static final SET_ANIMATION_SCALE:String = 'android.permission.SET_ANIMATION_SCALE';
	public static final SET_DEBUG_APP:String = 'android.permission.SET_DEBUG_APP';
	public static final SET_PREFERRED_APPLICATIONS:String = 'android.permission.SET_PREFERRED_APPLICATIONS';
	public static final SET_PROCESS_LIMIT:String = 'android.permission.SET_PROCESS_LIMIT';
	public static final SET_TIME:String = 'android.permission.SET_TIME';
	public static final SET_TIME_ZONE:String = 'android.permission.SET_TIME_ZONE';
	public static final SET_WALLPAPER:String = 'android.permission.SET_WALLPAPER';
	public static final SET_WALLPAPER_HINTS:String = 'android.permission.SET_WALLPAPER_HINTS';
	public static final SIGNAL_PERSISTENT_PROCESSES:String = 'android.permission.SIGNAL_PERSISTENT_PROCESSES';
	public static final SMS_FINANCIAL_TRANSACTIONS:String = 'android.permission.SMS_FINANCIAL_TRANSACTIONS';
	public static final START_FOREGROUND_SERVICES_FROM_BACKGROUND:String = 'android.permission.START_FOREGROUND_SERVICES_FROM_BACKGROUND';
	public static final START_VIEW_APP_FEATURES:String = 'android.permission.START_VIEW_APP_FEATURES';
	public static final START_VIEW_PERMISSION_USAGE:String = 'android.permission.START_VIEW_PERMISSION_USAGE';
	public static final STATUS_BAR:String = 'android.permission.STATUS_BAR';
	public static final SYSTEM_ALERT_WINDOW:String = 'android.permission.SYSTEM_ALERT_WINDOW';
	public static final TRANSMIT_IR:String = 'android.permission.TRANSMIT_IR';
	public static final UNINSTALL_SHORTCUT:String = 'android.permission.UNINSTALL_SHORTCUT';
	public static final UPDATE_DEVICE_STATS:String = 'android.permission.UPDATE_DEVICE_STATS';
	public static final UPDATE_PACKAGES_WITHOUT_USER_ACTION:String = 'android.permission.UPDATE_PACKAGES_WITHOUT_USER_ACTION';
	public static final USE_BIOMETRIC:String = 'android.permission.USE_BIOMETRIC';
	public static final USE_EXACT_ALARM:String = 'android.permission.USE_EXACT_ALARM';
	public static final USE_FINGERPRINT:String = 'android.permission.USE_FINGERPRINT';
	public static final USE_FULL_SCREEN_INTENT:String = 'android.permission.USE_FULL_SCREEN_INTENT';
	public static final USE_ICC_AUTH_WITH_DEVICE_IDENTIFIER:String = 'android.permission.USE_ICC_AUTH_WITH_DEVICE_IDENTIFIER';
	public static final USE_SIP:String = 'android.permission.USE_SIP';
	public static final UWB_RANGING:String = 'android.permission.UWB_RANGING';
	public static final VIBRATE:String = 'android.permission.VIBRATE';
	public static final WAKE_LOCK:String = 'android.permission.WAKE_LOCK';
	public static final WRITE_APN_SETTINGS:String = 'android.permission.WRITE_APN_SETTINGS';
	public static final WRITE_CALENDAR:String = 'android.permission.WRITE_CALENDAR';
	public static final WRITE_CALL_LOG:String = 'android.permission.WRITE_CALL_LOG';
	public static final WRITE_CONTACTS:String = 'android.permission.WRITE_CONTACTS';
	public static final WRITE_EXTERNAL_STORAGE:String = 'android.permission.WRITE_EXTERNAL_STORAGE';
	public static final WRITE_GSERVICES:String = 'android.permission.WRITE_GSERVICES';
	public static final WRITE_SECURE_SETTINGS:String = 'android.permission.WRITE_SECURE_SETTINGS';
	public static final WRITE_SETTINGS:String = 'android.permission.WRITE_SETTINGS';
	public static final WRITE_SYNC_SETTINGS:String = 'android.permission.WRITE_SYNC_SETTINGS';
	public static final WRITE_VOICEMAIL:String = 'android.permission.WRITE_VOICEMAIL';

	/**
	 * Checks whether the app already has the given permission.
	 * Returns the granted permissions.
	 */
	public static function getGrantedPermissions():Array<String>
	{
		var getGrantedPermissionsJNI:Dynamic = JNI.createStaticMethod('org/haxe/extension/Permissions', 'getGrantedPermissions', '()[Ljava/lang/String;');
		return getGrantedPermissionsJNI();
	}

	/**
	 * Displays a dialog requesting all of the given permissions at once.
	 * This dialog will be displayed even if the user already granted the permissions, allowing them to disable them if they like.
	 * 
	 * @param permissions the array of permissions.
	 * @param requestCode the code that should be requested.
	 */
	public static function requestPermissions(permissions:Array<String>, requestCode:Int = 1):Void
	{
		var requestPermissionsJNI:Dynamic = JNI.createStaticMethod('org/haxe/extension/Permissions', 'requestPermissions', '([Ljava/lang/String;I)V');
		requestPermissionsJNI(permissions, requestCode);
	}
}
