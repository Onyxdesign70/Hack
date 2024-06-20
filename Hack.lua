local Players = game:GetService("Players")

local function createNameTag(player)
    -- Wait for the character to load
    local character = player.Character or player.CharacterAdded:Wait()
    local head = character:WaitForChild("Head")

    -- Create the BillboardGui
    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Name = "NameTag"
    billboardGui.Adornee = head
    billboardGui.Size = UDim2.new(0, 200, 0, 50)
    billboardGui.StudsOffset = Vector3.new(0, 2, 0)
    billboardGui.AlwaysOnTop = true

    -- Create the TextLabel
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = player.Name
    textLabel.TextColor3 = Color3.new(1, 1, 1)
    textLabel.TextStrokeTransparency = 0.5
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.TextScaled = true

    -- Parent the TextLabel to the BillboardGui
    textLabel.Parent = billboardGui

    -- Parent the BillboardGui to the player's head
    billboardGui.Parent = head
end

-- Connect to PlayerAdded event
Players.PlayerAdded:Connect(function(player)
    -- Create the name tag when the player joins
    player.CharacterAdded:Connect(function(character)
        createNameTag(player)
    end)
end)

-- Create name tags for players already in the game
for _, player in pairs(Players:GetPlayers()) do
    if player.Character then
        createNameTag(player)
    end
end
