package extension.androidtools.media;

import extension.androidtools.jni.JNICache;
import lime.app.Event;
import lime.system.JNI;

#if (!android && !native)
#error 'extension-androidtools is not supported on your current platform'
#end

/**
 * Utility class for managing volume and ringer mode control.
 */
class AudioManager 
{
    /**
	 * Constant representing the stream type that can be used for changing volume of that stream: voice call.
	 */
	public static final STREAM_VOICE_CALL:Int = 0;

    /**
	 * Constant representing the stream type that can be used for changing volume of that stream: system sounds.
	 */
	public static final STREAM_SYSTEM:Int = 1;

    /**
	 * Constant representing the stream type that can be used for changing volume of that stream: phone ring.
	 */
	public static final STREAM_RING:Int = 2;

    /**
	 * Constant representing the stream type that can be used for changing volume of that stream: music playback.
	 */
	public static final STREAM_MUSIC:Int = 3;

    /**
	 * Constant representing the stream type that can be used for changing volume of that stream: alarm.
	 */
	public static final STREAM_ALARM:Int = 4;

    /**
	 * Constant representing the stream type that can be used for changing volume of that stream: notification.
	 */
	public static final STREAM_NOTIFICATION:Int = 5;

    /**
	 * Constant representing the stream type that can be used for changing volume of that stream: phone calls when connected to bluetooth.
	 */
	public static final STREAM_BLUETOOTH_SCO:Int = 6;

    /**
	 * Constant representing the stream type that can be used for changing volume of that stream: enforced system sounds.
	 */
	public static final STREAM_SYSTEM_ENFORCED:Int = 7;

    /**
	 * Constant representing the stream type that can be used for changing volume of that stream: DTMF Tones.
	 */
	public static final STREAM_DTMF:Int = 8;

    /**
	 * Constant representing the stream type that can be used for changing volume of that stream: tts transmitted through the speaker.
	 */
	public static final STREAM_TTS:Int = 9;

    /**
	 * Constant representing the stream type that can be used for changing volume of that stream: accessibility prompts.
	 */
	public static final STREAM_ACCESSIBILITY:Int = 10;

    /**
	 * Constant representing the stream type that can be used for changing volume of that stream: virtual assistant.
	 */
	public static final STREAM_ASSISTANT:Int = 11;


    /**
	 * Constant representing the direction of volume adjustment: raise the volume.
	 */
	public static final ADJUST_RAISE:Int = 1;

    /**
	 * Constant representing the direction of volume adjustment: lower the volume.
	 */
	public static final ADJUST_LOWER:Int = -1;

    /**
	 * Constant representing the direction of volume adjustment: same volume.
	 */
	public static final ADJUST_SAME:Int = 0;

    /**
	 * Constant representing the direction of volume adjustment: mute the volume.
	 */
	public static final ADJUST_MUTE:Int = -100;

    /**
	 * Constant representing the direction of volume adjustment: unmute the volume.
	 */
	public static final ADJUST_UNMUTE:Int = 100;

    /**
	 * Constant representing the direction of volume adjustment: toggle mute state.
	 */
	public static final ADJUST_TOGGLE_MUTE:Int = 101;


    /**
	 * Constant representing the flags for volume adjustment: show ui.
	 */
	public static final FLAG_SHOW_UI:Int = 1 << 0;

    /**
	 * Constant representing the flags for volume adjustment: include ringer modes.
	 */
    public static final FLAG_ALLOW_RINGER_MODES:Int = 1 << 1;
    /**
	 * Constant representing the flags for volume adjustment: play sound when changing volume.
	 */
    public static final FLAG_PLAY_SOUND:Int = 1 << 2;

    /**
	 * Constant representing the flags for volume adjustment: remove any sound and vibrate.
	 */
    public static final FLAG_REMOVE_SOUND_AND_VIBRATE:Int = 1 << 3;

    /**
	 * Constant representing the flags for volume adjustment: vibrate if going into the vibrate ringer mode.
	 */
    public static final FLAG_VIBRATE:Int = 1 << 4;


	/**
	 * Constant representing the flags for audio focus status: nothing changed.
	 */
	public static final AUDIOFOCUS_NONE:Int = 0;

	/**
	 * Constant representing the flags for audio focus status: gain of audio focus.
	 */
    public static final AUDIOFOCUS_GAIN:Int = 1;

	/**
	 * Constant representing the flags for audio focus status: gain of temporary audio focus.
	 */
    public static final AUDIOFOCUS_GAIN_TRANSIENT:Int = 2;

	/**
	 * Constant representing the flags for audio focus status: gain of temporary audio focus with ducking another app.
	 */
    public static final AUDIOFOCUS_GAIN_TRANSIENT_MAY_DUCK:Int = 3;

	/**
	 * Constant representing the flags for audio focus status: gain of exclusive temporary audio focus.
	 */
    public static final AUDIOFOCUS_GAIN_TRANSIENT_EXCLUSIVE:Int = 4;

	/**
	 * Constant representing the flags for audio focus status: loss of audio focus.
	 */
    public static final AUDIOFOCUS_LOSS:Int = -1 * AUDIOFOCUS_GAIN;

	/**
	 * Constant representing the flags for audio focus status: loss of temporary audio focus.
	 */
    public static final AUDIOFOCUS_LOSS_TRANSIENT:Int = -1 * AUDIOFOCUS_GAIN_TRANSIENT;

