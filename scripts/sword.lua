SwordItem = class(CustomItem)

function SwordItem:init(name, code, element)
    self:createItem(name)
    self.code = code
    self:setProperty("active", false)
    self:setProperty("level", 1)
    self.ItemInstance.PotentialIcon = self.activeImage
	self:setProperty("element", element)
    self:updateIcon()    
end

function SwordItem:setActive(active)
    self:setProperty("active", active)
end

function SwordItem:getActive()
    return self:getProperty("active")
end

function SwordItem:setLevel()
	newLevel = self:getProperty("level") + 1
	if newLevel == 4 then
		newLevel = 1
	end
    self:setProperty("level", newLevel)
end

function SwordItem:updateIcon()
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

function SwordItem:onLeftClick()
    self:setActive(not self:getActive())
end

function SwordItem:onRightClick()
    self:setLevel()
	element = self:getProperty("element")
end

function SwordItem:canProvideCode(code)
    if code == self.code then
        return true
    else
        return false
    end
end

function SwordItem:providesCode(code)
    if code == self.code and self:getActive() then
        return 2
    end
    return 0
end

function SwordItem:advanceToCode(code)
    if code == nil or code == self.code then
        self:setActive(true)
    end
end

function SwordItem:save()
    local saveData = {}
    saveData["active"] = self.getActive()
    return saveData
end

function SwordItem:Load(data)
    if data["active"] ~= nil then
        self:setActive(data["active"])
    end
    return true
end

function SwordItem:propertyChanged(key, value)
    self:updateIcon()
end