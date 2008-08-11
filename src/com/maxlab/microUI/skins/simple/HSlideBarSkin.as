package com.maxlab.microUI.skins.simple 
{
	import com.maxlab.microUI.controls.HSlideBar;
	import com.maxlab.microUI.skins.Skin;
	import flash.display.CapsStyle;
	import flash.display.JointStyle;
	import flash.display.Shape;
	
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
		protected var m_box:Shape;
		protected var m_boxBg:Shape;
		
		override public function initialize():void 
		{
			m_bar = new Shape();
			m_box = new Shape();
			m_boxBg = new Shape();
			
			HSlideBar(owner).slideBar.addChildAt(m_bar, 0);
			
			HSlideBar(owner).slideBox.addChild(m_boxBg);
			HSlideBar(owner).slideBox.addChild(m_box);
			HSlideBar(owner).slideBoxSize = BOX_SIZE;
			HSlideBar(owner).slideBox.buttonMode = true;
			HSlideBar(owner).slideBox.useHandCursor = true;
			
			paintBar();
			paintBoxNormal();
			
			super.initialize();
		}
		
		override public function paint(invalidateItems:Array):void 
		{
			if (owner.enable)
			{
				if (invalidateItems.indexOf("size") >= 0)
				{
					paintBar();
					
					if (HSlideBar(owner).mouseDownFlag)
						paintBoxMouseDown();
					else if (HSlideBar(owner).mouseInFlag)
						paintBoxMouseOn();
					else
						paintBoxNormal();
				}
				
				if(invalidateItems.indexOf("mouseInFlag") >= 0
				|| invalidateItems.indexOf("mouseDownFlag") >= 0)
				{
					if (HSlideBar(owner).mouseDownFlag)
						paintBoxMouseDown();
					else if (HSlideBar(owner).mouseInFlag)
						paintBoxMouseOn();
					else
						paintBoxNormal();
				}
			}
			
			super.paint(invalidateItems);
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
			SimpleSkinHelper.paintNormalBorder(m_box, boxWidth, boxHeight);
			SimpleSkinHelper.paintNormalBackground(m_boxBg, boxWidth, boxHeight);
		}
		
		private function paintBoxMouseOn():void
		{
			SimpleSkinHelper.paintNormalBorder(m_box, boxWidth, boxHeight);
			SimpleSkinHelper.paintFocusBackground(m_boxBg, boxWidth, boxHeight);
		}
		
		private function paintBoxMouseDown():void
		{
			SimpleSkinHelper.paintInlineBorder(m_box, boxWidth, boxHeight);
			SimpleSkinHelper.paintNormalBackground(m_boxBg, boxWidth, boxHeight);
		}
	}
}