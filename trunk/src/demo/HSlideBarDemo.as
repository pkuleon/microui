package demo 
{
	import com.maxlab.microUI.controls.HSlideBar;
	import com.maxlab.microUI.core.Control;
	import com.maxlab.microUI.skins.simple.HSlideBarSkin;
	
	/**
	* The demo shows what the HSlideBar control can do.
	* 
	* @author BG5SBK
	*/
	public class HSlideBarDemo extends Control
	{
		public function HSlideBarDemo(config:* = null) 
		{
			super(config);
			
			var slideBar1:HSlideBar = new HSlideBar( { 
				x: 20,
				y: 20,
				height: 20,
				width: 200,
				owner: this,
				skin: new HSlideBarSkin()
			});
		}
	}
}