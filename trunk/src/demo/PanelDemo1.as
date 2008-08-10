﻿package demo 
{
	import com.maxlab.microUI.controls.Application;
	import com.maxlab.microUI.controls.Button;
	import com.maxlab.microUI.controls.Label;
	import com.maxlab.microUI.controls.Panel;
	import com.maxlab.microUI.controls.ToolBar;
	import com.maxlab.microUI.controls.VSplit;
	
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
			super({
				vGap: 20,
				vAlign: ControlAlign.TOP,
				layout: ControlLayout.VERTICAL
			});
			
			var bar:ToolBar = new ToolBar({
				pWidth: 1,
				owner: this,
				padding: [4, 4, 4, 4],
				skin: new ToolBarSkin(),
				childs:[
					new Button({
						textSize: 11,
						text: "Auto Size",
						skin: new ButtonSkin(),
						onClick: function():void {
							if (box1.autoSize == false)
							{
								box1.percentWidth = 0;
								box2.percentWidth = 0;
								box3.percentWidth = 0;
								box4.percentWidth = 0;
								box5.percentWidth = 0;
								
								box1.autoSize = true;
								box2.autoSize = true;
								box3.autoSize = true;
								box4.autoSize = true;
								box5.autoSize = true;
								
								box2.y -= 32;
								box3.y -= 64;
								box4.y -= 96;
								box5.y -= 128;
							}
						}
					}),
					new Button({
						textSize: 11,
						text: "100% x 80px",
						skin: new ButtonSkin(),
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
								
								box1.height = 80;
								box2.height = 80;
								box3.height = 80;
								box4.height = 80;
								box5.height = 80;
								
								box2.y += 32;
								box3.y += 64;
								box4.y += 96;
								box5.y += 128;
							}
						}
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
						text: "Left",
						skin: new ButtonSkin(),
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
						skin: new ButtonSkin(),
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
						skin: new ButtonSkin(),
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
						skin: new VSplitSkin()
					}),
					new Button({
						textSize: 11,
						text: "Top",
						skin: new ButtonSkin(),
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
						skin: new ButtonSkin(),
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
						skin: new ButtonSkin(),
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
				vGap:20,
				pWidth: 1,
				owner: this,
				hAlign: ControlAlign.LEFT,
				layout: ControlLayout.VERTICAL
			});
			
			var box1:Panel = new Panel({
				y: 90,
				hGap: 10,
				owner: panel,
				autoSize: true,
				skin: new PanelSkin(),
				padding: [10, 10, 10, 10],
				layout: ControlLayout.HORIZONTAL,
				childs:[
					new Button({
						textSize: 11,
						text: "Button 01",
						skin: new ButtonSkin()
					})
				]
			});
			
			var box2:Panel = new Panel({
				y: 150,
				hGap: 10,
				owner: panel,
				autoSize: true,
				skin: new PanelSkin(),
				padding: [10, 10, 10, 10],
				layout: ControlLayout.HORIZONTAL,
				childs:[
					new Button({
						textSize: 11,
						text: "Button 02",
						skin: new ButtonSkin()
					}),
					new Button({
						textSize: 11,
						text: "Button 03",
						skin: new ButtonSkin()
					})
				]
			});
			
			var box3:Panel = new Panel({
				y: 210,
				hGap: 10,
				owner: panel,
				autoSize: true,
				skin: new PanelSkin(),
				padding: [10, 10, 10, 10],
				layout: ControlLayout.HORIZONTAL,
				childs:[
					new Button({
						textSize: 11,
						text: "Button 04",
						skin: new ButtonSkin()
					}),
					new Button({
						textSize: 11,
						text: "Button 05",
						skin: new ButtonSkin()
					}),
					new Button({
						textSize: 11,
						text: "Button 06",
						skin: new ButtonSkin()
					})
				]
			});
			
			var box4:Panel = new Panel({
				y: 270,
				hGap: 10,
				owner: panel,
				autoSize: true,
				skin: new PanelSkin(),
				padding: [10, 10, 10, 10],
				layout: ControlLayout.HORIZONTAL,
				childs:[
					new Button({
						textSize: 11,
						text: "Button 07",
						skin: new ButtonSkin()
					}),
					new Button({
						textSize: 11,
						text: "Button 08",
						skin: new ButtonSkin()
					}),
					new Button({
						textSize: 11,
						text: "Button 09",
						skin: new ButtonSkin()
					}),
					new Button({
						textSize: 11,
						text: "Button 10",
						skin: new ButtonSkin()
					})
				]
			});
			
			var box5:Panel = new Panel({
				y: 330,
				hGap: 10,
				owner: panel,
				autoSize: true,
				skin: new PanelSkin(),
				padding: [10, 10, 10, 10],
				layout: ControlLayout.HORIZONTAL,
				childs:[
					new Button({
						textSize: 11,
						text: "Button 11",
						skin: new ButtonSkin()
					}),
					new Button({
						textSize: 11,
						text: "Button 12",
						skin: new ButtonSkin()
					}),
					new Button({
						textSize: 11,
						text: "Button 13",
						skin: new ButtonSkin()
					}),
					new Button({
						textSize: 11,
						text: "Button 14",
						skin: new ButtonSkin()
					}),
					new Button({
						textSize: 11,
						text: "Button 15",
						skin: new ButtonSkin()
					})
				]
			});
		}
	}
}