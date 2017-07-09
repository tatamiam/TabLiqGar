tabchi = dofile('./bot/funcation.lua')
--------------------------------
tabchi_id = 431003445
---------------------------------
json = dofile('./libs/JSON.lua')
---------------------------------
URL = require "socket.url"
----~~~~~~~~~~~~~~~~
serpent = dofile("./libs/serpent.lua")
------~~~~~~~~~~~~~~~~
http = require "socket.http"
-----~~~~~~~~~~~~~~~~
https = require "ssl.https"
-----~~~~~~~~~~~~~~~~
d = dofile('./libs/redis.lua')
-------------------------------
config_sudo = {987654321}
function dl_cb(arg, data)
end
function is_sudo(msg)
  local var = false
  for v,user in pairs(config_sudo) do
    if user == msg.sender_user_id_ then
      var = true
    end
  end
  return var
end
	  function showedit(msg,data)
         if msg then
  tabchi.viewMessages(msg.chat_id_, {[0] = msg.id_})
      if msg.send_state_.ID == "MessageIsSuccessfullySent" then
      return false 
      end     
 if msg.chat_id_ then
      local id = tostring(msg.chat_id_)
      if id:match('-100(%d+)') then
        chat_type = 'super'
        elseif id:match('^(%d+)') then
        chat_type = 'user'
        else
        chat_type = 'group'
        end
      end

 local text = msg.content_.text_
	if text and text:match('[QWERTYUIOPASDFGHJKLZXCVBNM]') then
		text = text
		end
    if msg.content_.ID == "MessageText" then
      msg_type = 'text'
    end
    if msg.content_.ID == "MessageChatAddMembers" then
      msg_type = 'user'
    end
    if msg.content_.ID == "MessageChatJoinByLink" then
      msg_type = 'Joins'
    end
   if msg.content_.ID == "MessageDocument" then
        print("This is [ File Or Document ]")
        msg_type = 'Document'
      end
      -------------------------
      if msg.content_.ID == "MessageSticker" then
        print("This is [ Sticker ]")
        msg_type = 'Sticker'
      end
      -------------------------
      if msg.content_.ID == "MessageAudio" then
        print("This is [ Audio ]")
        msg_type = 'Audio'
      end
      -------------------------
      if msg.content_.ID == "MessageVoice" then
        print("This is [ Voice ]")
        msg_type = 'Voice'
      end
      -------------------------
      if msg.content_.ID == "MessageVideo" then
        print("This is [ Video ]")
        msg_type = 'Video'
      end
      -------------------------
      if msg.content_.ID == "MessageAnimation" then
        print("This is [ Gif ]")
        msg_type = 'Gif'
      end
      -------------------------
      if msg.content_.ID == "MessageLocation" then
        print("This is [ Location ]")
        msg_type = 'Location'
      end
    
      -------------------------
      if msg.content_.ID == "MessageContact" then
        print("This is [ Contact ]")
        msg_type = 'Contact'
      end
      
 if not msg.reply_markup_ and msg.via_bot_user_id_ ~= 0 then
        print("This is [ MarkDown ]")
        msg_type = 'Markreed'
      end
    if msg.content_.ID == "MessagePhoto" then
      msg_type = 'Photo'
end
-----------------------------------------------
function check_markdown(text) 
		str = text
		if str:match('_') then
			output = str:gsub('_',[[\_]])
		elseif str:match('*') then
			output = str:gsub('*','\\*')
		elseif str:match('`') then
			output = str:gsub('`','\\`')
		else
			output = str
		end
	return output
end
    -------------------------------------------
    if msg_type == 'text' and text then
      if text:match('^[/]') then
      text = text:gsub('^[/]','')
      end
    end
  local savecontact = (d:get('savecontact') or 'no') 
    if savecontact == 'yes' then
 if msg.content_.ID == "MessageContact" then
	  tabchi.importContacts(msg.content_.contact_.phone_number_, (msg.content_.contact_.first_name_ or '--'), '#Tarfand.Pro', msg.content_.contact_.user_id_)
        print("ConTact Added")
local function c(a,b,c) 
  tabchi.sendContact(msg.chat_id_, msg.id_, 0, 1, nil, b.phone_number_, b.first_name_, (b.last_name_ or ''), 0)
 end
tabchi.getMe(c)
d:sadd('tcom', msg.content_.contact_.user_id_)
local text = d:get('pm')
if not text then
text = 'Addi Golam Bia Pv :0'
end
        tabchi.sendText(msg.chat_id_, msg.id_, 1, text,1, 'md')
        print("Tabchi [ Message ]")

