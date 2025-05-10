package;

class Main extends lime.app.Application
{
	public function new():Void
	{
		super();
	}

	public override function onWindowCreate():Void
	{
		super.onWindowCreate();

		trace("=== Build Information ===");
		trace("BOARD: " + extension.androidtools.os.Build.BOARD);
		trace("BOOTLOADER: " + extension.androidtools.os.Build.BOOTLOADER);
		trace("BRAND: " + extension.androidtools.os.Build.BRAND);
		trace("DEVICE: " + extension.androidtools.os.Build.DEVICE);
		trace("ID: " + extension.androidtools.os.Build.ID);
		trace("PRODUCT: " + extension.androidtools.os.Build.PRODUCT);
		trace("MANUFACTURER: " + extension.androidtools.os.Build.MANUFACTURER);
		trace("HARDWARE: " + extension.androidtools.os.Build.HARDWARE);
		trace("MODEL: " + extension.androidtools.os.Build.MODEL);
		trace("ODM_SKU: " + extension.androidtools.os.Build.ODM_SKU);
		trace("SKU: " + extension.androidtools.os.Build.SKU);
		trace("SOC_MANUFACTURER: " + extension.androidtools.os.Build.SOC_MANUFACTURER);
		trace("SOC_MODEL: " + extension.androidtools.os.Build.SOC_MODEL);
		trace("TAGS: " + extension.androidtools.os.Build.TAGS);
		trace("TYPE: " + extension.androidtools.os.Build.TYPE);
		trace("HOST: " + extension.androidtools.os.Build.HOST);
		trace("USER: " + extension.androidtools.os.Build.USER);

		trace("=== Version Information ===");
		trace("BASE_OS: " + extension.androidtools.os.Build.VERSION.BASE_OS);
		trace("CODENAME: " + extension.androidtools.os.Build.VERSION.CODENAME);
		trace("INCREMENTAL: " + extension.androidtools.os.Build.VERSION.INCREMENTAL);
		trace("MEDIA_PERFORMANCE_CLASS: " + extension.androidtools.os.Build.VERSION.MEDIA_PERFORMANCE_CLASS);
		trace("RELEASE: " + extension.androidtools.os.Build.VERSION.RELEASE);
		trace("SDK: " + extension.androidtools.os.Build.VERSION.SDK);
		trace("SDK_INT: " + extension.androidtools.os.Build.VERSION.SDK_INT);
		trace("PREVIEW_SDK_INT: " + extension.androidtools.os.Build.VERSION.PREVIEW_SDK_INT);
		trace("RELEASE_OR_CODENAME: " + extension.androidtools.os.Build.VERSION.RELEASE_OR_CODENAME);
		trace("RELEASE_OR_PREVIEW_DISPLAY: " + extension.androidtools.os.Build.VERSION.RELEASE_OR_PREVIEW_DISPLAY);
		trace("SECURITY_PATCH: " + extension.androidtools.os.Build.VERSION.SECURITY_PATCH);

		trace("=== Context Paths ===");
		trace("FilesDir: " + extension.androidtools.content.Context.getFilesDir());
		trace("ExternalFilesDir: " + extension.androidtools.content.Context.getExternalFilesDir());
		trace("ExternalFilesDirs: " + extension.androidtools.content.Context.getExternalFilesDirs());
		trace("CacheDir: " + extension.androidtools.content.Context.getCacheDir());
		trace("CodeCacheDir: " + extension.androidtools.content.Context.getCodeCacheDir());
		trace("NoBackupFilesDir: " + extension.androidtools.content.Context.getNoBackupFilesDir());
		trace("ExternalCacheDir: " + extension.androidtools.content.Context.getExternalCacheDir());
		trace("ExternalCacheDirs: " + extension.androidtools.content.Context.getExternalCacheDirs());
		trace("ObbDir: " + extension.androidtools.content.Context.getObbDir());

		trace("=== Environment Paths & States ===");
		trace("Data Directory: " + extension.androidtools.os.Environment.getDataDirectory());
		trace("Download Cache Directory: " + extension.androidtools.os.Environment.getDownloadCacheDirectory());
		trace("External Storage Directory: " + extension.androidtools.os.Environment.getExternalStorageDirectory());
		trace("Storage Directory: " + extension.androidtools.os.Environment.getStorageDirectory());
		trace("External Storage State: " + extension.androidtools.os.Environment.getExternalStorageState());
		trace("Root Directory: " + extension.androidtools.os.Environment.getRootDirectory());
		trace("External Storage Emulated: " + extension.androidtools.os.Environment.isExternalStorageEmulated());
		trace("External Storage Manager: " + extension.androidtools.os.Environment.isExternalStorageManager());
		trace("External Storage Legacy: " + extension.androidtools.os.Environment.isExternalStorageLegacy());
		trace("External Storage Removable: " + extension.androidtools.os.Environment.isExternalStorageRemovable());
	}

	public override function render(context:lime.graphics.RenderContext):Void
	{
		switch (context.type)
		{
			case CAIRO:
				context.cairo.setSourceRGB(0.75, 1, 0);
				context.cairo.paint();
			case CANVAS:
				context.canvas2D.fillStyle = '#BFFF00';
				context.canvas2D.fillRect(0, 0, window.width, window.height);
			case DOM:
				context.dom.style.backgroundColor = '#BFFF00';
			case FLASH:
				context.flash.graphics.beginFill(0xBFFF00);
				context.flash.graphics.drawRect(0, 0, window.width, window.height);
			case OPENGL | OPENGLES | WEBGL:
				context.webgl.clearColor(0.75, 1, 0, 1);
				context.webgl.clear(context.webgl.COLOR_BUFFER_BIT);
			default:
		}
	}
}
