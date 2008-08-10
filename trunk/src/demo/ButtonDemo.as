package demo 
{
	import com.maxlab.microUI.controls.Application;
	import com.maxlab.microUI.controls.Button;
	import com.maxlab.microUI.controls.Panel;
	
	import com.maxlab.microUI.core.Control;
	import com.maxlab.microUI.core.ControlAlign;
	import com.maxlab.microUI.core.ControlLayout;
	
	import com.maxlab.microUI.skins.simple.ButtonSkin;
	
	import demo.assets.icons;
	
	/**
	* The button demo shows what the Button control can do.
	* 
	* @author BG5SBK
	*/
	public class ButtonDemo extends Application
	{
		public function ButtonDemo() 
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
			
			var button1:Button = new Button({
				owner: panel,
				textSize: 11,
				skin: new ButtonSkin(),
				icon: new icons.Accept()
			});
			
			var button2:Button = new Button({
				owner: panel,
				textSize: 11,
				text: "I have text",
				skin: new ButtonSkin()
			});
			
			var button3:Button = new Button({
				owner: panel,
				textSize: 11,
				skin: new ButtonSkin(),
				icon: new icons.Accept(),
				text: "I have text and icon"
			});
			
			var button4:Button = new Button({
				owner: panel,
				textSize: 11,
				enable: false,
				text: "Disabled",
				skin: new ButtonSkin()
			});
			
			var button5:Button = new Button(null);
			button5.x = 20;
			button5.y = 180;
			button5.textSize = 11;
			button5.skin = new ButtonSkin();
			button5.icon = new icons.Accept();
			button5.text = "This is a button create by normal way";
			
			panel.addChild(button5);
		}
	}
}