end
end
   if text == 'leave sgp' and is_sudo(msg) then
          local list = d:smembers('tsgps')
          for k,v in pairs(list) do
       tabchi.changeChatMemberStatus(v, tabchi_id, "Left")
        print("Tabchi [ Left ]")

d:del('tsgps')
   end
tabchi.sendText(msg.sender_user_id_, 0, 1,'*✅انجام شد \nthe bot ad trader from all Supergroups your exited*', 1, 'md')
   print("Tabchi [ Message ]")

      end
if text and text:match('^setapi (%d+)') and is_sudo(msg) then
          local id = text:match('^setapi (%d+)')
d:set('apiid',id)
tabchi.sendText(msg.chat_id_, msg.id_, 1,'*✅انجام شد*', 1, 'md')
end
		if text == 'git pull' and is_sudo(msg) then
text = io.popen("git pull"):read('*all')
 tabchi.sendText(msg.chat_id_, msg.id_, 1,text, 1, 'md')
end
 if text == 'addapi' and is_sudo(msg) then
if d:get('apiid') then
local id = d:get('apiid')
  local add = d:smembers("tsgps")
          for k,v in pairs(add) do
    tabchi.addChatMember(v, id,20)
  end
 local add = d:smembers("tgp")
local id = d:get('apiid')
          for k,v in pairs(add) do
    tabchi.addChatMember(v, id,20)
  end
tabchi.sendText(msg.chat_id_, msg.id_, 1,'*✅انجام شد*', 1, 'md')
end
end
 if text == 'leave gp' and is_sudo(msg) then
          local list = d:smembers('tgp')
          for k,v in pairs(list) do
       tabchi.changeChatMemberStatus(v, tabchi_id, "Left")
        print("Tabchi [ Left ]")
d:del('tgp')       
   end
tabchi.sendText(msg.sender_user_id_, 0, 1,'*✅انجام شد \nthe bot ad trader from all groups your exited*', 1, 'md')
   print("Tabchi [ Message ]")
      end
		 if text and text:match('^setname (.*)') then
          local name = text:match('^setname (.*)')
		  tabchi.changeName(name, '')
		       local text = '*Name Changed To* `'..name..'`'
			 tabchi.sendText(msg.chat_id_, msg.id_, 1,text, 1, 'md')


		  end
if text == 'panel' and is_sudo(msg) then
local gps = d:scard("tsgps") or 0
local user = d:scard("tusers")
local gp = d:scard("tgp") or 0
local com = d:scard("tcom") or 0
local block = d:scard("tblock") or 0
local allmsg = d:get("tallmsg") or 0
local link = d:scard('links') or 0 
local text = '🔥آمار تبلیغ گر شما \n\n☘️ `تمام پیام ها :` *'..allmsg..'*\n\n`☘️ سوپرگروه ها  :`* '..gps..'*\n\n`☘️ گروه ها  :` *'..gp..'*`\n\n☘️ پی وی ها : `*'..user..'*\n\n`☘️ مخاطبین  :` *'..com..'*`\n\n☘️ لینک های استفاده شده :` *'..link..'*`\n\n☘️ مسدودی ها :` *'..block..'*'
 tabchi.sendText(msg.chat_id_, msg.id_,1,text,1,'md')
 end
 if text == 'help' and is_sudo(msg) then
local text = 'راهنمای کار با سورس تبچی (CLI) \n \n panel \n اطلاعات ربات \n settings \n تنظیمات ربات  \n setpm (text)  \n تایین متن بعد از ذخیره شدن مخاطب  \n delpm  \n حذف متن ذخیره شده \n pm (userID) (text)  \n ارسال پیام به فرد مورد نظر  \n leave sgp  \n خروج از تمامی سوپر گروه ها \n leave gp  \n خروج از تمام گروه ها \n savecontact enable  \n فعال کردن سیو مخاطب \n savecontact disable  \n غیرفعال کردن سیو مخاطب \n join enable  \n فعال کردن جویین خودکار \n join disable  \n غیرفعال کردن جوییپ خودکار \n block (id) \n بلاک کردن کاربر  \n unblock (id) \n آزاد کردن کاربر \n jointo (link) \n جویین شدن به گروه مورد نظر  \n --------------------------------------------------- \n git pull  \n همگام سازی با گیت ها  \n setapi (id)  \n تایین ربات api   \n relaod  \n بازنگری پلاگین ها  \n setname (name) \n تغییر نام تبلیغ چی\n \n راهنمای کار با سورس (API) \n panel  \n آمار ربات تبلیغ گر (api) \n bcsgp \n ارسال پیام به تمام سوپر گروه ها \n bcgp \n ارسا پیام به تمام گروه ها \n bcuser  \n ارسال پیام به تمام کاربران (pv) \n ------- \n fwdsgp \n فروارد به تمام سوپرگروه ها \n fwdgp \n فروارد به تمام گروه ها  \n fwduser \n فروارد به تمام کاربران  \n \n git pull  \n همگام سازی با گیت هاب \n reload \n بازنگری پلاگین ها'
 tabchi.sendText(msg.chat_id_, msg.id_,1,text,1,'md')
 end
 if text == 'settings' and is_sudo(msg) then
