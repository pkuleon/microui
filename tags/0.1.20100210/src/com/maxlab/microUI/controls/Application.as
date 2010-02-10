package com.maxlab.microUI.controls 
{
	import com.maxlab.microUI.controls.Panel;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	/**
	* The MicroUI Application class.
	* 
	* @author BG5SBK
	*/
	public class Application extends Panel
	{
		public function Application(config:*=null) 
		{
			if (!config)
				config = { };
			
			if(config.percentWidth == null && config.pWidth == null)
				config.percentWidth = 1;
				
			if(config.percentHeight == null && config.pHeight == null)
				config.percentHeight = 1;
				
			if (config.padding == null 
			&& config.paddingTop == null
			&& config.paddingRight == null
			&& config.paddingBottom == null
			&& config.paddingLeft == null)
				config.padding = [10, 10, 10, 10];
				
			super(config);
		}
		
		override protected function initializeSelf():void 
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
		}
		
		override public function get width():Number 
		{ 
			return stage.stageWidth; 
		}
		
		override public function get height():Number 
		{ 
			return stage.stageHeight; 
		}
	}
}