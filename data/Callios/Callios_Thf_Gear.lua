-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal','DT')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Match','Normal','DT','SomeAcc','Acc','FullAcc','Fodder','Proc')
	state.IdleMode:options('Normal','Regain','Sphere')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
    state.Weapons:options('None123','AeneasCento','AeneasGleti','TauretCento','TauretGleti','NaeglingBK')

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','Suppa','DWMax','Parry'}
	state.AmbushMode = M(false, 'Ambush Mode')

	
    -- Additional local binds
    send_command('bind ^` input /ja "Flee" <me>')
    send_command('bind !` input /ra <t>')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind @f10 gs c toggle AmbushMode')
	send_command('bind ^backspace input /item "Thief\'s Tools" <t>')
	send_command('bind ^q gs c weapons ProcWeapons;gs c set WeaponSkillMode proc;')
	send_command('bind !q gs c weapons SwordThrowing')
	send_command('bind !backspace input /ja "Hide" <me>')
	send_command('bind ^x gs c weapons Default;gs c set WeaponSkillMode match') --Requips weapons and gear.
	send_command('bind !r gs c weapons MagicWeapons')
	send_command('bind ^\\\\ input /ja "Despoil" <t>')
	send_command('bind !\\\\ input /ja "Mug" <t>')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Special sets (required by rules)
    --------------------------------------

	sets.TreasureHunter = {hands="Plunderer's Armlets +1",waist="Chaac Belt",feet="Skulk. Poulaines"}
    sets.Kiting = {feet="Jute Boots +1"} --ctrl F10

	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {}
	
    sets.buff['Sneak Attack'] = {head="Malignance Chapeau",neck="Assassin's Gorget +2",ear1="Mache Earring +1",ear2="Sherida Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Ilabrat Ring",ring2="Regal Ring",
        back="Sacro Mantle",waist="Yemaya Belt",legs="Lustratio Subligar +1",feet="Malignance Boots"}

    sets.buff['Trick Attack'] = {head="Malignance Chapeau",neck="Assassin's Gorget +2",ear1="Mache Earring +1",ear2="Sherida Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Ilabrat Ring",ring2="Regal Ring",
        back="Sacro Mantle",waist="Yemaya Belt",legs="Lustratio Subligar +1",feet="Malignance Boots"}

    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
	sets.Suppa = {ear1="Suppanomimi", ear2="Sherida Earring"}
	sets.DWEarrings = {ear1="Suppanomimi",ear2="Eabani Earring"}
	sets.DWMax = {ear1="Suppanomimi",ear2="Eabani Earring",body="Adhemar Jacket +1",hands="Floral Gauntlets",waist="Reiki Yotai"}
	sets.Parry = {hands="Turms Mittens +1",ring1="Defending Ring"}
	sets.Ambush = {body="Plunderer's Vest +3"} --body="Plunderer's Vest +1"
	
	-- Weapons sets
	sets.weapons.AeneasCento = {main="Aeneas",sub="Fusetto +2"}
    sets.weapons.AeneasGleti = {main="Aeneas",sub="Gleti's Knife"}
    sets.weapons.TauretCento = {main="Tauret",sub="Fusetto +2"}
    sets.weapons.TauretGleti = {main="Tauret",sub="Gleti's Knife"}
    sets.weapons.NaeglingBK = {main="Naegling",sub="Blurred Knife +1"}
	
    -- Actions we want to use to tag TH.
    sets.precast.Step = {ammo="C. Palug Stone",
        head="Malignance Chapeau",neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Telos Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
        back=gear.THFCape_TP,waist="Sailfi Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.precast.JA['Violent Flourish'] = {ammo="C. Palug Stone",
        head="Malignance Chapeau",neck="Combatant's Torque",ear1="Digni. Earring",ear2="Odr Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back=gear.THFCape_TP,waist="Sailfi Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.precast.JA['Animated Flourish'] = sets.TreasureHunter
	sets.precast.JA.Provoke = sets.TreasureHunter

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Collaborator'] = {"Skulker's Bonnet"}
    sets.precast.JA['Accomplice'] = {"Skulker's Bonnet"}
    sets.precast.JA['Flee'] = {} --feet="Pillager's Poulaines +1"
    sets.precast.JA['Hide'] = {body="Pillager's Vest +1"}
    sets.precast.JA['Conspirator'] = {body="Skulker's Vest"} 
    sets.precast.JA['Steal'] = {hands="Pill. Armlets +1"}
	sets.precast.JA['Mug'] = {}
    sets.precast.JA['Despoil'] = {legs="Skulker's Culottes",feet="Skulk. Poulaines +1"}
    sets.precast.JA['Perfect Dodge'] = {hands="Plunderer's Armlets +1"}
    sets.precast.JA['Feint'] = {} -- {legs="Assassin's Culottes +2"}

    sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
    sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Yamarang",
        head="Mummu Bonnet +2",neck="Unmoving Collar +1",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
        body="Passion jacket",hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonbeam Cape",waist="Chaac Belt",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}

	sets.Self_Waltz = {head="Mummu Bonnet +2",body="Passion Jacket",ring1="Asklepian Ring"}
		
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}


    -- Fast cast sets for spells
    sets.precast.FC = {ammo="Impatiens",
		head=gear.HercHeadFC,neck="Baetyl Pendant",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Adhemar jacket",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Rahab Ring",
		legs=gear.HercLegsFC,feet=gear.Herculean_HercFeetFC}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})


    -- Ranged snapshot gear
    sets.precast.RA = {}


    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="C. Palug Stone",
        head="Nyame Helm",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Sherida Earring",
        body="Plunderer's Vest +3",hands="Meg. Gloves +2",ring1="Ilabrat Ring",ring2="Regal Ring",
        back=gear.THFCape_DEXWS,waist="Grunfeld Rope",legs="Lustratio Subligar +1",feet="Lustratio Leggings +1"}

    sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {neck="Combatant's Torque"})

    sets.precast.WS.Acc = set_combine(sets.precast.WS, {neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Odr Earring",
        body="Meg. Cuirie +2",
        waist="Reiki Yotai",legs="Meg. Chausses +2",feet="Malignance Boots"})

	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Odr Earring",body="Meg. Cuirie +2",waist="Olseni Belt",legs="Meg. Chausses +2",feet="Malignance Boots"})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {ammo="Cath Palug Stone",
        head="Nyame Helm",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Odr Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Ilabrat Ring",ring2="Regal Ring",
        back=gear.THFCape_DEXWS,waist="Grunfeld Rope",legs="Nyame Flanchard",feet="Nyame Sollerets"})

    sets.precast.WS["Rudra's Storm"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {neck="Caro Necklace",ear1="Moonshade Earring",body="Meg. Cuirie +2",back=gear.wsd_jse_back})
    sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS.Acc, {ear1="Moonshade Earring",body="Meg. Cuirie +2",back=gear.wsd_jse_back})
	sets.precast.WS["Rudra's Storm"].FullAcc = set_combine(sets.precast.WS.FullAcc, {back=gear.wsd_jse_back})
    sets.precast.WS["Rudra's Storm"].Fodder = set_combine(sets.precast.WS["Rudra's Storm"], {body=gear.herculean_wsd_body})
	sets.precast.WS["Rudra's Storm"].DT = set_combine(sets.precast.WS["Rudra's Storm"],{neck="Loricate Torque +1",ring1="Defending Ring",ring2="Dark Ring"})
    sets.precast.WS["Rudra's Storm"].SA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila +1",body="Meg. Cuirie +2",legs="Pill. Culottes +3",ring1="Epaminondas's Ring"})
    sets.precast.WS["Rudra's Storm"].TA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila +1",body="Meg. Cuirie +2",legs="Pill. Culottes +3"})
    sets.precast.WS["Rudra's Storm"].SATA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila +1",body="Meg. Cuirie +2",legs="Pill. Culottes +3"})

    sets.precast.WS["Mandalic Stab"] = set_combine(sets.precast.WS, {ammo="Cath Palug Stone",
        head="Nyame Helm",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Odr Earring",
        body="Plunderer's Vest +3",hands="Meghanada Gloves +2",ring1="Epaminondas's Ring",ring2="Regal Ring",
        back=gear.THFCape_DEXWS,waist="Grunfeld Rope",legs="Nyame Flanchard",feet="Nyame Sollerets"})


    sets.precast.WS["Mandalic Stab"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {neck="Caro Necklace",ear1="Moonshade Earring",body="Meg. Cuirie +2",back=gear.THFCape_DEXWS})
    sets.precast.WS["Mandalic Stab"].Acc = set_combine(sets.precast.WS.Acc, {ear1="Moonshade Earring",body="Meg. Cuirie +2",back=gear.THFCape_DEXWS})
	sets.precast.WS["Mandalic Stab"].FullAcc = set_combine(sets.precast.WS.FullAcc, {back=gear.THFCape_DEXWS})
    sets.precast.WS["Mandalic Stab"].Fodder = set_combine(sets.precast.WS["Mandalic Stab"], {ammo="C. Palug Stone",body=gear.herculean_wsd_body})
    sets.precast.WS["Mandalic Stab"].SA = set_combine(sets.precast.WS["Mandalic Stab"].Fodder, {ammo="Yetshila +1",head="Adhemar Bonnet +1",body="Meg. Cuirie +2",legs="Pill. Culottes +3"})
    sets.precast.WS["Mandalic Stab"].TA = set_combine(sets.precast.WS["Mandalic Stab"].Fodder, {ammo="Yetshila +1",head="Adhemar Bonnet +1",body="Meg. Cuirie +2",legs="Pill. Culottes +3"})
    sets.precast.WS["Mandalic Stab"].SATA = set_combine(sets.precast.WS["Mandalic Stab"].Fodder, {ammo="Yetshila +1",head="Adhemar Bonnet +1",body="Meg. Cuirie +2",legs="Pill. Culottes +3"})

    sets.precast.WS["Shark Bite"] = set_combine(sets.precast.WS, {neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",body="Meg. Cuirie +2",back=gear.THFCape_DEXWS})
    sets.precast.WS["Shark Bite"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {neck="Caro Necklace",ear1="Moonshade Earring",body="Meg. Cuirie +2",back=gear.THFCape_DEXWS})
    sets.precast.WS["Shark Bite"].Acc = set_combine(sets.precast.WS.Acc, {ear1="Moonshade Earring",body="Meg. Cuirie +2",back=gear.THFCape_DEXWS})
	sets.precast.WS["Shark Bite"].FullAcc = set_combine(sets.precast.WS.FullAcc, {back=gear.THFCape_DEXWS})
    sets.precast.WS["Shark Bite"].Fodder = set_combine(sets.precast.WS["Shark Bite"], {ammo="C. Palug Stone",body=gear.herculean_wsd_body})
    sets.precast.WS["Shark Bite"].SA = set_combine(sets.precast.WS["Shark Bite"].Fodder, {ammo="Yetshila +1",body="Meg. Cuirie +2",legs="Pill. Culottes +3"})
    sets.precast.WS["Shark Bite"].TA = set_combine(sets.precast.WS["Shark Bite"].Fodder, {ammo="Yetshila +1",body="Meg. Cuirie +2",legs="Pill. Culottes +3"})
    sets.precast.WS["Shark Bite"].SATA = set_combine(sets.precast.WS["Shark Bite"].Fodder, {ammo="Yetshila +1",body="Meg. Cuirie +2",legs="Pill. Culottes +3"})
	
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {ammo="Yetshila +1",
        head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Odr Earring",
        body="Plunderer's Vest +3",hands="Adhemar Wristbands +1",ring1="Begrudging Ring",ring2="Regal Ring",
        back=gear.eviscape,waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"})

    sets.precast.WS['Evisceration'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ammo="Yetshila +1",head="Adhemar Bonnet +1",ear1="Moonshade Earring",ear2="Odr Earring",neck="Fotia Gorget",body="Abnoba Kaftan",hands="Mummu Wrists +2",ring1="Begrudging Ring",waist="Fotia Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
    sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Yetshila +1",head="Mummu Bonnet +2",ring1="Begrudging Ring",neck="Fotia Gorget",body="Sayadio's Kaftan",hands="Mummu Wrists +2",waist="Fotia Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS['Evisceration'].FullAcc = set_combine(sets.precast.WS.FullAcc, {ammo="Yetshila +1",head="Mummu Bonnet +2",body="Mummu Jacket +2",hands="Mummu Wrists +2",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS['Evisceration'].Fodder = set_combine(sets.precast.WS['Evisceration'], {})
	
    -- SAVAGE BLADE --

    sets.precast.WS["Savage Blade"] = set_combine(sets.precast.WS, {ammo="Seething Bomblet +1", 
         head="Nyame Helm",
         body="Nyame Mail",hands="Nyame Gauntlets",ring1="Regal Ring", ring2="Epaminondas's Ring", 
         waist="Sailfi Belt +1", legs="Nyame Flanchard", feet="Nyame Sollerets"})

    sets.precast.WS["Savage Blade"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS["Savage Blade"].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS["Savage Blade"].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS["Savage Blade"].Fodder = set_combine(sets.precast.WS["Savage Blade"], {})

    sets.precast.WS["Savage Blade"].SA = set_combine(sets.precast.WS["Savage Blade"].Fodder, {ammo="Seething Bomblet +1",
         head="Nyame Helm",neck="Assassin's Gorget +2", ear1="Sherida Earring", 
         body="Nyame Mail",hands="Nyame Gauntlets",ring1="Regal Ring", ring2="Karieyh Ring +1", 
         waist="Sailfi Belt +1", legs="Plunderer's Culottes +3", feet="Nyame Sollerets"})

    sets.precast.WS["Savage Blade"].TA = set_combine(sets.precast.WS["Savage Blade"].Fodder, {ammo="Seething Bomblet +1",
         head="Nyame Helm",neck="Assassin's Gorget +2", ear1="Sherida Earring", 
         body="Nyame Mail",hands="Nyame Gauntlets",ring1="Regal Ring", ring2="Karieyh Ring +1", 
         waist="Sailfi Belt +1", legs="Plunderer's Culottes +3", feet="Nyame Sollerets"})

    sets.precast.WS["Savage Blade"].SATA = set_combine(sets.precast.WS["Savage Blade"].Fodder, {ammo="Seething Bomblet +1",
         head="Nyame Helm",neck="Assassin's Gorget +2", ear1="Sherida Earring", 
         body="Nyame Mail",hands="Nyame Gauntlets",ring1="Regal Ring", ring2="Karieyh Ring +1", 
         waist="Sailfi Belt +1", legs="Plunderer's Culottes +3", feet="Nyame Sollerets"})   

    -- EXENTERATOR -- 

    sets.precast.WS["Exenterator"] = set_combine(sets.precast.WS, {ammo="Cath Palug Stone",
        head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
        body="Plunderer's Vest +3",hands="Meghanada Gloves +2",ring1="Ilabrat Ring",ring2="Regal Ring",
        back=gear.wscape,waist="Fotia Belt",legs="Meghanada Chausses +2",feet="Plunderer's Poulaines +3"})

    sets.precast.WS["Exenterator"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS["Exenterator"].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS["Exenterator"].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS["Exenterator"].Fodder = set_combine(sets.precast.WS["Exenterator"], {})

    sets.precast.WS["Exenterator"].SA = set_combine(sets.precast.WS["Exenterator"].Fodder, {ammo="Seething Bomblet +1",
        head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
        body="Plunderer's Vest +3",hands="Meghanada Gloves +2",ring1="Ilabrat Ring",ring2="Regal Ring",
        back=gear.wscape,waist="Fotia Belt",legs="Meghanada Chausses +2",feet="Meghanada Jambeaux +2"})

    sets.precast.WS["Exenterator"].TA = set_combine(sets.precast.WS["Exenterator"].Fodder, {ammo="Seething Bomblet +1",
        head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
        body="Plunderer's Vest +3",hands="Meghanada Gloves +2",ring1="Ilabrat Ring",ring2="Regal Ring",
        back=gear.wscape,waist="Fotia Belt",legs="Meghanada Chausses +2",feet="Meghanada Jambeaux +2"})

    sets.precast.WS["Exenterator"].SATA = set_combine(sets.precast.WS["Exenterator"].Fodder, {ammo="Seething Bomblet +1",
        head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
        body="Plunderer's Vest +3",hands="Meghanada Gloves +2",ring1="Ilabrat Ring",ring2="Regal Ring",
        back=gear.wscape,waist="Fotia Belt",legs="Meghanada Chausses +2",feet="Meghanada Jambeaux +2"})


    sets.precast.WS["Mercy Stroke"] = set_combine(sets.precast.WS, {ammo="Seething Bomblet +1",
         neck="Assassin's Gorget +2", ear1="Sherida Earring", 
         ring1="Regal Ring", ring2="Karieyh Ring +1", 
         waist="Sailfi Belt +1", legs="Samnuha Tights"})


    sets.precast.WS.Proc = {ammo="Yamarang",
        head="Malignance Chapeau",neck="Voltsurge Torque",ear1="Digni. Earring",ear2="Heartseeker Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Varar Ring +1",ring2="Varar Ring +1",
        back="Ground. Mantle +1",waist="Olseni Belt",legs="Malignance Tights",feet="Malignance Boots"}

    sets.precast.WS['Last Stand'] = {
        head="Pill. Bonnet +3",neck="Fotia Gorget",ear1="Enervating Earring",ear2="Telos Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Apate Ring",ring2="Regal Ring",
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.precast.WS['Empyreal Arrow'] = {
        head="Pill. Bonnet +3",neck="Fotia Gorget",ear1="Enervating Earring",ear2="Telos Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Apate Ring",ring2="Regal Ring",
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.precast.WS['Aeolian Edge'] = {ammo="Seething Bomblet +1",
        head="Nyame Helm",neck="Baetyl Pendant",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Dingir Ring",ring2="Epaminondas's Ring",
        back=gear.THFCape_DEXWS,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring",ear2="Sherida Earring"}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Sherida Earring"}

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Defending Ring",ring2="Prolix Ring",
        back="Moonbeam Cape",waist="Tempus Fugit",legs="Rawhide Trousers",feet="Malignance Boots"}

    -- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})

	sets.midcast.Dia = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)

    sets.midcast['Phalanx'] = set_combine(sets.midcast.FastRecast, {
        head=gear.taeon_phalanx_head,
        body=gear.taeon_phalanx_body,
        hands=gear.taeon_phalanx_hands,
        legs=gear.taeon_phalanx_legs,
        feet=gear.taeon_phalanx_feet,
    })

    sets.midcast.RA = {
        head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring",ear2="Crepuscular Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Dingir Ring",ring2="Cacoethic Ring +1",
        back="Sacro Mantle",waist="Eschan Stone",legs="Malignance Tights",feet="Malignance Boots"}

    sets.midcast.RA.Acc = {
        head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring",ear2="Crepuscular Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Dingir Ring",ring2="Cacoethic Ring +1",
        back="Sacro Mantle",waist="Eschan Stone",legs="Malignance Tights",feet="Malignance Boots"}

    --------------------------------------
    -- Idle/resting/defense sets
    --------------------------------------

    -- Resting sets
    sets.resting = {ammo="Staunch Tathlum +1",
        head="Meghanada Visor +2 ",neck="Bathy Choker +1",ear1="Infused Earring",ear2="Odnowa Earring +1",
        body="Meghanada Cuirie +2",hands="Meghanada Gloves +2",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
        back="Moonbeam Cape",waist="Flume belt +1",legs="Meghanada Chausses +2",feet="Meghanada Jambeaux +2"}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",neck="Bathy Choker +1",ear1="Infused Earring",ear2="Odnowa Earring +1",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume belt +1",legs="Malignance Tights",feet="Jute Boots +1"}
        
    sets.idle.TP = {ammo="Ginsen",
        head="Malignance Chapeau",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
        back="Moonbeam Cape",waist="Reiki Yotai",legs="Malignance Tights",feet="Jute Boots +1"}   

    sets.idle.Regain = set_combine(sets.idle,{head="Gleti's Mask",body="Gleti's cuirass",
                                    hands="Gleti's gauntlets",legs="Gleti's breeches",feet="Gleti's Boots"})
        
    sets.idle.Town = {ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",neck="Bathy Choker +1",ear1="Infused Earring",ear2="Odnowa Earring +1",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume belt +1",legs="Malignance Tights",feet="Jute Boots +1"}
		
    sets.idle.Sphere = set_combine(sets.idle, {body="Mekosu. Harness"})

    sets.idle.Weak = set_combine(sets.idle, {})

	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.ExtraRegen = {hands="Turms Mittens +1"}

    -- Defense sets

    sets.defense.PDT = {ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmi Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Gelatinous Ring +1",ring2="Moonbeam Ring",
        back="Moonbeam Cape",waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}

    sets.defense.MDT = {ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Eabani Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Shadow Ring",
        back="Moonbeam Cape",waist="Engraved Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.defense.MEVA = {ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Eabani Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Vengeful Ring",ring2="Purity Ring",
		back="Moonbeam Earring",waist="Engraved Belt",legs="Malignance Tights",feet="Malignance Boots"}


    --------------------------------------
    -- Melee sets  
    --------------------------------------

    -- Normal melee group
    sets.engaged = {ammo="Ginsen",
        head="Adhemar Bonnet +1",neck="Anu Torque",ear1="Dedition Earring",ear2="Sherida Earring",
        body="Adhemar Jacket +1",hands="Adhemar Wristbands +1",ring1="Epona's Ring",ring2="Hetairoi Ring",
        back=gear.THFCape_TP,waist="Reiki Yotai",legs="Samnuha Tights",feet=gear.HercFeetTP}
        
    sets.engaged.SomeAcc = {ammo="Yamarang",
        head="Plunderer's Bonnet +3",neck="Anu Torque2",ear1="Telos Earring",ear2="Sherida Earring",
        body="Pillager's Vest +3",hands="Adhemar Wristbands +1",ring1="Gere Ring",ring2="Hetairoi Ring",
        back=gear.THFCape_TP,waist="Reiki Yotai",legs="Pillager's Culottes +3",feet=gear.HercFeetTP}
    
    sets.engaged.Acc = {ammo="Yamarang",
        head="Malignance Chapeau",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
        back=gear.THFCape_TP,waist="Reiki Yotai",legs="Pillager's Culottes +3",feet="Malignance Boots"}
        
    sets.engaged.FullAcc = {ammo="Cath Palug Stone",
        head="Malignance Chapeau",neck="Anu Torque",ear1="Telos Earring",ear2="Mache Earring +1",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Cacoethic Ring +1",
        back=gear.THFCape_TP,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}

    sets.engaged.Fodder = {ammo="Yamarang",
        head="Adhemar Bonnet +1",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
        body="Pillager's Vest +3",hands="Adhemar Wristbands +1",ring1="Gere Ring",ring2="Hetairoi Ring",
        back=gear.THFCape_TP,waist="Reiki Yotai",legs="Samnuha Tights",feet="Plunderer's Poulaines +3"}

    sets.engaged.DT = {ammo="Yamarang",
        head="Malignance Chapeau",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Defending Ring",
        back=gear.THFCape_TP,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}

    sets.engaged.SomeAcc.DT = {ammo="Yamarang",
        head="Malignance Chapeau",neck="Anu Torque",ear1="Telos Earring",ear2="Odnowa Earring +1",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Gere Ring",ring2="Moonlight Ring",
        back=gear.THFCape_TP,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
        
    sets.engaged.Acc.DT = {ammo="Yamarang",
        head="Malignance Chapeau",neck="Anu Torque",ear1="Telos Earring",ear2="Mache Earring +1",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Gere Ring",ring2="Moonlight Ring",
        back=gear.THFCape_TP,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}

    sets.engaged.FullAcc.DT = {ammo="Cath Palug Stone",
        head="Malignance Chapeau",neck="Anu Torque",ear1="Telos Earring",ear2="Mache Earring +1",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Cacoethic Ring +1",ring2="Moonlight Ring",
        back=gear.THFCape_TP,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
        
    sets.engaged.Fodder.DT = {ammo="Yamarang",
        head="Malignance Chapeau",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Gere Ring",ring2="Hetairoi Ring",
        back=gear.THFCape_TP,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(2, 2)
    elseif player.sub_job == 'WAR' then
        set_macro_page(2, 2)
    elseif player.sub_job == 'NIN' then
        set_macro_page(2, 2)
    else
        set_macro_page(2, 2)
    end
end

--Job Specific Trust Override
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not data.areas.cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()

				if spell_recasts[993] < spell_latency and not have_trust("ArkEV") then
					windower.chat.input('/ma "AAEV" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[955] < spell_latency and not have_trust("Apururu") then
					windower.chat.input('/ma "Apururu (UC)" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
					windower.chat.input('/ma "Koru-Moru" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.chat.input('/ma "Qultada" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.chat.input('/ma "Ulmia" <me>')
					tickdelay = os.clock() + 3
					return true
				else
					return false
				end
			end
		end
	end
	return false
end


autows_list = {['Aeneas']="Rudra's Storm",['Aeolian']='Aeolian Edge',['Savage']='Savage Blade',['AccSavage']='Savage Blade',
     ['AccAeneas']='Savage Blade',['ProcWeapons']='Wasp Sting'}