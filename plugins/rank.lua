do

local function me(msg ,matches)
        if is_sudo(msg) then
local url = "You Are Sudo"
local file = download_to_file(url,'/data/Sudo.webp')
send_document(get_receiver(msg) , file, ok_cb, false)
        
        elseif is_owner(msg) then
        local url = "You Are Owner"
local file = download_to_file(url,'/data/Owner.webp')
send_document(get_receiver(msg) , file, ok_cb, false)
        
        elseif is_momod(msg) then
        local url = "You Are GP Admin"
local file = download_to_file(url,'/data/GPAdmin.webp')
send_document(get_receiver(msg) , file, ok_cb, false)
        
        elseif not is_momod(msg) then
        local url = "You Are Member"
local file = download_to_file(url,'/data/Member.webp')
send_document(get_receiver(msg) , file, ok_cb, false)
        
        end
end

return { 
    patterns = { 
        "^[#!/](me)$"
    },
    run = Stick,
    
}

end
