function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc', 'Fodder')
    state.WeaponskillMode:options('Match','Normal', 'SomeAcc', 'Acc', 'FullAcc', 'Fodder')
    state.HybridMode:options('Normal', 'PDT')
    state.PhysicalDefenseMode:options('PDT', 'HP')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT')
	state.Weapons:options('Godhands','Staff','ProcStaff','ProcClub','Barehanded','ProcSword','ProcGreatSword','ProcScythe','ProcPolearm','ProcGreatKatana')

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None'}

    update_melee_groups()
	
	-- Additional local binds
	send_command('bind ^` input /ja "Boost" <me>')
	send_command('bind !` input /ja "Perfect Counter" <me>')
	send_command('bind ^backspace input /ja "Mantra" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
	
	select_default_macro_book()
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs on use
	sets.precast.JA['Hundred Fists'] = {legs="Hesychast's Hose +1"}
	sets.precast.JA['Boost'] = {} --hands="Anchorite's Gloves +1"
	sets.precast.JA['Boost'].OutOfCombat = {} --hands="Anchorite's Gloves +1", Remove Haste and Add Slow Gear.
	sets.precast.JA['Dodge'] = {feet="Anchorite's Gaiters +1"}
	sets.precast.JA['Focus'] = {head="Anchorite's Crown +1"}
	sets.precast.JA['Counterstance'] = {} --feet="Hesychast's Gaiters +1"
	sets.precast.JA['Footwork'] = {feet="Shukuyu Sune-Ate"}
	sets.precast.JA['Formless Strikes'] = {body="Hesychast's Cyclas"}
	sets.precast.JA['Mantra'] = {feet="Mel. Gaiters +2"} --feet="Hesychast's Gaiters +1"

	sets.precast.JA['Chi Blast'] = {}
	
	sets.precast.JA['Chakra'] = {ammo="Staunch Tathlum +1",
        head="Kendatsuba Jinpachi +1",neck="Unmoving Collar +1",
        body="Anchorite's Cyclas +3",hands="Hesychast's Gloves +1",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back="Moonbeam Cape",waist="Moonbow Belt +1",legs="Kendatsuba Hakama +1",feet="Anchorite's Gaiters +3"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {ammo="Voluspa Tathlum",
		head="Malignance Chapeau",neck="Moonbeam Nodowa",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Ilabrat Ring",ring2="Chirich Ring +1",
		back=gear.MNK_TP,waist="Moonbow Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.precast.Flourish = {ammo="Voluspa Tathlum",
		head="Malignance Chapeau",neck="Moonbeam Nodowa",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Ilabrat Ring",ring2="Chirich Ring +1",
		back=DEX_DA,waist="Moonbow Belt +1",legs="Malignance Tights",feet="Malignance Boots"}


	-- Fast cast sets for spells
	
	sets.precast.FC = {ammo="Impatiens",
	head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
	body="Dread Jupon",hands="Leyline Gloves",ring2="Lebeche Ring",ring2="Kishar Ring",
	legs="Rawhide Trousers"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})

       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Knobkierrie",
        head="Nyame Helm",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
        body="Adhemar Jacket +1",
		hands="Adhemar Wristbands +1",
		ring1="Niqmaddu Ring",
		ring2="Epaminondas's Ring",
        back=gear.MNK_WS,
		waist="Moonbow Belt +1",
		legs="Hizamaru Hizayoroi +2",
		feet="Kendatsuba Sune-Ate +1"}

	sets.precast.WSSomeAcc = {legs="Malignance Tights"}
	sets.precast.WSAcc = {hands="Malignance Gloves",legs="Malignance Tights"}
	sets.precast.WSFullAcc = {ear1="Mache Earring +1",ear2="Odr Earring",
		hands="Malignance Gloves",legs="Malignance Tights",ring2="Ilabrat Ring"}

	sets.precast.WSFodder = {}
	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, sets.precast.WSSomeAcc)	
	sets.precast.WS.Acc = set_combine(sets.precast.WS, sets.precast.WSAcc)
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, sets.precast.WSFullAcc)
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, sets.precast.WSFodder)

	-- Specific weaponskill sets.

	sets.precast.WS['Raging Fists']    = set_combine(sets.precast.WS, {
		head="Mpaca's Cap",
		neck="Monk's Nodowa +2",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
        body="Kendatsuba Samue +1",
		hands="Kendatsuba Tekko +1",
		ring1="Niqmaddu Ring",
		ring2="Regal Ring",
        back=gear.MNK_WS,
		waist="Moonbow Belt +1",
		legs="Mpaca's Hose",
		feet="Kendatsuba Sune-Ate +1"})

	sets.precast.WS['Howling Fist']    = set_combine(sets.precast.WS, {
		head="Hesychast's Crown +3",
		neck="Monk's Nodowa +2",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
        body="Kendatsuba Samue +1",
		hands="Kendatsuba Tekko +1", --swap to Kenda+1 or Herc TA
		ring1="Niqmaddu Ring",
		ring2="Regal Ring",
        back=gear.MNK_WS,
		waist="Moonbow Belt +1",
		legs="Kendatsuba Hakama +1",
		feet="Kendatsuba Sune-Ate +1"})

	sets.precast.WS['Asuran Fists']    = set_combine(sets.precast.WS, {
		ear1="Mache Earring +1",ear2="Cessance Earring",
		ring2="Regal Ring",
		back=gear.MNK_WS})

	sets.precast.WS["Ascetic's Fury"]  = set_combine(sets.precast.WS, {
		ammo="Knobkierrie",
		head="Adhemar Bonnet +1",
		neck="Monk's Nodowa +2",
		body="Adhemar Jacket +1",
		hands="Ryuo Tekko +1",
		ring1="Niqmaddu Ring",
		ring2="Regal Ring",
		back=gear.MNK_WS,
		waist="Moonbow Belt +1",
		legs="Hizamaru Hizayoroi +2",
		feet="Rao Sune-Ate +1"})

	sets.precast.WS["Victory Smite"]   = set_combine(sets.precast.WS, {
		ammo="Knobkierrie",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear2="Brutal Earring",
		body="Kendatsuba Samue +1",
		hands="Ryuo Tekko +1",
		ring1="Niqmaddu Ring",
		ring2="Regal Ring",
		back=gear.MNK_WS,
		waist="Moonbow Belt +1",
		legs="Kendatsuba Hakama +1",
		feet="Kendatsuba Sune-Ate +1"})

	sets.precast.WS['Shijin Spiral']   = set_combine(sets.precast.WS, {
		ammo="Voluspa Tathlum",
		head="Kendatsuba Jinpachi +1",
		neck="Fotia Gorget",
		ear2="Mache Earring +1",
		body="Adhemar Jacket +1",
		hands="Kendatsuba Tekko +1",
		ring1="Niqmaddu Ring",
		ring2="Ilabrat Ring",
		back=gear.MNK_WS,
		waist="Moonbow Belt +1",
		legs="Kendatsuba Hakama +1",
		feet="Kendatsuba Sune-Ate +1"})

	sets.precast.WS['Dragon Kick']     = set_combine(sets.precast.WS, {
		head="Hesychast's Crown +3",
		neck="Monk's Nodowa +2",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
        body="Kendatsuba Samue +1",
		hands="Kendatsuba Tekko +1",
		ring1="Niqmaddu Ring",
		ring2="Regal Ring",
        back=gear.MNK_WS,
		waist="Moonbow Belt +1",
		legs="Kendatsuba Hakama +1",
		feet="Anchorite's Gaiters +3"})

	sets.precast.WS['Tornado Kick']    = set_combine(sets.precast.WS, {
		head="Kendatsuba Jinpachi +1",
		neck="Monk's Nodowa +2",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
        body="Kendatsuba Samue +1",
		hands="Kendatsuba Tekko +1",
		ring1="Niqmaddu Ring",
		ring2="Regal Ring",
        back=gear.MNK_WS,
		waist="Moonbow Belt +1",
		legs="Kendatsuba Hakama +1",
		feet="Anchorite's Gaiters +3"})

	sets.precast.WS['Spinning Attack'] = set_combine(sets.precast.WS, {waist="Grunfeld Rope"})

	sets.precast.WS["Raging Fists"].SomeAcc = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSSomeAcc)
	sets.precast.WS["Howling Fist"].SomeAcc = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSSomeAcc)
	sets.precast.WS["Asuran Fists"].SomeAcc = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSSomeAcc)
	sets.precast.WS["Ascetic's Fury"].SomeAcc = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSSomeAcc, {head="Mummu Bonnet +2",body="Abnoba Kaftan",hands="Ryuo Tekko",ring2="Begrudging Ring",waist="Grunfeld Rope",legs="Mummu Kecks +2",feet=gear.herculean_wsd_feet})
	sets.precast.WS["Victory Smite"].SomeAcc = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSSomeAcc, {head="Mummu Bonnet +2",ear1="Moonshade Earring",body="Abnoba Kaftan",hands="Ryuo Tekko",ring2="Begrudging Ring",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS["Shijin Spiral"].SomeAcc = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSSomeAcc, {})
	sets.precast.WS["Dragon Kick"].SomeAcc = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSSomeAcc)
	sets.precast.WS["Tornado Kick"].SomeAcc = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSSomeAcc)
	
	sets.precast.WS["Raging Fists"].Acc = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSAcc)
	sets.precast.WS["Howling Fist"].Acc = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSAcc)
	sets.precast.WS["Asuran Fists"].Acc = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSAcc)
	sets.precast.WS["Ascetic's Fury"].Acc = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSAcc, {head="Mummu Bonnet +2",body="Sayadio's Kaftan",hands="Ryuo Tekko",ring2="Begrudging Ring",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS["Victory Smite"].Acc = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSAcc, {head="Mummu Bonnet +2",ear1="Moonshade Earring",body="Sayadio's Kaftan",hands="Ryuo Tekko",ring2="Begrudging Ring",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS["Shijin Spiral"].Acc = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSAcc)
	sets.precast.WS["Dragon Kick"].Acc = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSAcc)
	sets.precast.WS["Tornado Kick"].Acc = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSAcc)

	sets.precast.WS["Raging Fists"].FullAcc = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSFullAcc)
	sets.precast.WS["Howling Fist"].FullAcc = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSFullAcc)
	sets.precast.WS["Asuran Fists"].FullAcc = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSFullAcc)
	sets.precast.WS["Ascetic's Fury"].FullAcc = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSFullAcc, {head="Mummu Bonnet +2",body="Mummu Jacket +2",hands="Ryuo Tekko",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS["Victory Smite"].FullAcc = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSFullAcc, {head="Mummu Bonnet +2",body="Mummu Jacket +2",hands="Ryuo Tekko",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS["Shijin Spiral"].FullAcc = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSFullAcc)
	sets.precast.WS["Dragon Kick"].FullAcc = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSFullAcc)
	sets.precast.WS["Tornado Kick"].FullAcc = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSFullAcc)
	
	sets.precast.WS["Raging Fists"].Fodder = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSFodder)
	sets.precast.WS["Howling Fist"].Fodder = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSFodder)
	sets.precast.WS["Asuran Fists"].Fodder = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSFodder)
	sets.precast.WS["Ascetic's Fury"].Fodder = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSFodder, {head="Adhemar Bonnet +1",neck="Caro Necklace",body="Abnoba Kaftan",ring1="Begrudging Ring",waist="Grunfeld Rope"})
	sets.precast.WS["Victory Smite"].Fodder = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSFodder, {ear1="Moonshade Earring",body="Abnoba Kaftan",ring1="Begrudging Ring"})
	sets.precast.WS["Shijin Spiral"].Fodder = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSFodder)
	sets.precast.WS["Dragon Kick"].Fodder = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSFodder)
	sets.precast.WS["Tornado Kick"].Fodder = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSFodder)


	sets.precast.WS['Cataclysm'] = {ammo="Ghastly Tathlum +1",
		neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Crematio Earring",
		hands="Malignance Gloves",ring1="Shiva Ring +1",
		back="Toro Cape",legs="Nahtirah Trousers"}
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring",ear2="Sherida Earring",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}
	
	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",
		ear2="Loquacious Earring",
        body="Malignance Tabard",
		hands="Malignance Gloves",
        ring1="Gelatinous Ring +1",ring2="Defending Ring",
		waist="Moonbow Belt +1",feet="Malignance Boots"}
		
	-- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})
		
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {body="Hesychast's Cyclas",ring2="Sheltered Ring",feet="Nyame Sollerets"}
	

	-- Idle sets
	sets.idle = {ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Eabani Earring",ear2="Odnowa Earring +1",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Moonbow Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

	sets.idle.Weak = {ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Eabani Earring",ear2="Infused Earring",
        body="Ashera Harness",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Moonbow Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

	sets.idle.PDT = {ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Gelatinous Ring +1",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Moonbow Belt +1",legs="Malignance Tights",feet="Malignance Boots"}	

	-- Defense sets
	sets.defense.PDT = {ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Eabani Earring",ear2="Odnowa Earring +1",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Gelatinous Ring +1",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Moonbow Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
	-- Defense sets
	sets.defense.HP = {ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Gelatinous Ring +1",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Moonbow Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

	sets.defense.MDT = {ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Eabani Earring",ear2="Odnowa Earring +1",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Gelatinous Ring +1",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Moonbow Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.defense.MEVA = {ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Eabani Earring",ear2="Odnowa Earring +1g",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Gelatinous Ring +1",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Moonbow Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

	sets.Kiting = {feet="Hermes' Sandals"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee sets
	sets.engaged = {ammo="Ginsen",
		head="Adhemar Bonnet +1",
		neck="Moonbeam Nodowa",
		ear1="Sherida Earring",ear2="Schere Earring",
		body="Kendatsuba Samue +1",
		hands="Adhemar Wristbands +1",
		ring1="Niqmaddu Ring",ring2="Epona's Ring",
		back=gear.MNK_TP,
		waist="Moonbow Belt +1",
		legs="Mpaca's Hose",
		feet="Kendatsuba Sune-Ate +1"}
		
	sets.engaged.SomeAcc = {ammo="Ginsen",
		head="Kendatsuba Jinpachi +1",
		neck="Moonbeam Nodowa",
		ear1="Sherida Earring",ear2="Brutal Earring",
		body="Kendatsuba Samue +1",
		hands="Adhemar Wristbands +1",
		ring1="Niqmaddu Ring",ring2="Epona's Ring",
		back=gear.MNK_TP,
		waist="Moonbow Belt +1",
		legs="Kendatsuba Hakama +1",
		feet="Kendatsuba Sune-Ate +1"}
	
	sets.engaged.Acc = {ammo="Voluspa Tathlum",
		head="Kendatsuba Jinpachi +1",
		neck="Moonbeam Nodowa",
		ear1="Odr Earring",ear2="Telos Earring",
		body="Kendatsuba Samue +1",
		hands="Kendatsuba Tekko +1",
		ring1="Niqmaddu Ring",ring2="Chirich Ring +1",
		back=gear.MNK_TP,
		waist="Moonbow Belt +1",
		legs="Kendatsuba Hakama +1",
		feet="Kendatsuba Sune-Ate +1"}
	
	sets.engaged.FullAcc = {ammo="Voluspa Tathlum",
		head="Kendatsuba Jinpachi +1",
		neck="Moonbeam Nodowa",
		ear1="Odr Earring",ear2="Mache Earring +1",
		body="Kendatsuba Samue +1",
		hands="Kendatsuba Tekko +1",
		ring1="Niqmaddu Ring",ring2="Chirich Ring +1",
		back=gear.MNK_TP,
		waist="Moonbow Belt +1",
		legs="Kendatsuba Hakama +1",
		feet="Kendatsuba Sune-Ate +1"}
	
	sets.engaged.Fodder = {ammo="Ginsen",
		head="Adhemar Bonnet +1",
		neck="Moonbeam Nodowa",
		ear1="Sherida Earring",ear2="Brutal Earring",
		body="Kendatsuba Samue +1",
		hands="Adhemar Wristbands +1",
		ring1="Niqmaddu Ring",ring2="Epona's Ring",
		back=gear.MNK_TP,
		waist="Moonbow Belt +1",
		legs="Hesychast's Hose +3",
		feet="Anchorite's Gaiters +3"}

	-- Defensive melee hybrid sets
	sets.engaged.PDT = {ammo="Ginsen",
		head="Malignance Chapeau",
		neck="Moonbeam Nodowa",
		ear1="Sherida Earring",
		ear2="Brutal Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Niqmaddu Ring",
		ring2="Epona's Ring",
		back= gear.MNK_TP,
		waist="Moonbow Belt +1",
		legs="Malignance Tights",
		feet="Malignance Boots"}
		
	sets.engaged.SomeAcc.PDT = {ammo="Ginsen",
		head="Malignance Chapeau",
		neck="Moonbeam Nodowa",
		ear1="Sherida Earring",
		ear2="Brutal Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Niqmaddu Ring",
		ring2="Epona's Ring",
		back= gear.MNK_TP,
		waist="Moonbow Belt +1",
		legs="Malignance Tights",
		feet="Malignance Boots"}
	
	sets.engaged.Acc.PDT = {ammo="Voluspa Tathlum",
		head="Malignance Chapeau",
		neck="Moonbeam Nodowa",
		ear1="Sherida Earring",
		ear2="Brutal Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Niqmaddu Ring",
		ring2="Epona's Ring",
		back= gear.MNK_TP,
		waist="Moonbow Belt +1",
		legs="Malignance Tights",
		feet="Malignance Boots"}
	
	sets.engaged.FullAcc.PDT = {ammo="Ginsen",
		head="Malignance Chapeau",
		neck="Moonbeam Nodowa",
		ear1="Sherida Earring",
		ear2="Brutal Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Niqmaddu Ring",
		ring2="Epona's Ring",
		back= gear.MNK_TP,
		waist="Moonbow Belt +1",
		legs="Malignance Tights",
		feet="Malignance Boots"}
	
	sets.engaged.Fodder.PDT = {ammo="Ginsen",
		head="Malignance Chapeau",
		neck="Moonbeam Nodowa",
		ear1="Sherida Earring",
		ear2="Brutal Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Niqmaddu Ring",
		ring2="Epona's Ring",
		back= gear.MNK_TP,
		waist="Moonbow Belt +1",
		legs="Malignance Tights",
		feet="Malignance Boots"}
	
-- MEVA engaged sets	
	sets.engaged.MEVA = {ammo="Ginsen",
		head="Kendatsuba Jinpachi +1",
		neck="Moonbeam Nodowa",
		ear1="Sherida Earring",
		ear2="Brutal Earring",
		body="Kendatsuba Samue +1",
		hands="Kendatsuba Tekko +1",
		ring1="Niqmaddu Ring",
		ring2="Epona's Ring",
		back= gear.MNK_TP,
		waist="Moonbow Belt +1",
		legs="Kendatsuba Hakama +1",
		feet="Kendatsuba Sune-Ate +1"}
		
    sets.engaged.SomeAcc.MEVA = {ammo="Voluspa Tathlum",
        head="Kendatsuba Jinpachi +1",
		neck="Moonbeam Nodowa",
		ear1="Sherida Earring",
		ear2="Telos Earring",
		body="Kendatsuba Samue +1",
		hands="Kendatsuba Tekko +1",
		ring1="Niqmaddu Ring",
		ring2="Epona's Ring",
		back= gear.MNK_TP,
		waist="Moonbow Belt +1",
		legs="Kendatsuba Hakama +1",
		feet="Kendatsuba Sune-Ate +1"}
		
    sets.engaged.Acc.MEVA = {ammo="Voluspa Tathlum",
        head="Kendatsuba Jinpachi +1",
		neck="Moonbeam Nodowa",
		ear1="Odr Earring",
		ear2="Telos Earring",
		body="Kendatsuba Samue +1",
		hands="Kendatsuba Tekko +1",
		ring1="Niqmaddu Ring",
		ring2="Chirich Ring +1",
		back= gear.MNK_TP,
		waist="Moonbow Belt +1",
		legs="Kendatsuba Hakama +1",
		feet="Kendatsuba Sune-Ate +1"}
		
	sets.engaged.FullAcc.MEVA = {ammo="Voluspa Tathlum",
        head="Kendatsuba Jinpachi +1",
		neck="Moonbeam Nodowa",
		ear1="Odr Earring",
		ear2="Mache Earring +1",
		body="Kendatsuba Samue +1",
		hands="Kendatsuba Tekko +1",
		ring1="Niqmaddu Ring",
		ring2="Chirich Ring +1",
		back= gear.MNK_TP,
		waist="Moonbow Belt +1",
		legs="Kendatsuba Hakama +1",
		feet="Kendatsuba Sune-Ate +1"}
	
    sets.engaged.Hybrid = {ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",
		neck="Moonbeam Nodowa",
		ear1="Sherida Earring",
		ear2="Schere Earring",
		body="Kendatsuba Samue +1",
		hands="Malignance Gloves",
		ring1="Niqmaddu Ring",
		ring2="Epona's Ring",
		back= gear.MNK_TP,
		waist="Moonbow Belt +1",
		legs="Malignance Tights",
		feet="Kendatsuba Sune-Ate +1"}
		
    sets.engaged.SomeAcc.Hybrid = {ammo="Voluspa Tathlum",
        head="Malignance Chapeau",
		neck="Moonbeam Nodowa",
		ear1="Sherida Earring",
		ear2="Telos Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Niqmaddu Ring",
		ring2="Epona's Ring",
		back= gear.MNK_TP,
		waist="Moonbow Belt +1",
		legs="Kendatsuba Hakama +1",
		feet="Kendatsuba Sune-Ate +1"}
	
	sets.engaged.Acc.Hybrid = {ammo="Voluspa Tathlum",
        head="Malignance Chapeau",
		neck="Moonbeam Nodowa",
		ear1="Odr Earring",
		ear2="Telos Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Niqmaddu Ring",
		ring2="Chirich Ring +1",
		back= gear.MNK_TP,
		waist="Moonbow Belt +1",
		legs="Kendatsuba Hakama +1",
		feet="Kendatsuba Sune-Ate +1"}
		
	sets.engaged.FullAcc.Hybrid = {ammo="Voluspa Tathlum",
        head="Malignance Chapeau",
		neck="Moonbeam Nodowa",
		ear1="Odr Earring",
		ear2="Mache Earring +1",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Niqmaddu Ring",
		ring2="Chirich Ring +1",
		back= gear.MNK_TP,
		waist="Moonbow Belt +1",
		legs="Kendatsuba Hakama +1",
		feet="Kendatsuba Sune-Ate +1"}
	-- Hundred Fists/Impetus melee set mods
	
	sets.engaged.HF = set_combine(sets.engaged, {})
	sets.engaged.SomeAcc.HF = set_combine(sets.engaged.SomeAcc, {})
	sets.engaged.Acc.HF = set_combine(sets.engaged.Acc, {})
	sets.engaged.FullAcc.HF = set_combine(sets.engaged.FullAcc, {})
	sets.engaged.Fodder.HF = set_combine(sets.engaged.Fodder, {})




	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff.Impetus = {body="Bhikku Cyclas +1"}
	sets.buff.Footwork = {feet="Shukuyu Sune-Ate"}
	sets.buff.Boost = {} --waist="Ask Sash"
	
	sets.FootworkWS = {feet="Shukuyu Sune-Ate"}
	sets.DayIdle = {}
	sets.NightIdle = {}
    sets.Knockback = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.Skillchain = {legs="Ryuo Hakama"}
	
	-- Weapons sets
	sets.weapons.Godhands = {main="Godhands"}
	sets.weapons.Barehanded = {main=empty}
	sets.weapons.Staff = {main="Malignance Pole",sub="Bloodrain Strap"}
	sets.weapons.ProcStaff = {main="Terra's Staff"}
	sets.weapons.ProcClub = {main="Mafic Cudgel"}
	sets.weapons.ProcSword = {main="Ark Sword",sub=empty}
	sets.weapons.ProcGreatSword = {main="Lament",sub=empty}
	sets.weapons.ProcScythe = {main="Ark Scythe",sub=empty}
	sets.weapons.ProcPolearm = {main="Pitchfork +1",sub=empty}
	sets.weapons.ProcGreatKatana = {main="Hardwood Katana",sub=empty}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(5, 20)
	elseif player.sub_job == 'NIN' then
		set_macro_page(4, 20)
	elseif player.sub_job == 'THF' then
		set_macro_page(6, 20)
	elseif player.sub_job == 'RUN' then
		set_macro_page(7, 20)
	else
		set_macro_page(6, 20)
	end
end