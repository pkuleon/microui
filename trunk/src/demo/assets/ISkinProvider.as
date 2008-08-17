package demo.assets 
{
	import com.maxlab.microUI.skins.Skin;
	
	/**
	* ...
	* @author BG5SBK
	*/
	public interface ISkinProvider 
	{
		function get applicationSkin():Skin;
		function get toolbarSkin():Skin;
		function get buttonSkin():Skin;
		function get panelSkin():Skin;
		function get hSplitSkin():Skin;
		function get vSplitSkin():Skin;
	}
}