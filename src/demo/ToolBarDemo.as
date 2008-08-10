package demo 
{
	import com.maxlab.microUI.controls.Application;
	import com.maxlab.microUI.controls.Button;
	import com.maxlab.microUI.controls.Panel;
	import com.maxlab.microUI.controls.ToolBar;
	import com.maxlab.microUI.controls.ToolBarGroup;
	
	import com.maxlab.microUI.core.Control;
	import com.maxlab.microUI.core.ControlAlign;
	import com.maxlab.microUI.core.ControlLayout;
	
	import com.maxlab.microUI.skins.simple.ButtonSkin;
	import com.maxlab.microUI.skins.simple.ToolBarSkin;
	
	import demo.assets.icons;
	
	/**
	* The demo shows what the ToolBar control can do.
	* 
	* @author BG5SBK
	*/
	public class ToolBarDemo extends Application
	{
		public function ToolBarDemo() 
		{
			super({
				vGap: 20,
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
			
			var toolbar1:ToolBar = new ToolBar({
				owner: panel,
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
			
			var toolbar2:ToolBar = new ToolBar({
				height: 34,
				width: 600,
				owner: panel,
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
			
			var toolbar3:ToolBar = new ToolBar({
				height: 34,
				width: 600,
				owner: panel,
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
			
			var toolbar4:ToolBarGroup = new ToolBarGroup({
				owner: panel,
				skin: new ToolBarSkin(),
				childs:[
					new ToolBar({
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
							})
						]
					}),
					new ToolBar({
						skin: new ToolBarSkin(),
						padding: [4, 4, 4, 4],
						childs:[
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
					})
				]
			});
			
			var toolbar5:ToolBarGroup = new ToolBarGroup({
				height: 34,
				width: 600,
				owner: panel,
				skin: new ToolBarSkin(),
				childs:[
					new ToolBar({
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
							})
						]
					}),
					new ToolBar({
						skin: new ToolBarSkin(),
						padding: [4, 4, 4, 4],
						childs:[
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
					})
				]
			});
		}
	}
}