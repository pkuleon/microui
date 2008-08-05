package com.maxlab.microUI.skins.simple 
{
	
	/**
	* The VSlideBar control's skin
	* 
	* @author BG5SBK
	*/
	public class VSlideBarSkin extends HSlideBarSkin
	{
		override protected function get ownerSize():Number
		{
			return owner.width;
		}
		
		override protected function get barWidth():Number
		{
			return BAR_SIZE;
		}
		
		override protected function get barHeight():Number
		{
			return owner.height;
		}
		
		override protected function get barPosition():Number
		{
			return m_bar.x;
		}
		
		override protected function set barPosition(value:Number):void
		{
			m_bar.x = value;
		}
		
		override protected function get boxWidth():Number
		{
			return owner.width;
		}
		
		override protected function get boxHeight():Number
		{
			return BOX_SIZE;
		}
	}
}