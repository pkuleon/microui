package demo 
{
	import com.maxlab.microUI.controls.Application;
	import com.maxlab.microUI.controls.CheckBox;
	
	import com.maxlab.microUI.core.Control;
	import com.maxlab.microUI.core.ControlAlign;
	import com.maxlab.microUI.core.ControlLayout;
	
	import com.maxlab.microUI.skins.simple.CheckBoxSkin;
	
	/**
	* The demo shows what the CheckBox control can do.
	* 
	* @author BG5SBK
	*/
	public class CheckBoxDemo extends Application
	{
		public function CheckBoxDemo() 
		{
			super({
				vGap: 20,
				vAlign: ControlAlign.MIDDLE,
				layout: ControlLayout.VERTICAL
			});
			
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