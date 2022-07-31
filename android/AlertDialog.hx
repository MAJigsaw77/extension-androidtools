package android;

#if (!android && !native && macro)
#error 'extension-androidtools is not supported on your current platform'
#end
import haxe.crypto.Base64;
import lime.app.Event;
#if (openfl < '4.0.0')
import openfl.utils.JNI;
#else
import lime.system.JNI;
#end
import openfl.display.BitmapData;
import openfl.display.PNGEncoderOptions;
import openfl.utils.ByteArray;

/**
 * @author luckydog7
 */
class AlertDialog
{
	private var builder:Dynamic;

	public function new()
	{
		builder = JNI.createStaticMethod('org/haxe/extension/Dialog', 'createBuilder', '()Ljava/lang/Object;');
	}

	/**
	 * Not working for now.
	 */
	public function setView(view:Dynamic):AlertDialog
	{
		JNI.callMember(getMemberMethod('setView', '(Landroid/view/View;)Landroid/app/AlertDialog$Builder;'), builder, [view]);

		return this;
	}

	public function setCancelable(value:Bool = true):AlertDialog
	{
		JNI.callMember(getMemberMethod('setCancelable', '(Z)Landroid/app/AlertDialog$Builder;'), builder, [value]);

		return this;
	}

	public function setTitle(value:String):AlertDialog
	{
		JNI.callMember(getMemberMethod('setTitle', '(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;'), builder, [value]);

		return this;
	}

	public function setMessage(value:String):AlertDialog
	{
		JNI.callMember(getMemberMethod('setMessage', '(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;'), builder, [value]);

		return this;
	}

	public function setIcon(bitmap:BitmapData):AlertDialog
	{
		var bytes:ByteArray = bitmap.encode(bitmap.rect, new PNGEncoderOptions());
		bytes.position = 0;

		var getDrawable_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Dialog', 'getDrawable',
			'(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;');
		JNI.callMember(getMemberMethod('setIcon', '(Landroid/graphics/drawable/Drawable;)Landroid/app/AlertDialog$Builder;'), builder,
			[getDrawable_jni(Base64.encode(bytes))]);
		bytes.clear();

		return this;
	}

	public function setPositiveButton(name:String, callback:Void->Void):AlertDialog
	{
		var setButton_jni = JNI.createStaticMethod('org/haxe/extension/Dialog', 'setButton',
			'(Landroid/app/AlertDialog$Builder;Lorg/haxe/lime/HaxeObject;Ljava/lang/String;Z)V');
		setButton_jni(builder, new ClickEventListener(callback), name, true);

		return this;
	}

	public function setNegativeButton(name:String, callback:Void->Void):AlertDialog
	{
		var setButton_jni = JNI.createStaticMethod('org/haxe/extension/Dialog', 'setButton',
			'(Landroid/app/AlertDialog$Builder;Lorg/haxe/lime/HaxeObject;Ljava/lang/String;Z)V');
		setButton_jni(builder, new ClickEventListener(callback), name, false);

		return this;
	}

	public function show():AlertDialog
	{
		var showDialog_jni:Dynamic = JNI.createStaticMethod('org/haxe/extension/Dialog', 'showDialog', '(Ljava/lang/Object;)V');
		showDialog_jni(builder);

		return this;
	}

	public function createEditText():Dynamic
	{
		return JNI.createStaticMethod('org/haxe/extension/Dialog', 'createEditText', '()Landroid/widget/EditText;');
	}

	private function getMemberMethod(name:String, sig:String):Dynamic
	{
		return JNI.createMemberMethod('android/app/AlertDialog$Builder', name, sig);
	}
}

class EditText
{
	/**
	 * Should work for now??
	 */
	public function getText():String
	{
		return JNI.callMember(getMemberMethod('getText', '()Ljava/lang/String;'), this, []);
	}

	private function getMemberMethod(name:String, sig:String)
	{
		return JNI.createMemberMethod('android/widget/EditText', name, sig);
	}
}

class ClickEventListener
{
	public function new(cb:Dynamic)
	{
		onClickButton.add(cb);
	}

	public var onClickButton = new Event<Void->Void>();

	public function onClick(dialog:Dynamic, whichButton:Int)
	{
		onClickButton.dispatch();
	}
}
