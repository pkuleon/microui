package com.maxlab.microUI.controls 
{
	
	/**
	* The ToolBar control group.
	* 
	* @author BG5SBK
	*/
	public class ToolBarGroup extends ToolBar
	{
		public function ToolBarGroup(config:*) 
		{
			if (!config)
				config = { };
				
			config.hGap = -1;
			config.vGap = -1;
			config.padding = [0, 0, 0, 0];
			
			super(config);
		}
	}
}