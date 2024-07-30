--[[
    decrypted for reason: scamming
    opiumdev owns all
]]

local statsCache = {}

function calculateStats(vehicle)
  local info = {}

  local model = GetEntityModel(vehicle)
  local brand = GetLabelText(GetMakeNameFromVehicleModel(model))
  if brand == "NULL" or brand == "null" then
    brand = "IMPORT"
  end
  if statsCache[model] then return statsCache[model] end

  local isMotorCycle = IsThisModelABike(model) or (GetVehicleClass(vehicle) == 8)
  local isBoat = IsThisModelABoat(model) or tonumber(model) == -1706603682 or (GetVehicleClass(vehicle) == 14)
  local fInitialDriveMaxFlatVel = getFieldFromHandling(vehicle, "fInitialDriveMaxFlatVel")
  local fInitialDriveForce = getFieldFromHandling(vehicle, "fInitialDriveForce")
  local fClutchChangeRateScaleUpShift = getFieldFromHandling(vehicle, "fClutchChangeRateScaleUpShift")
  local nInitialDriveGears = getFieldFromHandling(vehicle, "nInitialDriveGears")
  local fDriveBiasFront = getFieldFromHandling(vehicle, "fDriveBiasFront")
  local fInitialDragCoeff = getFieldFromHandling(vehicle, "fInitialDragCoeff")
  local fTractionCurveMax = getFieldFromHandling(vehicle, "fTractionCurveMax")
  local fTractionCurveMin = getFieldFromHandling(vehicle, "fTractionCurveMin")
  local fLowSpeedTractionLossMult = getFieldFromHandling(vehicle, "fLowSpeedTractionLossMult")
  local fSuspensionReboundDamp = getFieldFromHandling(vehicle, "fSuspensionReboundDamp")
  local fSuspensionReboundComp = 0.0
  local fAntiRollBarForce = getFieldFromHandling(vehicle, "fAntiRollBarForce")
  local fBrakeForce = getFieldFromHandling(vehicle, "fBrakeForce")
  local drivetrainMod = 0.0
  local force = fInitialDriveForce
	if fInitialDriveForce > 0 and fInitialDriveForce < 1 then
		force = force * 1.1
	end
	local accel = (fInitialDriveMaxFlatVel * force) / 10
	local speed = ((fInitialDriveMaxFlatVel / fInitialDragCoeff) * (fTractionCurveMax + fTractionCurveMin)) / 40
	if isMotorCycle then
		speed = speed * 2
	end
	local handling = (fTractionCurveMax + fSuspensionReboundDamp) * fTractionCurveMin
	if isMotorCycle then
		handling = handling / 2
	end
	local braking = ((fTractionCurveMin / fInitialDragCoeff) * fBrakeForce) * 7
	local perfRating = ((accel * 5) + speed + handling + braking) * 15

  
  if fDriveBiasFront > 0.5 then
      --fwd
      drivetrainMod = 1.0-fDriveBiasFront
  else
      --rwd
      drivetrainMod = fDriveBiasFront
  end

  local score = {
      accel = 0.0,
      speed = 0.0,
      handling = 0.0,
      braking = 0.0,
      drivetrain = 0.0,
  }

  score.drivetrain = fDriveBiasFront

  local force = fInitialDriveForce
  if fInitialDriveForce > 0 and fInitialDriveForce < 1 then
      force = (force + drivetrainMod*0.15) * 1.1
  end

  -- SPEED -- 
  local speedScore = ((fInitialDriveMaxFlatVel / fInitialDragCoeff) * (fTractionCurveMax + fTractionCurveMin)) / 40
--  score.speed = speedScore
  
  local spid = math.ceil(fInitialDriveMaxFlatVel * 1.3)
  score.speed = (spid / 300) * 10

  -- ACCELERATION -- 
  local accelScore = (fInitialDriveMaxFlatVel * force + (fClutchChangeRateScaleUpShift*0.7)) / 10
  score.accel = accelScore

  -- HANDLING -- 
  local lowSpeedTraction = 1.0
  if fLowSpeedTractionLossMult >= 1.0 then
      lowSpeedTraction = lowSpeedTraction + (fLowSpeedTractionLossMult-lowSpeedTraction)*0.15
  else
      lowSpeedTraction = lowSpeedTraction - (lowSpeedTraction - fLowSpeedTractionLossMult)*0.15
  end
  local handlingScore = (fTractionCurveMax + (fSuspensionReboundDamp+fSuspensionReboundComp+fAntiRollBarForce)/3) * (fTractionCurveMin/lowSpeedTraction) + drivetrainMod
  score.handling = handlingScore

  -- BRAKING -- 
  local brakingScore = ((fTractionCurveMin / fTractionCurveMax ) * fBrakeForce) * 7
  score.braking = brakingScore
  if isBoat or not tonumber(score.braking) then
    score.braking = 0.0
  end
  -- Balance -- 
  local balance = {
    acceleration = 4,
    speed = 3,
    handling = 2,
    braking = 1,
    ratingMultiplier = 12
  }
  local performanceScore = math.floor(((accelScore * balance.acceleration) + (speedScore*balance.speed) + (handlingScore*balance.handling) + (brakingScore*balance.braking)) * balance.ratingMultiplier )
  -- Get class --
  if isMotorCycle then
		class = "M"
	elseif perfRating > 700 then
		class = "S"
	elseif perfRating > 550 then
		class = "A"
	elseif perfRating > 400 then
		class = "B"
	elseif perfRating > 325 then
		class = "C"
	else
		class = "D"
	end
  local info = {}
  info['acceleration'] = {name = UILang['acceleration'], value = score.accel}
  info['handling'] = {name = UILang['handling'], value = score.handling}
  info['speed'] = {name = UILang['speed'], value = score.speed}
  info['braking'] = {name = UILang['braking'], value = score.braking}
  statsCache[model] = {info = info, class = class, brand = brand}
  return statsCache[model]
end

function getFieldFromHandling(vehicle, field)
  return GetVehicleHandlingFloat(vehicle, 'CHandlingData', field)
end