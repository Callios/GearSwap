----------------------------------------------------------------------------------------
--  __  __           _                     __   _____                        _
-- |  \/  |         | |                   / _| |  __ \                      | |
-- | \  / | __ _ ___| |_ ___ _ __    ___ | |_  | |__) |   _ _ __  _ __   ___| |_ ___
-- | |\/| |/ _` / __| __/ _ \ '__|  / _ \|  _| |  ___/ | | | '_ \| '_ \ / _ \ __/ __|
-- | |  | | (_| \__ \ ||  __/ |    | (_) | |   | |   | |_| | |_) | |_) |  __/ |_\__ \
-- |_|  |_|\__,_|___/\__\___|_|     \___/|_|   |_|    \__,_| .__/| .__/ \___|\__|___/
--                                                         | |   | |
--                                                         |_|   |_|
-----------------------------------------------------------------------------------------
--[[
    Originally Created By: Faloun
    Programmers: Arrchie, Kuroganashi, Byrne, Tuna
    Testers:Arrchie, Kuroganashi, Haxetc, Patb, Whirlin, Petsmart
    Contributors: Xilkk, Byrne, Blackhalo714
    ASCII Art Generator: http://www.network-science.de/ascii/
    
]]

-- Initialization function for this job file.
-- IMPORTANT: Make sure to also get the Mote-Include.lua file (and its supplementary files) to go with this.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include("Mote-Include.lua")
end

function user_setup()
    -- Alt-F10 - Toggles Kiting Mode.

    --[[
        F9 - Cycle Offense Mode (the offensive half of all 'hybrid' melee modes).
        
        These are for when you are fighting with or without Pet
        When you are IDLE and Pet is ENGAGED that is handled by the Idle Sets
    ]]
    state.OffenseMode:options("Mpaca", "PetEnmity","PetTank", "Rao", "PetTP", "PetDA", "Malignance")

    --[[
        Ctrl-F9 - Cycle Hybrid Mode (the defensive half of all 'hybrid' melee modes).
        
        Used when you are Engaged with Pet
        Used when you are Idle and Pet is Engaged
    ]]
    state.HybridMode:options("Master", "DualTP", "Pet")

    --[[
        Alt-F12 - Turns off any emergency mode
        
        Ctrl-F10 - Cycle type of Physical Defense Mode in use.
        F10 - Activate emergency Physical Defense Mode. Replaces Magical Defense Mode, if that was active.
    ]]
    state.PhysicalDefenseMode:options("Normal", "PetDT", "Malignance")

    --[[
        Alt-F12 - Turns off any emergency mode
        F11 - Activate emergency Magical Defense Mode. Replaces Physical Defense Mode, if that was active.
    ]]
    state.MagicalDefenseMode:options("PetMDT")

    --[[ IDLE Mode Notes:
        F12 - Update currently equipped gear, and report current status.
        Ctrl-F12 - Cycle Idle Mode.
        
        Will automatically set IdleMode to Idle when Pet becomes Engaged and you are Idle
    ]]
    state.IdleMode:options("Malignance","Mpaca","PetTP", "PetDA", "PetTank", "PetEnmity", "Rao")

    --Various Cycles for the different types of PetModes
    state.PetStyleCycleTank = M {"NORMAL", "DD", "MAGIC", "SPAM"}
    state.PetStyleCycleMage = M {"NORMAL", "HEAL", "SUPPORT", "MB", "DD"}
    state.PetStyleCycleDD = M {"NORMAL", "BONE", "SPAM", "OD"}

    --The actual Pet Mode and Pet Style cycles
    --Default Mode is Tank
    state.PetModeCycle = M {"TANK", "DD", "MAGE"}
    --Default Pet Cycle is Tank
    state.PetStyleCycle = state.PetStyleCycleTank

    --Toggles
    --[[
        Alt + E will turn on or off Auto Maneuver
    ]]
    state.AutoMan = M(false, "Auto Maneuver")

    --[[
        //gs c toggle autodeploy
    ]]
    state.AutoDeploy = M(false, "Auto Deploy")

    --[[
        Alt + D will turn on or off Lock Pet DT
        (Note this will block all gearswapping when active)
    ]]
    state.LockPetDT = M(false, "Lock Pet DT")

    --[[
        Alt + (tilda) will turn on or off the Lock Weapon
    ]]
    state.LockWeapon = M(false, "Lock Weapon")

    --[[
        //gs c toggle setftp
    ]]
    state.SetFTP = M(false, "Set FTP")

   --[[
        This will hide the entire HUB
        //gs c hub all
    ]]
    state.textHideHUB = M(false, "Hide HUB")

    --[[
        This will hide the Mode on the HUB
        //gs c hub mode
    ]]
    state.textHideMode = M(false, "Hide Mode")

    --[[
        This will hide the State on the HUB
        //gs c hub state
    ]]
    state.textHideState = M(false, "Hide State")

    --[[
        This will hide the Options on the HUB
        //gs c hub options
    ]]
    state.textHideOptions = M(false, "Hide Options")

    --[[
        This will toggle the HUB lite mode
        //gs c hub lite
    ]]  
    state.useLightMode = M(false, "Toggles Lite mode")

    --[[
        This will toggle the default Keybinds set up for any changeable command on the window
        //gs c hub keybinds
    ]]
    state.Keybinds = M(true, "Hide Keybinds")

    --[[ 
        This will toggle the CP Mode 
        //gs c toggle CP 
    ]] 
    state.CP = M(false, "CP") 
    CP_CAPE = "Mecistopins mantle" 

    --[[
        Enter the slots you would lock based on a custom set up.
        Can be used in situation like Salvage where you don't want
        certain pieces to change.
        //gs c toggle customgearlock
        ]]
    state.CustomGearLock = M(false, "Custom Gear Lock")
    --Example customGearLock = T{"head", "waist"}
    customGearLock = T{}

    send_command("bind !f7 gs c cycle PetModeCycle")
    send_command("bind ^f7 gs c cycleback PetModeCycle")
    send_command("bind !f8 gs c cycle PetStyleCycle")
    send_command("bind ^f8 gs c cycleback PetStyleCycle")
	send_command("bind !f10 gs c cycleback PhysicalDefenseMode")
    send_command("bind !e gs c toggle AutoMan")
    send_command("bind !d gs c toggle LockPetDT")
    send_command("bind !f6 gs c predict")
    send_command("bind ^` gs c toggle LockWeapon")
    send_command("bind @home gs c toggle setftp")
    send_command("bind @PAGEUP gs c toggle autodeploy")
    send_command("bind @PAGEDOWN gs c hide keybinds")
    send_command("bind @end gs c toggle CP") 
    send_command("bind = gs c clear")

    select_default_macro_book()
	send_command('@wait 4;input /lockstyleset 088')
    send_command('@wait 6; input //lua l autopup')

    -- Adjust the X (horizontal) and Y (vertical) position here to adjust the window
    pos_x = 1400
    pos_y = 100
    setupTextWindow(pos_x, pos_y)
    
