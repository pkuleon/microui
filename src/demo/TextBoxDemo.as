package demo 
{
	import com.maxlab.microUI.controls.Button;
	import com.maxlab.microUI.controls.TextBox;
	import com.maxlab.microUI.core.Control;
	import com.maxlab.microUI.skins.simple.ButtonSkin;
	import com.maxlab.microUI.skins.simple.TextBoxSkin;
	import demo.assets.icons;
	
	/**
	* The demo shows what the TextBox control can do.
	* 
	* @author BG5SBK
	*/
	public class TextBoxDemo extends Control
	{
		public function TextBoxDemo(config:* = null) 
		{
			super(config);
			
			var textBox1:TextBox = new TextBox( {
				x: 20,
				y: 20,
				owner: this,
				skin: new TextBoxSkin()
			});
			
			var textBox2:TextBox = new TextBox( {
				x: 20,
				y: 70,
				owner: this,
				text: "default text",
				skin: new TextBoxSkin()
			});
			
			var textBox3:TextBox = new TextBox( {
				x: 20,
				y: 120,
				owner: this,
				text: "I have icon",
				skin: new TextBoxSkin(),
				icon: new icons.Accept()
			});
			
			var textBox4:TextBox = new TextBox( {
				x: 20,
				y: 170,
				owner: this,
				enable: false,
				text: "disable",
				skin: new TextBoxSkin()
			});
			
			var textBox5:TextBox = new TextBox( {
				x: 20,
				y: 220,
				owner: this,
				readOnly: true,
				text: "read only",
				skin: new TextBoxSkin()
			});
			
			var textBox6:TextBox = new TextBox( {
				x: 20,
				y: 270,
				owner: this,
				passwordMode: true,
				skin: new TextBoxSkin(),
				text: "This is password"
			});
		}
	}
}