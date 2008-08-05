package com.maxlab.microUI.skins.simple 
{
	import com.maxlab.microUI.controls.ProgressBar;
	import com.maxlab.microUI.skins.Skin;
	import flash.display.Shape;
	
	/**
	* The ProgressBar control's skin
	* 
	* @author BG5SBK
	*/
	public class ProgressBarSkin extends Skin
	{
		private var m_bar:Shape;
		private var m_barBg:Shape;
		
		override public function initialize():void 
		{			
			m_bar = new Shape();
			m_barBg = new Shape();
			
			addChild(m_bar);
			addChild(m_barBg);
			
			paintBar();
			paintBarBg();
			
			super.initialize();
		}
		
		override public function paint(invalidateItems:Array):void 
		{
			super.paint(invalidateItems);
			
			if (invalidateItems.indexOf("progress") >= 0)
			{
				paintBarBg();
			}
			else if (invalidateItems.indexOf("size") >= 0)
			{
				paintBar();
				paintBarBg();
			}
		}
		
		private function paintBar():void
		{
			SimpleSkinHelper.paintNormalBackground(m_bar, owner.width, owner.height);
			SimpleSkinHelper.paintInlineBorder(m_bar, owner.width, owner.height, true);
		}
		
		private function paintBarBg():void
		{
			var p:Number = ProgressBar(owner).progress;
			
			SimpleSkinHelper.paintFocusBackground(m_barBg, (owner.width) * p, owner.height);
			SimpleSkinHelper.paintNormalBorder(m_barBg, (owner.width) * p, owner.height, true);	
		}
	}
}