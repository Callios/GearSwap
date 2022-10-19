-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
	state.OffenseMode:options('Normal','Acc')
	state.HybridMode:options('Normal','DT')
	state.RangedMode:options('Normal','Acc','Fodder')
	state.WeaponskillMode:options('Match','Normal','Acc')
	state.IdleMode:options('Normal','PDT')
	state.Weapons:options('Annihilator','AnnihilatorD','Fomalhaut','Yoichi','YoichiD','DualMalevolenceBow','YoichiMain','Trial','Trial2','DualSavageWeapons','DualEviscerationWeapons','DualMagicWeapons','DualMalevolence','None')
	
	WeaponType =  {['Fail-Not'] = "Bow",
	               ['Yoichinoyumi'] = "Bow",
	               ['Sparrowhawk'] = "Bow",
				   ['Astrild'] = "Bow",				   
                   ['Fomalhaut'] = "Gun",
				   ['Annihilator'] = "Gun",
				   ['Armageddon'] = "Gun",
				   ['Ataktos'] = "Gun",				   
                   }

	DefaultAmmo = {
		['Bow']  = {['Default'] = "Yoichi's Arrow",
					['WS'] = "Yoichi's Arrow",
					['Acc'] = "Yoichi's Arrow",
					['Magic'] = "Yoichi's Arrow",
					['MagicAcc'] = "Chrono Arrow",
					['Unlimited'] = "Hauksbok Arrow",
					['MagicUnlimited'] ="Hauksbok Arrow",
					['MagicAccUnlimited'] ="Hauksbok Arrow"},
					
		['Gun']  = {['Default'] = "Chrono Bullet",
					['WS'] = "Chrono Bullet",
					['Acc'] = "Eradicating Bullet",
					['Magic'] = "Devastating Bullet",
					['MagicAcc'] = "Devastating Bullet",
					['Unlimited'] = "Hauksbok Bullet",
					['MagicUnlimited'] = "Hauksbok Bullet",
					['MagicAccUnlimited'] ="Devastating Bullet"},
					
		['Crossbow'] = {['Default'] = "Eminent Bolt",
						['WS'] = "Eminent Bolt",
						['Acc'] = "Eminent Bolt",
						['Magic'] = "Eminent Bolt",
						['MagicAcc'] = "Eminent Bolt",
						['Unlimited'] = "Hauksbok Bolt",
						['MagicUnlimited'] = "Hauksbok Bolt",
						['MagicAccUnlimited'] ="Hauksbok Bolt"}
	}
	
	
	
	    -- Additional local binds
    send_command('bind !` input /ra <t>')
	send_command('bind !backspace input /ja "Bounty Shot" <t>')
	send_command('bind @f7 gs c toggle RngHelper')
	send_command('bind @` gs c cycle SkillchainMode')
	--send_command('bind !r gs c weapons MagicWeapons;gs c update')
	send_command('bind ^q gs c weapons SingleWeapon;gs c update')
	send_command('bind @m gs c mount Tiger')	
	
	select_default_macro_book()

end


