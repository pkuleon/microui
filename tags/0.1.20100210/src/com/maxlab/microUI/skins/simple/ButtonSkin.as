package com.maxlab.microUI.skins.simple 
{
	import com.maxlab.microUI.controls.Button;
	import com.maxlab.microUI.skins.Skin;
	import flash.display.Shape;
	
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
		
		override public function initialize():void 
		{
			m_background = new Shape();
			m_border = new Shape();
				
			addChild(m_background);
			addChild(m_border);
				
			super.initialize();
		}
		
		override public function paint(invalidateItems:Array):void 
		{
			super.paint(invalidateItems);
			
			var needRedraw:Boolean = false;
			
			if (invalidateItems.indexOf("size") >= 0
			|| invalidateItems.indexOf("focusFlag") >= 0
			|| invalidateItems.indexOf("mouseInFlag") >= 0
			|| invalidateItems.indexOf("mouseDownFlag") >= 0)
			{
				needRedraw = true;
			}
			else if (invalidateItems.indexOf("enable") >=  0)
			{
				if(owner.enable)
					Button(owner).textField.textColor = 0x000000;
				else
					Button(owner).textField.textColor = 0xCCCCCC;
					
				needRedraw = true;
			}
			
			if (needRedraw)
			{
				if (owner.enable)
				{
					if (Button(owner).mouseDownFlag)
						paintMouseDownMode();
					else if (Button(owner).mouseInFlag)
						paintMouseOnMode();
					else
						paintNormalMode();
				}
				else
					paintDisableMode();
			}
		}
		
		private function paintDisableMode():void
		{
			SimpleSkinHelper.paintDisableBorder(m_border, owner.width, owner.height);
			SimpleSkinHelper.paintNormalBackground(m_background, owner.width, owner.height);
		}
		
		private function paintNormalMode():void
		{
			if (!ownerInToolBar)
			{
				if (owner.focusFlag)
					SimpleSkinHelper.paintFlatBorder(m_border, 0x0000FF, owner.width, owner.height);
				else
					SimpleSkinHelper.paintNormalBorder(m_border, owner.width, owner.height);
			}
			else
			{
				if (owner.focusFlag)
					SimpleSkinHelper.paintFlatBorder(m_border, 0x0000FF, owner.width, owner.height);
				else
					m_border.graphics.clear();
			}
			
			SimpleSkinHelper.paintNormalBackground(m_background, owner.width, owner.height);
		}
		
		private function paintMouseOnMode():void
		{
			if(!ownerInToolBar)
				SimpleSkinHelper.paintNormalBorder(m_border, owner.width, owner.height);
			else
				SimpleSkinHelper.paintDisableBorder(m_border, owner.width, owner.height);
			
			SimpleSkinHelper.paintFocusBackground(m_background, owner.width, owner.height);
		}
		
		private function paintMouseDownMode():void
		{
			SimpleSkinHelper.paintInlineBorder(m_border, owner.width, owner.height);
			SimpleSkinHelper.paintNormalBackground(m_background, owner.width, owner.height);
		}
	}
}