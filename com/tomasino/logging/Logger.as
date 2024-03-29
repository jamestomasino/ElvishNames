package com.tomasino.logging
{
	import flash.errors.IllegalOperationError;
	import com.tomasino.logging.LogLevel;
	import com.tomasino.logging.Log;
	import flash.utils.getQualifiedClassName;
	
	public class Logger
	{
		private var _category:String;
		private var _log:Log;
		
		public function Logger (category:Object):void
		{
			_log = Log.inst;

			if (category is String)
			{
				_category = category as String;
			}
			else
			{
				_category = getQualifiedClassName (category);
			}
		}

		public function log (level:int, message:String, ... rest):void
		{
			if (rest.length)
			{
				message +=  ' ' + rest.join (' ');
			}
			_log.log (_category, level, message);
		}

		public function debug (message:String, ... rest):void
		{
			if (rest.length)
			{
				message +=  ' ' + rest.join (' ');
			}

			log (LogLevel.DEBUG, message);
		}
				
		public function info (message:String, ... rest):void
		{
			if (rest.length)
			{
				message +=  ' ' + rest.join (' ');
			}

			log (LogLevel.INFO, message);
		}
			
		public function warn (message:String, ... rest):void
		{
			if (rest.length)
			{
				message +=  ' ' + rest.join (' ');
			}

			log (LogLevel.WARN, message);
		}
		
		public function error (message:String, ... rest):void
		{
			if (rest.length)
			{
				message +=  ' ' + rest.join (' ');
			}

			log (LogLevel.ERROR, message);
		}
				
		public function fatal (message:String, ... rest):void
		{
			if (rest.length)
			{
				message +=  ' ' + rest.join (' ');
			}

			log (LogLevel.FATAL, message);
		}
	}
}