package demo 
{
	import com.maxlab.microUI.controls.Application;
	import com.maxlab.microUI.controls.Button;
	import com.maxlab.microUI.controls.ToolBar;
	
	import com.maxlab.microUI.skins.simple.ButtonSkin;
	import com.maxlab.microUI.skins.simple.ToolBarSkin;
	
	import com.maxlab.microUI.controls.HSplit;
	import com.maxlab.microUI.controls.VSplit;
	
	import com.maxlab.microUI.core.Control;
	import com.maxlab.microUI.core.ControlAlign;
	import com.maxlab.microUI.core.ControlLayout;
	
	import com.maxlab.microUI.skins.simple.HSplitSkin;
	import com.maxlab.microUI.skins.simple.VSplitSkin;
	
	import demo.assets.icons;
	
	/**
	* The demo shows what the HSplit and VSplit control can do.
	* 
	* @author BG5SBK
	*/
	public class SplitDemo extends Application
	{
		public function SplitDemo() 
		{
			super({
				vGap: 20,
				vAlign: ControlAlign.MIDDLE,
				layout: ControlLayout.VERTICAL
			});
			
			var hSplit:HSplit = new HSplit({
				width: 200,
				owner: this,
				skin: new HSplitSkin()
			});
			
			var vSplit:VSplit = new VSplit({
				height: 200,
				owner: this,
				skin: new VSplitSkin()
			});
			
			var toolbar1:ToolBar = new ToolBar({
				owner: this,
				skin: new ToolBarSkin(),
				padding: [4, 4, 4, 4],
				childs:[
					new Button({
						textSize: 11,
						text: "Left",
						skin: new ButtonSkin(),
						icon: new icons.AlignLeft()
					}),
					new Button({
						textSize: 11,
						text: "Center",
						skin: new ButtonSkin(),
						icon: new icons.AlignCenter()
					}),
					new Button({
						textSize: 11,
						text: "Right",
						skin: new ButtonSkin(),
						icon: new icons.AlignRight()
					}),
					new VSplit({
						y: 90,
						x: 110,
						height: 20,
						owner: this,
						skin: new VSplitSkin()
					}),
					new Button({
						textSize: 11,
						text: "Top",
						skin: new ButtonSkin(),
						icon: new icons.AlignTop()
					}),
					new Button({
						textSize: 11,
						text: "Middle",
						skin: new ButtonSkin(),
						icon: new icons.AlignMiddle()
					}),
					new Button({
						textSize: 11,
						text: "Bottom",
						skin: new ButtonSkin(),
						icon: new icons.AlignBottom()
					})
				]
			});
		}
	}
}