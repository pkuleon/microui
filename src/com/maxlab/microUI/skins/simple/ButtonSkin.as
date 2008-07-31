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
		private var m_background:Shape;
		private var m_border:Shape;
		
		private function get ownerInToolBar():Boolean
		{
			return owner.owner != null && getQualifiedClassName(owner) == "com.maxlab.microUI.controls::ToolBar";
		}
		
		override public function paint(invalidateItems:Array):void 
		{
			if (invalidateItems.indexOf("initialize") >= 0)
			{
				m_background = new Shape();
				m_border = new Shape();
				
				addChild(m_background);
				addChild(m_border);
				
				paintBackground();
				paintNormalMode();
			}
			else if (invalidateItems.indexOf("width") >= 0
			|| invalidateItems.indexOf("height") >= 0
			|| invalidateItems.indexOf("mouseInFlag") >= 0
			|| invalidateItems.indexOf("mouseDownFlag") >= 0)
			{
				if (Button(owner).mouseDownFlag)
					paintMouseDownMode();
				else if (Button(owner).mouseInFlag && ownerInToolBar)
					paintMouseOnMode();
				else
					paintNormalMode();
			}
			
			super.paint(invalidateItems);
		}
		
		private function paintBackground(color:Number=0xFFFFFF):void
		{
			m_background.graphics.beginFill(color);
			m_background.graphics.drawRect(0, 0, owner.width - 1, owner.height - 1);
			m_background.graphics.endFill();
		}
		
		private function paintNormalMode():void
		{
			if(ownerInToolBar)
				paintBackground();
			
			m_border.graphics.clear();
			
			if(ownerInToolBar == false)
			{
				m_border.graphics.lineStyle(1, 0x999999, 1, false, "normal", CapsStyle.NONE, JointStyle.MITER);
				m_border.graphics.drawRect(0, 0, owner.width - 1, owner.height - 1);
			}
		}
		
		private function paintMouseOnMode():void
		{
			m_border.graphics.clear();
			paintBackground(0xebebeb);
		}
		
		private function paintMouseDownMode():void
		{
			if(ownerInToolBar)
				paintBackground();
			
			m_border.graphics.clear();
			
			m_border.graphics.lineStyle(1, 0x999999, 1, false, "normal", CapsStyle.NONE, JointStyle.MITER);
			m_border.graphics.moveTo(owner.width - 1, 0);
			m_border.graphics.lineTo(0, 0);
			m_border.graphics.lineTo(0, owner.height - 1);
			
			m_border.graphics.lineStyle(1, 0xCCCCCC, 1, false, "normal", CapsStyle.NONE, JointStyle.MITER);
			m_border.graphics.moveTo(0, owner.height - 1);
			m_border.graphics.lineTo(owner.width - 1, owner.height - 1);
			m_border.graphics.lineTo(owner.width - 1, 0);
			
			m_border.graphics.lineStyle(1, 0xCACACA, 1, false, "normal", CapsStyle.NONE, JointStyle.MITER);
			m_border.graphics.moveTo(1, owner.height - 1);
			m_border.graphics.lineTo(1, 1);
			m_border.graphics.lineTo(owner.width - 1, 1);
		}
	}
}