package com.maxlab.microUI.controls 
{
	import com.maxlab.microUI.core.Control;
	
	/**
	* The Horizontal Split Control.
	* 
	* @author BG5SBK
	*/
	public class HSplit extends Control
	{
		public function HSplit(config:*) 
		{
			if (!config)
				config = { };
				
			if (config.width == null && config.size == null)
				config.width = 16;
				
			super(config);
		}
	}
}