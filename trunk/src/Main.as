package 
{
	import com.maxlab.microUI.controls.Button;
	import com.maxlab.microUI.controls.Label;
	import com.maxlab.microUI.core.Control;
	import com.maxlab.microUI.skins.simple.ButtonSkin;
	import com.maxlab.microUI.skins.simple.LabelSkin;

	public class Main extends Control
	{	
		public function Main(config:*=null)
		{
			super(config);
			
			var button:Button = new Button({
				x: 20,
				y: 20,
				width: 120,
				height: 30,
				owner: this,
				skin: new ButtonSkin(),
				onClick: function():void {
					trace("hello!");
				}
			});
			
			var label:Label = new Label( { 
				x: 20,
				y: 50,
				owner: this,
				text: "你好！",
				skin: new LabelSkin()
			});
		}
	}
}