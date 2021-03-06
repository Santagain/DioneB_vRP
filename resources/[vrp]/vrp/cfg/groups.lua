
local cfg = {}

-- define each group with a set of permissions
-- _config property:
--- title (optional): group display name
--- gtype (optional): used to have only one group with the same gtype per player (example: a job gtype to only have one job)
--- onspawn (optional): function(player) (called when the player spawn with the group)
--- onjoin (optional): function(player) (called when the player join the group)
--- onleave (optional): function(player) (called when the player leave the group)
--- (you have direct access to vRP and vRPclient, the tunnel to client, in the config callbacks)

cfg.groups = {
  ["superadmin"] = {
    _config = {onspawn = function(player) vRPclient._notify(player,'info',30,'Bem-Vindo!','Você é um SuperAdmin') end},
    "spawnvehicle",
    "whitelist",
    "givemoney",
    "giveitem",
    "coords",
    "tptome",
    "tpcds",
    "tpway",
    "tpto",
    "noclip",
    "heal",
  },
  ["admin"] = {
    "whitelist",
    "coords",
    "tptome",
    "tpcds",
    "tpto",
    "noclip",
    "heal",
  },

  ["user"] = {
    "perm",
  },
  ["police"] = {
    _config = {
      title = "Police",
      gtype = "job",
      onjoin = function(player) vRPclient._setCop(player,true) end,
      onspawn = function(player) vRPclient._setCop(player,true) end,
      onleave = function(player) vRPclient._setCop(player,false) end
    },
    "police.menu",
    "police.cloakroom",
    "police.pc",
    "police.handcuff",
    "police.drag",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
    "-police.store_weapons",
    "-police.seizable" -- negative permission, police can't seize itself, even if another group add the permission
  },
  ["emergency"] = {
    _config = {
      title = "Emergency",
      gtype = "job"
    },
    "emergency.revive",
    "emergency.shop",
    "emergency.service"
  },
  ["repair"] = {
    _config = {
      title = "Repair",
      gtype = "job"
    },
    "vehicle.repair",
    "vehicle.replace",
    "repair.service"
  },
  ["taxi"] = {
    _config = {
      title = "Taxi",
      gtype = "job"
    },
    "taxi.service"
  },
  ["citizen"] = {
    _config = {
      title = "Citizen",
      gtype = "job"
    }
  }
}

-- groups are added dynamically using the API or the menu, but you can add group when an user join here
cfg.users = {
  [1] = { -- give superadmin and admin group to the first created user on the database
    "superadmin",
    "admin"
  }
}


return cfg