-- Set up all gear sets.
function init_gear_sets()
	--------------------------------------
	-- Precast sets
	--------------------------------------

	
	
	-- Precast sets to enhance JAs
	sets.TreasureHunter = set_combine(sets.TreasureHunterRNG, {
		waist="Chaac Belt"})
	sets.precast.JA['Bounty Shot'] = set_combine(sets.TreasureHunter, {hands="Amini Glove. +1"})
	sets.precast.JA['Camouflage'] = {body="Orion Jerkin +2"}
	sets.precast.JA['Scavenge'] = {feet="Orion Socks +1"}
	sets.precast.JA['Shadowbind'] = {hands="Orion Bracers +2"}
	sets.precast.JA['Sharpshot'] = {legs="Orion Braccae +1"}
	sets.precast.JA['Double Shot'] = {back=gear.RNG_RATP}
	sets.precast.JA['Eagle Eye Shot'] = {head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Odr Earring",
        body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Mummu Ring",ring2="Begrudging Ring",
        back=gear.RNG_RATP,waist="Kwahu Kachina Belt +1",legs="Arcadian Braccae +3",feet="Arcadian Socks +3"}


	-- Fast cast sets for spells

    sets.precast.FC = {
        head="Carmine Mask +1",neck="Baetyl Pendant",ear1="Etiolation Earring",ear2="Loquac. Earring",
        body="Adhemar Jacket",hands="Leyline Gloves",ring1="Rahab Ring",ring2="Lebeche Ring",
        back="Moonbeam Cape",waist="Flume belt +1",legs=gear.HercLegsFC,feet="Carmine Greaves +1"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})


	-- Ranged sets (snapshot)
	
	sets.precast.RA = {
		head=gear.taeon_Snap_head,neck="Iskur Gorget",
		body="Oshosi Vest",hands="Carmine Fin. Ga. +1",ring2="Crepuscular Ring",
		back=gear.RNG_SNAP,waist="Impulse Belt",legs="Adhemar Kecks",feet="Meg. Jam. +2"}
		
	-- 15% flurry + 10% merits, only need 45 Snapshot
	-- 11 + 4 + 13 + 16 = 44 Rapid Shot
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {
		head=gear.taeon_Snap_head,			-- 10/0 
		body="Amini Caban +1",			-- 0/0 velocity shot -7% delay
		hands="Carmine Fin. Ga. +1",	-- 8/11
		back=gear.RNG_SNAP, 				-- 10/0
		waist="Yemaya Belt",			-- 0/4 
		legs="Adhemar Kecks",		-- 10/13
		feet="Meghanada Jambeaux +2"	-- 10/0 	= 48 snapshot
		})
	
	-- 30% flurry2 + 10% merits, only need 30 snapshot
	-- 18 + 11 + 4 + 19 = 68 Rapid Shot, 28 Snapshot,	
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {
		head="Orion Beret +3",			-- 0/18
		neck="Iskur Gorget",		-- 4/0
		body="Amini Caban +1",			-- 0/0 velocity shot -7% delay
		hands="Carmine Fin. Ga. +1",	-- 8/11
		back=gear.RNG_SNAP,  			-- 10
		waist="Yemaya Belt",			-- 0/4
		legs="Malignance Tights",			-- 0/19
		feet="Meghanada Jambeaux +2"	-- 10/0	= 28 snapshot
		})


	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Nyame Helm",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Epaminondas's Ring",
        back=gear.RNG_RAWSD,waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
    sets.precast.WS.Acc = {
        head="Malignance Chapeau",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Regal Ring",ring2="Cacoethic Ring +1",
        back=gear.RNG_RAWSD,waist="Fotia Belt",legs="Arcadian Braccae +3",feet="Nyame Sollerets"}
		
    sets.precast.WS['Coronach'] = {
        head="Nyame Helm",neck="Scout's Gorget +2",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Nyame Mail",hands="Meghanada Gloves +2",ring1="Regal Ring",ring2="Epaminondas's Ring",
        back=gear.RNG_RAWSD,waist="Fotia Belt",legs="Arcadian Braccae +3",feet="Nyame Sollerets"}	

    sets.precast.WS['Last Stand'] = {
        head="Orion Beret +3",neck="Scout's Gorget +2",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Epaminondas's Ring",
        back=gear.RNG_RAWSD,waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}		

    sets.precast.WS['Hot Shot'] = {
        head="Nyame Helm",neck="Scout's Gorget +2",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Dingir Ring",
        back=gear.RNG_RAWSD,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}		
		
    sets.precast.WS['Wildfire'] = {
        head="Nyame Helm",neck="Scout's Gorget +2",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Dingir Ring",
        back=gear.RNG_RAWSD,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.precast.WS['Wildfire'].Acc = {
        head="Nyame Helm",neck="Scout's Gorget +2",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Dingir Ring",
        back=gear.RNG_RAWSD,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
    sets.precast.WS['Trueflight'] = {
        head="Nyame Helm",neck="Scout's Gorget +2",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Dingir Ring",
        back=gear.RNG_RAWSD,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.precast.WS['Trueflight'].Acc = {
        head="Nyame Helm",neck="Scout's Gorget +2",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Dingir Ring",
        back=gear.RNG_RAWSD,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	sets.precast.WS['Savage Blade'] = {ammo="Hauksbok Arrow",
		head="Nyame Helm",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",
		body="Nyame Mail",hands="Meghanada Gloves +2",ring1="Regal Ring",ring2="Metamorph Ring +1",
		back=gear.RNG_SAVAGE,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}	
		
	sets.precast.WS['Aeolian Edge'] = {ammo="Hauksbok Arrow",
        head="Nyame Helm",neck="Sibyl Scarf",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Dingir Ring",
        back=gear.RNG_RAWSD,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}	
		
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Telos Earring"}
	sets.AccMaxTP = {ear1="Telos Earring"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


	--------------------------------------
	-- Midcast sets
	--------------------------------------

	-- Fast recast for spells
	
    sets.midcast.FastRecast = {
        head="Carmine Mask +1",neck="Baetyl Pendant",ear1="Etiolation Earring",ear2="Loquac. Earring",
        body="Adhemar Jacket",hands="Leyline Gloves",ring1="Rahab Ring",ring2="Lebeche Ring",
        back="Moonbeam Cape",waist="Flume belt +1",legs=gear.HercLegsFC,feet="Carmine Greaves +1"}
		
	-- Ranged sets

    sets.midcast.RA = {
        head="Malignance Chapeau",neck="Scout's Gorget +2",ear1="Telos Earring",ear2="Crepuscular Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Regal Ring",ring2="Crepuscular Ring",
        back=gear.RNG_RATP,waist="Kwahu Kachina Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
	
    sets.midcast.RA.Acc = {
        head="Malignance Chapeau",neck="Scout's Gorget +2",ear1="Telos Earring",ear2="Crepuscular Earring",
        body="Malignance Tabard",hands="Orion Bracers +2",ring1="Regal Ring",ring2="Cacoethic Ring +1",
        back=gear.RNG_RATP,waist="Kwahu Kachina Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.midcast.RA.Fodder = {
        head="Malignance Chapeau",neck="Scout's Gorget +2",ear1="Telos Earring",ear2="Crepuscular Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Crepuscular Ring",ring2="Dingir Ring",
        back=gear.RNG_RATP,waist="Kwahu Kachina Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.midcast.RA.AM = {
        head="Meghanada Visor +2",neck="Scout's Gorget +2",ear1="Telos Earring",ear2="Odr Earring",
        body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Mummu Ring",ring2="Begrudging Ring",
        back=gear.RNG_RATP,waist="Kwahu Kachina Belt +1",legs="Mummu Kecks +2",feet="Arcadian Socks +3"}		
		
	--These sets will overlay based on accuracy level, regardless of other options.
	sets.buff.Camouflage = {}
	sets.buff.Camouflage.Acc = {}
	
	sets.buff['Double Shot'] = {
	    head="Arcadian Beret +3",
		body="Arcadian Jerkin +3",
		back=gear.RNG_RATP,feet="Oshosi Leggings"}
	sets.buff['Double Shot'].Acc = {}
	
	sets.buff.Barrage = {head="Orion Beret +3",neck="Scout's Gorget +2",ear1="Telos Earring",ear2="Crepuscular Earring",
        body="Orion Jerkin +2",hands="Orion Bracers +2",ring1="Regal Ring",ring2="Cacoethic Ring +1",
        back=gear.RNG_RATP,waist="Kwahu Kachina Belt +1",legs="Malignance Tights",feet="Orion Socks +1"}
	
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
    sets.midcast.Utsusemi = sets.midcast.FastRecast
	
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {}

	-- Idle sets
    sets.idle = {
        head="Malignance Chapeau",neck="Bathy Choker +1",ear1="Infused Earring",ear2="Odnowa Earring +1",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Chirich Ring +1",
        back="Moonbeam Cape",waist="Flume belt +1",legs="Carmine Cuisses +1",feet="Malignance Boots"}
		
	sets.idle.Town = {
        head="Malignance Chapeau",neck="Warder's Charm +1",ear1="Infused Earring",ear2="Odnowa Earring +1",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Chirich Ring +1",
        back="Moonbeam Cape",waist="Flume belt +1",legs="Carmine Cuisses +1",feet="Malignance Boots"}			
		
	sets.idle.PDT = {
        head="Malignance Chapeau",neck="Warder's Charm +1",ear1="Tuisto Earring",ear2="Odnowa Earring +1",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Purity Ring",
        back="Moonbeam Cape",waist="Flume belt +1",legs="Malignance Tights",feet="Malignance Boots"}	
    
    -- Defense sets
    sets.defense.PDT = {
        head="Malignance Chapeau",neck="Warder's Charm +1",ear1="Tuisto Earring",ear2="Odnowa Earring +1",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Purity Ring",
        back="Moonbeam Cape",waist="Flume belt +1",legs="Malignance Tights",feet="Malignance Boots"}

    sets.defense.MDT = {
        head="Malignance Chapeau",neck="Warder's Charm +1",ear1="Tuisto Earring",ear2="Odnowa Earring +1",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Purity Ring",
        back="Moonbeam Cape",waist="Flume belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.defense.MEVA = {
        head="Malignance Chapeau",neck="Warder's Charm +1",ear1="Tuisto Earring",ear2="Odnowa Earring +1",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Purity Ring",
        back="Moonbeam Cape",waist="Flume belt +1",legs="Malignance Tights",feet="Malignance Boots"}

    sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	-- Weapons sets
	sets.weapons.Annihilator = {main="Perun +1",sub="Nusku Shield",range="Annihilator"}
	sets.weapons.AnnihilatorD = {main="Perun +1",sub="Gleti's Knife",range="Annihilator"}
	sets.weapons.Fomalhaut = {main="Perun +1",sub="Nusku Shield",range="Fomalhaut"}
	--sets.weapons.Armageddon = {main="Perun +1",sub="Nusku Shield",range="Armageddon"}
	--sets.weapons.Failnot = {main="Perun +1",sub="Nusku Shield",range="Fail-Not"}
	sets.weapons.Yoichi = {main="Perun +1",sub="Nusku Shield",range="Yoichinoyumi"}
	sets.weapons.YoichiD = {main="Perun +1",sub="Gleti's Knife",range="Yoichinoyumi"}
	sets.weapons.DualSavageWeapons = {main="Naegling",sub="Blurred Knife +1",range="Sparrowhawk +2"}	
	sets.weapons.Trial = {main="Naegling",sub="Blurred Knife +1",range="Astrild"}
	sets.weapons.Trial2 = {main="Fermion Sword",sub="Chicken Knife II",range="Sparrowhawk"}
	sets.weapons.DualEviscerationWeapons = {main="Tauret",sub="Blurred Knife +1",range="Sparrowhawk +2"}
	sets.weapons.DualMalevolence = {main="Malevolence",sub="Malevolence",range="Fomalhaut"}
	sets.weapons.DualMalevolenceBow = {main="Malevolence",sub="Malevolence",range="Yoichinoyumi"}
	sets.weapons.DualMagicWeapons = {main="Tauret",sub="Naegling",range="Fomalhaut"}
	sets.weapons.YoichiMain ={range="Yoichinoyumi"}

	--------------------------------------
	-- Engaged sets
	--------------------------------------

    -- Normal melee group
    sets.engaged = {
		head="Adhemar Bonnet +1",neck="Combatant's Torque",ear1="Telos Earring",ear2="Sherida Earring",
		body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Chirich Ring +1",ring2="Epona's Ring",
		back=gear.RNG_TP,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Herculean Boots"}
    
    sets.engaged.Acc = {
		head="Malignance Chapeau",neck="Combatant's Torque",ear1="Telos Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.RNG_TP,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.engaged.DT = {
        head="Malignance Chapeau",neck="Combatant's Torque",ear1="Telos Earring",ear2="Sherida Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Epona's Ring",
        back=gear.RNG_TP,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

    sets.engaged.DW = {
		head="Adhemar Bonnet +1",neck="Combatant's Torque",ear1="Suppanomimi",ear2="Sherida Earring",
		body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Chirich Ring +1",ring2="Epona's Ring",
		back=gear.RNG_TP,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Herculean Boots"}
		
    sets.engaged.DW.DT = {
        head="Malignance Chapeau",neck="Combatant's Torque",ear1="Suppanomimi",ear2="Sherida Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Epona's Ring",
        back=gear.RNG_TP,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
    
    sets.engaged.DW.Acc = {
		head="Malignance Chapeau",neck="Combatant's Torque",ear1="Suppanomimi",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Cacoethic Ring +1",
		back=gear.RNG_TP,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {ring2="Purity Ring", waist="Gishdubar Sash",})
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'NIN' then
        set_macro_page(2, 9)
    elseif player.sub_job == 'DNC' then
		set_macro_page(2, 9)
    elseif player.sub_job == 'DRG' then
        set_macro_page(2, 9)
    else
        set_macro_page(2, 9)
    end
end

function user_job_lockstyle()
windower.chat.input('/lockstyleset 090') --Catchall just in case something's weird.
end
