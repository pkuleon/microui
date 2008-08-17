package demo 
{
	import com.maxlab.microUI.controls.Application;
	import com.maxlab.microUI.controls.Button;
	import com.maxlab.microUI.controls.Label;
	import com.maxlab.microUI.controls.Panel;
	import com.maxlab.microUI.controls.ToolBar;
	import com.maxlab.microUI.controls.VSplit;
	import demo.assets.ISkinProvider;
	import demo.assets.PhotoshopSkinProvider;
	import demo.assets.SimpleSkinProvider;
	
	import com.maxlab.microUI.core.Control;
	import com.maxlab.microUI.core.ControlAlign;
	import com.maxlab.microUI.core.ControlLayout;
	
	import com.maxlab.microUI.skins.simple.ButtonSkin;
	import com.maxlab.microUI.skins.simple.PanelSkin;
	import com.maxlab.microUI.skins.simple.ToolBarSkin;
	import com.maxlab.microUI.skins.simple.VSplitSkin;
	
	import demo.assets.icons;
	
	/**
	* The demo shows what the Panel control's horizontal layout can do.
	* 
	* @author BG5SBK
	*/
	public class PanelDemo1 extends Application
	{
		
		public function PanelDemo1() 
		{
			var skinProvider:ISkinProvider = new PhotoshopSkinProvider();
			
			super({
				vGap: 10,
				vAlign: ControlAlign.TOP,
				layout: ControlLayout.VERTICAL,
				skin: skinProvider.applicationSkin
			});
			
			var bar:ToolBar = new ToolBar({
				pWidth: 1,
				owner: this,
				padding: [4, 4, 4, 4],
				skin: skinProvider.toolbarSkin,
				childs:[
					new Button({
						textSize: 11,
						text: "Auto Size",
						skin: skinProvider.buttonSkin,
						icon: new icons.ArrowIn(),
						onClick: function():void {
							if (box1.autoSize == false)
							{
								box1.percentWidth = 0;
								box2.percentWidth = 0;
								box3.percentWidth = 0;
								box4.percentWidth = 0;
								box5.percentWidth = 0;
								
								box1.percentHeight = 0;
								box2.percentHeight = 0;
								box3.percentHeight = 0;
								box4.percentHeight = 0;
								box5.percentHeight = 0;
								
								box1.autoSize = true;
								box2.autoSize = true;
								box3.autoSize = true;
								box4.autoSize = true;
								box5.autoSize = true;
							}
						}
					}),
					new Button({
						textSize: 11,
						text: "Fix Stage",
						skin: skinProvider.buttonSkin,
						icon: new icons.ArrowOut(),
						onClick: function():void {
							if (box1.autoSize)
							{
								box1.autoSize = false;
								box2.autoSize = false;
								box3.autoSize = false;
								box4.autoSize = false;
								box5.autoSize = false;
								
								box1.percentWidth = 1;
								box2.percentWidth = 1;
								box3.percentWidth = 1;
								box4.percentWidth = 1;
								box5.percentWidth = 1;
								
								box1.percentHeight = 1;
								box2.percentHeight = 1;
								box3.percentHeight = 1;
								box4.percentHeight = 1;
								box5.percentHeight = 1;
							}
						}
					}),
					new VSplit({
						y: 90,
						x: 110,
						height: 20,
						owner: this,
						skin: skinProvider.vSplitSkin
					}),
					new Button({
						textSize: 11,
						text: "Left",
						skin: skinProvider.buttonSkin,
						icon: new icons.AlignLeft(),
						onClick: function():void {
							box1.horizontalAlign = ControlAlign.LEFT;
							box2.horizontalAlign = ControlAlign.LEFT;
							box3.horizontalAlign = ControlAlign.LEFT;
							box4.horizontalAlign = ControlAlign.LEFT;
							box5.horizontalAlign = ControlAlign.LEFT;
						}
					}),
					new Button({
						textSize: 11,
						text: "Center",
						skin: skinProvider.buttonSkin,
						icon: new icons.AlignCenter(),
						onClick: function():void {
							box1.horizontalAlign = ControlAlign.CENTER;
							box2.horizontalAlign = ControlAlign.CENTER;
							box3.horizontalAlign = ControlAlign.CENTER;
							box4.horizontalAlign = ControlAlign.CENTER;
							box5.horizontalAlign = ControlAlign.CENTER;
						}
					}),
					new Button({
						textSize: 11,
						text: "Right",
						skin: skinProvider.buttonSkin,
						icon: new icons.AlignRight(),
						onClick: function():void {
							box1.horizontalAlign = ControlAlign.RIGHT;
							box2.horizontalAlign = ControlAlign.RIGHT;
							box3.horizontalAlign = ControlAlign.RIGHT;
							box4.horizontalAlign = ControlAlign.RIGHT;
							box5.horizontalAlign = ControlAlign.RIGHT;
						}
					}),
					new VSplit({
						y: 90,
						x: 110,
						height: 20,
						owner: this,
						skin: skinProvider.vSplitSkin
					}),
					new Button({
						textSize: 11,
						text: "Top",
						skin: skinProvider.buttonSkin,
						icon: new icons.AlignTop(),
						onClick: function():void {
							box1.verticalAlign = ControlAlign.TOP;
							box2.verticalAlign = ControlAlign.TOP;
							box3.verticalAlign = ControlAlign.TOP;
							box4.verticalAlign = ControlAlign.TOP;
							box5.verticalAlign = ControlAlign.TOP;
						}
					}),
					new Button({
						textSize: 11,
						text: "Middle",
						skin: skinProvider.buttonSkin,
						icon: new icons.AlignMiddle(),
						onClick: function():void {
							box1.verticalAlign = ControlAlign.MIDDLE;
							box2.verticalAlign = ControlAlign.MIDDLE;
							box3.verticalAlign = ControlAlign.MIDDLE;
							box4.verticalAlign = ControlAlign.MIDDLE;
							box5.verticalAlign = ControlAlign.MIDDLE;
						}
					}),
					new Button({
						textSize: 11,
						text: "Bottom",
						skin: skinProvider.buttonSkin,
						icon: new icons.AlignBottom(),
						onClick: function():void {
							box1.verticalAlign = ControlAlign.BOTTOM;
							box2.verticalAlign = ControlAlign.BOTTOM;
							box3.verticalAlign = ControlAlign.BOTTOM;
							box4.verticalAlign = ControlAlign.BOTTOM;
							box5.verticalAlign = ControlAlign.BOTTOM;
						}
					})
				]
			});
			
			var panel:Panel = new Panel({
				vGap:10,
				pWidth: 1,
				pHeight: 1,
				owner: this,
				hAlign: ControlAlign.LEFT,
				layout: ControlLayout.VERTICAL
			});
			
			var box1:Panel = new Panel({
				y: 90,
				hGap: 10,
				owner: panel,
				autoSize: true,
				skin: skinProvider.panelSkin,
				padding: [10, 10, 10, 10],
				layout: ControlLayout.HORIZONTAL,
				childs:[
					new Button({
						textSize: 11,
						text: "Button 01",
						padding: [6, 6, 6, 6],
						skin: skinProvider.buttonSkin
					})
				]
			});
			
			var box2:Panel = new Panel({
				y: 150,
				hGap: 10,
				owner: panel,
				autoSize: true,
				skin: skinProvider.panelSkin,
				padding: [10, 10, 10, 10],
				layout: ControlLayout.HORIZONTAL,
				childs:[
					new Button({
						textSize: 11,
						text: "Button 02",
						padding: [6, 6, 6, 6],
						skin: skinProvider.buttonSkin
					}),
					new Button({
						textSize: 11,
						text: "Button 03",
						padding: [6, 6, 6, 6],
						skin: skinProvider.buttonSkin
					})
				]
			});
			
			var box3:Panel = new Panel({
				y: 210,
				hGap: 10,
				owner: panel,
				autoSize: true,
				skin: skinProvider.panelSkin,
				padding: [10, 10, 10, 10],
				layout: ControlLayout.HORIZONTAL,
				childs:[
					new Button({
						textSize: 11,
						text: "Button 04",
						padding: [6, 6, 6, 6],
						skin: skinProvider.buttonSkin
					}),
					new Button({
						textSize: 11,
						text: "Button 05",
						padding: [6, 6, 6, 6],
						skin: skinProvider.buttonSkin
					}),
					new Button({
						textSize: 11,
						text: "Button 06",
						padding: [6, 6, 6, 6],
						skin: skinProvider.buttonSkin
					})
				]
			});
			
			var box4:Panel = new Panel({
				y: 270,
				hGap: 10,
				owner: panel,
				autoSize: true,
				skin: skinProvider.panelSkin,
				padding: [10, 10, 10, 10],
				layout: ControlLayout.HORIZONTAL,
				childs:[
					new Button({
						textSize: 11,
						text: "Button 07",
						padding: [6, 6, 6, 6],
						skin: skinProvider.buttonSkin
					}),
					new Button({
						textSize: 11,
						text: "Button 08",
						padding: [6, 6, 6, 6],
						skin: skinProvider.buttonSkin
					}),
					new Button({
						textSize: 11,
						text: "Button 09",
						padding: [6, 6, 6, 6],
						skin: skinProvider.buttonSkin
					}),
					new Button({
						textSize: 11,
						text: "Button 10",
						padding: [6, 6, 6, 6],
						skin: skinProvider.buttonSkin
					})
				]
			});
			
			var box5:Panel = new Panel({
				y: 330,
				hGap: 10,
				owner: panel,
				autoSize: true,
				skin: skinProvider.panelSkin,
				padding: [10, 10, 10, 10],
				layout: ControlLayout.HORIZONTAL,
				childs:[
					new Button({
						textSize: 11,
						text: "Button 11",
						padding: [6, 6, 6, 6],
						skin: skinProvider.buttonSkin
					}),
					new Button({
						textSize: 11,
						text: "Button 12",
						padding: [6, 6, 6, 6],
						skin: skinProvider.buttonSkin
					}),
					new Button({
						textSize: 11,
						text: "Button 13",
						padding: [6, 6, 6, 6],
						skin: skinProvider.buttonSkin
					}),
					new Button({
						textSize: 11,
						text: "Button 14",
						padding: [6, 6, 6, 6],
						skin: skinProvider.buttonSkin
					}),
					new Button({
						textSize: 11,
						text: "Button 15",
						padding: [6, 6, 6, 6],
						skin: skinProvider.buttonSkin
					})
				]
			});
		}
	}
}