package com.maxlab.microUI.skins.simple 
{
	import com.maxlab.microUI.controls.CheckBox;
	import com.maxlab.microUI.skins.Skin;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.CapsStyle;
	import flash.display.JointStyle;
	
	/**
	* The CheckBox control's skin
	* 
	* @author BG5SBK
	*/
	public class CheckBoxSkin extends LabelSkin
	{
		private var m_checkBox:Sprite;
		private var m_fill:Shape;
		
		override public function initialize():void 
		{
			super.initialize();
			
			m_checkBox = new Sprite();
			CheckBox(owner).icon = m_checkBox;
			
			m_fill = new Shape();
			m_fill.visible = CheckBox(owner).value;
			m_checkBox.addChild(m_fill);
			
			redraw();
		}
		
		override public function paint(invalidateItems:Array):void 
		{
			super.paint(invalidateItems);
			
			if (invalidateItems.indexOf("value") >= 0)
				m_fill.visible = CheckBox(owner).value;
		}
		
		private function redraw():void
		{
			SimpleSkinHelper.paintFocusBackground(m_checkBox, 12, 12);
			m_checkBox.graphics.lineStyle(1, 0x808080, 1, false, "normal", CapsStyle.NONE, JointStyle.MITER);
			m_checkBox.graphics.moveTo(0, 0);
			m_checkBox.graphics.drawRect(0, 0, 11, 11);
				
			m_fill.graphics.lineStyle(2, 0x808080, 1, false, "normal", CapsStyle.NONE, JointStyle.MITER);
			m_fill.graphics.moveTo(2, 5);
			m_fill.graphics.lineTo(5, 8);
			m_fill.graphics.lineTo(10, 2);
		}
	}
}