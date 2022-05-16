PresetItem = class(CustomItem)

function PresetItem:init(name, code, flags)
    self:createItem(name)
    self.code = code
    self:setProperty("active", false)
    self:setProperty("level", 1)
    self.ItemInstance.PotentialIcon = self.activeImage
	self:setProperty("element", flags)
    self:updateIcon()    
end

function PresetItem:setActive(active)
    self:setProperty("active", active)
end

function PresetItem:getActive()
    return self:getProperty("active")
end

function PresetItem:setLevel()
	newLevel = self:getProperty("level") + 1
	if newLevel == 4 then
		newLevel = 1
	end
    self:setProperty("level", newLevel)
end

function PresetItem:updateIcon()
	newIcon = "images/swords/"
	newIcon = newIcon .. self:getProperty("element")
	if not self:getProperty("active") then
		newIcon = newIcon .. "_off"
	end
	level = self:getProperty("level")
	if level == 2 then
		newIcon = newIcon .. "2"
	end
	if level == 3 then
		newIcon = newIcon .. "3"
	end
	newIcon = newIcon .. ".png"

	self.ItemInstance.Icon = ImageReference:FromPackRelativePath(newIcon)
end

function PresetItem:onLeftClick()
    self:setActive(not self:getActive())
end

function PresetItem:onRightClick()
    self:setLevel()
	element = self:getProperty("element")
end

function PresetItem:canProvideCode(code)
    if code == self.code then
        return true
    else
        return false
    end
end

function PresetItem:providesCode(code)
    if code == self.code and self:getActive() then
        return 2
    end
    return 0
end

function PresetItem:advanceToCode(code)
    if code == nil or code == self.code then
        self:setActive(true)
    end
end

function PresetItem:save()
    local saveData = {}
    saveData["active"] = self.getActive()
    return saveData
end

function PresetItem:Load(data)
    if data["active"] ~= nil then
        self:setActive(data["active"])
    end
    return true
end

function PresetItem:propertyChanged(key, value)
    self:updateIcon()
end