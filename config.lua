Config = {}

Config.Framework = 'qb' -- qbx or qb
Config.OpenMenu = 'I' -- https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
Config.Notify = 'ox' -- qb or ox or ps
Config.StressChance = 0.1 -- Default: 10% -- Percentage Stress Chance When Shooting (0-1)
Config.MaxShotBeforeStress = 10 -- Default: 5 -- Maximum Amount
Config.UseMPH = true -- If true speed math will be done as MPH, if false KPH will be used (YOU HAVE TO CHANGE CONTENT IN STYLES.CSS TO DISPLAY THE CORRECT TEXT)
Config.MinimumStress = 50 -- Minimum Stress Level For Screen Shaking
Config.MinimumSpeedUnbuckled = 50 -- Going Over This Speed Will Cause Stress
Config.MinimumSpeed = 100 -- Going Over This Speed Will Cause Stress
Config.BikeSpeed = 90 -- Going Over This Speed Will Cause Stress for Bike users
Config.FlyingSpeed = 150 -- Going Over This Speed Will Cause Stress for Aircraft users
Config.SeatBeltSpeed = 10 -- Going over this speed will make the seatbelt sound
Config.PersistantArmor = true -- If true, armor will be save when people log out

Config.DisableStress = { -- job TYPES that you want to disable stress for
    'leo',
    'ambulance',
   -- 'all' -- If you want to disable stress for all jobs, uncomment this line
}

Config.FuelScript = 'LegacyFuel' -- ps-fuel/lj-fuel/LegacyFuel/cdn-fuel or if you use ox_fuel then you can ignore as we hard check for it in the fuelCheck function

-- Admin only to change hud icons/shapes
Config.AdminOnly = false

-- Stress
Config.WhitelistedWeaponArmed = { -- weapons specifically whitelisted to not show armed mode
    -- miscellaneous
    `weapon_petrolcan`,
    `weapon_hazardcan`,
    `weapon_fireextinguisher`,
    -- melee
    `weapon_dagger`,
    `weapon_bat`,
    `weapon_bottle`,
    `weapon_crowbar`,
    `weapon_flashlight`,
    `weapon_golfclub`,
    `weapon_hammer`,
    `weapon_hatchet`,
    `weapon_knuckle`,
    `weapon_knife`,
    `weapon_machete`,
    `weapon_switchblade`,
    `weapon_nightstick`,
    `weapon_wrench`,
    `weapon_battleaxe`,
    `weapon_poolcue`,
    `weapon_briefcase`,
    `weapon_briefcase_02`,
    `weapon_garbagebag`,
    `weapon_handcuffs`,
    `weapon_bread`,
    `weapon_stone_hatchet`,
    -- throwables
    `weapon_grenade`,
    `weapon_bzgas`,
    `weapon_molotov`,
    `weapon_stickybomb`,
    `weapon_proxmine`,
    `weapon_snowball`,
    `weapon_pipebomb`,
    `weapon_ball`,
    `weapon_smokegrenade`,
    `weapon_flare`
}

Config.WhitelistedWeaponStress = {
    `weapon_petrolcan`,
    `weapon_hazardcan`,
    `weapon_fireextinguisher`
}

Config.Intensity = {
    ["blur"] = {
        [1] = {
            min = 50,
            max = 60,
            intensity = 1500,
        },
        [2] = {
            min = 60,
            max = 70,
            intensity = 2000,
        },
        [3] = {
            min = 70,
            max = 80,
            intensity = 2500,
        },
        [4] = {
            min = 80,
            max = 90,
            intensity = 2700,
        },
        [5] = {
            min = 90,
            max = 100,
            intensity = 3000,
        },
    }
}

Config.EffectInterval = {
    [1] = {
        min = 50,
        max = 60,
        timeout = math.random(50000, 60000)
    },
    [2] = {
        min = 60,
        max = 70,
        timeout = math.random(40000, 50000)
    },
    [3] = {
        min = 70,
        max = 80,
        timeout = math.random(30000, 40000)
    },
    [4] = {
        min = 80,
        max = 90,
        timeout = math.random(20000, 30000)
    },
    [5] = {
        min = 90,
        max = 100,
        timeout = math.random(15000, 20000)
    }
}

Config.FuelBlacklist = {
	"surge",
	"iwagen",
	"voltic",
	"voltic2",
	"raiden",
	"cyclone",
	"tezeract",
	"neon",
	"omnisegt",
	"iwagen",
	"caddy",
	"caddy2",
	"caddy3",
	"airtug",
	"rcbandito",
	"imorgon",
	"dilettante",
	"khamelion",
	"wheelchair",
}

Config.VehClassStress = { -- Enable/Disable gaining stress from vehicle classes in this table
    ['0'] = true, -- Compacts
    ['1'] = true, -- Sedans
    ['2'] = true, -- SUVs
    ['3'] = true, -- Coupes
    ['4'] = true, -- Muscle
    ['5'] = true,  -- Sports Classics
    ['6'] = true, -- Sports
    ['7'] = true, -- Super
    ['8'] = false, -- Motorcycles
    ['9'] = true, -- Off Road
    ['10'] = true, -- Industrial
    ['11'] = true,  -- Utility
    ['12'] = true,  -- Vans
    ['13'] = false, -- Cycles
    ['14'] = false, -- Boats
    ['15'] = false, -- Helicopters
    ['16'] = false, -- Planes
    ['18'] = false, -- Emergency
    ['19'] = false, -- Military
    ['20'] = false, -- Commercial
    ['21'] = false  -- Trains
}
