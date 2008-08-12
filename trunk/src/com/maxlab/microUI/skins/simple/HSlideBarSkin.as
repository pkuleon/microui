package com.maxlab.microUI.skins.simple 
{
	import com.maxlab.microUI.controls.HSlideBar;
	import com.maxlab.microUI.skins.Skin;
	import flash.display.CapsStyle;
	import flash.display.JointStyle;
	import flash.display.Shape;
	import flash.geom.Rectangle;
	
	/**
	* The HSlideBar control's skin
	* 
	* @author BG5SBK
	*/
	public class HSlideBarSkin extends Skin
	{
		protected static const BOX_SIZE:Number = 10;
		protected static const BAR_SIZE:Number = 6;
		
		protected var m_bar:Shape;
		
		override public function initialize():void 
		{
			m_bar = new Shape();
			
			HSlideBar(owner).slideBar.addChildAt(m_bar, 0);
			
			HSlideBar(owner).slideBoxSize = BOX_SIZE;
			HSlideBar(owner).slideBox.buttonMode = true;
			HSlideBar(owner).slideBox.useHandCursor = true;
			HSlideBar(owner).slideBox.focusRect = new Rectangle();
			
			paintBar();
			paintBoxNormal();
			
			super.initialize();
		}
		
		override public function paint(invalidateItems:Array):void 
		{
			super.paint(invalidateItems);
			
			if (owner.enable)
			{
				var needRedraw:Boolean = false;
				
				if (invalidateItems.indexOf("size") >= 0)
				{
					paintBar();
					needRedraw = true;
				}
				else if(invalidateItems.indexOf("focusFlag") >= 0
				|| invalidateItems.indexOf("mouseInFlag") >= 0
				|| invalidateItems.indexOf("mouseDownFlag") >= 0)
				{
					needRedraw = true;
				}
				
				if(needRedraw)
				{
					if (HSlideBar(owner).mouseDownFlag)
						paintBoxMouseDown();
					else if (HSlideBar(owner).mouseInFlag)
						paintBoxMouseOn();
					else
						paintBoxNormal();
				}
			}
		}
		
		protected function get ownerSize():Number
		{
			return owner.height;
		}
		
		protected function get barWidth():Number
		{
			return owner.width;
		}
		
		protected function get barHeight():Number
		{
			return BAR_SIZE;
		}
		
		protected function get barPosition():Number
		{
			return m_bar.y;
		}
		
		protected function set barPosition(value:Number):void
		{
			m_bar.y = value;
		}
		
		protected function get boxWidth():Number
		{
			return BOX_SIZE;
		}
		
		protected function get boxHeight():Number
		{
			return owner.height;
		}
		
		private function paintBar():void
		{
			SimpleSkinHelper.paintNormalBackground(m_bar, barWidth, barHeight);
			SimpleSkinHelper.paintInlineBorder(m_bar, barWidth, barHeight, true);
			
			barPosition = (ownerSize - BAR_SIZE) / 2;
		}
		
		private function paintBoxNormal():void
		{
			SimpleSkinHelper.paintNormalBackground(HSlideBar(owner).slideBox, boxWidth, boxHeight);
			
			if (owner.focusFlag)
				SimpleSkinHelper.paintFlatBorder(HSlideBar(owner).slideBox, 0x0000FF, boxWidth, boxHeight, true);
			else
				SimpleSkinHelper.paintNormalBorder(HSlideBar(owner).slideBox, boxWidth, boxHeight, true);
		}
		
		private function paintBoxMouseOn():void
		{
			SimpleSkinHelper.paintFocusBackground(HSlideBar(owner).slideBox, boxWidth, boxHeight);
			SimpleSkinHelper.paintNormalBorder(HSlideBar(owner).slideBox, boxWidth, boxHeight, true);
		}
		
		private function paintBoxMouseDown():void
		{
			SimpleSkinHelper.paintNormalBackground(HSlideBar(owner).slideBox, boxWidth, boxHeight);
			SimpleSkinHelper.paintInlineBorder(HSlideBar(owner).slideBox, boxWidth, boxHeight, true);
		}
	}
}