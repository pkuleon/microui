package demo 
{
	import com.maxlab.microUI.controls.Application;
	import com.maxlab.microUI.controls.Button;
	import com.maxlab.microUI.controls.HSlideBar;
	import com.maxlab.microUI.controls.ProgressBar;
	import com.maxlab.microUI.controls.ToolTip;
	
	import com.maxlab.microUI.core.ControlAlign;
	import com.maxlab.microUI.core.ControlLayout;
	
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
	public class ToolTipDemo extends Application
	{
		public function ToolTipDemo() 
		{
			super({
				vGap: 20,
				vAlign: ControlAlign.MIDDLE,
				layout: ControlLayout.VERTICAL
			});
			
			var button:Button = new Button({
				owner:this,
				textSize: 11,
				text: "Click Me",
				skin: new ButtonSkin(),
				icon: new icons.Accept()
			});
			
			var slideBar:HSlideBar = new HSlideBar({
				height: 20,
				width: 200,
				owner: this,
				skin: new HSlideBarSkin()
			});
			
			var progressBar:ProgressBar = new ProgressBar({
				width: 200,
				height: 10,
				owner: this,
				indeterminate: true,
				skin: new ProgressBarSkin()
			});
			
			var toolTip1:ToolTip = new ToolTip({
				owner: this,
				textSize: 11,
				target: button,
				skin: new ToolTipSkin(),
				text: "This is a Button"
			});
			
			var toolTip2:ToolTip = new ToolTip({
				owner: this,
				textSize: 11,
				target: slideBar,
				skin: new ToolTipSkin(),
				text: "This is a ToolBar"
			});
			
			var toolTip3:ToolTip = new ToolTip({
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