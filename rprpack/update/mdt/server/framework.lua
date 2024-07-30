FRAMEWORK = {}
ESX = {}
QB = {}
CUSTOM = {}

if Config.ESX.enabled then
    ESX = exports[Config.ESX.frameworkScript][Config.ESX.frameworkExport]()
elseif Config.QB.enabled then
    QBCore = exports[Config.QB.frameworkScript][Config.QB.frameworkExport]()
else
    -- CUSTOM = YOUR OWN FRAMEWORK EXPORT
end
--