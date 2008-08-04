package com.maxlab.microUI.skins.simple 
{
	import com.maxlab.microUI.controls.Button;
	import com.maxlab.microUI.skins.Skin;
	import flash.display.Shape;
	import flash.utils.getQualifiedClassName;
	
	/**
	* The Button control's skin. 
	* 
	* @author BG5SBK
	*/
	public class ButtonSkin extends Skin
	{
		private var m_border:Shape;
		private var m_background:Shape;
		
		private var m_normalTextColor:Number;
		
		private function get ownerInToolBar():Boolean
		{
			return owner.owner != null && getQualifiedClassName(owner) == "com.maxlab.microUI.controls::ToolBar";
		}
		
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
			
			if(invalidateItems.indexOf("enable") >=  0)
			{
				if (owner.enable)
				{
					Button(owner).textField.textColor = 0x000000;
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
		
		private function paintDisableMode():void
		{
			SimpleSkinHelper.paintDisableBorder(m_border, owner.width, owner.height);
			SimpleSkinHelper.paintNormalBackground(m_background, owner.width, owner.height);
			
			Button(owner).textField.textColor = 0xCCCCCC;
		}
		
		private function paintNormalMode():void
		{
			SimpleSkinHelper.paintNormalBorder(m_border, owner.width, owner.height);
			SimpleSkinHelper.paintNormalBackground(m_background, owner.width, owner.height);
		}
		
		private function paintMouseOnMode():void
		{
			SimpleSkinHelper.paintNormalBorder(m_border, owner.width, owner.height);
			SimpleSkinHelper.paintFocusBackground(m_background, owner.width, owner.height);
		}
		
		private function paintMouseDownMode():void
		{
			SimpleSkinHelper.paintInlineBorder(m_border, owner.width, owner.height);
			SimpleSkinHelper.paintNormalBackground(m_background, owner.width, owner.height);
		}
	}
}