local pm = d:get('pm')
if not pm then
pm = '🙈سیو کردم پیوی بده'
end
 if d:get('savecontact') then
              co = '🔹فعال'
            else
              co = '🔸غیرفعال'
            end
 if d:get('joinlink') then
              join = '🔹فعال'
            else
              join = '🔸غیرفعال'
            end
   tabchi.sendText(msg.chat_id_, msg.id_, 1, '⚙️تنظیمات تبلیغ گر \n✉️ پیام ذخیره مخاطب :  \n *'..pm..'*\n\n🤖 عضویت خودکار : *'..join..'*\n📲 ذخیره مخاطب : *'..co..'*\n\n', 1, 'md')
        print("Tabchi [ Message ]")

end
if text == 'addmembers' and is_sudo(msg) then
  local pv = d:smembers("tusers")
  for i = 1, #pv do
    tabchi.addChatMember(msg.chat_id_, pv[i], 5)
  end
 local co = d:smembers("tcom")
  for i = 1, #co do
    tabchi.addChatMember(msg.chat_id_, co[i], 5)
  end
  tabchi.sendText(msg.chat_id_, msg.id_,1,'All Members Has Been Added To Group ',1,'md')
 end
  if text and text:match('^addtoall (%d+)') and is_sudo(msg) then
          local id = text:match('^addtoall (%d+)')
  local add = d:smembers("tsgps")
          for k,v in pairs(add) do
    tabchi.addChatMember(v, id,5)
  end
 local add = d:smembers("tgp")
          for k,v in pairs(add) do
    tabchi.addChatMember(v, id,5)
  end
  tabchi.sendText(msg.chat_id_, msg.id_,1,'User '..id..' Has Been Added To All Group ',1,'md')
end

--[[if text == 'panel' and is_sudo(msg) then
function Helper(code,lua)
          tdcli_function({
        ID = "SendInlineQueryResultMessage",
        chat_id_ = msg.chat_id_,
        reply_to_message_id_ = msg.id_,
        disable_notification_ = 0,
        from_background_ = 1,
        query_id_ = lua.inline_query_id_,
        result_id_ = lua.results_[0].id_
      }, dl_cb, nil)
end
          tdcli_function({
      ID = "GetInlineQueryResults",
      bot_user_id_ = 000000000,
      chat_id_ = msg.chat_id_,
      user_location_ = {
        ID = "Location",
        latitude_ = 0,
        longitude_ = 0
      },
      query_ = '----------',
      offset_ = 0
    }, Helper, nil)
       end]]--
if text == 'reset' and is_sudo(msg) then
d:del("tallmsg")
d:del("tsgps")
d:del("tgp")
d:del("tcom")
d:del("tblock")
d:del("tusers")
d:del("links")
d:del("tbotmsg")
tabchi.sendText(msg.chat_id_, msg.id_,1,' Stats TabChi Has Been Reseted ',1,'md')
        print("Tabchi [ Message ]")

end
if text == 'join enable' and is_sudo(msg) then

          d:set('joinlink','yes')
         tabchi.sendText(msg.chat_id_, msg.id_, 1,'`Auto Join` *Has Been Enabled*', 1, 'md')
                  print("Tabchi [ Message ]")

end
        if text == 'join disable' and is_sudo(msg) then

          d:set('joinlink','no')
         d:del('joinlink','yes')  
        tabchi.sendText(msg.chat_id_, msg.id_, 1,'`Auto Join` *Has Been Disabled*', 1, 'md')
                print("Tabchi [ Message ]")

  end
if text == 'savecontact enable' and is_sudo(msg) then

          d:set('savecontact','yes')
         tabchi.sendText(msg.chat_id_, msg.id_, 1,'`Save Contact`  *Has Been Enabled*', 1, 'md')
                 print("Tabchi [ Message ]")

 end
        if text == 'savecontact disable' and is_sudo(msg) then

          d:set('savecontact ','no')
          d:del('savecontact','yes')

          tabchi.sendText(msg.chat_id_, msg.id_, 1,'`Save Contact`  *Has Been Disabled*', 1, 'md')
                  print("Tabchi [ Message ]")

