package demo.assets 
{
	import com.maxlab.microUI.skins.simple.ButtonSkin;
	import com.maxlab.microUI.skins.simple.HSlideBarSkin;
	import com.maxlab.microUI.skins.simple.HSplitSkin;
	import com.maxlab.microUI.skins.simple.PanelSkin;
	import com.maxlab.microUI.skins.simple.ToolBarSkin;
	import com.maxlab.microUI.skins.simple.VSplitSkin;
	import com.maxlab.microUI.skins.Skin;
	
	/**
	* ...
	* @author BG5SBK
	*/
	public class SimpleSkinProvider implements ISkinProvider
	{
		public function get applicationSkin():Skin
		{
			return null;
		}
		
		public function get toolbarSkin():Skin
		{
			return new ToolBarSkin();
		}
		
		public function get buttonSkin():Skin
		{
			return new ButtonSkin();
		}
		
		public function get panelSkin():Skin
		{
			return new PanelSkin();
		}
		
		public function get hSplitSkin():Skin
		{
			return new HSplitSkin();
		}
		
		public function get vSplitSkin():Skin
		{
			return new VSplitSkin();
		}
	}
}