HelloAce = LibStub("AceAddon-3.0"):NewAddon("HelloAce", "AceEvent-3.0", "AceConsole-3.0")
local AC = LibStub("AceConfig-3.0")
local ACD = LibStub("AceConfigDialog-3.0")

function HelloAce:OnInitialize()
	-- uses the "Default" profile instead of character-specific profiles
	-- https://www.wowace.com/projects/ace3/pages/api/ace-db-3-0
	self.db = LibStub("AceDB-3.0"):New("HelloAceDB", self.defaults, true)

	-- registers an options table and adds it to the Blizzard options window
	-- https://www.wowace.com/projects/ace3/pages/api/ace-config-registry-3-0
	AC:RegisterOptionsTable("HelloAce_Options", self.options)
	self.optionsFrame = ACD:AddToBlizOptions("HelloAce_Options", "HelloAce (label 1)")

	-- adds a child options table, in this case our profiles panel
	local profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
	AC:RegisterOptionsTable("HelloAce_Profiles", profiles)
	ACD:AddToBlizOptions("HelloAce_Profiles", "Profiles", "HelloAce (label 1)")

	-- https://www.wowace.com/projects/ace3/pages/api/ace-console-3-0
	self:RegisterChatCommand("ha", "SlashCommand")
	self:RegisterChatCommand("helloace", "SlashCommand")

	self:GetCharacterInfo()
end

function HelloAce:OnEnable()
	self:RegisterEvent("PLAYER_STARTED_MOVING")
	self:RegisterEvent("CHAT_MSG_CHANNEL")
end

function HelloAce:PLAYER_STARTED_MOVING(event)
	print(event)
end

function HelloAce:CHAT_MSG_CHANNEL(event, text, ...)
	print(event, text, ...)
end

function HelloAce:GetCharacterInfo()
	-- stores character-specific data
	self.db.char.level = UnitLevel("player")
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
		-- https://github.com/Stanzilla/WoWUIBugs/issues/89
		InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
		InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
		--[[ or as a standalone window
		if ACD.OpenFrames["HelloAce_Options"] then
			ACD:Close("HelloAce_Options")
		else
			ACD:Open("HelloAce_Options")
		end
		]]
	end
end
