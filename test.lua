local HttpService = game:GetService("HttpService")
local url = getgenv().WebhookURL
local msg = getgenv().Message
if url and msg then
    local data = { content = tostring(msg) }
    local ok, err = pcall(function()
        HttpService:PostAsync(url, HttpService:JSONEncode(data), Enum.HttpContentType.ApplicationJson)
    end)
    if not ok then warn("Webhook failed: " .. tostring(err)) end
else
    warn("Missing WebhookURL or Message")
end