UIImprove = {};
UIImprove.modName = "UIImprove";

---Печатает сообщение в лог файл.
---@param message string
UIImprove.log = function (message, ...)
    print(UIImprove.modName, "Info", message, ...);
end

---Печатает предупреждения в лог файл.
---@param message string
UIImprove.logWarn = function (message, ...)
    print(UIImprove.modName, "Warning", message, ...);
end

---Печатает ошибки в лог файл.
---@param message string
UIImprove.logErr = function (message, ...)
    print(UIImprove.modName, "ERROR", message, ...);
end

--- func desc
---@param self any
UIImprove.OnGameStart = function ()
    --UIImprove:log("Event:OnGameStart","start");
    ---@TODO:сделать настройки мода
    --UIImprove:log("Event:OnGameStart","end");
end

Events.OnGameStart.Add(UIImprove.OnGameStart)