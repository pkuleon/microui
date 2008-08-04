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
		private static const BOX_WIDTH:Number = 10;
		private static const BAR_HEIGHT:Number = 6;
		
		private var m_bar:Shape;
		private var m_box:Shape;
		private var m_boxBg:Shape;
		
		override public function initialize():void 
		{
			m_bar = new Shape();
			m_box = new Shape();
			m_boxBg = new Shape();
			
			owner.addChildAt(m_bar, 0);
			HSlideBar(owner).slideBox.addChild(m_boxBg);
			HSlideBar(owner).slideBox.addChild(m_box);
			HSlideBar(owner).slideBox.width = BOX_WIDTH;
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
				if (invalidateItems.indexOf("size")
				|| invalidateItems.indexOf("mouseInFlag") >= 0
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
		
		private function paintBar():void
		{
			SimpleSkinHelper.paintNormalBackground(m_bar, owner.width, BAR_HEIGHT);
			SimpleSkinHelper.paintInlineBorder(m_bar, owner.width, BAR_HEIGHT, true);
			
			m_bar.y = (owner.height - m_bar.height) / 2;
		}
		
		private function paintBoxNormal():void
		{
			SimpleSkinHelper.paintNormalBorder(m_box, BOX_WIDTH, owner.height);
			SimpleSkinHelper.paintNormalBackground(m_boxBg, BOX_WIDTH, owner.height);
		}
		
		private function paintBoxMouseOn():void
		{
			SimpleSkinHelper.paintNormalBorder(m_box, BOX_WIDTH, owner.height);
			SimpleSkinHelper.paintFocusBackground(m_boxBg, BOX_WIDTH, owner.height);
		}
		
		private function paintBoxMouseDown():void
		{
			SimpleSkinHelper.paintInlineBorder(m_box, BOX_WIDTH, owner.height);
			SimpleSkinHelper.paintNormalBackground(m_boxBg, BOX_WIDTH, owner.height);
		}
	}
}