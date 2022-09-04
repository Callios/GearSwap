-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal', 'SomeAcc','Acc','FullAcc','Bumba','Fodder')
    state.HybridMode:options('Normal','DTLite','PDT','MDT')
    state.WeaponskillMode:options('Match','Normal','AttCap','SomeAcc','Acc','FullAcc','Fodder','Proc')
	state.IdleMode:options('Normal','Gleti','Sphere')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Aeneas','AeneasTP','Tauret','TauretTP','LowBuff')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','Suppa','DWEarrings','DWMax'}

	
	gear.stp_jse_back = {name="Senuna's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	gear.wsd_jse_back = {name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}
	
    -- Additional local binds
    send_command('bind @` gs c step') 
	send_command('bind ^!@` gs c toggle usealtstep')
	send_command('bind ^@` gs c cycle mainstep')
	send_command('bind !@` gs c cycle altstep')
    send_command('bind ^` input /ja "Saber Dance" <me>')
    send_command('bind !` input /ja "Fan Dance" <me>')
	send_command('bind ^\\\\ input /ja "Chocobo Jig II" <me>')
	send_command('bind !\\\\ input /ja "Spectral Jig" <me>')
	send_command('bind !backspace input /ja "Reverse Flourish" <me>')
	send_command('bind ^backspace input /ja "No Foot Rise" <me>')
	send_command('bind %~` gs c cycle SkillchainMode')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	
    -- Extra Melee sets.  Apply these on top of melee sets.
	sets.Suppa = {ear1="Suppanomimi", ear2="Sherida Earring"}
	sets.DWEarrings = {ear1="Suppanomimi",ear2="Eabani Earring"}
	sets.DWMax = {ear1="Suppanomimi",ear2="Eabani Earring",body="Adhemar Jacket +1",hands="Floral Gauntlets",waist="Reiki Yotai"}
	
	-- Weapons sets
	sets.weapons.Aeneas = {main="Aeneas",sub="Gleti's Knife"}
    sets.weapons.AeneasTP = {main="Aeneas",sub="Fusetto +2"}
    sets.weapons.Tauret = {main="Tauret",sub="Gleti's Knife"}
    sets.weapons.TauretTP = {main="Tauret",sub="Fusetto +2"}
	sets.weapons.LowBuff = {main="Aeneas",sub="Blurred Knife +1"}
	
    -- Precast Sets
    
    -- Precast sets to enhance JAs

    sets.precast.JA['No Foot Rise'] = {body="Horos Casaque +3"} --body="Horos Casaque +1"

    sets.precast.JA['Trance'] = {head="Horos Tiara +3"} --head="Horos Tiara +1"

    sets.precast.JA['Fan Dance'] = {hands="Horos bangles +3"}

    sets.precast.JA['Saber Dance'] = {legs="Horos tights +3"}
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Yamarang",
        head="Horos tiara +3",neck="Unmoving Collar +1",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
        body="Maxixi Casaque +1",hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Metamorph Ring +1",
        back="Toetapper Mantle",waist="Chaac Belt",legs="Dashing Subligar",feet="Maxixi toe shoes +1"}
		
	sets.Self_Waltz = {head="Horos tiara +3",body="Passion Jacket",ring1="Asklepian Ring"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    
    sets.precast.Samba = {head="Maxixi Tiara +1",back=gear.stp_jse_back} --head="Maxixi Tiara"

    sets.precast.Jig = {legs="Horos Tights +3", feet="Maxixi Toe Shoes +1"} --legs="Horos Tights", feet="Maxixi Toe Shoes"

    sets.precast.Step = {ammo="C. Palug Stone",
        head="Malignance chapeau",neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Digni. Earring",
        body="Malignance Tabard",hands="Maxix Bangles +3",ring1="Regal Ring",ring2="Chirich Ring +1",
        back=gear.stp_jse_back,waist="Olseni Belt",legs="Malignance Tights",feet="Horos Toe Shoes +3"}
		
    sets.Enmity = {ammo="Paeapua",
        head="Nyame Helm",neck="Unmoving Collar +1",ear1="Friomisi Earring",ear2="Trux Earring",
        body="Emet Harness +1",hands="Malignance Gloves",ring1="Petrov Ring",ring2="Vengeful Ring",
        back="Solemnity Cape",waist="Goading Belt",legs="Nyame Flanchard",feet="Malignance Boots"}
		
    sets.precast.JA.Provoke = sets.Enmity

    sets.precast.Flourish1 = {}
    sets.precast.Flourish1['Violent Flourish'] = {ammo="C. Palug Stone",
        head="Malignance Chapeau",neck="Combatant's Torque",ear1="Telos Earring",ear2="Digni. Earring",
        body="Horos Casaque +3",hands="Malignance Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
        back=gear.stp_jse_back,waist="Eschan Stone",legs="Horos Tights +3",feet="Malignance Boots"}
		
    sets.precast.Flourish1['Animated Flourish'] = sets.Enmity
		
    sets.precast.Flourish1['Desperate Flourish'] = {ammo="C. Palug Stone",
    head="Malignance Chapeau",neck="Combatant's Torque",ear1="Telos Earring",ear2="Digni. Earring",
    body="Horos Casaque +3",hands="Malignance Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
    back=gear.stp_jse_back,waist="Eschan Stone",legs="Horos Tights +3",feet="Malignance Boots"}

    sets.precast.Flourish2 = {}
    sets.precast.Flourish2['Reverse Flourish'] = {back="Toetapper Mantle",hands="Maculele bangles +1"} --hands="Charis Bangles +2"

    sets.precast.Flourish3 = {}
    sets.precast.Flourish3['Striking Flourish'] = {} --body="Charis Casaque +2"
    sets.precast.Flourish3['Climactic Flourish'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {ammo="Sapience Orb",
		head=gear.HercHeadFC,neck="Baetyl Pendant",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Adhemar jacket",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Rahab Ring",waist="Flume Belt +1",
		legs=gear.HercLegsFC}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Voluspa Tathlum",
        head="Nyame Helm",neck="Fotia Gorget",ear1="Ishvara Earring",ear2="Moonshade Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Regal Ring",
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {neck="Combatant's Torque"})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {ammo="C. Palug Stone",neck="Combatant's Torque",ear1="Telos Earring",body="Meg. Cuirie +2",waist="Olseni Belt",legs="Meg. Chausses +2",feet="Malignance Boots"})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {ammo="C. Palug Stone",neck="Combatant's Torque",ear1="Telos Earring",body="Meg. Cuirie +2",waist="Olseni Belt",legs="Meg. Chausses +2",feet="Malignance Boots"})
	sets.precast.WS.Proc = {ammo="Yamarang",
        head="Wh. Rarab Cap +1",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Sanare Earring",
        body="Dread Jupon",hands="Kurys Gloves",ring1="Defending Ring",ring2="Dark Ring",
        back="Moonbeam Cape",waist="Flume belt +1",legs="Dashing Subligar",feet="Ahosi Leggings"}
    
    sets.precast.WS.AttCap = {ammo="Crepuscular Pebble",
    head="Nyame Helm",neck="Fotia Gorget",ear1="Ishvara Earring",ear2="Moonshade Earring",
    body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Regal Ring",
    back=gear.wsd_jse_back,waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {ammo="C. Palug Stone",hands="Maxixi Bangles +3",legs="Horos Tights +3",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Odr Earring",ring1="Ilabrat Ring"})
    sets.precast.WS["Rudra's Storm"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ammo="C. Palug Stone",head="Lilitu Headpiece",neck="Caro Necklace",ear1="Moonshade Earring",body="Meg. Cuirie +2",legs=gear.herculean_wsd_legs})
    sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS.Acc, {ear1="Moonshade Earring",body="Meg. Cuirie +2"})
	sets.precast.WS["Rudra's Storm"].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS["Rudra's Storm"].Fodder = set_combine(sets.precast.WS["Rudra's Storm"], {})
    sets.precast.WS["Rudra's Storm"].AttCap = set_combine(sets.precast.WS["Rudra's Storm"], {body="Gleti's Cuirass"})
	
    sets.precast.WS["Shark Bite"] = set_combine(sets.precast.WS, {ammo="C. Palug Stone",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Sherida Earring",hands="Maxixi Bangles +3",legs="Nyame Flanchard",waist="Grunfeld Rope"})
    sets.precast.WS["Shark Bite"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {head="Lilitu Headpiece",neck="Caro Necklace",ear1="Moonshade Earring",body="Meg. Cuirie +2",legs=gear.herculean_wsd_legs})
    sets.precast.WS["Shark Bite"].Acc = set_combine(sets.precast.WS.Acc, {ear1="Moonshade Earring",body="Meg. Cuirie +2"})
	sets.precast.WS["Shark Bite"].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS["Shark Bite"].Fodder = set_combine(sets.precast.WS["Shark Bite"], {})
	
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {ammo="Charis Feather",head="Adhemar Bonnet +1",neck="Fotia Gorget",body="Meg. Cuirie +2",hands="Mummu Wrists +2",ring1="Ilabrat Ring",waist="Fotia Belt",legs="Lustr. Subligar +1"})
    sets.precast.WS['Evisceration'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {head="Adhemar Bonnet +1",neck="Fotia Gorget",body="Abnoba Kaftan",hands="Mummu Wrists +2",ring1="Begrudging Ring",waist="Fotia Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
    sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS.Acc, {head="Mummu Bonnet +2",ring1="Begrudging Ring",neck="Fotia Gorget",body="Sayadio's Kaftan",hands="Mummu Wrists +2",waist="Fotia Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS['Evisceration'].FullAcc = set_combine(sets.precast.WS.FullAcc, {head="Mummu Bonnet +2",body="Mummu Jacket +2",hands="Mummu Wrists +2",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS['Evisceration'].Fodder = set_combine(sets.precast.WS['Evisceration'], {})
	
    sets.precast.WS['Pyrrhic Kleos'] = set_combine(sets.precast.WS, {head="Adhemar Bonnet +1",hands="Adhemar Wrist. +1",feet=gear.herculean_ta_feet})
    sets.precast.WS['Pyrrhic Kleos'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {head="Adhemar Bonnet +1",hands="Adhemar Wrist. +1",})
    sets.precast.WS['Pyrrhic Kleos'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Pyrrhic Kleos'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Pyrrhic Kleos'].Fodder = set_combine(sets.precast.WS['Pyrrhic Kleos'], {})

    sets.precast.WS['Aeolian Edge'] = {ammo="Ghastly tathlum +1",
        head="Nyame Helm",neck="Sibyl scarf",ear1="Friomisi Earring",ear2="Moonshade Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Metamor. Ring +1",ring2="Epaminondas's Ring",
        back=gear.wsd_jse_back,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring",ear2="Sherida Earring"}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Sherida Earring"}
	
    sets.Skillchain = {} --hands="Charis Bangles +2"
    
    
    -- Midcast Sets
    
    sets.midcast.FastRecast = {
        head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Defending Ring",ring2="Prolix Ring",
        back="Moonbeam Cape",waist="Flume belt +1",legs="Rawhide Trousers",feet="Malignance Boots"}
        
    -- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})

    sets.midcast['Phalanx'] = set_combine(sets.EnhancingSkill, {
		head=gear.taeon_phalanx_head,
		body=gear.taeon_phalanx_body,
		hands=gear.taeon_phalanx_hands,
		legs=gear.taeon_phalanx_legs,
		feet=gear.taeon_phalanx_feet,
	})

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {}
    sets.ExtraRegen = {}
    

    -- Idle sets

    sets.idle = {ammo="Staunch Tathlum +1",
    head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
    body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Dark Ring",
    back="Moonbeam Cape",waist="Flume belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		

    sets.idle.Gleti = {ammo="Staunch Tathlum +1",
    head="Gleti's Mask",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
    body="Gleti's Cuirass",hands="Gleti's Gauntlets",ring1="Defending Ring",ring2="Dark Ring",
    back="Moonbeam Cape",waist="Flume belt +1",legs="Gleti's Breeches",feet="Gleti's Boots"}


    sets.idle.Sphere = set_combine(sets.idle, {body="Mekosu. Harness"})
    
    -- Defense sets

    sets.defense.PDT = {ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Dark Ring",
        back="Moonbeam Cape",waist="Flume belt +1",legs="Malignance Tights",feet="Malignance Boots"}

    sets.defense.MDT = {ammo="Staunch Tathlum +1",
    head="Malignace Chapeau",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
    body="Malignace Tabard",hands="Malignace Gloves",ring1="Defending Ring",ring2="Dark Ring",
    back="Moonbeam Cape",waist="Engraved belt",legs="Malignace Tights",feet="Malignance Boots"}
		
	sets.defense.MEVA = {ammo="Staunch Tathlum +1",
    head="Malignance Chapeau",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
    body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Dark Ring",
    back="Moonbeam Cape",waist="Engraved belt",legs="Malignance Tights",feet="Malignance Boots"}

    sets.Kiting = {feet="Tandava crackows"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {ammo="Yamarang",
        head="Adhemar Bonnet +1",neck="Anu Torque",ear1="Cessance Earring",ear2="Sherida Earring",
        body="Horos Casaque +3",hands="Adhemar Wrist. +1",ring1="Gere Ring",ring2="Epona's Ring",
        back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Horos T. Shoes +3"}
		
    sets.engaged.DTLite = {ammo="Yamarang",
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Sherida Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Gere Ring",ring2="Moonbeam Ring",
        back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.engaged.SomeAcc = {ammo="Yamarang",
        head="Dampening Tam",neck="Combatant's Torque",ear1="Cessance Earring",ear2="Sherida Earring",
        body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Gere Ring",ring2="Epona's Ring",
        back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.HercFeetTP}
    
	sets.engaged.Acc = {ammo="Yamarang",
        head="Malignance Chapeau",neck="Combatant's Torque",ear1="Telos Earring",ear2="Sherida Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
        back=gear.stp_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.engaged.FullAcc = {ammo="C. Palug Stone",
        head="Dampening Tam",neck="Combatant's Torque",ear1="Telos Earring",ear2="Digni. Earring",
        body="Mummu Jacket +2",hands="Adhemar Wrist. +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back=gear.stp_jse_back,waist="Olseni Belt",legs="Meg. Chausses +2",feet="Malignance Boots"}

    sets.engaged.Fodder = {ammo="Yamarang",
        head="Dampening Tam",neck="Ainia Collar",ear1="Brutal Earring",ear2="Sherida Earring",
        body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Gere Ring",ring2="Epona's Ring",
        back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.HercFeetTP}

    sets.engaged.PDT = {ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Sherida Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Moonlbeam Ring",
        back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignace Boots"}

    sets.engaged.Bumba = {ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",neck="Warder's Charm +1",ear1="Brutal Earring",ear2="Sherida Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gere Ring",
        back=gear.stp_jse_back,waist="Engraved Belt",legs="Malignance Tights",feet="Malignace Boots"}

    sets.engaged.SomeAcc.PDT = {ammo="Staunch Tathlum +1",
    head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Sherida Earring",
    body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Moonlbeam Ring",
    back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignace Boots"}
		
    sets.engaged.Acc.PDT = {ammo="Staunch Tathlum +1",
    head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Sherida Earring",
    body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Moonlbeam Ring",
    back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignace Boots"}

    sets.engaged.FullAcc.PDT = {ammo="Staunch Tathlum +1",
    head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Sherida Earring",
    body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Moonlbeam Ring",
    back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignace Boots"}
		
    sets.engaged.Fodder.PDT = {ammo="Staunch Tathlum +1",
    head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Sherida Earring",
    body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Moonlbeam Ring",
    back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignace Boots"}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Saber Dance'] = {legs="Horos Tights +3"} --legs="Horos Tights"
    sets.buff['Climactic Flourish'] = {head="Maculele Tiara +2",ammo="Charis Feather",body="Meg. Cuirie +2"} --head="Charis Tiara +2"
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(3, 2)
    elseif player.sub_job == 'NIN' then
        set_macro_page(3, 2)
    elseif player.sub_job == 'SAM' then
        set_macro_page(3, 2)
    elseif player.sub_job == 'THF' then
        set_macro_page(3, 2)
    else
        set_macro_page(3, 2)
    end
end