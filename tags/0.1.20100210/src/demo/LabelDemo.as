package demo 
{
	import com.maxlab.microUI.controls.Application;
	import com.maxlab.microUI.controls.Label;
	import com.maxlab.microUI.controls.LinkLabel;
	import com.maxlab.microUI.controls.Panel;
	
	import com.maxlab.microUI.core.Control;
	import com.maxlab.microUI.core.ControlAlign;
	import com.maxlab.microUI.core.ControlLayout;
	
	import com.maxlab.microUI.skins.simple.LabelSkin;
	import com.maxlab.microUI.skins.simple.LinkLabelSkin;
	
	import demo.assets.icons;
	
	/**
	* The demo shows what the Label control can do.
	* 
	* @author BG5SBK
	*/
	public class LabelDemo extends Application
	{
		public function LabelDemo() 
		{
			super({
				vAlign: ControlAlign.MIDDLE,
				layout: ControlLayout.VERTICAL
			});
			
			var panel:Panel = new Panel({
				vGap:20,
				owner: this,
				autoSize: true,
				hAlign: ControlAlign.LEFT,
				layout: ControlLayout.VERTICAL
			});
			
			var label1:Label = new Label({
				owner: panel,
				textSize: 11,
				skin: new LabelSkin(),
				icon: new icons.Accept()
			});
			
			var label2:Label = new Label({
				owner: panel,
				textSize: 11,
				text: "I have text",
				skin: new LabelSkin()
			});
			
			var label3:Label = new Label({
				owner: panel,
				textSize: 11,
				skin: new LabelSkin(),
				icon: new icons.Accept(),
				text: "I have text and icon"
			});
			
			var label4:Label = new LinkLabel({
				owner: panel,
				textSize: 11,
				text: "This is a link",
				url: "http://microui.googlecode.com",
				skin: new LinkLabelSkin()
			});
		}
	}
}