end

function file_unload()
    send_command("unbind !f7")
    send_command("unbind ^f7")
    send_command("unbind !f8")
    send_command("unbind ^f8")
    send_command("unbind !e")
    send_command("unbind !d")
    send_command("unbind !f6")
    send_command("unbind ^`")
    send_command("unbind @home")
    send_command("unbind @PAGEUP")
    send_command("unbind @PAGEDOWN")       
    send_command("unbind @end")
    send_command("unbind =")
end

function job_setup()
    include("PUP-LIB.lua")
end

function init_gear_sets()
    --Table of Contents
    ---Gear Variables
    ---Master Only Sets
    ---Hybrid Only Sets
    ---Pet Only Sets
    ---Misc Sets

    -------------------------------------------------------------------------
    --  _____                  __      __        _       _     _
    -- / ____|                 \ \    / /       (_)     | |   | |
    --| |  __  ___  __ _ _ __   \ \  / /_ _ _ __ _  __ _| |__ | | ___  ___
    --| | |_ |/ _ \/ _` | '__|   \ \/ / _` | '__| |/ _` | '_ \| |/ _ \/ __|
    --| |__| |  __/ (_| | |       \  / (_| | |  | | (_| | |_) | |  __/\__ \
    -- \_____|\___|\__,_|_|        \/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/
    -------------------------------------------------------------------------
    --[[
        This section is best ultilized for defining gear that is used among multiple sets
        You can simply use or ignore the below
    ]]
	
	gear.Pet = {}
	
	-- Used by strobes and such
	gear.Pet.Enmity = {
		head="Heyoka Cap +1",
		body="Heyoka Harness",
       	hands="Heyoka Mittens",
	   	legs="Heyoka Subligar",
	   	feet="Heyoka Leggings",
	   	left_ear="Rimeice Earring",
		right_ear="Domes. Earring",
		neck="Shulmanu Collar",
	}
	
    Animators = {}
    Animators.Range = "Animator P II"
    Animators.Melee = "Animator P +1"

    --Adjust to your reforge level
    --Sets up a Key, Value Pair
    Artifact_Foire = {}
    Artifact_Foire.Head_PRegen = "Foire Taj +1"
    Artifact_Foire.Body_WSD_PTank = "Foire Tobe +1"
    Artifact_Foire.Hands_Mane_Overload = "Foire Dastanas +1"
    Artifact_Foire.Legs_PCure = "Foire Churidars +1"
    Artifact_Foire.Feet_Repair_PMagic = "Foire Babouches +1"

    Relic_Pitre = {}
    Relic_Pitre.Head_PRegen = "Pitre Taj +2" --Enhances Optimization
    Relic_Pitre.Body_PTP = "Pitre Tobe +3" --Enhances Overdrive
    Relic_Pitre.Hands_WSD = "Pitre Dastanas +2" --Enhances Fine-Tuning
    Relic_Pitre.Legs_PMagic = "Pitre Churidars +3" --Enhances Ventriloquy
    Relic_Pitre.Feet_PMagic = "Pitre Babouches +1" --Role Reversal

    Empy_Karagoz = {}
    Empy_Karagoz.Head_PTPBonus = "Karagoz Capello +2"
    Empy_Karagoz.Body_Overload = "Karagoz Farsetto +1"
    Empy_Karagoz.Hands = "Karagoz guanti +1"
    Empy_Karagoz.Legs_Combat = "Karagoz pantaloni +1"
    Empy_Karagoz.Feet_Tatical = "Karagoz scrape +1 "

    --Taeon_DA = {}
    Taeon_DAHead = { name="Taeon Chapeau", augments={'Pet: Accuracy+21 Pet: Rng. Acc.+21','Pet: "Dbl. Atk."+5','Pet: Damage taken -2%'}}
    Taeon_DABody = { name="Taeon Tabard", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet: "Dbl. Atk."+4','Pet: Damage taken -3%'}}
    Taeon_DAHands = { name="Taeon Gloves", augments={'Pet: Accuracy+22 Pet: Rng. Acc.+22','Pet: "Dbl. Atk."+5','Pet: Damage taken -3%'}}
    Taeon_DALegs = { name="Taeon Tights", augments={'Pet: Accuracy+20 Pet: Rng. Acc.+20','Pet: "Dbl. Atk."+4','Pet: Damage taken -3%'}}
    Taeon_DaFeet = { name="Taeon Boots", augments={'Pet: Attack+25 Pet: Rng.Atk.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%'}}


    --PetWSDEX
    PetHercDexLegs = { name="Herculean Trousers", augments={'Pet: Attack+21 Pet: Rng.Atk.+21','Pet: "Store TP"+4','Pet: DEX+11','Pet: "Mag.Atk.Bns."+10',}}
    PetHercDexFeet = { name="Herculean Boots", augments={'Pet: Accuracy+30 Pet: Rng. Acc.+30','"Repair" potency +7%','Pet: DEX+7','Pet: "Mag.Atk.Bns."+12',}}



    Visucius = {}
	
    Visucius.PetDT = {
        name = "Visucius's Mantle",
        augments = {
            'Pet: Haste+10%',
        },
    }
	
    Visucius.PetMagic = {
        name = "Visucius's Mantle",
        augments = {
            'Pet: Haste+10%',
        }
    }
	
	Visucius.WS = {
		name = "Visucius's Mantle",
        augments = {'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10'}
	}
	
	Visucius.WSDEX = {
		name = "Visucius's Mantle",
        augments = {'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10'}
	}
	
	Visucius.Tank = {
		name="Visucius's Mantle",
		augments={'Pet: Regen+10'}
	}
	
	Visucius.TP = { name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10'}}
	
    Visucius.PetandMasterTP = { name="Visucius's Mantle",
    augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20',
    'Pet: Accuracy+10 Pet: Rng. Acc.+10',
    'Pet: Haste+10',
    'Pet: Damage taken -5%',}
}

    Visucius.WSSTR = {name="Visucius's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10',}}



	PET_TP_GEAR = {
	head={ name="Herculean Helm", augments={'Pet: "Store TP"+7','Pet: VIT+3',}},
    --body={ name="Herculean Vest", augments={'Pet: Attack+5 Pet: Rng.Atk.+5','Pet: "Store TP"+10',}},
    --relic body should go here +3
    body="Pitre Tobe +3",
    hands={ name="Herculean Gloves", augments={'Pet: "Store TP"+6','Pet: INT+6','Pet: Attack+7 Pet: Rng.Atk.+7',}},
    legs={ name="Herculean Trousers", augments={'Pet: Accuracy+26 Pet: Rng. Acc.+26','Pet: "Dbl. Atk."+3','Pet: Attack+15 Pet: Rng.Atk.+15',}},
    feet={ name="Herculean Boots", augments={'Pet: "Store TP"+9','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: "Mag.Atk.Bns."+12',}},
		ring1="Cath Palug Ring",
		ring2="Thurandaut Ring",
		ear1="Enmerkar Earring",
		ear2="Rimeice Earring",
		neck="Shulmanu Collar",
		back=Visucius.PetandMasterTP,
		waist="Klouskap Sash +1"
	}
	
    PetTank = {

    head={ name="Taeon Chapeau", augments={'Pet: Accuracy+21 Pet: Rng. Acc.+21','Pet: "Dbl. Atk."+5','Pet: Damage taken -2%',}},
    body={ name="Taeon Tabard", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet: "Dbl. Atk."+4','Pet: Damage taken -3%',}},
    hands={ name="Taeon Gloves", augments={'Pet: Accuracy+22 Pet: Rng. Acc.+22','Pet: "Dbl. Atk."+5','Pet: Damage taken -3%',}},
    legs={ name="Taeon Tights", augments={'Pet: Accuracy+20 Pet: Rng. Acc.+20','Pet: "Dbl. Atk."+4','Pet: Damage taken -3%',}},
    feet={ name="Taeon Boots", augments={'Pet: Attack+25 Pet: Rng.Atk.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
    ring1="Thurandaut ring",
    ring2="Cath Palug ring",
    waist="Isa belt",
    ear1="Handler's Earring +1",
    ear2="Rimiece Earring",
    back=Visucius.PetandMasterTP

    }

	PET_DA_GEAR = set_combine(PET_TP_GEAR, {
	head={ name="Taeon Chapeau", augments={'Pet: Accuracy+21 Pet: Rng. Acc.+21','Pet: "Dbl. Atk."+5','Pet: Damage taken -2%',}},
    body={ name="Taeon Tabard", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet: "Dbl. Atk."+4','Pet: Damage taken -3%',}},
    hands={ name="Taeon Gloves", augments={'Pet: Accuracy+22 Pet: Rng. Acc.+22','Pet: "Dbl. Atk."+5','Pet: Damage taken -3%',}},
    legs={ name="Taeon Tights", augments={'Pet: Accuracy+20 Pet: Rng. Acc.+20','Pet: "Dbl. Atk."+4','Pet: Damage taken -3%',}},
    feet={ name="Taeon Boots", augments={'Pet: Attack+25 Pet: Rng.Atk.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
	})
	
	OD_GEAR=set_combine(PET_TP_GEAR, {
		
	})
	
	RAO_SET = {
		head="Rao Kabuto +1",
		body="Rao Togi +1",
		hands="Rao Kote +1",
		legs="Rao Haidate +1",
		feet="Rao Sune-Ate +1"
	}
	
	DT_GEAR = {
       	head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		ring1="Cath Palug Ring",
		ring2="Defending Ring",
		ear1="Enmerkar Earring",
		ear2="Eabani Earring",
		waist="Moonbow Belt +1",
		neck="Shulmanu Collar",
        back="Moonbeam Cape"
    }
	
	-- Used when doing skillchains and you have bonecrusher setup
	sets.DD = {}
	sets.DD.BONE = set_combine(PET_DA_GEAR, {
		--hands="Mpaca's Gloves",
		feet="Mpaca's Boots",
		back=Visucius.PetandMasterTP,
		ear1="Domes. Earring",
		ear2="Kyrene's Earring",
		--waist="Incarnation Sash",
	})	

    --------------------------------------------------------------------------------
    --  __  __           _               ____        _          _____      _
    -- |  \/  |         | |             / __ \      | |        / ____|    | |
    -- | \  / | __ _ ___| |_ ___ _ __  | |  | |_ __ | |_   _  | (___   ___| |_ ___
    -- | |\/| |/ _` / __| __/ _ \ '__| | |  | | '_ \| | | | |  \___ \ / _ \ __/ __|
    -- | |  | | (_| \__ \ ||  __/ |    | |__| | | | | | |_| |  ____) |  __/ |_\__ \
    -- |_|  |_|\__,_|___/\__\___|_|     \____/|_| |_|_|\__, | |_____/ \___|\__|___/
    --                                                  __/ |
    --                                                 |___/
    ---------------------------------------------------------------------------------
    --This section is best utilized for Master Sets
    --[[
        Will be activated when Pet is not active, otherwise refer to sets.idle.Pet
    ]]
   
	
	sets.Enmity = {
		body="Passion Jacket",
		legs="Tali'ah Sera. +1",
		neck="Unmoving Collar +1",
		ring1="Petrov Ring",
		ear1="Friomisi Earring",
		ear2="Handler's Earring +1",
	}

    -------------------------------------Fastcast
    sets.precast.FC = {
       head={ name="Herculean Helm", augments={'"Fast Cast"+3','INT+4','Mag. Acc.+3','"Mag.Atk.Bns."+6',}},
       body="Zendik Robe",
       hands="Malignance Gloves",
       legs={ name="Herculean Trousers", augments={'"Fast Cast"+5','MND+5',}},
       feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+12','"Fast Cast"+6','Mag. Acc.+1',}},
       neck="Baetyl Pendant",
       waist="Moonbow Belt +1",
       left_ear="Loquac. Earring",
       right_ear="Enchntr. Earring +1",
       left_ring="Defending Ring",
       right_ring="Gelatinous Ring +1",
       back="Fi Follet Cape +1",
    }

    -------------------------------------Midcast
    sets.midcast = {} --Can be left empty

    sets.midcast.FastRecast = {
       -- Add your set here 
    }
	
	-------------------------------------FLASH
	sets.midcast['Flash'] = sets.Enmity

    sets.midcast['Dia'] = set_combine (sets.precast.FC, {waist="Chaac Belt", head="White Rarab Cap +1",})

    -------------------------------------Kiting
    sets.Kiting = {feet = "Hermes' Sandals"}

    -------------------------------------JA
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck = "Magoraga Beads", body = "Passion Jacket"})

    -- Precast sets to enhance JAs
    sets.precast.JA = {} -- Can be left empty

    sets.precast.JA["Tactical Switch"] = {feet = Empy_Karagoz.Feet_Tatical}

    sets.precast.JA["Ventriloquy"] = {legs = Relic_Pitre.Legs_PMagic}

    sets.precast.JA["Role Reversal"] = {feet = Relic_Pitre.Feet_PMagic}

    sets.precast.JA["Overdrive"] = {body = Relic_Pitre.Body_PTP}

    sets.precast.JA["Repair"] = {
		head="Rao Kabuto +1",
		body="Rao Togi +1",
		hands="Rao Kote +1",
		legs="Rao Haidate +1",
		feet="Rao Sune-Ate +1",
        ear1="Guignol Earring",
        ear2="Pratik Earring",
        ammo = "Automat. Oil +3",
        feet = Artifact_Foire.Feet_Repair_PMagic
    }

    sets.precast.JA["Maintenance"] = set_combine(sets.precast.JA["Repair"], {})

    sets.precast.JA.Maneuver = {
        neck = "Buffoon's Collar +1",
        body = "Karagoz Farsetto +1",
        hands = Artifact_Foire.Hands_Mane_Overload,
        back = "Visucius's Mantle",
        ear1 = "Burana Earring"
    }

    sets.precast.JA["Activate"] = {back =Visucius.PetandMasterTP, feet="Mpaca's boots"}

    sets.precast.JA["Deus Ex Automata"] = sets.precast.JA["Activate"]

	-- Mainly just enmity pieces
    sets.precast.JA["Provoke"] = sets.Enmity

    --Waltz set (chr and vit)
    sets.precast.Waltz = {
       body = "Passion Jacket"
    }

    sets.precast.Waltz["Healing Waltz"] = {}
	
	sets.master_accessories = {
		ring1="Niqmaddu Ring",
		ring2="Gere Ring",
		ear1="Mache Earring +1",
		ear2="Telos Earring",
		waist="Moonbow Belt +1",
		back=Visucius.PetandMasterTP
	}
	
	sets.pet_accessories = {
		ring1="Cath Palug Ring",
	   	ring2="Thurandaut Ring",
	   	waist="Klouskap Sash +1",
		ear1="Crep. Earring",
		ear2="Enmerkar Earring",
		back=Visucius.PetandMasterTP,
	}

    sets.pet_hybrid_accessories = {
		ring1="Niqmaddu Ring",
	   	ring2="Gere Ring",
	   	waist="Moonbow Belt +1",
		ear1="Mache Earring +1",
		ear2="Crep. Earring",
		back=Visucius.PetandMasterTP,
	}

    sets.pet_tank_accessories = {
		ring1="Cath Palug Ring",
	   	ring2="Thurandaut Ring",
        neck="Shepherd's Chain",
	   	waist="Isa Belt",
		ear1="Handler's Earring +1",
		ear2="Enmerkar Earring",
		back=Visucius.PetandMasterTP,
	}
    -------------------------------------WS
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
       	head="Mpaca's Cap",
		body="Mpaca's Doublet",
		hands="Mpaca's Gloves",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots",
		ring1="Niqmaddu Ring",
		ring2="Gere Ring",
		neck="Fotia Gorget",
		ear1="Schere Earring",
		ear2="Moonshade Earring",
		waist="Moonbow Belt +1",
		back=Visucius.WSSTR
    }

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found

    sets.precast.WS["Victory Smite"] = set_combine(sets.precast.WS, {})
	
	sets.precast.WS["Stringing Pummel"] = set_combine(sets.precast.WS["Victory Smite"], {})

    sets.precast.WS["Shijin Spiral"] = set_combine(sets.precast.WS, {
		body = "Tali'ah Manteel +2",
        ring2= "Regal Ring",
		back = Visucius.WSDEX
	})

    sets.precast.WS["Howling Fist"] = set_combine(sets.precast.WS["Victory Smite"], {})
	
	sets.precast.WS["Raging Fists"] = set_combine(sets.precast.WS, {})
	
	sets.precast.WS["Evisceration"] = set_combine(sets.precast.WS["Victory Smite"], {
		ear1 = "Mache Earring +1",
		ear2 = "Mache Earring +1",
		back = Visucius.WSDEX
	})
	
	sets.precast.WS["Aeolian Edge"] = set_combine(sets.precast.WS, {
		body="Cohort Cloak +1",
		neck="Baetyl Pendant",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		waist="Eschan Stone",
		ear1="Friomisi Earring",
		ear2="Moonshade Earring",
		back="Kaikias' Cape"
	})

    -------------------------------------Engaged
    --[[
        Offense Mode = Mpaca
        Hybrid Mode = Normal
    ]]
	
    sets.engaged.Mpaca = {
       	head="Mpaca's Cap",
		body="Mpaca's Doublet",
		hands="Mpaca's Gloves",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots",
		neck="Shulmanu Collar",
		waist="Moonbow Belt +1",
		back=Visucius.PetandMasterTP,
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		ear1="Mache Earring +1",
		ear2="Telos Earring",
    }

    -------------------------------------
    --[[
        Offense Mode = Mpaca
        Hybrid Mode = Master
    ]]
    sets.engaged.Mpaca.Master = set_combine(sets.engaged.Mpaca, sets.master_accessories)

    -------------------------------------
    --[[
        Offense Mode = Mpaca
        Hybrid Mode = Pet
    ]]
	
    sets.engaged.Mpaca.Pet = set_combine(sets.engaged.Mpaca, sets.pet_accessories)

     --[[
        Offense Mode = Mpaca
        Hybrid Mode = DualTP
    ]]

    sets.engaged.Mpaca.DualTP = set_combine(sets.engaged.Mpaca, sets.pet_hybrid_accessories)
	
	-------------------------------------
    --[[
        Offense Mode = Mpaca
        Hybrid Mode = Normal
    ]]
	
	sets.engaged.PetEnmity = set_combine(sets.engaged.Mpaca.Master, {
		head="Heyoka Cap +1",
		body="Heyoka Harness",
       	hands="Heyoka Mittens",
	   	legs="Heyoka Subligar",
	   	feet="Heyoka Leggings",
	})

    -------------------------------------
    --[[
        Offense Mode = Rao
		Hybrid Mode = Normal
    ]]
	
	sets.engaged.Rao = set_combine(RAO_SET, {
		ear1="Rimeice Earring",
		ear2="Enmerkar Earring",
        neck="Shulmanu Collar",
		ring1="C. Palug Ring",
		ring2="Thurandaut Ring",
		back=Visucius.PetandMasterTP
	})
	
    sets.engaged.Rao.Master = set_combine(sets.engaged.Rao, sets.master_accessories)
	sets.engaged.Rao.Pet = set_combine(sets.engaged.Rao, sets.pet_tank_accessories)
    sets.engaged.Rao.DualTP = set_combine(sets.engaged.Rao,sets.pet_hybrid_accessories)
	
	-------------------------------------
    --[[
        Offense Mode = PetTP
        Hybrid Mode = Normal
    ]]
	
	sets.engaged.PetTP = PET_TP_GEAR
	sets.engaged.PetTP.Master = set_combine(sets.engaged.PetTP, sets.master_accessories)
	sets.engaged.PetTP.Pet = set_combine(sets.engaged.PetTP, sets.pet_accessories)
	
	sets.engaged.PetTank = PetTank
    sets.engaged.PetTank.Master = set_combine(sets.engaged.PetTank, sets.master_accessories)
    sets.engaged.PetTank.Pet = set_combine(sets.engaged.PetTank, sets.pet_tank_accessories) 
	-------------------------------------
    --[[
        Offense Mode = PetDA
        Hybrid Mode = Normal
    ]]
	
	sets.engaged.PetDA = PET_DA_GEAR
	sets.engaged.PetDA.Master = set_combine(sets.engaged.PetDA, sets.master_accessories)
	sets.engaged.PetDA.Pet = set_combine(sets.engaged.PetDA, sets.pet_accessories)
	
	-------------------------------------
    --[[
        Offense Mode = Malignance
        Hybrid Mode = Normal
    ]]
	
	sets.engaged.Malignance = set_combine(DT_GEAR, {})
	sets.engaged.Malignance.Master = set_combine(DT_GEAR, sets.master_accessories)
	sets.engaged.Malignance.Pet = set_combine(DT_GEAR, sets.pet_accessories)

    ----------------------------------------------------------------
    --  _____     _      ____        _          _____      _
    -- |  __ \   | |    / __ \      | |        / ____|    | |
    -- | |__) |__| |_  | |  | |_ __ | |_   _  | (___   ___| |_ ___
    -- |  ___/ _ \ __| | |  | | '_ \| | | | |  \___ \ / _ \ __/ __|
    -- | |  |  __/ |_  | |__| | | | | | |_| |  ____) |  __/ |_\__ \
    -- |_|   \___|\__|  \____/|_| |_|_|\__, | |_____/ \___|\__|___/
    --                                  __/ |
    --                                 |___/
    ----------------------------------------------------------------

    -------------------------------------Magic Midcast
    sets.midcast.Pet = {
       -- Add your set here 
    }

    sets.midcast.Pet.Cure = {
       -- Add your set here 
    }

    sets.midcast.Pet["Healing Magic"] = {
       --legs="Kara. Pantaloni +1",
    }

    sets.midcast.Pet["Elemental Magic"] = {
       	head={ name="Herculean Helm", augments={'Pet: "Mag.Atk.Bns."+30','Pet: "Regen"+3','Pet: INT+7',}},
	    body="Udug jacket",
	    hands={ name="Herculean Gloves", augments={'Pet: "Mag.Atk.Bns."+30','"Store TP"+1','Pet: INT+9',}},
		legs = Relic_Pitre.Legs_PMagic,
		feet=Relic_Pitre.Feet_PMagic,
	    neck="Adad Amulet",
	    waist="Ukko Sash",
	    left_ear="Enmerkar Earring", 
	    right_ear="Burana Earring",
	    left_ring="C. Palug Ring",
	    right_ring="Thurandaut Ring",
	    back={ name="Visucius's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20'}},
    }

    sets.midcast.Pet["Enfeebling Magic"] = {
       body="Udug jacket"
    }

    sets.midcast.Pet["Dark Magic"] = {
       body="Udug jacket"
    }

    sets.midcast.Pet["Divine Magic"] = {
       -- Add your set here 
    }

    sets.midcast.Pet["Enhancing Magic"] = {
       -- Add your set here 
    }

    -------------------------------------Idle
    --[[
        This set will become default Idle Set when the Pet is Active 
        and sets.idle will be ignored
        Player = Idle and not fighting
        Pet = Idle and not fighting
        Idle Mode = Idle
    ]]
	
	
	sets.idle.Malignance = set_combine(sets.engaged.Malignance, {ear1="Eabani Earring", ear2="Genmei earring", waist="Moonbow Belt +1",})
	
    sets.idle.Mpaca = set_combine(sets.engaged.Mpaca, {ring1="Defending Ring", ring2="Gelatinous Ring +1", neck="Bathy Choker +1",ear1="Eabani earring", ear2="Etiolation Earring", back="Moonbeam Cape"})

    sets.idle.PetDA = sets.engaged.PetDA
	
	sets.idle.PetEnmity = sets.engaged.PetEnmity
	
	sets.idle.PetTP = sets.engaged.PetTP
	
	sets.idle.Rao  = set_combine(sets.engaged.Rao, sets.pet_tank_accessories)

    sets.idle.PetTank = set_combine(sets.engaged.PetTank, sets.pet_tank_accessories)

    -------------------------------------Enmity
    sets.pet = {} -- Not Used

    --Equipped automatically
    sets.pet.Enmity = gear.Pet.Enmity
	
    sets.defense = {}

    sets.defense.Malignance = sets.engaged.Malignance
    sets.defense.PetDT = sets.engaged.Rao

    -------------------------------------WS
    --[[
        WSNoFTP is the default weaponskill set used
    ]]
    sets.midcast.Pet.WSNoFTP = {

            head= "Karagoz Capello +2",
            body= "Pitre Tobe +3",
            legs= "Kara. Pantaloni +1",
            hands="Mpaca's gloves",
            feet="Mpaca's Boots",
            ear1="Burana Earring",
			ear2="Enmerkar Earring",
			waist="Koulskap Sash +1",
            neck="Shulmanu Collar",
		    back="Dispersal Mantle",
		    ring1="Thurandaut Ring",
		    ring2="C. Palug Ring",
		    waist="Klouskap Sash +1",
            
    }

    --[[
        If we have a pet weaponskill that can benefit from WSFTP
        then this set will be equipped
    ]] -- Cal Original
    -- sets.midcast.Pet.WSFTP = set_combine(sets.midcast.Pet.WSNoFTP, {
	-- 	head=Empy_Karagoz.Head_PTPBonus,
    --     --legs=Empy_Karagoz.Legs_Combat,
    --     legs=PetHercDexLegs,
    --     feet=PetHercDexFeet,
	-- 	back="Dispersal Mantle",
	-- })

    sets.midcast.Pet.WSFTP = set_combine(sets.midcast.Pet.WSNoFTP, {
		head=Empy_Karagoz.Head_PTPBonus,
        --legs=Empy_Karagoz.Legs_Combat,
        legs=PetHercDexLegs,
        feet=PetHercDexFeet,
		back="Dispersal Mantle",
	})

    --[[
        Base Weapon Skill Set
        Used by default if no modifier is found
    ]]
    sets.midcast.Pet.WS = set_combine(sets.midcast.Pet.WSNoFTP, {})

    --Chimera Ripper, String Clipper
    sets.midcast.Pet.WS["STR"] = set_combine(PET_DA_GEAR, {
		ear2="Kyrene's Earring",
		hands="Karagoz Guanti +1",
	})

    -- Bone crusher, String Shredder
    sets.midcast.Pet.WS["VIT"] ={
            -- Add your gear here that would be different from sets.midcast.Pet.WSNoFTP
            --head = Empy_Karagoz.Head_PTPBonus,
            head= Taeon_DAHead,
            body= "Pitre Tobe +3",
            legs= Taeon_DALegs,
            hands= "Mpaca's gloves",
            ear1="Burana Earring",
			ear2="Kyrene's Earring",
			waist="Incarnation Sash",
      }


    -- Cannibal Blade
    sets.midcast.Pet.WS["MND"] = set_combine(sets.midcast.Pet.WSNoFTP, {})

    -- Armor Piercer, Armor Shatterer
    sets.midcast.Pet.WS["DEX"] = set_combine(sets.midcast.Pet.WSFTP, {
		ear2="Kyrene's Earring",
		--legs="Kara. Pantaloni +1",
	})

    -- Arcuballista, Daze
    sets.midcast.Pet.WS["DEXFTP"] =
        set_combine(
        sets.midcast.Pet.WSFTP,
        {
            -- Add your gear here that would be different from sets.midcast.Pet.WSFTP
            head = Empy_Karagoz.Head_PTPBonus,
			hands="Mpaca's Gloves",
			legs="Kara. Pantaloni +1",
            back="Dispersal Mantle",
			ear2="Kyrene's Earring"
        }
    )

    ---------------------------------------------
    --  __  __ _             _____      _
    -- |  \/  (_)           / ____|    | |
    -- | \  / |_ ___  ___  | (___   ___| |_ ___
    -- | |\/| | / __|/ __|  \___ \ / _ \ __/ __|
    -- | |  | | \__ \ (__   ____) |  __/ |_\__ \
    -- |_|  |_|_|___/\___| |_____/ \___|\__|___/
    ---------------------------------------------
    -- Town Set
    sets.idle.Town = {
        head="Malignance Chapeau",
		body="Udug jacket",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		ring1="Cath Palug Ring",
		ring2="Thurandaut Ring",
		ear1="Eabani Earring",
		ear2="Etiolation Earring",
		waist="Moonbow Belt +1",
		neck="Bathy Choker +1",
        back="Moonbeam Cape"
    }

    -- Resting sets
    sets.resting = {
       -- Add your set here
    }
	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 19)
end