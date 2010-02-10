package com.maxlab.microUI.controls 
{
	import com.maxlab.microUI.core.ControlAlign;
	import com.maxlab.microUI.core.ControlLayout;
	
	/**
	* The ToolBar control.
	* 
	* @author BG5SBK
	*/
	public class ToolBar extends Panel
	{
		public function ToolBar(config:*) 
		{
			if (config == null)
				config = { };
				
			if (config.size == null && (config.width == null || config.height == null) && config.size == null && !config.autoSize)
			{
				config.autoSize = true;
			}
				
			if(config.layout == null)
				config.layout = ControlLayout.HORIZONTAL;
					
			if(config.hAlign == null && config.horizontalAlign == null)
				config.hAlign = ControlAlign.LEFT;
					
			if (config.vAlign == null && config.verticalAlign == null)
				config.vAlign = ControlAlign.MIDDLE;
			
			super(config);
		}
	}
}