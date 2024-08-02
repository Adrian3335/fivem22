Config = {}

Config.Support = "discord.gg/0resmon"

Config.OpenKey = 38

Config.MoneyIsItem = false

Config.SellTax = 10

Config.PutOnlyOwnedVehicleInGarage = 1


Config.Aparts = {

  ["apartment3"] = {
      out = vector3(-782.2, 319, 187.9),
      manage = vector3(-785.6, 327.3, 187.3),
      garage = vector3(232.4, -1005.8, -99.0),
      stash = vector3(-796.5, 328.2, 187.3),
      garage_out_heading = 350.6,
  }

}


Config.Houses = { 
    { 
      name = "Dom na sprzedaz",
      price = 500000,
      coords = {      
        house_in = vector3(-974.3, 582.2, 102.7),
        house_out = Config.Aparts["apartment3"].out, -- vector3(-782.2, 319, 187.9)
        garage_in = vector3(-986.3, 584.6, 102.4),
        garage_out = Config.Aparts["apartment3"].garage, -- vector3(232.4, -1005.8, -99)
        manage = Config.Aparts["apartment3"].manage, -- vector3(-785.6, 327.3, 187.3)
        stash = Config.Aparts["apartment3"].stash,
        garage_out_heading = Config.Aparts["apartment3"].garage_out_heading, --  350.6
      },
      owner = "",
      friends = {},
      garage = {},
      stars = 2,
      theme = "modern",
      garage_stock = 10,
      pool_or_garden = true,
      extends = {},
    },
    { 
      name = "Dom na sprzedaz",
      price = 500000,
      coords = {      
        house_in = vector3(-947.8, 568.4, 101.5),
        house_out = Config.Aparts["apartment3"].out, -- vector3(-782.2, 319, 187.9)
        garage_in = vector3(-955.9, 578.5, 101.2),
        garage_out = Config.Aparts["apartment3"].garage,
        manage = Config.Aparts["apartment3"].manage, -- vector3(-785.6, 327.3, 187.3)
        stash = Config.Aparts["apartment3"].stash,
        garage_out_heading = Config.Aparts["apartment3"].garage_out_heading, --  350.6
      },
      owner = "",
      friends = {},
      garage = {},
      stars = 3,
      theme = "modern",
      garage_stock = 10,
      pool_or_garden = true,
      extends = {},
    },
    { 
      name = "Dom na sprzedaz",
      price = 500000,
      coords = {      
        house_in = vector3(-958.4, 607.1, 106.3),
        house_out = Config.Aparts["apartment3"].out, -- vector3(-782.2, 319, 187.9)
        garage_in = vector3(-945.1, 597.8, 101.0),
        garage_out = Config.Aparts["apartment3"].garage,
        manage = Config.Aparts["apartment3"].manage, -- vector3(-785.6, 327.3, 187.3)
        stash = Config.Aparts["apartment3"].stash,
        garage_out_heading = Config.Aparts["apartment3"].garage_out_heading, --  350.6
      },
      owner = "",
      friends = {},
      garage = {},
      stars = 4,
      theme = "modern",
      garage_stock = 10,
      pool_or_garden = false,
      extends = {},
    }
	
	
	
}

Config.Houses_Template = { 
    name = "Dom na sprzedaz",
    price = 5,
    coords = {      
      house_in = vector3(1,1,1),
      house_out = vector3(1,1,1),
      garage_in = vector3(1,1,1),
      garage_out = vector3(1,1,1),
      stash = vector3(1,1,1)
    },
    owner = "",
    friends = {  },
    garage = {},
    theme = "modern",
    stars = 1,
    garage_stock = 6,
    extends = {},
}




Config.GaragePos = {

  { coord =  vector3(233.5064, -1000.765, -99.41049), h = 90.1  },
  { coord =  vector3(233.5064, -996.7, -99.41049), h = 90.1  },
  { coord =  vector3(233.5064, -992.7, -99.41049), h = 90.1  },
  { coord =  vector3(233.5064, -988.7, -99.41049), h = 90.1  },
  { coord =  vector3(233.5064, -984.7, -99.41049), h = 90.1  },
  { coord =  vector3(223.23, -1000.41, -99.41229), h = 270.1  },
  { coord =  vector3(223.23, -996.41, -99.41229), h = 270.1  },
  { coord =  vector3(223.23, -992.41, -99.41229), h = 270.1  },
  { coord =  vector3(223.23, -988.41, -99.41229), h = 270.1  },
  { coord =  vector3(223.23, -984.41, -99.41229), h = 270.1  },

}

Config.StashFunction = function(id)
   TriggerServerEvent("inventory:server:OpenInventory", "stash", "HOUSE-"..id)
   TriggerEvent("inventory:client:SetCurrentStash", "HOUSE-"..id)
end 