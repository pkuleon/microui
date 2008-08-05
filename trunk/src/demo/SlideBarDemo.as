package demo 
{
	import com.maxlab.microUI.controls.HSlideBar;
	import com.maxlab.microUI.controls.VSlideBar;
	import com.maxlab.microUI.core.Control;
	import com.maxlab.microUI.skins.simple.HSlideBarSkin;
	import com.maxlab.microUI.skins.simple.VSlideBarSkin;
	
	/**
	* The demo shows what the SlideBar control can do.
	* 
	* @author BG5SBK
	*/
	public class SlideBarDemo extends Control
	{
		public function SlideBarDemo(config:* = null) 
		{
			super(config);
			
			var slideBar1:HSlideBar = new HSlideBar( { 
				x: 40,
				y: 20,
				height: 20,
				width: 200,
				owner: this,
				skin: new HSlideBarSkin()
			});
			
			var slideBar2:VSlideBar = new VSlideBar( { 
				x: 20,
				y: 40,
				width: 20,
				value: 100,
				height: 200,
				owner: this,
				skin: new VSlideBarSkin()
			});
			
			var slideBar3:HSlideBar = new HSlideBar( { 
				x: 40,
				y: 240,
				height: 20,
				width: 200,
				value: 100,
				owner: this,
				skin: new HSlideBarSkin()
			});
			
			var slideBar4:VSlideBar = new VSlideBar( { 
				x: 240,
				y: 40,
				width: 20,
				height: 200,
				owner: this,
				skin: new VSlideBarSkin()
			});
		}
	}
}