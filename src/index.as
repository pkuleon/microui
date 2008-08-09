package 
{
	import com.adobe.viewsource.ViewSource;
	
	import demo.ToolTipDemo;
	
	import flash.display.StageScaleMode;
	import flash.ui.ContextMenu;

	public class index extends ToolTipDemo
	{	
		public function index()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			contextMenu = new ContextMenu();
			contextMenu.hideBuiltInItems();
			
			ViewSource.addMenuItem(this, "srcview/index.html");
		}
	}
}