package 
{
	import com.adobe.viewsource.ViewSource;
	
	import demo.ToolTipDemo;
	
	import flash.ui.ContextMenu;

	public class index extends ToolTipDemo
	{	
		public function index()
		{
			contextMenu = new ContextMenu();
			contextMenu.hideBuiltInItems();	
			ViewSource.addMenuItem(this, "srcview/index.html");
		}
	}
}