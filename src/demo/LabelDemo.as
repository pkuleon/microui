package demo 
{
	import com.maxlab.microUI.controls.Label;
	import com.maxlab.microUI.controls.LinkLabel;
	import com.maxlab.microUI.core.Control;
	import com.maxlab.microUI.skins.simple.LabelSkin;
	import com.maxlab.microUI.skins.simple.LinkLabelSkin;
	import demo.assets.icons;
	
	/**
	* The demo shows what the Label control can do.
	* 
	* @author BG5SBK
	*/
	public class LabelDemo extends Control
	{
		public function LabelDemo(config:* = null) 
		{
			super(config);
			
			var label1:Label = new Label( {
				x: 20,
				y: 20,
				owner: this,
				textSize: 11,
				skin: new LabelSkin(),
				icon: new icons.Accept()
			});
			
			var label2:Label = new Label( {
				x: 20,
				y: 60,
				owner: this,
				textSize: 11,
				text: "I have text",
				skin: new LabelSkin()
			});
			
			var label3:Label = new Label( {
				x: 20,
				y: 100,
				owner: this,
				textSize: 11,
				skin: new LabelSkin(),
				icon: new icons.Accept(),
				text: "I have text and icon"
			});
			
			var label4:Label = new LinkLabel( { 
				x: 20,
				y: 140,
				owner: this,
				textSize: 11,
				text: "Home Page",
				url: "http://microui.googlecode.com",
				skin: new LinkLabelSkin()
			} );
		}
	}
}