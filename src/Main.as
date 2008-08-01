package 
{
	import com.maxlab.microUI.controls.Button;
	import com.maxlab.microUI.controls.Label;
	import com.maxlab.microUI.controls.Panel;
	import com.maxlab.microUI.core.Control;
	import com.maxlab.microUI.core.ControlAlign;
	import com.maxlab.microUI.core.ControlLayout;
	import com.maxlab.microUI.skins.simple.ButtonSkin;
	import com.maxlab.microUI.skins.simple.LabelSkin;
	import com.maxlab.microUI.skins.simple.PanelSkin;

	public class Main extends Control
	{	
		public function Main(config:*=null)
		{
			super(config);
			
			//var button:Button = new Button({
				//x: 20,
				//y: 20,
				//width: 120,
				//height: 30,
				//owner: this,
				//paddingTop:4,
				//paddingLeft:4,
				//paddingRight:4,
				//paddingBottom:4,
				//text: "Say hello",
				//skin: new ButtonSkin(),
				//onClick: function():void {
					//trace("hello!");
				//}
			//});
			//
			//var label:Label = new Label( { 
				//x: 20,
				//y: 50,
				//owner: this,
				//text: "你好！",
				//skin: new LabelSkin()
			//});
			
			var box1:Panel = new Panel({
				x: 20,
				y: 20,
				hGap:10,
				owner:this,
				autoSize: true,
				skin: new PanelSkin(),
				padding: [10, 10, 10, 10],
				hAlign: ControlAlign.RIGHT,
				layout: ControlLayout.HORIZONTAL,
				childs: [
					new Button({
						autoSize: true,
						text: "button 1",
						padding: [4, 4, 4, 4],
						skin: new ButtonSkin()
					}),
					new Button({
						autoSize: true,
						text: "button 2",
						padding: [4, 4, 4, 4],
						skin: new ButtonSkin()
					})
				]
			});
			
			var box2:Panel = new Panel({
				x: 20,
				y: 90,
				hGap:10,
				owner:this,
				autoSize: true,
				skin: new PanelSkin(),
				padding: [10, 10, 10, 10],
				hAlign: ControlAlign.LEFT,
				layout: ControlLayout.HORIZONTAL,
				childs:[
					new Button({
						autoSize: true,
						text: "button 3",
						padding: [4, 4, 4, 4],
						skin: new ButtonSkin()
					}),
					new Button({
						autoSize: true,
						text: "button 4",
						padding: [4, 4, 4, 4],
						skin: new ButtonSkin()
					})
				]
			});
			
			var box3:Panel = new Panel({
				x: 20,
				y: 160,
				hGap:10,
				owner:this,
				autoSize: true,
				skin: new PanelSkin(),
				padding: [10, 10, 10, 10],
				hAlign: ControlAlign.CENTER,
				layout: ControlLayout.HORIZONTAL,
				childs:[
					new Button({
						autoSize: true,
						text: "button 5",
						padding: [4, 4, 4, 4],
						skin: new ButtonSkin()
					}),
					new Button({
						autoSize: true,
						text: "button 6",
						padding: [4, 4, 4, 4],
						skin: new ButtonSkin()
					})
				]
			});
			
			var box4:Panel = new Panel({
				x: 20,
				y: 230,
				hGap:10,
				owner: this,
				autoSize: true,
				skin: new PanelSkin(),
				padding: [10, 10, 10, 10],
				hAlign: ControlAlign.CENTER,
				layout: ControlLayout.HORIZONTAL,
				childs:[
					new Button({
						autoSize: true,
						text: "button 7",
						padding: [4, 4, 4, 4],
						skin: new ButtonSkin()
					}),
					new Button({
						autoSize: true,
						text: "button 8",
						padding: [4, 4, 4, 4],
						skin: new ButtonSkin()
					}),
					new Button({
						autoSize: true,
						text: "button 9",
						padding: [4, 4, 4, 4],
						skin: new ButtonSkin()
					})
				]
			});
			
			var box5:Panel = new Panel({
				x: 20,
				y: 300,
				hGap:10,
				owner: this,
				autoSize: true,
				skin: new PanelSkin(),
				padding: [10, 10, 10, 10],
				hAlign: ControlAlign.CENTER,
				layout: ControlLayout.HORIZONTAL,
				childs:[
					new Button({
						autoSize: true,
						text: "button 10",
						padding: [4, 4, 4, 4],
						skin: new ButtonSkin()
					}),
					new Button({
						autoSize: true,
						text: "button 11",
						padding: [4, 4, 4, 4],
						skin: new ButtonSkin()
					}),
					new Button({
						autoSize: true,
						text: "button 12",
						padding: [4, 4, 4, 4],
						skin: new ButtonSkin()
					}),
					new Button({
						autoSize: true,
						text: "button 14",
						padding: [4, 4, 4, 4],
						skin: new ButtonSkin()
					})
				]
			});
			
			var box6:Panel = new Panel({
				x: 20,
				y: 370,
				id: "box1",
				owner:this,
				autoSize: true,
				skin: new PanelSkin(),
				hAlign: ControlAlign.LEFT,
				layout: ControlLayout.HORIZONTAL,
				childs: [
					new Label({
						id: "label1",
						skin: new LabelSkin(),
						text: "Horizontal layout and Right align:"
					}), 
					new Panel( {
						id: "panel",
						hGap:10,
						autoSize: true,
						skin: new PanelSkin(),
						hAlign: ControlAlign.RIGHT,
						layout: ControlLayout.HORIZONTAL,
						childs: [
							new Button( {
								id: "button1",
								autoSize: true,
								text: "button 1",
								padding: [4, 4, 4, 4],
								skin: new ButtonSkin()
							}),
							new Button( {
								id: "button2",
								autoSize: true,
								text: "button 2",
								padding: [4, 4, 4, 4],
								skin: new ButtonSkin()
							})
						]
					})
				]
			});
		}
	}
}