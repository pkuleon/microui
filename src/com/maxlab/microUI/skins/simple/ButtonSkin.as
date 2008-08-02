package com.maxlab.microUI.skins.simple 
{
	import com.maxlab.microUI.controls.Button;
	import com.maxlab.microUI.skins.Skin;
	import flash.display.CapsStyle;
	import flash.display.JointStyle;
	import flash.display.Shape;
	import flash.utils.getQualifiedClassName;
	
	/**
	* The Button control's skin. 
	* 
	* @author BG5SBK
	*/
	public class ButtonSkin extends LabelSkin
	{
		private var m_border:Shape;
		private var m_background:Shape;
		
		private var m_normalTextColor:Number;
		
		private function get ownerInToolBar():Boolean
		{
			return owner.owner != null && getQualifiedClassName(owner) == "com.maxlab.microUI.controls::ToolBar";
		}
		
		override public function paint(invalidateItems:Array):void 
		{
			trace(invalidateItems);
			super.paint(invalidateItems);
			
			if (invalidateItems.indexOf("initialize") >= 0)
			{
				m_background = new Shape();
				m_border = new Shape();
				
				addChild(m_background);
				addChild(m_border);
			}
			
			if(invalidateItems.indexOf("enable") >=  0)
			{
				if (owner.enable)
				{
					textField.textColor = 0x000000;
					paintNormalMode();
				}
				else
					paintDisableMode();
			}
			else if(invalidateItems.indexOf("size") >= 0)
			{
				if (owner.enable)
					paintNormalMode();
				else
					paintDisableMode();
			}
			
			if (owner.enable)
			{
				if (invalidateItems.indexOf("mouseInFlag") >= 0
				|| invalidateItems.indexOf("mouseDownFlag") >= 0)
				{
					if (Button(owner).mouseDownFlag)
						paintMouseDownMode();
					else if (Button(owner).mouseInFlag)
						paintMouseOnMode();
					else
						paintNormalMode();
				}
			}
		}
		
		private function paintBackground(color:Number=0xE8E8E8):void
		{
			m_background.graphics.beginFill(color);
			m_background.graphics.drawRect(0, 0, owner.width - 1, owner.height - 1);
			m_background.graphics.endFill();
		}
		
		private function paintNormalBorder():void
		{
			m_border.graphics.clear();
			
			m_border.graphics.lineStyle(1, 0x808080, 1, false, "normal", CapsStyle.NONE, JointStyle.MITER);
			m_border.graphics.drawRect(0, 0, owner.width - 1, owner.height - 1);
				
			m_border.graphics.lineStyle(1, 0xFFFFFF, 1, false, "normal", CapsStyle.SQUARE, JointStyle.MITER);
			m_border.graphics.moveTo(owner.width - 2, 1);
			m_border.graphics.lineTo(1, 1);
			m_border.graphics.lineTo(1, owner.height - 2);
				
			m_border.graphics.lineStyle(1, 0xCCCCCC, 1, false, "normal", CapsStyle.SQUARE, JointStyle.MITER);
			m_border.graphics.moveTo(owner.width - 2, 2);
			m_border.graphics.lineTo(owner.width - 2, owner.height - 2);
			m_border.graphics.lineTo(2, owner.height - 2);
		}
		
		private function paintDisableMode():void
		{
			paintBackground();
			
			m_border.graphics.clear();
			
			m_border.graphics.lineStyle(1, 0xCCCCCC, 1, false, "normal", CapsStyle.NONE, JointStyle.MITER);
			m_border.graphics.drawRect(0, 0, owner.width - 1, owner.height - 1);
			
			textField.textColor = 0xCCCCCC;
		}
		
		private function paintNormalMode():void
		{
			paintBackground();
			paintNormalBorder();
		}
		
		private function paintMouseOnMode():void
		{
			paintBackground(0xF0F0F0);
			paintNormalBorder();
		}
		
		private function paintMouseDownMode():void
		{
			paintBackground();
				
			m_border.graphics.clear();
				
			m_border.graphics.lineStyle(1, 0x808080, 1, false, "normal", CapsStyle.NONE, JointStyle.MITER);
			m_border.graphics.drawRect(0, 0, owner.width - 1, owner.height - 1);
			
			m_border.graphics.lineStyle(1, 0xCCCCCC, 1, false, "normal", CapsStyle.SQUARE, JointStyle.MITER);
			m_border.graphics.moveTo(owner.width - 2, 1);
			m_border.graphics.lineTo(1, 1);
			m_border.graphics.lineTo(1, owner.height - 2);
				
			m_border.graphics.lineStyle(1, 0xFFFFFF, 1, false, "normal", CapsStyle.SQUARE, JointStyle.MITER);
			m_border.graphics.moveTo(owner.width - 2, 2);
			m_border.graphics.lineTo(owner.width - 2, owner.height - 2);
			m_border.graphics.lineTo(2, owner.height - 2);
		}
	}
}