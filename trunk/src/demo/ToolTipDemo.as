package demo 
{
	import com.maxlab.microUI.controls.Button;
	import com.maxlab.microUI.controls.HSlideBar;
	import com.maxlab.microUI.controls.ProgressBar;
	import com.maxlab.microUI.controls.ToolTip;
	import com.maxlab.microUI.core.Control;
	import com.maxlab.microUI.skins.simple.ButtonSkin;
	import com.maxlab.microUI.skins.simple.HSlideBarSkin;
	import com.maxlab.microUI.skins.simple.ProgressBarSkin;
	import com.maxlab.microUI.skins.simple.ToolTipSkin;
	import demo.assets.icons;
	
	/**
	* The demo shows what the ToolTip control can do.
	* 
	* @author BG5SBK
	*/
	public class ToolTipDemo extends Control
	{
		public function ToolTipDemo(config:* = null) 
		{
			super(config);
			
			var button:Button = new Button({
				x:20,
				y:20,
				owner:this,
				textSize: 11,
				text: "Click Me",
				skin: new ButtonSkin(),
				icon: new icons.Accept()
			});
			
			var slideBar:HSlideBar = new HSlideBar( {
				x: 20,
				y: 60,
				height: 20,
				width: 200,
				owner: this,
				skin: new HSlideBarSkin()
			});
			
			var progressBar:ProgressBar = new ProgressBar( {
				x: 20,
				y: 100,
				width: 200,
				height: 10,
				owner: this,
				indeterminate: true,
				skin: new ProgressBarSkin()
			});
			
			var toolTip1:ToolTip = new ToolTip( {
				owner: this,
				textSize: 11,
				target: button,
				skin: new ToolTipSkin(),
				text: "This is a Button"
			});
			
			var toolTip2:ToolTip = new ToolTip( {
				owner: this,
				textSize: 11,
				target: slideBar,
				skin: new ToolTipSkin(),
				text: "This is a ToolBar"
			});
			
			var toolTip3:ToolTip = new ToolTip( {
				owner: this,
				textSize: 11,
				target: progressBar,
				skin: new ToolTipSkin(),
				icon: new icons.Accept(),
				text: "This is a ProgressBar"
			});
		}
	}
}