package android;

import flixel.util.FlxColor;
import haxe.crypto.Base64;
import haxe.io.Bytes;
import lime.app.Event;
import lime.system.JNI;
import openfl.display.BitmapData;
import openfl.display.PNGEncoderOptions;

class AlertDialog
{
	var builder:Dynamic;

	public function new()
	{
		builder = createBuilder_jni();
	}

	public function setIcon(bitmap:BitmapData)
	{
		var bytes = bitmap.encode(bitmap.rect, new PNGEncoderOptions());
		bytes.position = 0;
		var drawable = getDrawable_jni(Base64.encode(bytes));
		JNI.callMember(getMemberMethod("setIcon", "(Landroid/graphics/drawable/Drawable;)Landroid/app/AlertDialog$Builder;"), builder, [drawable]);
		bytes.clear();
		return this;
	}

	// not working
	public function setView(view:Dynamic)
	{
		JNI.callMember(getMemberMethod("setView", "(Landroid/view/View;)Landroid/app/AlertDialog$Builder;"), builder, [view]);
		return this;
	}

	public function setCancelable(b:Bool)
	{
		JNI.callMember(getMemberMethod("setCancelable", "(Z)Landroid/app/AlertDialog$Builder;"), builder, [b]);
		return this;
	}

	public function setTitle(str:String)
	{
		JNI.callMember(getMemberMethod("setTitle", "(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;"), builder, [str]);
		return this;
	}

	public function setMessage(str:String)
	{
		JNI.callMember(getMemberMethod("setMessage", "(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;"), builder, [str]);
		return this;
	}

	public function setPositiveButton(name:String, callback:Void->Void)
	{
		setButton_jni(builder, new ClickEventListener(callback), name, true);
		return this;
	}

	public function setNegativeButton(name:String, callback:Void->Void)
	{
		setButton_jni(builder, new ClickEventListener(callback), name, false);
		return this;
	}

	public function show()
	{
		showDialog_jni(builder);
	}

	public function createEditText()
	{
		return createEditText_jni();
	}

	function getMemberMethod(name:String, sig:String)
	{
		return JNI.createMemberMethod("android/app/AlertDialog$Builder", name, sig);
	}

	static var createEditText_jni = JNI.createStaticMethod("org/haxe/extension/Dialog", "createEditText", "()Landroid/widget/EditText;");
	static var getDrawable_jni = JNI.createStaticMethod("org/haxe/extension/Dialog", "getDrawable",
		"(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;");

	static var setButton_jni = JNI.createStaticMethod("org/haxe/extension/Dialog", "setButton",
		"(Landroid/app/AlertDialog$Builder;Lorg/haxe/lime/HaxeObject;Ljava/lang/String;Z)V");

	static var createBuilder_jni = JNI.createStaticMethod("org/haxe/extension/Dialog", "createBuilder", "()Ljava/lang/Object;");
	static var showDialog_jni = JNI.createStaticMethod("org/haxe/extension/Dialog", "showDialog", "(Ljava/lang/Object;)V");
}

class ClickEventListener
{
	public function new(cb)
	{
		onClickButton.add(cb);
	}

	public var onClickButton = new Event<Void->Void>();

	public function onClick(dialog:Dynamic, whichButton:Int)
	{
		onClickButton.dispatch();
	}
}

abstract EditText(Dynamic) from Dynamic to Dynamic
{
	// should work??
	public function getText():String
	{
		var editable = JNI.callMember(getMemberMethod("getText", "()Ljava/lang/String;"), this, []);
		return editable;
	}

	function getMemberMethod(name:String, sig:String)
	{
		return JNI.createMemberMethod("android/widget/EditText", name, sig);
	}
}
