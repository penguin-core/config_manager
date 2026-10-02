local appMod = { "ctrl", "cmd" }

hs.hotkey.bind(appMod, "0", function()
	local finder = hs.application.get("Finder")

	if finder then
		for _, window in ipairs(finder:allWindows()) do
			if window:isStandard() then
				hs.application.launchOrFocus("Finder")
				return
			end
		end
	end

	hs.execute('open "$HOME/Desktop"')
end)

hs.hotkey.bind(appMod, "Left", function()
	hs.application.launchOrFocus("Ghostty")
end)

hs.hotkey.bind(appMod, "Up", function()
	hs.application.launchOrFocus("Safari")
end)

hs.hotkey.bind(appMod, "Down", function()
	hs.application.launchOrFocus("Firefox")
end)

hs.hotkey.bind(appMod, "Right", function()
	hs.application.launchOrFocus("Preview")
end)

hs.hotkey.bind(appMod, "k", function()
	local app = hs.application.get("Stickies")

	if app then
		app:activate(true)
	else
		hs.application.launchOrFocus("Stickies")
	end
end)

hs.hotkey.bind(appMod, "n", function()
	hs.application.launchOrFocus("Notes")
end)

hs.hotkey.bind(appMod, "c", function()
	hs.application.launchOrFocus("Calendar")
end)

hs.hotkey.bind(appMod, "o", function()
	hs.application.launchOrFocus("Microsoft Outlook")
end)

hs.hotkey.bind(appMod, "m", function()
	hs.application.launchOrFocus("Microsoft Teams")
end)

hs.hotkey.bind(appMod, "v", function()
	hs.application.launchOrFocus("Visual Studio Code")
end)

hs.hotkey.bind(appMod, "z", function()
	hs.application.launchOrFocus("Zotero")
end)

----------------------------------------------------------
local tempAppKey = "temporaryApp"

-- Assign the currently focused app
hs.hotkey.bind(appMod, "8", function()
	local app = hs.application.frontmostApplication()

	if app then
		hs.settings.set(tempAppKey, app:bundleID())
		hs.alert.show("Temporary app: " .. app:name())
	end
end)

-- Open/focus the assigned temporary app
hs.hotkey.bind(appMod, "9", function()
	local bundleID = hs.settings.get(tempAppKey)

	if bundleID then
		hs.application.launchOrFocusByBundleID(bundleID)
	else
		hs.alert.show("No temporary app assigned")
	end
end)
