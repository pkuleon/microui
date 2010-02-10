package demo 
{
	import com.maxlab.microUI.controls.Application;
	import com.maxlab.microUI.controls.Panel;
	import com.maxlab.microUI.controls.ProgressBar;
	import com.maxlab.microUI.skins.simple.ToolBarSkin;
	
	import com.maxlab.microUI.core.Control;
	import com.maxlab.microUI.core.ControlAlign;
	import com.maxlab.microUI.core.ControlLayout;
	
	import com.maxlab.microUI.skins.simple.ProgressBarSkin;
	
	/**
	* The demo shows what the ProgressBar control can do.
	* 
	* @author BG5SBK
	*/
	public class ProgressBarDemo extends Application
	{
		public function ProgressBarDemo() 
		{
			super({
				vGap: 20,
				vAlign: ControlAlign.MIDDLE,
				layout: ControlLayout.VERTICAL
			});
			
			var panel:Panel = new Panel( {
				owner: this,
				vGap: 20,
				skin: new ToolBarSkin(),
				autoSize: true,
				padding: [10, 10, 10, 10],
				vAlign: ControlAlign.MIDDLE,
				layout: ControlLayout.VERTICAL
			} );
			
			var progressBar1:ProgressBar = new ProgressBar({
				width: 200,
				height: 10,
				owner: panel,
				progress: 0.5,
				skin: new ProgressBarSkin()
			});
			
			var progressBar2:ProgressBar = new ProgressBar({
				width: 200,
				height: 10,
				owner: panel,
				progress: 0.5,
				indeterminate: true,
				skin: new ProgressBarSkin()
			});
		}
	}
}