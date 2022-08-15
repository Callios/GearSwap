-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal','Acc')
    state.RangedMode:options('Normal', 'Acc','Trial')
    state.WeaponskillMode:options('Match','Normal', 'Acc','Proc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Refresh')
	state.HybridMode:options('Normal','DT')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'DWMax'}
	state.Weapons:options('Default','Trial','Ranged','Savage','Evisceration','DualWeapons','DualSavageWeapons','DualSavageWeapons2','DualEvisceration','DualLeadenRanged','DualLeadenMelee','DualAeolian','DualLeadenMeleeAcc','DualRanged','None')
	state.CompensatorMode:options('Never','Always','300','1000')

    gear.RAbullet = "Chrono Bullet"
    gear.WSbullet = "Chrono Bullet"
    gear.MAbullet = "Orichalc. Bullet" --For MAB WS, do not put single-use bullets here.
    gear.QDbullet = "Animikii Bullet"
    gear.Trialbullet = "Bronze Bullet"
    options.ammo_warning_limit = 15


    -- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` gs c elemental quickdraw')
	
	send_command('bind ^backspace input /ja "Double-up" <me>')
	send_command('bind @backspace input /ja "Snake Eye" <me>')
	send_command('bind !backspace input /ja "Fold" <me>')
	send_command('bind ^@!backspace input /ja "Crooked Cards" <me>')
	
	send_command('bind ^\\\\ input /ja "Random Deal" <me>')
    send_command('bind !\\\\ input /ja "Bolter\'s Roll" <me>')
	send_command('bind ^@!\\\\ gs c toggle LuzafRing')
	send_command('bind @f7 gs c toggle RngHelper')

	send_command('bind !r gs c weapons DualSavageWeapons;gs c update')
    send_command('bind !s gs c weapons DualLeadenMeleeAcc;cs c update')
	send_command('bind ^q gs c weapons DualAeolian;gs c update')
	send_command('bind @q gs c weapons DualKustawi;gs c update')
	send_command('bind !q gs c weapons DualLeadenRanged;gs c update')
	send_command('bind @pause roller roll')
    send_command('bind @z gs c toggle CompensatorMode')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

	sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac"}
    sets.precast.JA['Snake Eye'] = {legs="Lanun Trews +1"}
    sets.precast.JA['Wild Card'] = {feet="Lanun Bottes +3"}
    sets.precast.JA['Random Deal'] = {body="Lanun Frac +3"}
    sets.precast.FoldDoubleBust = {hands="Lanun Gants +1"}

    sets.precast.CorsairRoll = {main="Rostam",range="Compensator",
        head="Lanun Tricorne",neck="Regal Necklace",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Lanun Frac +3",hands="Chasseur's Gants",ring1="Defending Ring",ring2="Dark Ring",
        back=gear.COR_TP,waist="Flume belt +1",legs="Malignance Tights",feet="Malignance Boots"}

    sets.precast.LuzafRing = {ring2="Luzaf's Ring"}
    
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chas. Culottes +1"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chass. Bottes +1"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chass. Tricorne"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants"})
    
    sets.precast.CorsairShot = {ammo=gear.QDbullet,
        head="Nyame Helm",neck="Iskur Gorget",ear1="Novio Earring",ear2="Friomisi Earring",
        body="Lanun Frac +3",hands="Carmine Finger Gauntlets +1",ring1="Dingir Ring",ring2="Ilabrat Ring",
        back=gear.COR_AGIWSD,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Lanun Bottes +3"}
        
    sets.precast.CorsairShot.Damage = {ammo=gear.QDbullet,
        head="Nyame Helm",neck="Sanctity Necklace",ear1="Novio Earring",ear2="Friomisi Earring",
        body="Lanun Frac +3",hands="Carmine Finger Gauntlets +1",ring1="Dingir Ring",ring2="Ilabrat Ring",
        back=gear.COR_AGIWSD,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Lanun Bottes +3"}
    
    sets.precast.CorsairShot.Proc = {ammo=gear.QDbullet,
        head="Nyame Helm",neck="Commodore Charm +2",ear1="Novio Earring",ear2="Friomisi Earring",
        body="Lanun Frac +3",hands="Carmine Finger Gauntlets +1",ring1="Dingir Ring",ring2="Ilabrat Ring",
        back=gear.COR_AGIWSD,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Lanun Bottes +3"}

    sets.precast.CorsairShot['Light Shot'] = {ammo=gear.MACCbullet,
        head="Laksamana's Tricorne +2",neck="Commodore Charm +2",ear1="Dignitary's Earring",ear2="Crepuscular Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Stikini Ring",ring2="Regal Ring",
        back=gear.COR_AGIWSD,waist="Kwahu Kachina Belt +1",legs="Malignance Tights",feet="Laksamana's Bottes +2"}

    sets.precast.CorsairShot['Dark Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'], {})

    sets.precast.CorsairShot['Earth Shot'] = set_combine(sets.precast.CorsairShot, {feet="Chasseur's bottes +1"})

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Carmine Mask +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonbeam Cape",waist="Flume belt +1",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}
		
	sets.Self_Waltz = {head="Mummu Bonnet +2",body="Passion Jacket",ring1="Asklepian Ring"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
        head="Carmine Mask +1",neck="Baetyl Pendant",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
        body="Adhemar Jacket",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
        back="Moonbeam Cape",waist="Flume belt +1",legs=gear.HercLegsFC,feet="Carmine Greaves +1"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear2="Mendi. Earring"})

    sets.precast.RA = {ammo=gear.RAbullet,
        head=gear.taeon_Snap_head,
        neck="Commodore's Charm +2", -- 8
        body="Oshosi Vest", -- 12
        hands="Carmine Fin. Ga. +1", -- 11
        ring1="Crepuscular Ring", -- 3
        back=gear.COR_SNAP, -- 10
        waist="Impulse Belt", -- 5
        legs="Laksa. Trews +2", -- 8 
        feet="Meg. Jam. +2"} -- 10
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {
        body="Laksamana's Frac +3", --0/20
        waist="Yemaya Belt"})
    sets.precast.RA.Flurry2 = set_combine(sets.precast.RA.Flurry, {
        head="Chass. Tricorne",  --0/14
        waist="Impulse Belt",       --
        })

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
sets.precast.WS = {
        head="Nyame Helm",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Epaminondas's Ring",
        back=gear.COR_STRWSD,waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
        
    sets.precast.WS.Acc = {
        head="Carmine Mask +1",neck="Combatant's Torque",ear1="Digni. Earring",ear2="Telos Earring",
        body="Meg. Cuirie +2",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.COR_STRWSD,waist="Grunfeld Rope",legs="Carmine Cuisses +1",feet="Lanun Bottes +3"}     
        
    sets.precast.WS.Proc = {
        head="Carmine Mask +1",neck="Combatant's Torque",ear1="Digni. Earring",ear2="Mache Earring +1",
        body="Mummu Jacket +2",hands="Floral Gauntlets",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back=gear.COR_STRWSD,waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Malignance Boots"}
        
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {
        head="Carmine Mask +1",
        ring2="Epaminondas's Ring",
        legs="Carmine Cuisses +1",feet="Carmine Greaves +1"})
    
    sets.precast.WS['Savage Blade'] = {ammo=gear.WSbullet,
        head="Nyame Helm",neck="Commodore Charm +2",
        body="Nyame Mail",hands="Nyame Gauntlets",ear1="Ishvara Earring",ear2="Moonshade Earring",
        ring1="Regal Ring",ring2="Epaminondas's Ring",
        back=gear.COR_STRWSD,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.precast.WS['Savage Blade'].Acc = {ammo=gear.WSbullet,
        head="Carmine Mask +1",neck="Commodore Charm +2",ear1="Moonshade Earring",ear2="Telos Earring",
        body="Meg. Cuirie +2",hands="Meghanada Gloves +2",ring1="Regal Ring",ring2="Epaminondas's Ring",
        back=gear.COR_STRWSD,waist="Grunfeld Rope",legs="Carmine Cuisses +1",feet="Lanun Bottes +3"}
    
    sets.precast.WS['Last Stand'] = {ammo=gear.WSbullet,
        head="Nyame Helm",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Epaminondas's Ring",
        back=gear.COR_AGIWSD,waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.precast.WS['Last Stand'].Acc = {ammo=gear.WSbullet,
        head="Nyame Helm",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Dingir Ring",
        back=gear.COR_AGIWSD,waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
        
    sets.precast.WS['Detonator'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Detonator'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Slug Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Slug Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Numbing Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Numbing Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Sniper Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Sniper Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Split Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Split Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    
    sets.precast.WS['Leaden Salute'] = {ammo=gear.MAbullet,
        head="Pixie Hairpin +1",neck="Commodore Charm +2",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Archon Ring",ring2="Dingir Ring",
        back=gear.COR_AGIWSD,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Lanun Bottes +3"}
        
    sets.precast.WS['Evisceration'] = {ammo=gear.MAbullet,
        head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Odr Earring",
        body="Nyame Mail",hands="Adhemar Wristbands +1",ring1="Regal Ring",ring2="Begrudging Ring",
        back=gear.COR_AGIWSD,waist="Fotia Belt",legs="Lustratio Subligar +1",feet="Adhemar Gamashes +1"}      

    sets.precast.WS['Aeolian Edge'] = {ammo=gear.MAbullet,
        head="Nyame Helm",neck="Commodore Charm +2",ear2="Friomisi Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Ilabrat Ring",ring2="Dingir Ring",
        back=gear.COR_AGIWSD,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Lanun Bottes +3"}

    sets.precast.WS['Wildfire'] = {ammo=gear.MAbullet,
        head="Nyame Helm",neck="Commodore Charm +2",ear1="Novio Earring",ear2="Friomisi Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Dingir Ring",
        back=gear.COR_AGIWSD,waist="Eschan Stone",legs="Nyame Flanchard",feet="Lanun Bottes +3"}

    sets.precast.WS['Wildfire'].Acc = {ammo=gear.MAbullet,
        head="Nyame Helm",neck="Commodore Charm +2",ear1="Novio Earring",ear2="Friomisi Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Dingir Ring",
        back=gear.COR_AGIWSD,waist="Eschan Stone",legs="Nyame Flanchard",feet="Lanun Bottes +3"}
        
    sets.precast.WS['Hot Shot'] = sets.precast.WS['Wildfire']
    sets.precast.WS['Hot Shot'].Acc = sets.precast.WS['Wildfire'].Acc
        
        --Because omen skillchains.
    sets.precast.WS['Burning Blade'] = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Sanare Earring",
        body="Meg. Cuirie +2",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Dark Ring",
        back="Moonbeam Cape",waist="Flume belt +1",legs="Nyame Flanchard",feet="Meg. Jam. +2"}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}
        
    -- Midcast Sets
    sets.midcast.FastRecast = {
        head="Carmine Mask +1",neck="Baetyl Pendant",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
        body="Adhemar Jacket",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
        back="Moonbeam Cape",waist="Flume belt +1",legs=gear.HercLegsFC,feet="Carmine Greaves +1"}
        
    -- Specific spells

	sets.midcast.Cure = {
        head="Carmine Mask +1",neck="Incanter's Torque",ear1="Enchntr. Earring +1",ear2="Mendi. Earring",
        body="Adhemar Jacket",hands="Leyline Gloves",ring1="Janniston Ring",ring2="Lebeche Ring",
        back="Solemnity Cape",waist="Flume belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}
	
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    -- Ranged gear
    sets.midcast.RA = {ammo=gear.RAbullet,
        head="Malignance Chapeau",neck="Iskur Gorget",ear1="Crepuscular Earring",ear2="Telos Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Crepuscular Ring",ring2="Ilabrat Ring",
        back=gear.COR_RNG,waist="Kwahu Kachina Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

    sets.midcast.RA.Acc = {ammo=gear.RAbullet,
        head="Malignance Chapeau",neck="Iskur Gorget",ear1="Enervating Earring",ear2="Telos Earring",
        body="Laksa. Frac +3",hands="Malignance Gloves",ring1="Regal Ring",ring2="Dingir Ring",
        back=gear.COR_RNG,waist="Kwahu Kachina Belt +1",legs="Laksa. Trews +3",feet="Malignance Boots"}
		
	sets.buff['Triple Shot'] = {body="Chasseur's Frac"}
    
    -- Sets to return to when not performing an action.
	
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
    
    -- Resting sets
    sets.resting = {}
    

    -- Idle sets
    sets.idle = {ammo=gear.RAbullet,
        head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Chirich Ring +1",
        back="Moonbeam Cape",waist="Carrier's Sash",legs="Carmine Cuisses +1",feet="Nyame Sollerets"}
		
    sets.idle.PDT = {ammo=gear.RAbullet,
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Dark Ring",
        back="Moonbeam Cape",waist="Carrier's Sash",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.idle.Refresh = {ammo=gear.RAbullet,
        head="Rawhide Mask",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Genmei Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Dark Ring",
        back="Moonbeam Cape",waist="Flume belt +1",legs="Malignance Tights",feet="Malignance Boots"}
    
    -- Defense sets
    sets.defense.PDT = {ammo=gear.RAbullet,
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Genmei Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Dark Ring",
        back="Moonbeam Cape",waist="Flume belt +1",legs="Malignance Tights",feet="Malignance Boots"}

    sets.defense.MDT = {ammo=gear.RAbullet,
        head="Malignance Chapeau",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Eabani Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Shadow Ring",
        back="Moonbeam Cape",waist="Carrier's Sash",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.defense.MEVA = {ammo=gear.RAbullet,
        head="Nyame Helm",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Eabani Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
        back="Moonbeam Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.DWMax = {ear1="Eabani Earring",ear2="Suppanomimi",body="Adhemar Jacket +1",
                  hands="Floral Gauntlets",waist="Reiki Yotai",feet=gear.taeon_DW_feet}

	-- Weapons sets
	sets.weapons.Default = {main="Naegling",sub="Nusku Shield",range="Death Penalty"}
    sets.weapons.Trial = {main="Fermion Sword",sub="Chicken Knife II",range="Death Penalty"}
	sets.weapons.Ranged = {main="Rostam",sub="Nusku Shield",range="Fomalhaut"}
	sets.weapons.Evisceration = {main="Tauret",sub="Nusku Shield",range="Anarchy +2"}
	sets.weapons.DualWeapons = {main="Naegling",sub="Blurred Knife +1",range="Fomalhaut"}
	sets.weapons.DualSavageWeapons = {main="Naegling",sub="Rostam",range="Anarchy +2"}
    sets.weapons.DualSavageWeapons2 = {main="Naegling",sub="Gleti's Knife",range="Anarchy +2"}
	sets.weapons.DualEvisceration = {main="Tauret",sub="Gleti's Knife",range="Anarchy +2"}
	sets.weapons.Savage = {main="Naegling",sub="Nusku Shield",range="Anarchy +2"}
	sets.weapons.DualLeadenRanged = {main="Rostam",sub="Tauret",range="Death Penalty"}
	sets.weapons.DualLeadenMelee = {main="Naegling",sub="Tauret",range="Death Penalty"}
	sets.weapons.DualAeolian = {main="Rostam",sub="Tauret",range="Anarchy +2"}
	sets.weapons.DualLeadenMeleeAcc = {main="Naegling",sub="Rostam",range="Death Penalty"}
	sets.weapons.DualRanged = {main="Rostam",sub="Kustawi +1",range="Fomalhaut"}
   
	
    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
     sets.engaged = {
        head="Adhemar Bonnet +1",
        neck="Iskur Gorget",
        ear1="Dedition Earring",        -- 
        ear2="Cessance Earring",        -- 
        body="Adhemar Jacket +1",       --
        hands="Adhemar Wristbands +1",  -- 
        ring1="Ilabrat Ring",
        ring2="Epona's Ring",
        back=gear.COR_TP,
        waist="Windbuffet belt +1",     -- 
        legs="Samnuha Tights",          -- 
        feet=gear.HercFeetTP}
    
    sets.engaged.Acc = {
        head="Malignance Chapeau",
        neck="Iskur Gorget",
        ear1="Telos Earring",             -- 
        ear2="Odr Earring",           -- 
        body="Adhemar Jacket +1",       -- 6 DW
        hands="Adhemar Wristbands +1",  -- 
        ring1="Chirich Ring +1",
        ring2="Chirich Ring +1",
        back=gear.COR_TP,
        waist="Olseni Belt",            -- 
        legs="Carmine Cuisses +1",      -- 6 DW
        feet="Malignance Boots"}
        
    sets.engaged.DT = {
        head="Malignance Chapeau",
        neck="Loricate Torque +1",  
        ear1="Telos Earring",
        ear2="Odr Earring",       --
        body="Malignance Tabard",
        hands="Malignance Gloves",
        back=gear.COR_TP, 
        waist="Olseni Belt",        --
        ring1="Defending Ring",
        ring2="Chirich Ring +1",    
        legs="Malignance Tights",
        feet="Malignance Boots"}
    
    sets.engaged.Acc.DT = {
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Odr Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Chirich Ring +1",
        back=gear.COR_TP,waist="Olseni Belt",legs="Malignance Tights",feet="Malignance Boots"}

    sets.engaged.DW = {
        head="Adhemar Bonnet +1",
        neck="Iskur Gorget",
        ear1="Suppanomimi",             -- 5 DW
        ear2="Cessance Earring",        -- 
        body="Adhemar Jacket +1",       -- 6 DW
        hands="Adhemar Wristbands +1",  -- 
        ring1="Ilabrat Ring",
        ring2="Epona's Ring",
        back=gear.COR_TP,
        waist="Windbuffet belt +1",     -- 
        legs="Samnuha Tights",          -- 
        feet=gear.HercFeetTP}
    
    sets.engaged.DW.Acc = {
        head="Malignance Chapeau",
        neck="Iskur Gorget",
        ear1="Odr Earring",             -- 
        ear2="Telos Earring",           -- 
        body="Adhemar Jacket +1",       -- 6 DW
        hands="Adhemar Wristbands +1",  -- 
        ring1="Chirich Ring +1",
        ring2="Chirich Ring +1",
        back=gear.COR_TP,
        waist="Olseni Belt",            -- 
        legs="Carmine Cuisses +1",      -- 6 DW
        feet="Malignance Boots"}
        
    sets.engaged.DW.DT = {
        head="Malignance Chapeau",
        neck="Loricate Torque +1",  
        ear1="Suppanomimi",
        ear2="Telos Earring",       --5 DW
        body="Malignance Tabard",
        hands="Malignance Gloves",
        back=gear.COR_TP, 
        waist="Reiki Yotai",        --7 DW
        ring1="Defending Ring",
        ring2="Chirich Ring +1",    
        legs="Malignance Tights",
        feet="Malignance Boots"}
    
    sets.engaged.DW.Acc.DT = {
        head="Malignance Chapeau",
        neck="Loricate Torque +1",
        ear1="Telos Earring",             -- 
        ear2="Odr Earring",           -- 
        body="Malignance Tabard",       --  DW
        hands="Malignance Gloves",  -- 
        ring1="Defending Ring",
        ring2="Chirich Ring +1",
        back=gear.COR_TP,
        waist="Olseni Belt",            -- 
        legs="Malignance Tights",       --  DW
        feet="Malignance Boots"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'NIN' then
        set_macro_page(2, 3)
    elseif player.sub_job == 'DNC' then
		set_macro_page(2, 3)
    elseif player.sub_job == 'RNG' then
        set_macro_page(2, 3)
    elseif player.sub_job == 'DRG' then
        set_macro_page(2, 3)
    else
        set_macro_page(2, 3)
    end
end

function user_job_lockstyle()
	if player.equipment.main == nil or player.equipment.main == 'empty' then
		windower.chat.input('/lockstyleset 097')
	elseif res.items[item_name_to_id(player.equipment.main)].skill == 3 then --Sword in main hand.
		if player.equipment.sub == nil or player.equipment.sub == 'empty' then --Sword/Nothing.
				windower.chat.input('/lockstyleset 097')
		elseif res.items[item_name_to_id(player.equipment.sub)].shield_size then --Sword/Shield
				windower.chat.input('/lockstyleset 097')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Sword/Sword.
			windower.chat.input('/lockstyleset 097')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Sword/Dagger.
			windower.chat.input('/lockstyleset 097')
		else
			windower.chat.input('/lockstyleset 097') --Catchall just in case something's weird.
		end
	elseif res.items[item_name_to_id(player.equipment.main)].skill == 2 then --Dagger in main hand.
		if player.equipment.sub == nil or player.equipment.sub == 'empty' then --Dagger/Nothing.
			windower.chat.input('/lockstyleset 097')
		elseif res.items[item_name_to_id(player.equipment.sub)].shield_size then --Dagger/Shield
			windower.chat.input('/lockstyleset 097')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Dagger/Sword.
			windower.chat.input('/lockstyleset 097')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Dagger/Dagger.
			windower.chat.input('/lockstyleset 097')
		else
			windower.chat.input('/lockstyleset 097') --Catchall just in case something's weird.
		end
	end
end

autows_list = {['Default']='Savage Blade',['Evisceration']='Evisceration',['Savage']='Savage Blade',['Ranged']='Last Stand',['DualWeapons']='Savage Blade',['DualSavageWeapons']='Savage Blade',['DualEvisceration']='Evisceration',['DualLeadenRanged']='Leaden Salute',['DualLeadenMelee']='Leaden Salute',['DualAeolian']='Aeolian Edge',['DualRanged']='Last Stand'}