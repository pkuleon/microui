package demo 
{
	import com.maxlab.microUI.controls.Button;
	import com.maxlab.microUI.controls.ToolBar;
	import com.maxlab.microUI.core.Control;
	import com.maxlab.microUI.core.ControlAlign;
	import com.maxlab.microUI.skins.simple.ButtonSkin;
	import com.maxlab.microUI.skins.simple.ToolBarSkin;
	import demo.assets.icons;
	
	/**
	* The demo shows what the ToolBar control can do.
	* 
	* @author BG5SBK
	*/
	public class ToolBarDemo extends Control
	{
		
		public function ToolBarDemo(config:* = null) 
		{
			super(config);
			
			var toolbar1:ToolBar = new ToolBar( { 
				x: 20,
				y: 20,
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
			
			var toolbar2:ToolBar = new ToolBar( { 
				x: 20,
				y: 70,
				height: 34,
				width: 600,
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
			
			var toolbar3:ToolBar = new ToolBar( { 
				x: 20,
				y: 120,
				height: 34,
				width: 600,
				owner: this,
				hAlign: ControlAlign.RIGHT,
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