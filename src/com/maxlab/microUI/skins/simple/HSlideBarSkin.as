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
			m_bar.graphics.clear();
			
			m_bar.graphics.beginFill(0xE8E8E8);
			m_bar.graphics.drawRect(0, 0, owner.width - 1, BAR_HEIGHT - 1);
			m_bar.graphics.endFill();
				
			m_bar.graphics.lineStyle(1, 0x808080, 1, false, "normal", CapsStyle.NONE, JointStyle.MITER);
			m_bar.graphics.drawRect(0, 0, owner.width - 1, BAR_HEIGHT - 1);
			
			m_bar.graphics.lineStyle(1, 0xCCCCCC, 1, false, "normal", CapsStyle.SQUARE, JointStyle.MITER);
			m_bar.graphics.moveTo(owner.width - 2, 1);
			m_bar.graphics.lineTo(1, 1);
			m_bar.graphics.lineTo(1, BAR_HEIGHT - 2);
				
			m_bar.graphics.lineStyle(1, 0xFFFFFF, 1, false, "normal", CapsStyle.SQUARE, JointStyle.MITER);
			m_bar.graphics.moveTo(owner.width - 2, 2);
			m_bar.graphics.lineTo(owner.width - 2, BAR_HEIGHT - 2);
			m_bar.graphics.lineTo(2, BAR_HEIGHT - 2);
			
			m_bar.y = (owner.height - m_bar.height) / 2;
		}
		
		private function paintBoxBg(color:Number = 0xE8E8E8):void
		{
			m_boxBg.graphics.beginFill(color);
			m_boxBg.graphics.drawRect(0, 0, BOX_WIDTH - 1, owner.height - 1);
			m_boxBg.graphics.endFill();
		}
		
		private function paintBoxBorder():void
		{
			m_box.graphics.clear();
			
			m_box.graphics.lineStyle(1, 0x808080, 1, false, "normal", CapsStyle.NONE, JointStyle.MITER);
			m_box.graphics.drawRect(0, 0, BOX_WIDTH - 1, owner.height - 1);
				
			m_box.graphics.lineStyle(1, 0xFFFFFF, 1, false, "normal", CapsStyle.SQUARE, JointStyle.MITER);
			m_box.graphics.moveTo(BOX_WIDTH - 2, 1);
			m_box.graphics.lineTo(1, 1);
			m_box.graphics.lineTo(1, owner.height - 2);
				
			m_box.graphics.lineStyle(1, 0xCCCCCC, 1, false, "normal", CapsStyle.SQUARE, JointStyle.MITER);
			m_box.graphics.moveTo(BOX_WIDTH - 2, 2);
			m_box.graphics.lineTo(BOX_WIDTH - 2, owner.height - 2);
			m_box.graphics.lineTo(2, owner.height - 2);
		}
		
		private function paintBoxNormal():void
		{
			paintBoxBg();
			paintBoxBorder();
		}
		
		private function paintBoxMouseOn():void
		{
			paintBoxBg(0xF0F0F0);
			paintBoxBorder();
		}
		
		private function paintBoxMouseDown():void
		{
			paintBoxBg();
			
			m_box.graphics.clear();
			
			m_box.graphics.lineStyle(1, 0x808080, 1, false, "normal", CapsStyle.NONE, JointStyle.MITER);
			m_box.graphics.drawRect(0, 0, BOX_WIDTH - 1, owner.height - 1);
				
			m_box.graphics.lineStyle(1, 0xCCCCCC, 1, false, "normal", CapsStyle.SQUARE, JointStyle.MITER);
			m_box.graphics.moveTo(BOX_WIDTH - 2, 1);
			m_box.graphics.lineTo(1, 1);
			m_box.graphics.lineTo(1, owner.height - 2);
				
			m_box.graphics.lineStyle(1, 0xFFFFFF, 1, false, "normal", CapsStyle.SQUARE, JointStyle.MITER);
			m_box.graphics.moveTo(BOX_WIDTH - 2, 2);
			m_box.graphics.lineTo(BOX_WIDTH - 2, owner.height - 2);
			m_box.graphics.lineTo(2, owner.height - 2);
		}
	}
}