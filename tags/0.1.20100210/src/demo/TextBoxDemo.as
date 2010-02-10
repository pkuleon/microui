package demo 
{
	import com.maxlab.microUI.controls.Application;
	import com.maxlab.microUI.controls.Button;
	import com.maxlab.microUI.controls.TextBox;
	
	import com.maxlab.microUI.core.ControlAlign;
	import com.maxlab.microUI.core.ControlLayout;
	
	import com.maxlab.microUI.skins.simple.ButtonSkin;
	import com.maxlab.microUI.skins.simple.TextBoxSkin;
	
	import demo.assets.icons;
	
	/**
	* The demo shows what the TextBox control can do.
	* 
	* @author BG5SBK
	*/
	public class TextBoxDemo extends Application
	{
		public function TextBoxDemo() 
		{
			super({
				vGap: 20,
				vAlign: ControlAlign.MIDDLE,
				layout: ControlLayout.VERTICAL
			});
			
			var textBox1:TextBox = new TextBox({
				owner: this,
				skin: new TextBoxSkin()
			});
			
			var textBox2:TextBox = new TextBox({
				owner: this,
				text: "default text",
				skin: new TextBoxSkin()
			});
			
			var textBox3:TextBox = new TextBox({
				owner: this,
				text: "I have icon",
				skin: new TextBoxSkin(),
				icon: new icons.Accept()
			});
			
			var textBox4:TextBox = new TextBox({
				owner: this,
				enable: false,
				text: "disable",
				skin: new TextBoxSkin()
			});
			
			var textBox5:TextBox = new TextBox({
				owner: this,
				readOnly: true,
				text: "read only",
				skin: new TextBoxSkin()
			});
			
			var textBox6:TextBox = new TextBox({
				owner: this,
				passwordMode: true,
				skin: new TextBoxSkin(),
				text: "This is password"
			});
		}
	}
}