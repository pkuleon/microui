package demo.assets 
{
	import com.maxlab.microUI.skins.photoshop.ApplicationSkin;
	import com.maxlab.microUI.skins.photoshop.ButtonSkin;
	import com.maxlab.microUI.skins.photoshop.HSplitSkin;
	import com.maxlab.microUI.skins.photoshop.PanelSkin;
	import com.maxlab.microUI.skins.photoshop.ToolBarSkin;
	import com.maxlab.microUI.skins.photoshop.VSplitSkin;
	import com.maxlab.microUI.skins.Skin;
	
	/**
	* ...
	* @author BG5SBK
	*/
	public class PhotoshopSkinProvider implements ISkinProvider
	{
		public function get applicationSkin():Skin
		{
			return new ApplicationSkin();
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