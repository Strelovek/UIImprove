require 'ISUI/ISCollapsableWindow';
require 'ISUI/ISLabel';
require 'UIImprove';

UIImproveSafehouseWarning = ISCollapsableWindow:derive("UIImproveSafehouseWarning");
--- Окно с напоминанием проверить возрождение в доме.
g_UIImproveSafehouseWarning = nil;

--- Конструктор класса UIImproveSafehouseWarning
function UIImproveSafehouseWarning:new(x, y, width, height)
  --UIImprove.log("UIImproveSafehouseWarning:new()","start");
  local o = ISCollapsableWindow:new(x, y, width, height);
  setmetatable(o, self)
  self.__index          = self
  o.title               = "Warning";
  o.pin                 = true;
  o.resizable           = false;
  o.backgroundColor     = {r=0, g=0, b=0, a=0.8};
  --UIImprove.log("UIImproveSafehouseWarning:new()","end");
  return o;
end

--- Добавляет текст в окно с предупреждением.
function UIImproveSafehouseWarning:createChildren()
  --UIImprove.log("UIImproveSafehouseWarning:createChildren()","start");
  ISCollapsableWindow.createChildren(self);
  self.body = ISRichTextPanel:new(0, 16, 150, 200);
  self.body:initialise();
  self.body.marginTop = 3;
  self.body.text = "check respawn in safehouse";
  self:addChild(self.body);
  g_UIImproveSafehouseWarning.body:paginate();
  --UIImprove.log("UIImproveSafehouseWarning:createChildren()","end");
end

--- Создаёт окно с напоминанием, когда сохранение полностью загружено.
local function OnLoad()
  --UIImprove.log("Event:OnLoad","start");
  g_UIImproveSafehouseWarning = UIImproveSafehouseWarning:new(getCore():getScreenWidth()/2-75, getCore():getScreenHeight()/2-100, 150, 200);
  g_UIImproveSafehouseWarning:addToUIManager();
  g_UIImproveSafehouseWarning:setVisible(true);
  --UIImprove.log("Event:OnLoad","end");
end

Events.OnLoad.Add(OnLoad)