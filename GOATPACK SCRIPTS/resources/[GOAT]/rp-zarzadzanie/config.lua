Config = {}


Config.Cars = {
    ['police'] = {
        [1] = {
            model = 'polvic'
        },
        [2] = {
            model = 'polscout'
        },
        [3] = {
            model = 'polbuffalo4'
        },
        [4] = {
            model = 'poltorrence'
        },
        [5] = {
            model = 'polriot'
        },
        [6] = {
            model = 'polgranger2'
        },
        [7] = {
            model = 'polvigero'
        },
        [8] = {
            model = 'pd_durango'
        },
        [9] = {
            model = 'pd_explorer16'
        },
        [10] = {
            model = 'pd_hellcat'
        },
        [11] = {
            model = 'pd_mustang'
        },
        [12] = {
            model = 'pd_victoria'
        },
        [13] = {
            model = 'swathummer'
        },
        [14] = {
            model = 'vc_polchallenger'
        },
        [15] = {
            model = 'vc_polcharger22'
        },
        [16] = {
            model = 'vc_polg63221'
        }
    },
    ['tunerszone'] = {
        [1] = {
            model = 'police'
        },
        [2] = {
            model = 'xa'
        },
        [3] = {
            model = 'bati'
        },
        [4] = {
            model = 'bmx'
        },
        [5] = {
            model = 'police4'
        }
    },
    ['ambulance'] = {
        [1] = {
            model = 'ms_charger'
        },
        [2] = {
            model = 'ms_fusion16'
        },
        [3] = {
            model = 'ms_impala'
        },
        [4] = {
            model = 'ms_jeep'
        },
        [5] = {
            model = 'ms_m5'
        },
        [6] = {
            model = 'ms_ram19'
        },
        [7] = {
            model = 'ms_tahoe21'
        },
        [8] = {
            model = 'ms_transformer'
        },
        [9] = {
            model = 'ems_nspeedo'
        },

    },
}

function sprawdzPojazd(job, nazwaPojazdu)
    if Config.Cars[job] and Config.Cars[job][1] then
        for _, v in ipairs(Config.Cars[job]) do
            if v.model == nazwaPojazdu then
                return true
            end
        end
    end
    return false
end

-- function sprawdzJoba(job)
--         for jobik, _ in ipairs(Config.Cars) do
--             if jobik == job then
--                 return true
--             end
--         end
--     return false
-- end
