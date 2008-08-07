package demo 
{
	import com.maxlab.microUI.controls.CheckBox;
	import com.maxlab.microUI.core.Control;
	import com.maxlab.microUI.skins.simple.CheckBoxSkin;
	
	/**
	* The demo shows what the CheckBox control can do.
	* 
	* @author BG5SBK
	*/
	public class CheckBoxDemo extends Control
	{
		public function CheckBoxDemo(config:*=null) 
		{
			super(config);
			
			var chechBox:CheckBox = new CheckBox( {
				x: 20,
				y: 20,
				owner: this,
				skin: new CheckBoxSkin(),
				text: "This is a CheckBox"
			});
		}
	}
}