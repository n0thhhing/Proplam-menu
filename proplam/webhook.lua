--[[
function userReport()

 local report = gg.prompt({ 'what is your discord user: ', 'Report: ','⬅  Back'}, nil, { 'text', 'text', 'checkbox'})
 
 if report[3] then
 home()
  local discordWebhookUrlqna = ""
  ----------------------------------------------------------------
  function SendQuestionToDiscord()

   -- Construct the message content
   local messageContent = "User: " .. report[1] .. "\\n" .. "Report: " .. report[2]
   -- Prepare the request payload
   local payload = {
    content = messageContent
   }
   -- Encode payload to JSON
   local payloadJson = '{"content":"' .. messageContent .. '"}'
   -- Prepare the request
   local headers = {
    ["Content-Type"] = "application/json"
   }

   -- Send the message
   local Que = gg.makeRequest(discordWebhookUrlqna, headers, payloadJson)

   -- Check the response
   if Que.error then
    gg.alert("Error: " .. Que.content .. "\n" .. "Please try again")
   else
    gg.alert("Report Sent!!!")
   end
  end

  -- Send the message to Discord

  SendQuestionToDiscord()
 end
end
userReport()
]]
