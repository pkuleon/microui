package com.maxlab.microUI.skins.simple
{
	import flash.display.CapsStyle;
	import flash.display.JointStyle;
	
	/**
	* The helper class for skin painting
	* 
	* @author BG5SBK
	*/
	public class SimpleSkinHelper
	{
		private static function paintBorder(target:*, width:Number, height:Number, colorTop:Number, colorBottom:Number, saveOld:Boolean = false):void
		{
			if(!saveOld)
				target.graphics.clear();
			
			target.graphics.lineStyle(1, 0x808080, 1, false, "normal", CapsStyle.NONE, JointStyle.MITER);
			target.graphics.drawRect(0, 0, width - 1, height - 1);
				
			target.graphics.lineStyle(1, colorTop, 1, false, "normal", CapsStyle.SQUARE, JointStyle.MITER);
			target.graphics.moveTo(width - 2, 1);
			target.graphics.lineTo(1, 1);
			target.graphics.lineTo(1, height - 2);
				
			target.graphics.lineStyle(1, colorBottom, 1, false, "normal", CapsStyle.SQUARE, JointStyle.MITER);
			target.graphics.moveTo(width - 2, 2);
			target.graphics.lineTo(width - 2, height - 2);
			target.graphics.lineTo(2, height - 2);
		}
		
		public static function paintInlineBorder(target:*, width:Number, height:Number, saveOld:Boolean = false):void
		{
			paintBorder(target, width, height, 0xCCCCCC, 0xFFFFFF, saveOld);
		}
		
		public static function paintNormalBorder(target:*, width:Number, height:Number, saveOld:Boolean = false):void
		{
			paintBorder(target, width, height, 0xFFFFFF, 0xCCCCCC, saveOld);
		}
		
		public static function paintDisableBorder(target:*, width:Number, height:Number, saveOld:Boolean = false):void
		{
			target.graphics.clear();
			
			target.graphics.lineStyle(1, 0xCCCCCC, 1, false, "normal", CapsStyle.NONE, JointStyle.MITER);
			target.graphics.drawRect(0, 0, width - 1, height - 1);
		}
		
		private static function paintBackground(target:*, color:Number, width:Number, height:Number, saveOld:Boolean = false):void
		{
			if(!saveOld)
				target.graphics.clear();
			
			target.graphics.beginFill(color);
			target.graphics.drawRect(0, 0, width - 1, height - 1);
			target.graphics.endFill();
		}
		
		public static function paintNormalBackground(target:*, width:Number, height:Number, saveOld:Boolean = false):void
		{
			paintBackground(target, 0xE8E8E8, width, height, saveOld);
		}
		
		public static function paintFocusBackground(target:*, width:Number, height:Number, saveOld:Boolean = false):void
		{
			paintBackground(target, 0xF0F0F0, width, height, saveOld);
		}
	}
}