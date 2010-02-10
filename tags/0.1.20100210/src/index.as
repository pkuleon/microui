package 
{
	import com.adobe.viewsource.ViewSource;
	
	import demo.ToolTipDemo;
	
	import flash.ui.ContextMenu;

	/**
	 * This Class use in FlexBuilder project.
	 * Change the base class to the demo program class that what you want to see.
	 * 
	 * 这个类用于FlexBuilder项目
	 * 将基类类型改为你想运行的demo的类型
	 */
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