package 
{
	import com.maxlab.microUI.controls.Button;
	import com.maxlab.microUI.controls.Label;
	import com.maxlab.microUI.core.Control;
	import com.maxlab.microUI.core.ControlAlign;
	import com.maxlab.microUI.core.ControlLayout;
	import com.maxlab.microUI.skins.simple.ButtonSkin;
	import com.maxlab.microUI.skins.simple.LabelSkin;

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
			
			var box1:Button = new Button( {
				owner:this,
				x: 20,
				y: 20,
				autoSize: true,
				paddingTop: 4,
				paddingLeft: 4,
				paddingRight: 4,
				paddingBottom: 4,
				childs:[
					new Button({
						autoSize: true,
						text: "button 1",
						skin: new ButtonSkin()
					}),
					new Button( {
						autoSize: true,
						text: "button 2",
						skin: new ButtonSkin()
					})
				],
				layout: ControlLayout.HORIZONTAL,
				horizontalAlign: ControlAlign.RIGHT,
				skin: new ButtonSkin()
			});
			
			var box2:Button = new Button( {
				owner:this,
				x: 20,
				y: 70,
				autoSize: true,
				paddingTop: 4,
				paddingLeft: 4,
				paddingRight: 4,
				paddingBottom: 4,
				childs:[
					new Button({
						autoSize: true,
						text: "button 3",
						skin: new ButtonSkin()
					}),
					new Button( {
						autoSize: true,
						text: "button 4",
						skin: new ButtonSkin()
					})
				],
				layout: ControlLayout.HORIZONTAL,
				horizontalAlign: ControlAlign.LEFT,
				skin: new ButtonSkin()
			});
			
			var box3:Button = new Button( {
				owner:this,
				x: 20,
				y: 120,
				autoSize: true,
				paddingTop: 4,
				paddingLeft: 4,
				paddingRight: 4,
				paddingBottom: 4,
				childs:[
					new Button({
						autoSize: true,
						text: "button 5",
						skin: new ButtonSkin()
					}),
					new Button( {
						autoSize: true,
						text: "button 6",
						skin: new ButtonSkin()
					})
				],
				layout: ControlLayout.HORIZONTAL,
				horizontalAlign: ControlAlign.CENTER,
				skin: new ButtonSkin()
			});
			
			var box4:Button = new Button( {
				owner:this,
				x: 20,
				y: 170,
				autoSize: true,
				paddingTop: 4,
				paddingLeft: 4,
				paddingRight: 4,
				paddingBottom: 4,
				childs:[
					new Button({
						autoSize: true,
						text: "button 7",
						skin: new ButtonSkin()
					}),
					new Button( {
						autoSize: true,
						text: "button 8",
						skin: new ButtonSkin()
					}),
					new Button( {
						autoSize: true,
						text: "button 9",
						skin: new ButtonSkin()
					})
				],
				layout: ControlLayout.HORIZONTAL,
				horizontalAlign: ControlAlign.CENTER,
				skin: new ButtonSkin()
			});
		}
	}
}