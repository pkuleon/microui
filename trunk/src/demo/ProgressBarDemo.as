package demo 
{
	import com.maxlab.microUI.controls.ProgressBar;
	import com.maxlab.microUI.core.Control;
	import com.maxlab.microUI.skins.simple.ProgressBarSkin;
	
	/**
	* The demo shows what the ProgressBar control can do.
	* 
	* @author BG5SBK
	*/
	public class ProgressBarDemo extends Control
	{
		public function ProgressBarDemo(config:* = null) 
		{
			super(config);
			
			var progressBar1:ProgressBar = new ProgressBar( {
				x: 20,
				y: 20,
				width: 200,
				height: 10,
				owner: this,
				progress: 0.5,
				skin: new ProgressBarSkin()
			});
			
			var progressBar2:ProgressBar = new ProgressBar( {
				x: 20,
				y: 40,
				width: 200,
				height: 10,
				owner: this,
				progress: 0.5,
				indeterminate: true,
				skin: new ProgressBarSkin()
			});
		}
	}
}