	/**
	 * Constant representing the flags for audio focus status: loss of temporary audio focus with ducking another app.
	 */
    public static final AUDIOFOCUS_LOSS_TRANSIENT_CAN_DUCK:Int = -1 * AUDIOFOCUS_GAIN_TRANSIENT_MAY_DUCK;


    /**
     * Constant representing the flags for audio focus change result: unable to change focus.
     */
    public static final AUDIOFOCUS_REQUEST_FAILED:Int = 0;
    
	/**
     * Constant representing the flags for audio focus change result: focus was changed successfully.
     */
    public static final AUDIOFOCUS_REQUEST_GRANTED:Int = 1;
    
	/**
     * Constant representing the flags for audio focus change result: focus was changed successfully but delayed.
     */
    public static final AUDIOFOCUS_REQUEST_DELAYED:Int = 2;
    
    @:noCompletion
	private var constructor:Null<Dynamic>;

	private var onFocusChangeListener:OnAudioFocusChangeListener;

	/**
	 * Constructs a new instance of AudioManager.
	 */
	public function new():Void
	{
		final constructorJNI:Null<Dynamic> = JNICache.createStaticMethod('org/haxe/extension/Tools', 'getAudioManager', '()Landroid/media/AudioManager;');
		
		if (constructorJNI != null)
		{
			constructor = constructorJNI();
		}

		onFocusChangeListener = new OnAudioFocusChangeListener();
	}

    /**
	 * Adjust the volume of a stream.
	 */
	public function adjustStreamVolume(streamType:Int, direction:Int, flags:Int):Void
	{
		if (constructor == null)
			return;

		final adjustStreamVolumeJNI:Null<Dynamic> = JNICache.createMemberMethod('android/media/AudioManager', 'adjustStreamVolume', '(III)V');

		if (adjustStreamVolumeJNI != null)
			JNI.callMember(adjustStreamVolumeJNI, constructor, [streamType, direction, flags]);
	}

    /**
	 * Get the volume of a stream.
	 */
	public function getStreamVolume(streamType:Int):Int
    {
		if (constructor == null)
			return 0;

		final getStreamVolumeJNI:Null<Dynamic> = JNICache.createMemberMethod('android/media/AudioManager', 'getStreamVolume', '(I)I');

		if (getStreamVolumeJNI != null)
		{
        	return JNI.callMember(getStreamVolumeJNI, constructor, [streamType]);
		}
		else
		{
			return 0;
		}
    }

	/**
	 * Clears all audio focus callbacks that were passed on request and abandon.
	 */
	public function clearAllAudioFocusCallbacks() 
	{
		onFocusChangeListener.clearAllCallbacks();
	}

	/**
	 * Requests audio focus.
	 */
	public function requestAudioFocus(?callback:Int->Void, streamType:Int, durationHint:Int):Int
    {
		if (constructor == null && onFocusChangeListener.focusListenerJNI == null)
			return 0;

		if (callback != null)
			onFocusChangeListener.addCallback(callback);

		final requestAudioFocusJNI:Null<Dynamic> = JNICache.createMemberMethod('android/media/AudioManager', 'requestAudioFocus', "(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I");

		if (requestAudioFocusJNI != null)
		{
        	return JNI.callMember(requestAudioFocusJNI, constructor, [onFocusChangeListener.focusListenerJNI, streamType, durationHint]);
		}
		else
		{
			return 0;
		}
    }

	/**
	 * Abandon audio focus.
	 */
	public function abandonAudioFocus(?callback:Int->Void):Int
    {
		if (constructor == null && onFocusChangeListener.focusListenerJNI == null)
			return 0;
		
		if (callback != null)
			onFocusChangeListener.addCallback(callback);

		final abandonAudioFocusJNI:Null<Dynamic> = JNICache.createMemberMethod('android/media/AudioManager', 'abandonAudioFocus', "(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I");

		if (abandonAudioFocusJNI != null)
		{
        	return JNI.callMember(JNICache.createMemberMethod('android/media/AudioManager', 'abandonAudioFocus', "(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I"), constructor, [onFocusChangeListener.focusListenerJNI]);
		}
		else
		{
			return 0;
		}
    }
}

/**
 * Listener class for handling audio focus changes.
 */
@:noCompletion
private class OnAudioFocusChangeListener #if (lime >= "8.0.0") implements JNISafety #end
{
	private var onFocusChangeEvent:Event<Int->Void> = new Event<Int->Void>();

	@:noCompletion
	public var focusListenerJNI(default, null):Null<Dynamic>;

	/**
	 * Creates a new audio focus listener with a specified callback function.
	 *
	 * @param focusChange The function to execute when the focus is changed.
	 */
	public function new(?focusChange:Int->Void):Void
	{
		if (focusChange != null)
			onFocusChangeEvent.add(focusChange);

		final createAudioFocusCallbackJNI:Null<Dynamic> =  JNICache.createStaticMethod('org/haxe/extension/Tools', 'createAudioFocusCallback',
				"(Lorg/haxe/lime/HaxeObject;)Ljava/lang/Object;");

		if (createAudioFocusCallbackJNI != null)
		{
			focusListenerJNI = createAudioFocusCallbackJNI(this);
		}
	}

	public function addCallback(focusChange:Int->Void) 
	{
		onFocusChangeEvent.add(focusChange);
	}

	public function clearAllCallbacks() 
	{
		onFocusChangeEvent.removeAll();
	}

	#if (lime >= "8.0.0")
	@:runOnMainThread
	#end
	public function onAudioFocusChange(focusChange:Int):Void
	{
		onFocusChangeEvent.dispatch(focusChange);
	}
}