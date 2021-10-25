HelloAce.defaults = {
	profile = {
		someToggle = true,
		someRange = 7,
		someInput = "Hello World",
		someSelect = 2, -- Banana
	},
}

-- https://www.wowace.com/projects/ace3/pages/ace-config-3-0-options-tables
HelloAce.options = {
	type = "group",
	name = "HelloAce (label 2)",
	handler = HelloAce,
	args = {
		someToggle = {
			type = "toggle",
			order = 1,
			name = "a checkbox",
			desc = "some description",
			-- inline getter/setter example
			get = function(info) return HelloAce.db.profile.someToggle end,
			set = function(info, value) HelloAce.db.profile.someToggle = value end,
		},
		someRange = {
			type = "range",
			order = 2,
			name = "a slider",
			-- this will look for a getter/setter on our handler object
			get = "GetSomeRange",
			set = "SetSomeRange",
			min = 1, max = 10, step = 1,
		},
		group1 = {
			type = "group",
			order = 3,
			name = "a group",
			inline = true,
			-- getters/setters can be inherited through the table tree
			get = "GetValue",
			set = "SetValue",
			args = {
				someInput = {
					type = "input",
					order = 1,
					name = "an input box",
					width = "double",
				},
				someDescription = {
					type = "description",
					order = 2,
					name = "Ace3 is neat",
					fontSize = "large",
				},
				someSelect = {
					type = "select",
					order = 3,
					name = "a dropdown",
					values = {"Apple", "Banana", "Strawberry"},
				},
			},
		},
	},
}

function HelloAce:GetSomeRange(info)
    return self.db.profile.someRange
end

function HelloAce:SetSomeRange(info, value)
    self.db.profile.someRange = value
end

-- https://www.wowace.com/projects/ace3/pages/ace-config-3-0-options-tables#title-4-1
function HelloAce:GetValue(info)
	return self.db.profile[info[#info]]
end

function HelloAce:SetValue(info, value)
	self.db.profile[info[#info]] = value
end
