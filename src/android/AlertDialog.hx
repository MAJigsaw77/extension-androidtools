package android;

import haxe.crypto.Base64;
import lime.app.Event;
import lime.system.JNI;
import openfl.display.BitmapData;
import openfl.display.PNGEncoderOptions;

/**
 * ...
 * @author luckydog7
 */
class AlertDialog
{
	private var builder:Dynamic;

	public function new()
	{
		builder = JNI.createStaticMethod('android/haxe/extensions/Dialog', 'createBuilder', '()Ljava/lang/Object;');
	}

	/**
	 * Not working for now.
	 */
	public function setView(view:Dynamic):Dynamic
	{
		JNI.callMember(getMemberMethod('setView', '(Landroid/view/View;)Landroid/app/AlertDialog$Builder;'), builder, [view]);
	}

	public function setCancelable(value:Bool = true):Dynamic
	{
		JNI.callMember(getMemberMethod('setCancelable', '(Z)Landroid/app/AlertDialog$Builder;'), builder, [value]);
	}

	public function setTitle(value:String):Dynamic
	{
		JNI.callMember(getMemberMethod('setTitle', '(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;'), builder, [value]);
	}

	public function setMessage(value:String):Dynamic
	{
		JNI.callMember(getMemberMethod('setMessage', '(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;'), builder, [value]);
	}

	public function setIcon(bitmap:BitmapData):Dynamic
	{
		var bytes:BitmapData = bitmap.encode(bitmap.rect, new PNGEncoderOptions());
		bytes.position = 0;

		var getDrawable_jni:Dynamic = JNI.createStaticMethod('android/haxe/extensions/Dialog', 'getDrawable',
			'(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;');
		JNI.callMember(getMemberMethod('setIcon', '(Landroid/graphics/drawable/Drawable;)Landroid/app/AlertDialog$Builder;'), builder,
			[getDrawable_jni(Base64.encode(bytes))]);
		bytes.clear();
	}

	public function setPositiveButton(name:String, callback:Void->Void):Void
	{
		var setButton_jni = JNI.createStaticMethod('android/haxe/extensions/Dialog', 'setButton',
			'(Landroid/app/AlertDialog$Builder;Lorg/haxe/lime/HaxeObject;Ljava/lang/String;Z)V');
		setButton_jni(builder, new ClickEventListener(callback), name, true);
	}

	public function setNegativeButton(name:String, callback:Void->Void):Void
	{
		var setButton_jni = JNI.createStaticMethod('android/haxe/extensions/Dialog', 'setButton',
			'(Landroid/app/AlertDialog$Builder;Lorg/haxe/lime/HaxeObject;Ljava/lang/String;Z)V');
		setButton_jni(builder, new ClickEventListener(callback), name, false);
	}

	public function show():Void
	{
		var showDialog_jni:Dynamic = JNI.createStaticMethod('android/haxe/extensions/Dialog', 'showDialog', '(Ljava/lang/Object;)V');
		showDialog_jni(builder);
	}

	public function createEditText():Dynamic
	{
		return JNI.createStaticMethod('android/haxe/extensions/Dialog', 'createEditText', '()Landroid/widget/EditText;');
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