end
if text and text:match("^(pm) (%d+) (.*)") and is_sudo(msg) then

      local matches = {
        text:match("^(pm) (%d+) (.*)")
      }
      if #matches == 3 then
        tabchi.sendText((matches[2]), 0, 1, matches[3], 1, "html")
                    print("Tabchi [ Message ]")
 
  tabchi.sendText(msg.chat_id_, msg.id_, 1, '*Send!*', 1, 'md')
      end
end
 if text and text:match('^jointo (.*)') and is_sudo(msg) then

  local link = text:match('^jointo (.*)')
tabchi.importChatInviteLink(link, dl_cb, nil)
            print("Tabchi [ Message ]")

    tabchi.sendText(msg.chat_id_, msg.id_, 1, '*✅انجام شد!*', 1, 'md')
end
   if text and text:match('^block (%d+)') and is_sudo(msg) then

  local b = text:match('block (%d+)')
d:sadd('tblock',b)
   tabchi.blockUser(b)
 tabchi.sendText(msg.chat_id_, msg.id_, 1, '*User Blocked*', 1, 'md')
end
             if text and text:match('^unblock (%d+)') and is_sudo(msg) then

  local b = text:match('^unblock (%d+)')
d:srem('tblock',b)
     tabchi.unblockUser(b)
      tabchi.sendText(msg.chat_id_, msg.id_, 1, '*User Unblocked*', 1, 'md') 
end

if text == 'tabliqgar' and is_sudo(msg) then
tabchi.sendText(msg.chat_id_, msg.id_, 1,'*TbabliqGar\n*telegra.ph/CernerTeam-05-26', 1, 'md')
end


if text and text:match('^setpm (.*)') and is_sudo(msg) then
            local link = text:match('setpm (.*)')
            d:set('pm', link)
          tabchi.sendText(msg.chat_id_, msg.id_, 1,'*Seted*', 1, 'md')
            end
 if text == 'delpm' then
            d:del('pm')
          tabchi.sendText(msg.chat_id_, msg.id_, 1,'*Pm Removed*', 1, 'md')
            end
if text == 'reload' and is_sudo(msg) then
 dofile('./bot/funcation.lua')
 dofile('./bot/tabchi.lua')
tabchi.sendText(msg.chat_id_,msg.id_,1,'*♻️ریلود با موفقیت انجام شد*',1,'md')
end
if text and text:match('^leave(-100)(%d+)$') then
local leave = text:match('leave(-100)(%d+)$') 
       tabchi.sendText(msg.chat_id_,msg.id_,1,'騎필 훌 新繃綽 할 落 '..leave..' 曠緊 冬.',1,'md')
     tabchi.changeChatMemberStatus(leave, tabchi_id, "Left")
  end

  local joinlink = (d:get('joinlink') or 'no') 
    if joinlink == 'yes' then
	if text and text:match("https://telegram.me/joinchat/%S+") or text and text:match("https://t.me/joinchat/%S+") or text and text:match("https://t.me/joinchat/%S+")  or text and text:match("https://telegram.dog/joinchat/%S+") then
		local text = text:gsub("t.me", "telegram.me")
		for link in text:gmatch("(https://telegram.me/joinchat/%S+)") do
			if not d:sismember("links", link) then
				d:sadd("links", link)
				tabchi.importChatInviteLink(link)
			end
		end
end
end
------------------------------------
------------------------------------
d:incr("tallmsg")
------------------------------------
 if msg.chat_id_ then
      local id = tostring(msg.chat_id_)
      if id:match('-100(%d+)') then
        if not d:sismember("sgps",msg.chat_id_) then
          d:sadd("tsgps",msg.chat_id_)

        end
-----------------------------------
elseif id:match('^-(%d+)') then
if not d:sismember("tgp",msg.chat_id_) then
d:sadd("tgp",msg.chat_id_)

end
-----------------------------------------
elseif id:match('') then
if not d:sismember("tusers",msg.chat_id_) then
d:sadd("tusers",msg.chat_id_)
end
   else
        if not d:sismember("tsgps",msg.chat_id_) then
            d:sadd("tsgps",msg.chat_id_)

end
end
end
end
end
      function tdcli_update_callback(data)
 ------vardump(data)
    if (data.ID == "UpdateNewMessage") then
     showedit(data.message_,data)
  elseif (data.ID == "UpdateMessageEdited") then
    data = data
    local function edit(extra,result,success)
      showedit(result,data)
    end
     tdcli_function ({ ID = "GetMessage", chat_id_ = data.chat_id_,message_id_ = data.message_id_}, edit, nil)
  elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then
    tdcli_function ({ ID="GetChats",offset_order_="9223372036854775807", offset_chat_id_=0,limit_=20}, dl_cb, nil)
  end
end


