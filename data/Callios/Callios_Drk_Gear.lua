function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal','DT')
    state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
    state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT','Refresh','Reraise')
	state.Weapons:options('Apocalypse','Foenaria','Caladbolg','GAxe','Club','Crepuscular','Sword','Anguta','Trial')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Passive = M{['description'] = 'Passive Mode','None','MP','Twilight'}
	state.DrainSwapWeaponMode = M{'Always','Never','300','1000'}

	-- Additional local binds
	send_command('bind ^` input /ja "Hasso" <me>')
	send_command('bind !` input /ja "Seigan" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
	
	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	-- Precast Sets
	-- Precast sets to enhance JAs
	sets.precast.JA['Diabolic Eye'] = {}
	sets.precast.JA['Arcane Circle'] = {}
	sets.precast.JA['Souleater'] = {}
	sets.precast.JA['Weapon Bash'] = {}
	sets.precast.JA['Nether Void'] = {legs="Heath. Flanchard +2"}
	sets.precast.JA['Blood Weapon'] = {}
	sets.precast.JA['Dark Seal'] = {}
	sets.precast.JA['Last Resort'] = {back="Ankou's Mantle"}
                   
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
                   
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}
           
	sets.precast.Step = {}
	
	sets.precast.Flourish1 = {}
		   
	-- Fast cast sets for spells

	sets.precast.FC = {ammo="Sapience Orb",
		head="Carmine Mask +1",neck="Baetyl Pendant",ear1="Loquac. Earring",ear2="Malignance Earring",
		body="Sacro Breastplate",hands="Leyline Gloves",ring1="Rahab Ring",ring2="Kishar Ring",
		back="Moonbeam Cape",waist="Flume belt +1",legs=gear.odyssean_MagFCLegs,feet="Carmine Greaves +1"}

	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
		
	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Staunch Tathlum +1",
		head="Carmine Mask +1",neck="Baetyl Pendant",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		body="Sacro Breastplate",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Kishar Ring",
		back="Moonbeam Cape",waist="Tempus Fugit +1",legs=gear.odyssean_fc_legs,feet="Carmine Greaves +1"}
                   
	-- Specific spells
 
	sets.midcast['Dark Magic'] = {ammo="Pemphredo Tathlum",
		head="Carmine Mask +1",neck="Erra Pendant",ear1="Digni. Earring",ear2="Malignance Earring",
		body="Carmine Scale Mail +1",hands="Nyame Gauntlets",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Niht Mantle",waist="Eschan Stone",legs="Eschite Cuisses",feet="Ratri Sollerets +1"}
           
	sets.midcast['Enfeebling Magic'] = {ammo="Pemphredo Tathlum",
		head="Carmine Mask +1",neck="Incanter's Torque",ear1="Digni. Earring",ear2="Malignance Earring",
		body="Nyame Flanchard",hands="Nyame Gauntlets",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Niht Mantle",waist="Eschan Stone",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		   
	sets.midcast['Dread Spikes'] = {main="Crepuscular scythe",ammo="Crepuscular Pebble",
		head="Ratri Sallet",neck="Sanctity Necklace",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
		body="Heath. Cuirass +2",hands="Ratri Gadlings",ring1="Moonbeam Ring",ring2="Gelatinous Ring +1",
		back="Moonbeam Cape",waist="Eschan Stone",legs="Ratri Cuisses",feet="Ratri sollerets +1"}

	sets.midcast['Elemental Magic'] = {ammo="Ghastly Tathlum +1",
		head="Jumalik Helm",neck="Erra Pendant",ear1="Friomisi Earring",ear2="Malignance Earring",
		body="Sacro Breastplate",hands="Nyame Gauntlets",ring1="Metamorph Ring +1",ring2="Mujin Ring",
		back="Niht Mantle",waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.midcast.Absorb = {range="Ullr",ammo="Pemphredo Tathlum",
		head="Carmine Mask +1",neck="Erra Pendant",ear1="Digni. Earring",ear2="Malignance Earring",
		body="Carmine Scale Mail +1",hands="Pavor Gauntlets",ring1="Kishar Ring",ring2="Stikini Ring",
		back="Chuparrosa mantle",waist="Eschan Stone",legs="Eschite Cuisses",feet="Ratri Sollerets +1"}
           
	sets.midcast.Stun = {ammo="Pemphredo Tathlum",
		head="Carmine Mask +1",neck="Erra Pendant",ear1="Digni. Earring",ear2="Malignance Earring",
		body="Nayme Mail",hands="Nyame Guantlets",ring1="Stikini Ring",ring2="Kishar Ring",
		back="Niht Mantle",waist="Eschan Stone",legs="Nyame Flanchard",feet="Ratri Sollerets +1"}
                   
	sets.midcast.Drain = {main="Bounty Sickle",range="Ullr",
		head="Carmine Mask +1",neck="Erra Pendant",ear1="Digni. Earring",ear2="Malignance Earring",
		body="Carmine Scale Mail +1",hands="Nyame Gauntlets",ring1="Archon Ring",ring2="Evanescence Ring",
		back="Niht Mantle",waist="Orpheus's Sash",legs="Eschite Cuisses",feet="Ratri Sollerets +1"}
	
	sets.midcast.Sleep = set_combine(sets.midcast['Dark Magic'], {})

	sets.DrainWeapon = {main="Misanthropy",sub="Alber Strap"}

	sets.midcast['Endark'] = {ammo="Pemphredo Tathlum",
	head="Carmine Mask +1",neck="Erra Pendant",ear1="Digni. Earring",ear2="Malignance Earring",
	body="Carmine Scale Mail +1",hands="Nyame Guantlets",ring1="Stikini Ring",ring2="Evanescence Ring",
	back="Niht Mantle",waist="Eschan Stone",legs="Heath. Flanchard +2",feet="Ratri Sollerets +1"}

	sets.midcast['Absorb-TP'] = set_combine(sets.midcast.Absorb,{hands="Heath. Gauntlets +2"}) 
                   
	sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast.Impact = set_combine(sets.midcast['Dark Magic'], {head=empty,body="Twilight Cloak"})
	
	sets.midcast.Cure = {}
	
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
						                   
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Crepuscular Pebble",
		head="Nyame Helm",neck="Rep. Plat. Medal",ear1="Thrud earring",ear2="Moonshade Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Niqmaddu Ring",
		back=gear.DRKSTRWS,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {neck="Combatant's Torque"})
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, {})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.	
    sets.precast.WS['Catastrophe'] = {ammo="Knobkierrie",
	head="Nyame Helm",neck="Abyssal Bead necklace +2",ear1="Thrud earring",ear2="Moonshade Earring",
	body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Niqmaddu Ring",
	back=gear.DRKSTRWS,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.precast.WS['Catastrophe'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Catastrophe'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Catastrophe'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Catastrophe'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS['Torcleaver'] = {ammo="Knobkierrie",
	head="Nyame Helm",neck="Abyssal Bead necklace +2",ear1="Thrud earring",ear2="Moonshade Earring",
	body="Nyame Mail",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Niqmaddu Ring",
	back=gear.DRKVITWS,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.precast.WS['Torcleaver'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Torcleaver'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Torcleaver'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Torcleaver'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Entropy'] = {ammo="Knobkierrie",
	head="Hjarrandi Helm",neck="Fotia Gorget",ear1="Schere earring",ear2="Moonshade Earring",
	body="Dagon Breastplate",hands="Sakpata's Gauntlets",ring1="Regal Ring",ring2="Metamorph Ring +1",
	back=gear.DRKSTRWS,waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.precast.WS['Entropy'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Entropy'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Entropy'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Entropy'].Fodder = set_combine(sets.precast.WS.Fodder, {})

	sets.precast.WS['Insurgency'] = {ammo="Knobkierrie",
	head="Nyame Helm",neck="Fotia Gorget",ear1="Thrud earring",ear2="Moonshade Earring",
	body="Nyame Mail",hands="Sakpata's Gauntlets",ring1="Regal Ring",ring2="Niqmaddu Ring",
	back=gear.DRKSTRWS,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.precast.WS['Insurgency'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Insurgency'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Insurgency'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Insurgency'].Fodder = set_combine(sets.precast.WS.Fodder, {})
     
    sets.precast.WS['Resolution'] = {ammo="Knobkierrie",
	head="Sakpata's Helm",neck="Fotia Gorget",ear1="Schere earring",ear2="Moonshade Earring",
	body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Regal Ring",ring2="Niqmaddu Ring",
	back=gear.DRKSTRWS,waist="Fotia Belt",legs="Nyame Flanchard",feet="Sakpata's Leggings"}

    sets.precast.WS['Resolution'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Resolution'].Fodder = set_combine(sets.precast.WS.Fodder, {})     

	sets.precast.WS['Savage Blade'] = {ammo="Knobkierrie",
	head="Nyame Helm",neck="Rep. Plat. Medal",ear1="Thrud earring",ear2="Moonshade Earring",
	body="Nyame Mail",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Epaminondas's Ring",
	back=gear.DRKSTRWS,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.precast.WS['Savage Blade'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Savage Blade'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Savage Blade'].Fodder = set_combine(sets.precast.WS.Fodder, {}) 

	sets.precast.WS['Judgment'] = {ammo="Knobkierrie",
	head="Nyame Helm",neck="Rep. Plat. Medal",ear1="Thrud earring",ear2="Moonshade Earring",
	body="Nyame Mail",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Epaminondas's Ring",
	back=gear.DRKSTRWS,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.precast.WS['Judgment'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Judgment'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Judgment'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Judgment'].Fodder = set_combine(sets.precast.WS.Fodder, {})

	sets.precast.WS['Shadow of Death'] = {ammo="Seething Bomblet +1",
	head="Pixie Hairpin +1",neck="Sibyl Scarf",ear1="Malignance Earring",ear2="Moonshade Earring",
	body="Nyame Mail",hands="Nyame Gauntlets",ring1="Archon Ring",ring2="Epaminondas's Ring",
	back=gear.DRKSTRWS,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.precast.WS['Shadow of Death'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Shadow of Death'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Shadow of Death'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Shadow of Death'].Fodder = set_combine(sets.precast.WS.Fodder, {})
    
	sets.precast.WS['Infernal Scythe'] = {ammo="Knobkierrie",
	head="Pixie Hairpin +1",neck="Sibyl Scarf",ear1="Malignance Earring",ear2="Friomisi Earring",
	body="Nyame Mail",hands="Nyame Gauntlets",ring1="Archon Ring",ring2="Epaminondas's Ring",
	back=gear.DRKSTRWS,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.precast.WS['Infernal Scythe'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Infernal Scythe'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Infernal Scythe'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Infernal Scythe'].Fodder = set_combine(sets.precast.WS.Fodder, {})
     -- Sets to return to when not performing an action.
           
     -- Resting sets
     sets.resting = {}
           
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Lugra Earring +1",ear2="Lugra Earring",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.AccDayMaxTPWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayMaxTPWSEars = {ear1="Ishvara Earring",ear2="Brutal Earring",}
	sets.AccDayWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayWSEars = {ear1="Brutal Earring",ear2="Moonshade Earring",}
     
            -- Idle sets
           
    sets.idle = {ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Warder's Charm +1",ear1="Genmei Earring",ear2="Tuisto earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Chirich Ring +1",
		back="Moonbeam Cape",waist="Flume belt +1",legs="Carmine Cuisses +1",feet="Nyame Sollerets"}
		
    sets.idle.PDT = {ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Tuisto Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Warden's Ring",
		back=gear.DRKTPDA,waist="Flume belt +1",legs="Carmine Cuisses +1",feet="Nyame Sollerets"}

	sets.idle.Weak = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
           
    -- Defense sets
	sets.defense.PDT = {ammo="Staunch Tathlum +1",
		head="Loess Barbuta +1",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
		back="Shadow Mantle",waist="Flume belt +1",legs="Sulev. Cuisses +2",feet="Amm Greaves"}
		
	sets.defense.PDTReraise = set_combine(sets.defense.PDT, {head="Twilight Helm",body="Twilight Mail"})

	sets.defense.MDT = {ammo="Staunch Tathlum +1",
		head="Loess Barbuta +1",neck="Warder's Charm +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
		back="Moonbeam Cape",waist="Flume belt +1",legs="Sulev. Cuisses +2",feet="Amm Greaves"}
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.defense.MEVA = {ammo="Staunch Tathlum +1",
		head="Loess Barbuta +1",neck="Warder's Charm +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
		back="Moonbeam Cape",waist="Flume belt +1",legs="Sulev. Cuisses +2",feet="Amm Greaves"}
     
	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.passive.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff['Dark Seal'] = {} --head="Fallen's Burgeonet +3"
     
	-- Engaged sets
	sets.engaged = {ammo="Coiste Bodhar",
		head="Flam. Zucchetto +2",neck="Vim Torque +1",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Dagon Breastplate",hands="Sakpata's Gauntlets",ring1="Hetairoi Ring",ring2="Niqmaddu Ring",
		back=gear.DRKTPDA,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Flam. Gambieras +2"}

	sets.engaged.DT ={ammo="Coiste Bodhar",
		head="Sakpata's Helm",neck="Vim Torque +1",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Hetairoi Ring",ring2="Niqmaddu Ring",
		back=gear.DRKTPDA,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}

    sets.engaged.SomeAcc = {ammo="Coiste Bodhar",
		head="Flam. Zucchetto +2",neck="Combatant's Torque",ear1="Brutal Earring",ear2="Cessance Earring",
		body=gear.valorous_wsd_body,hands=gear.valorous_acc_hands,ring1="Flamma Ring",ring2="Niqmaddu Ring",
		back="Ankou's Mantle",waist="Sailfi Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}

	sets.engaged.SomeAcc.DT = set_combine(sets.engaged.DT,{})

	sets.engaged.Acc = {ammo="Coiste Bodhar",
		head="Flam. Zucchetto +2",neck="Combatant's Torque",ear1="Digni. Earring",ear2="Telos Earring",
		body=gear.valorous_wsd_body,hands=gear.valorous_acc_hands,ring1="Flamma Ring",ring2="Niqmaddu Ring",
		back="Ankou's Mantle",waist="Sailfi Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}

	sets.engaged.Acc.DT = set_combine(sets.engaged.DT,{})

    sets.engaged.FullAcc = {ammo="Coiste Bodhar",
		head="Flam. Zucchetto +2",neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Telos Earring",
		body=gear.valorous_wsd_body,hands=gear.valorous_acc_hands,ring1="Flamma Ring",ring2="Ramuh Ring +1",
		back="Ankou's Mantle",waist="Sailfi Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}

	sets.engaged.FullAcc.DT = set_combine(sets.engaged.DT,{})

    sets.engaged.Fodder = {ammo="Coiste Bodhar",
		head="Flam. Zucchetto +2",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Sherida Earring",
		body=gear.valorous_wsd_body,hands=gear.valorous_acc_hands,ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back="Ankou's Mantle",waist="Sailfi Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}

	sets.engaged.Fodder.DT = set_combine(sets.engaged.DT,{})
	

--Example sets:
--[[
    sets.engaged.Adoulin = {}
	sets.engaged.SomeAcc.Adoulin = {}
	sets.engaged.Acc.Adoulin = {}
	sets.engaged.FullAcc.Adoulin = {}
	sets.engaged.Fodder.Adoulin = {}
	
	sets.engaged.PDT = {}
	sets.engaged.SomeAcc.PDT = {}
	sets.engaged.Acc.PDT = {}
	sets.engaged.FullAcc.PDT = {}
	sets.engaged.Fodder.PDT = {}
	
	sets.engaged.PDT.Adoulin = {}
	sets.engaged.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Acc.PDT.Adoulin = {}
	sets.engaged.FullAcc.PDT.Adoulin = {}
	sets.engaged.Fodder.PDT.Adoulin = {}
	
	sets.engaged.MDT = {}
	sets.engaged.SomeAcc.MDT = {}
	sets.engaged.Acc.MDT = {}
	sets.engaged.FullAcc.MDT = {}
	sets.engaged.Fodder.MDT = {}
	
	sets.engaged.MDT.Adoulin = {}
	sets.engaged.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Acc.MDT.Adoulin = {}
	sets.engaged.FullAcc.MDT.Adoulin = {}
	sets.engaged.Fodder.MDT.Adoulin = {}
	
            -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
            -- sets if more refined versions aren't defined.
            -- If you create a set with both offense and defense modes, the offense mode should be first.
            -- EG: sets.engaged.Dagger.Accuracy.Evasion 
			]]--

 -- Apocalypse melee sets
 sets.engaged.Apocalypse = {ammo="Coiste Bodhar",
 	head="Flam. Zucchetto +2",neck="Vim Torque +1",ear1="Brutal Earring",ear2="Cessance Earring",
 	body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Hetairoi Ring",ring2="Niqmaddu Ring",
 	back=gear.DRKTPDA,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Flam. Gambieras +2"}

sets.engaged.Apocalypse.DT = {ammo="Coiste Bodhar",
	head="Sakpata's Helm",neck="Vim Torque +1",ear1="Brutal Earring",ear2="Cessance Earring",
	body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Hetairoi Ring",ring2="Niqmaddu Ring",
	back=gear.DRKTPDA,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}

 sets.engaged.Apocalypse.SomeAcc = {ammo="Coiste Bodhar",
 	head="Flam. Zucchetto +2",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
 	body=gear.valorous_wsd_body,hands=gear.valorous_acc_hands,ring1="Petrov Ring",ring2="Niqmaddu Ring",
 	back="Ankou's Mantle",waist="Sailfi Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}

sets.engaged.Apocalypse.SomeAcc.DT = set_combine(sets.engaged.Apocalypse.DT,{})

 sets.engaged.Apocalypse.Acc = {ammo="Coiste Bodhar",
 	head="Flam. Zucchetto +2",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
 	body=gear.valorous_wsd_body,hands=gear.valorous_acc_hands,ring1="Petrov Ring",ring2="Niqmaddu Ring",
 	back="Ankou's Mantle",waist="Sailfi Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}

sets.engaged.Apocalypse.Acc.DT = set_combine(sets.engaged.Apocalypse.DT,{})

 sets.engaged.Apocalypse.FullAcc = {ammo="Coiste Bodhar",
 	head="Flam. Zucchetto +2",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
 	body=gear.valorous_wsd_body,hands=gear.valorous_acc_hands,ring1="Petrov Ring",ring2="Niqmaddu Ring",
 	back="Ankou's Mantle",waist="Sailfi Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}

sets.engaged.Apocalypse.FullAcc.DT = set_combine(sets.engaged.Apocalypse.DT,{})

 sets.engaged.Apocalypse.Fodder = {ammo="Coiste Bodhar",
 	head="Flam. Zucchetto +2",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
 	body=gear.valorous_wsd_body,hands=gear.valorous_acc_hands,ring1="Petrov Ring",ring2="Niqmaddu Ring",
 	back="Ankou's Mantle",waist="Sailfi Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
 
sets.engaged.Apocalypse.Fodder.DT = set_combine(sets.engaged.Apocalypse.DT,{})

sets.engaged.Apocalypse.AM = {ammo="Coiste Bodhar",
 	head="Hjarrandi Helm",neck="Vim Torque +1",ear1="Cessance Earring",ear2="Dedition Earring",
 	body="Hjarrandi Breast.",hands="Sakpata's Gauntlets",ring1="Hetairoi Ring",ring2="Niqmaddu Ring",
 	back=gear.DRKTPDA,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}

sets.engaged.Apocalypse.AM.DT = set_combine(sets.engaged.Apocalypse.AM.DT,{})

 sets.engaged.Apocalypse.SomeAcc.AM = {}
 sets.engaged.Apocalypse.Acc.AM = {}
 sets.engaged.Apocalypse.FullAcc.AM = {}
 sets.engaged.Apocalypse.Fodder.AM = {}
 
 sets.engaged.Apocalypse.SomeAcc.AM.DT = {}
 sets.engaged.Apocalypse.Acc.AM.DT = {}
 sets.engaged.Apocalypse.FullAcc.AM.DT = {}
 sets.engaged.Apocalypse.Fodder.AM.DT = {}

 sets.engaged.Apocalypse.PDT = {}
 sets.engaged.Apocalypse.SomeAcc.PDT = {}
 sets.engaged.Apocalypse.Acc.PDT = {}
 sets.engaged.Apocalypse.FullAcc.PDT = {}
 sets.engaged.Apocalypse.Fodder.PDT = {}
 
-- sets.engaged.Apocalypse.PDT.Adoulin = {}
 --sets.engaged.Apocalypse.SomeAcc.PDT.Adoulin = {}
 --sets.engaged.Apocalypse.Acc.PDT.Adoulin = {}
 --sets.engaged.Apocalypse.FullAcc.PDT.Adoulin = {}
 --sets.engaged.Apocalypse.Fodder.PDT.Adoulin = {}
 
 sets.engaged.Apocalypse.PDT.AM = {}
 sets.engaged.Apocalypse.SomeAcc.PDT.AM = {}
 sets.engaged.Apocalypse.Acc.PDT.AM = {}
 sets.engaged.Apocalypse.FullAcc.PDT.AM = {}
 sets.engaged.Apocalypse.Fodder.PDT.AM = {}
 
 
 sets.engaged.Apocalypse.MDT = {}
 sets.engaged.Apocalypse.SomeAcc.MDT = {}
 sets.engaged.Apocalypse.Acc.MDT = {}
 sets.engaged.Apocalypse.FullAcc.MDT = {}
 sets.engaged.Apocalypse.Fodder.MDT = {}
 
 
 sets.engaged.Apocalypse.MDT.AM = {}
 sets.engaged.Apocalypse.SomeAcc.MDT.AM = {}
 sets.engaged.Apocalypse.Acc.MDT.AM = {}
 sets.engaged.Apocalypse.FullAcc.MDT.AM = {}
 sets.engaged.Apocalypse.Fodder.MDT.AM = {}
 

--  Caladbolg melee sets
sets.engaged.Caladbolg = {ammo="Coiste Bodhar",
head="Flam. Zucchetto +2",neck="Vim Torque +1",ear1="Dedition Earring",ear2="Telos Earring",
body="Dagon Breastplate",hands="Sakpata's Gauntlets",ring1="Hetairoi Ring",ring2="Niqmaddu Ring",
back=gear.DRKTPDA,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Flam. Gambieras +2"}

sets.engaged.Caladbolg.AM = {ammo="Coiste Bodhar",
head="Flam. Zucchetto +2",neck="Vim Torque +1",ear1="Dedition Earring",ear2="Telos Earring",
body="Dagon Breastplate",hands="Sakpata's Gauntlets",ring1="Hetairoi Ring",ring2="Niqmaddu Ring",
back=gear.DRKTPDA,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Flam. Gambieras +2"}

sets.engaged.Caladbolg.DT = {ammo="Coiste Bodhar",
head="Sakpata's Helm",neck="Vim Torque +1",ear1="Brutal Earring",ear2="Cessance Earring",
body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Hetairoi Ring",ring2="Niqmaddu Ring",
back=gear.DRKTPDA,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}

sets.engaged.Caladbolg.DT.AM = {ammo="Coiste Bodhar",
head="Sakpata's Helm",neck="Vim Torque +1",ear1="Dedition Earring",ear2="Telos Earring",
body="Dagon Breastplate",hands="Sakpata's Gauntlets",ring1="Hetairoi Ring",ring2="Niqmaddu Ring",
back=gear.DRKTPDA,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}

sets.engaged.Caladbolg.SomeAcc = {}
sets.engaged.Caladbolg.Acc = {}
sets.engaged.Caladbolg.FullAcc = {}
sets.engaged.Caladbolg.Fodder = {}

sets.engaged.Caladbolg.Adoulin = {}
sets.engaged.Caladbolg.SomeAcc.Adoulin = {}
sets.engaged.Caladbolg.Acc.Adoulin = {}
sets.engaged.Caladbolg.FullAcc.Adoulin = {}
sets.engaged.Caladbolg.Fodder.Adoulin = {}

sets.engaged.Caladbolg.SomeAcc.AM = {}
sets.engaged.Caladbolg.Acc.AM = {}
sets.engaged.Caladbolg.FullAcc.AM = {}
sets.engaged.Caladbolg.Fodder.AM = {}

sets.engaged.Caladbolg.Adoulin.AM = {}
sets.engaged.Caladbolg.SomeAcc.Adoulin.AM = {}
sets.engaged.Caladbolg.Acc.Adoulin.AM = {}
sets.engaged.Caladbolg.FullAcc.Adoulin.AM = {}
sets.engaged.Caladbolg.Fodder.Adoulin.AM = {}

sets.engaged.Caladbolg.PDT = {}
sets.engaged.Caladbolg.SomeAcc.PDT = {}
sets.engaged.Caladbolg.Acc.PDT = {}
sets.engaged.Caladbolg.FullAcc.PDT = {}
sets.engaged.Caladbolg.Fodder.PDT = {}

sets.engaged.Caladbolg.PDT.Adoulin = {}
sets.engaged.Caladbolg.SomeAcc.PDT.Adoulin = {}
sets.engaged.Caladbolg.Acc.PDT.Adoulin = {}
sets.engaged.Caladbolg.FullAcc.PDT.Adoulin = {}
sets.engaged.Caladbolg.Fodder.PDT.Adoulin = {}

sets.engaged.Caladbolg.PDT.AM = {}
sets.engaged.Caladbolg.SomeAcc.PDT.AM = {}
sets.engaged.Caladbolg.Acc.PDT.AM = {}
sets.engaged.Caladbolg.FullAcc.PDT.AM = {}
sets.engaged.Caladbolg.Fodder.PDT.AM = {}

sets.engaged.Caladbolg.PDT.Adoulin.AM = {}
sets.engaged.Caladbolg.SomeAcc.PDT.Adoulin.AM = {}
sets.engaged.Caladbolg.Acc.PDT.Adoulin.AM = {}
sets.engaged.Caladbolg.FullAcc.PDT.Adoulin.AM = {}
sets.engaged.Caladbolg.Fodder.PDT.Adoulin.AM = {}

sets.engaged.Caladbolg.MDT = {}
sets.engaged.Caladbolg.SomeAcc.MDT = {}
sets.engaged.Caladbolg.Acc.MDT = {}
sets.engaged.Caladbolg.FullAcc.MDT = {}
sets.engaged.Caladbolg.Fodder.MDT = {}

sets.engaged.Caladbolg.MDT.Adoulin = {}
sets.engaged.Caladbolg.SomeAcc.MDT.Adoulin = {}
sets.engaged.Caladbolg.Acc.MDT.Adoulin = {}
sets.engaged.Caladbolg.FullAcc.MDT.Adoulin = {}
sets.engaged.Caladbolg.Fodder.MDT.Adoulin = {}

sets.engaged.Caladbolg.MDT.AM = {}
sets.engaged.Caladbolg.SomeAcc.MDT.AM = {}
sets.engaged.Caladbolg.Acc.MDT.AM = {}
sets.engaged.Caladbolg.FullAcc.MDT.AM = {}
sets.engaged.Caladbolg.Fodder.MDT.AM = {}

sets.engaged.Caladbolg.MDT.Adoulin.AM = {}
sets.engaged.Caladbolg.SomeAcc.MDT.Adoulin.AM = {}
sets.engaged.Caladbolg.Acc.MDT.Adoulin.AM = {}
sets.engaged.Caladbolg.FullAcc.MDT.Adoulin.AM = {}
sets.engaged.Caladbolg.Fodder.MDT.Adoulin.AM = {}



--[[  Liberator melee sets
    sets.engaged.Liberator = {}
	sets.engaged.Liberator.SomeAcc = {}
	sets.engaged.Liberator.Acc = {}
	sets.engaged.Liberator.FullAcc = {}
	sets.engaged.Liberator.Fodder = {}
	
    sets.engaged.Liberator.Adoulin = {}
	sets.engaged.Liberator.SomeAcc.Adoulin = {}
	sets.engaged.Liberator.Acc.Adoulin = {}
	sets.engaged.Liberator.FullAcc.Adoulin = {}
	sets.engaged.Liberator.Fodder.Adoulin = {}
	
    sets.engaged.Liberator.AM = {}
	sets.engaged.Liberator.SomeAcc.AM = {}
	sets.engaged.Liberator.Acc.AM = {}
	sets.engaged.Liberator.FullAcc.AM = {}
	sets.engaged.Liberator.Fodder.AM = {}
	
    sets.engaged.Liberator.Adoulin.AM = {}
	sets.engaged.Liberator.SomeAcc.Adoulin.AM = {}
	sets.engaged.Liberator.Acc.Adoulin.AM = {}
	sets.engaged.Liberator.FullAcc.Adoulin.AM = {}
	sets.engaged.Liberator.Fodder.Adoulin.AM = {}

	sets.engaged.Liberator.PDT = {}
	sets.engaged.Liberator.SomeAcc.PDT = {}
	sets.engaged.Liberator.Acc.PDT = {}
	sets.engaged.Liberator.FullAcc.PDT = {}
	sets.engaged.Liberator.Fodder.PDT = {}
	
	sets.engaged.Liberator.PDT.Adoulin = {}
	sets.engaged.Liberator.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Liberator.Acc.PDT.Adoulin = {}
	sets.engaged.Liberator.FullAcc.PDT.Adoulin = {}
	sets.engaged.Liberator.Fodder.PDT.Adoulin = {}
	
	sets.engaged.Liberator.PDT.AM = {}
	sets.engaged.Liberator.SomeAcc.PDT.AM = {}
	sets.engaged.Liberator.Acc.PDT.AM = {}
	sets.engaged.Liberator.FullAcc.PDT.AM = {}
	sets.engaged.Liberator.Fodder.PDT.AM = {}
	
	sets.engaged.Liberator.PDT.Adoulin.AM = {}
	sets.engaged.Liberator.SomeAcc.PDT.Adoulin.AM = {}
	sets.engaged.Liberator.Acc.PDT.Adoulin.AM = {}
	sets.engaged.Liberator.FullAcc.PDT.Adoulin.AM = {}
	sets.engaged.Liberator.Fodder.PDT.Adoulin.AM = {}
	
	sets.engaged.Liberator.MDT = {}
	sets.engaged.Liberator.SomeAcc.MDT = {}
	sets.engaged.Liberator.Acc.MDT = {}
	sets.engaged.Liberator.FullAcc.MDT = {}
	sets.engaged.Liberator.Fodder.MDT = {}
	
	sets.engaged.Liberator.MDT.Adoulin = {}
	sets.engaged.Liberator.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Liberator.Acc.MDT.Adoulin = {}
	sets.engaged.Liberator.FullAcc.MDT.Adoulin = {}
	sets.engaged.Liberator.Fodder.MDT.Adoulin = {}
	
	sets.engaged.Liberator.MDT.AM = {}
	sets.engaged.Liberator.SomeAcc.MDT.AM = {}
	sets.engaged.Liberator.Acc.MDT.AM = {}
	sets.engaged.Liberator.FullAcc.MDT.AM = {}
	sets.engaged.Liberator.Fodder.MDT.AM = {}
	
	sets.engaged.Liberator.MDT.Adoulin.AM = {}
	sets.engaged.Liberator.SomeAcc.MDT.Adoulin.AM = {}
	sets.engaged.Liberator.Acc.MDT.Adoulin.AM = {}
	sets.engaged.Liberator.FullAcc.MDT.Adoulin.AM = {}
	sets.engaged.Liberator.Fodder.MDT.Adoulin.AM = {}
--]]
	--Extra Special Sets
	
	sets.buff.Souleater = {}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {body="Valorous Mail"})
	
	-- Weapons sets
	sets.weapons.Apocalypse = {main="Apocalypse", sub="Utu Grip"}
	sets.weapons.Foenaria = {main="Foenaria", sub="Utu Grip"}
	sets.weapons.Crepuscular = {main="Crepuscular Scythe", sub="Utu Grip"}
	sets.weapons.Sword = {main="Naegling",sub="Blurred Shield +1"}
	sets.weapons.Caladbolg = {main="Caladbolg", sub="Utu Grip"}
	sets.weapons.GAxe = {main="Lycurgos", sub="Utu Grip"}
	sets.weapons.Club = {main="Loxotic Mace +1", sub="Blurred Shield +1"}
	sets.weapons.Anguta = {main="Anguta",sub="Utu Grip"}
	sets.weapons.Trial = {main="Fermion Sword",sub="Blurred Shield +1"}
	
    end
	
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(2, 15)
    elseif player.sub_job == 'SAM' then
        set_macro_page(3, 15)
    elseif player.sub_job == 'DNC' then
        set_macro_page(4, 15)
    elseif player.sub_job == 'THF' then
        set_macro_page(1, 15)
    else
        set_macro_page(5, 15)
    end
end
autows_list = {['Default']='Torcleaver',['Caladbolg']="Torcleaver",['Apocalypse']="Catastrophe",['Sword']='Savage Blade',['Anguta']="Entropy"}