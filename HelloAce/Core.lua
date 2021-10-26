-- we can mixin more Ace libs here
HelloAce = LibStub("AceAddon-3.0"):NewAddon("HelloAce", "AceEvent-3.0", "AceConsole-3.0")

local ACR = LibStub("AceConfigRegistry-3.0")
local ACD = LibStub("AceConfigDialog-3.0")

function HelloAce:OnInitialize()
	-- uses the "Default" profile instead of character-specific profiles
	-- https://www.wowace.com/projects/ace3/pages/api/ace-db-3-0
	self.db = LibStub("AceDB-3.0"):New("HelloAceDB", self.defaults, true)

	-- registers an options table and adds it to the Blizzard options window
	-- https://www.wowace.com/projects/ace3/pages/api/ace-config-registry-3-0
	ACR:RegisterOptionsTable("HelloAce_Options", self.options)
	ACD:AddToBlizOptions("HelloAce_Options", "HelloAce (label 1)")

	-- adds a child options table, in this case our profiles panel
	local profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
	ACR:RegisterOptionsTable("HelloAce_Profiles", profiles)
	ACD:AddToBlizOptions("HelloAce_Profiles", "Profiles", "HelloAce_Options")

	-- https://www.wowace.com/projects/ace3/pages/api/ace-console-3-0
	self:RegisterChatCommand("ha", "SlashCommand")
	self:RegisterChatCommand("helloace", "SlashCommand")

	-- stores character-specific data
	self.db.char.level = UnitLevel("player")
end

function HelloAce:OnEnable()
	self:RegisterEvent("PLAYER_STARTED_MOVING")
	self:RegisterEvent("CHAT_MSG_CHANNEL")
end

function HelloAce:PLAYER_STARTED_MOVING(event)
	print(event)
end

function HelloAce:CHAT_MSG_CHANNEL(event, text, ...)
	-- prints the whole event payload
	print(event, text, ...)
end

function HelloAce:SlashCommand(input, editbox)
	if input == "enable" then
		self:Enable()
	elseif input == "disable" then
		-- unregisters all events and calls HelloAce:OnDisable() if you defined that
		self:Disable()
	elseif input == "message" then
		print("this is our saved message:", self.db.profile.someInput)
	else
		self:Print("some useful help message")
		-- we can also show the options as a standalone window
		ACD:Open("HelloAce_Options")
	end
end
