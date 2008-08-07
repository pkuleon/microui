package com.maxlab.microUI.controls 
{
	import com.maxlab.microUI.core.Control;
	
	/**
	* The Vertical Split control.
	* 
	* @author BG5SBK
	*/
	public class VSplit extends Control
	{
		public function VSplit(config:*) 
		{
			if (!config)
				config = { };
				
			if (config.height == null && config.size == null)
				config.height = 16;
				
			super(config);
		}
	}
}