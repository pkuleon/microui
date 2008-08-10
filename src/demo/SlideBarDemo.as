package demo 
{
	import com.maxlab.microUI.controls.Application;
	import com.maxlab.microUI.controls.HSlideBar;
	import com.maxlab.microUI.controls.Panel;
	import com.maxlab.microUI.controls.VSlideBar;
	
	import com.maxlab.microUI.core.Control;
	import com.maxlab.microUI.core.ControlAlign;
	import com.maxlab.microUI.core.ControlLayout;
	
	import com.maxlab.microUI.skins.simple.HSlideBarSkin;
	import com.maxlab.microUI.skins.simple.PanelSkin;
	import com.maxlab.microUI.skins.simple.VSlideBarSkin;
	
	/**
	* The demo shows what the SlideBar control can do.
	* 
	* @author BG5SBK
	*/
	public class SlideBarDemo extends Application
	{
		public function SlideBarDemo() 
		{
			super({
				vGap: 20,
				vAlign: ControlAlign.MIDDLE,
				layout: ControlLayout.VERTICAL
			});
			
			var panel:Panel = new Panel({
				owner:this,
				autoSize:true
			});
			
			var slideBar1:HSlideBar = new HSlideBar({
				x: 20,
				height: 20,
				width: 200,
				owner: panel,
				skin: new HSlideBarSkin()
			});
			
			var slideBar2:VSlideBar = new VSlideBar({
				y: 20,
				width: 20,
				value: 100,
				height: 200,
				owner: panel,
				skin: new VSlideBarSkin()
			});
			
			var slideBar3:HSlideBar = new HSlideBar( { 
				x: 20,
				y: 220,
				height: 20,
				width: 200,
				value: 100,
				owner: panel,
				skin: new HSlideBarSkin()
			});
			
			var slideBar4:VSlideBar = new VSlideBar( { 
				x: 220,
				y: 20,
				width: 20,
				height: 200,
				owner: panel,
				skin: new VSlideBarSkin()
			});
		}
	}
}