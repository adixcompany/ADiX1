local function tosticker(msg, success, result)
  local receiver = get_receiver(msg)
  if success then
    local file = 'data/stickers/'..msg.from.id..'.webp'
    print('File downloaded to:', result)
    os.rename(result, file)
    print('File moved to:', file)
    send_document(get_receiver(msg), file, ok_cb, false)
    redis:del("photo:sticker")
  else
    print('Error downloading: '..msg.id)
    send_large_msg(receiver, 'Failed, please try again!', ok_cb, false)
  end
end
local function run(msg,matches)
    local receiver = get_receiver(msg)
    local group = msg.to.id
    if msg.media then
       if msg.media.type == 'photo' and redis:get("photo:sticker") then
        if redis:get("photo:sticker") == 'waiting' then
          load_photo(msg.id, tosticker, msg)
        end
       end
    end
    if matches[1] == "sticker" then
     redis:set("photo:sticker", "waiting")
     return 'Please Send Me Your Photo Now'
    end
end
return {
  patterns = {
 "^[!/#](sticker)$",
 "%[(photo)%]",
  },
  run = run,
}
