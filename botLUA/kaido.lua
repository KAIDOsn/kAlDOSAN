-- BY : @KAIDOsn
local action = function(msg, matches)
 if matches[1] == "start" then
			keyboard = {} 
	keyboard.inline_keyboard = {
      {
		{text = "🔰 قناة السورس", url="https://t.me/teem_kaido"},					
			},	
		     {
		{text = "شرح سورس عله التلكرام", url="https://t.me/teem_kaido"},					
			},
       {
		{text = "📊 مطور السورس 📊", url="https://t.me/KAIDOsn"},					
			},	
	}
		api.sendKeyboard(msg.chat.id, '🏷 : اهلا بك عزيزي ارسل الملف وساقوم انا بتشغيله 

🔰: قناة الملفات * @ON_BOTS_LUA *', keyboard)     
	end	
	    if msg.document then				
			api.sendMessage(msg.chat.id, '💈: انتظر لكي يتم تشغيل الملف')
      local url = 'https://api.telegram.org/bot'..config.bot_api_key..'/getFile?file_id='..(msg.document.file_id or msg.forward_from.document.file_id)..''
			local res = HTTPS.request(url)
			local jres = JSON.decode(res)	
			local download = download_to_file("https://api.telegram.org/file/bot"..config.bot_api_key.."/"..jres.result.file_path, 'botLUA/kaido.lua')
			api.sendMessage(msg.chat.id, '📊: تم تشغيل الملف')
    	api.sendMessage(msg.chat.id, '🔋: جار تشغيل البوت')
    	api.sendMessage(msg.chat.id, '💎: تم اكتمال تشغيل البوت')
		  bot_init(true)
  end
	end
local triggers = {
  '^/(start)',
   '###file',
}
return {
  action = action,
  triggers = triggers,
}
 
