local HttpService = game:GetService("HttpService")
local url = getgenv().WebhookURL
local msg = getgenv().Message
if url and msg then
    local data = { content = tostring(msg) }
    pcall(function()
        HttpService:PostAsync(url, HttpService:JSONEncode(data), Enum.HttpContentType.ApplicationJson)
    end)
end