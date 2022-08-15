function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc')
	state.HybridMode:options('Normal','DT')
    state.CastingMode:options('Normal','Resistant','AoE')
    state.IdleMode:options('Normal','NoRefresh','DT')
	state.Weapons:options('None','Naegling','Dagger','DualWeapons','DualNaegling','DualTauret')

	--gear.melee_jse_back = {name="Intarabus's Cape",augments={'Accuracy+20 Attack+20'}}
	--gear.magic_jse_back = {name="Intarabus's Cape",augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}}

	-- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Daurdabla'
	-- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 1
	
	-- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(false, 'Use Custom Timers')
	
	-- Additional local binds
    send_command('bind ^` gs c cycle ExtraSongsMode')
	send_command('bind !` input /ma "Chocobo Mazurka" <me>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !r gs c weapons None;gs c update')
	send_command('bind !q gs c weapons NukeWeapons;gs c update')
	send_command('bind ^q gs c weapons Swords;gs c update')

	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Weapons sets
	sets.weapons.Dagger = {main="Skinflayer",sub="Genmei Shield"}
	sets.weapons.DualWeapons = {main="Skinflayer",sub="Blurred Knife"}
	sets.weapons.DualNaegling = {main="Naeglingd",sub="Blurred Knife"}
	sets.weapons.Naegling = {main="Naegling",sub="Genmei Shield"}
	sets.weapons.DualTauret = {main="Aija Dagger",sub="Blurred Knife"}
	

    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {main=gear.kali_macc,sub="Ammurapi Shield",ammo="Impatiens",
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Etiolation Earring",ear2="Enchntr. Earring +1",
		body="Inyanga Jubbah +2",hands=gear.telchine_enh_hands,ring1="Kishar Ring",ring2="Lebeche Ring",
		back=gear.brd_jse_fc,waist="Embla Sash",legs="Aya. Cosciales +2",feet="Bihu Slippers +1"}
		
	sets.precast.FC.DT = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Impatiens",
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Etiolation Earring",ear2="Enchntr. Earring +1",
		body="Inyanga Jubbah +2",hands=gear.telchine_enh_hands,ring1="Kishar Ring",ring2="Lebeche Ring",
		back=gear.brd_jse_fc,waist="Embla Sash",legs="Aya. Cosciales +2",feet="Bihu Slippers +1"}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {feet="Vanya Clogs"})

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})
	
	sets.precast.FC.BardSong = {main=gear.kali_macc,sub="Ammurapi Shield",range="Gjallarhorn",ammo=empty,
		head="Fili calot +1",neck="Voltsurge Torque",ear1="Etiolation Earring",ear2="Enchntr. Earring +1",
		body="Inyanga Jubbah +2",hands=gear.telchine_enh_hands,ring1="Kishar Ring",ring2="Lebeche Ring",
		back=gear.brd_jse_fc,waist="Embla Sash",legs="Aya. Cosciales +2",feet="Bihu Slippers +1"}

	sets.precast.FC.SongDebuff = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC.SongDebuff.Resistant = set_combine(sets.precast.FC.BardSong,{range="Daurdabla"})
	sets.precast.FC.Lullaby = {range="Marsyas"}
	sets.precast.FC.Lullaby.Resistant = {range="Daurdabla"}
	sets.precast.FC['Horde Lullaby'] = {range="Marsyas"}
	sets.precast.FC['Horde Lullaby'].Resistant = {range="Daurdabla"}
	sets.precast.FC['Horde Lullaby'].AoE = {range="Daurdabla"}
	sets.precast.FC['Horde Lullaby II'] = {range="Marsyas"}
	sets.precast.FC['Horde Lullaby II'].Resistant = {range="Daurdabla"}
	sets.precast.FC['Horde Lullaby II'].AoE = {range="Daurdabla"}
	
		
	sets.precast.FC.Mazurka = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})

	sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
	sets.precast.DaurdablaDummy = sets.precast.FC.Daurdabla
	sets.precast.FC["Shining Fantasia"] = sets.precast.FC.DaurdablaDummy
	sets.precast.FC["Scop's Operetta"] = sets.precast.FC.DaurdablaDummy
		
	
	-- Precast sets to enhance JAs
	
	sets.precast.JA.Nightingale = {feet="Bihu Slippers +1"}
	sets.precast.JA.Troubadour = {body="Bihu Jstcorps +1"}
	sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions +1"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Aurgelmir Orb +1",
		head="Aya. Zucchetto +2",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Mache Earring +1",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Ramuh Ring +1",ring2="Ilabrat Ring",
		back=gear.brd_savage,waist="Grunfeld Rope",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		
	sets.precast.WS.Acc = {ammo="Aurgelmir Orb +1",
		head="Aya. Zucchetto +2",neck="Combatant's Torque",ear1="Moonshade Earring",ear2="Mache Earring +1",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Ramuh Ring +1",ring2="Ilabrat Ring",
		back=gear.brd_savage,waist="Olseni Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		
	sets.precast.WS['Savage Blade'] = {ammo="Aurgelmir Orb +1",
		head="Nyame Helm",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Rufescent Ring",ring2="Ilabrat Ring",
		back=gear.brd_savage,waist="Sailfi Belt +1",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		
	sets.precast.WS['Aeolian Edge'] = {ammo="Aurgelmir Orb +1",
		head="Cath Palug Crown",neck="Baetyl Pendant",ear1="Moonshade Earring",ear2="Friomisi Earring",
		body="Chironic Doublet",hands=gear.chironic_enfeeble_hands,ring1="Metamorph Ring +1",ring2="Shiva Ring +1",
		back=gear.brd_savage,waist="Refoccilation Stone",legs="Gyve Trousers",feet=gear.chironic_nuke_feet}
		
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring",ear2="Telos Earring",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Nahtirah Hat",neck="Voltsurge Torque",ear2="Enchntr. Earring +1",ear1="Etiolation Earring",
		body="Inyanga Jubbah +2",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
		back=gear.magic_jse_back,waist="Witful Belt",legs="Aya. Cosciales +2",feet="Bihu Slippers +1"}

	-- Gear to enhance certain classes of songs
	sets.midcast.Ballad = {legs="Inyanga Shalwar +2"}
	sets.midcast.Lullaby = {range="Gjallarhorn"}
	sets.midcast.Lullaby.Resistant = {range="Daurdabla"}
	sets.midcast['Horde Lullaby'] = {range="Gjallarhorn"}
	sets.midcast['Horde Lullaby'].Resistant = {range="Daurdabla"}
	sets.midcast['Horde Lullaby'].AoE = {range="Daurdabla"}
	sets.midcast['Horde Lullaby II'] = {range="Gjallarhorn"}
	sets.midcast['Horde Lullaby II'].Resistant = {range="Daurdabla"}
	sets.midcast['Horde Lullaby II'].AoE = {range="Daurdabla"}
	sets.midcast.Madrigal = {head="Fili Calot +1"}
	sets.midcast.Paeon = {}
	sets.midcast.March = {hands="Fili Manchettes +1"}
	sets.midcast['Honor March'] = set_combine(sets.midcast.March,{range="Marsyas"})
	sets.midcast.Minuet = {body="Fili Hongreline +1"}
	sets.midcast.Minne = {}
	sets.midcast.Carol = {}
	sets.midcast["Sentinel's Scherzo"] = {feet="Fili Cothurnes +1"}
	sets.midcast['Magic Finale'] = {range="Gjallarhorn"}
	sets.midcast.Mazurka = {range="Gjallarhorn"}
	

	-- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffect = {main=gear.kali_macc,sub="Ammurapi Shield",range="Gjallarhorn",ammo=empty,
		head="Fili Calot +1",neck="Moonbow Whistle",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Fili Hongreline +1",hands="Inyan. Dastanas +2",ring1="Defending Ring",ring2="Stikini Ring",
		back=gear.brd_jse_macc,waist="Flume Belt",legs="Inyanga Shalwar +2",feet="Brioso Slippers +3"}
		
	sets.midcast.SongEffect.DW = {main=gear.kali_macc,sub=gear.kali_refresh}

	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {main=gear.kali_macc,sub="Ammurapi Shield",range="Gjallarhorn",ammo=empty,
		head="Inyanga Tiara +2",neck="Moonbow Whistle",ear1="Regal Earring",ear2="Digni. Earring",
		body="Fili Hongreline +1",hands="Inyan. Dastanas +2",ring1="Defending Ring",ring2="Metamorph Ring +1",
		back=gear.brd_jse_macc,waist="Eschan Stone",legs="Inyanga Shalwar +2",feet="Brioso Slippers +3"}
		
	sets.midcast.SongDebuff.DW = {main="Kali",sub="Kali"}

	-- For song defbuffs (accuracy primary, duration secondary)
	sets.midcast.SongDebuff.Resistant = {main="Daybreak",sub="Ammurapi Shield",range="Gjallarhorn",ammo=empty,
		head="Inyanga Tiara +2",neck="Moonbow Whistle",ear1="Regal Earring",ear2="Digni. Earring",
		body="Inyanga Jubbah +2",hands="Inyan. Dastanas +2",ring1="Defending Ring",ring2="Metamorph Ring +1",
		back=gear.brd_jse_macc,waist="Eschan Stone",legs="Inyanga Shalwar +2",feet="Brioso Slippers +3"}

	-- Song-specific recast reduction
	sets.midcast.SongRecast = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",range="Gjallarhorn",ammo=empty,
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Inyanga Jubbah +2",hands="Gendewitha Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
		back=gear.magic_jse_back,waist="Embla Sash",legs="Fili Rhingrave +1",feet="Nyame Sollerets"}
		
	sets.midcast.SongDebuff.DW = {}

	-- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = set_combine(sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

	sets.midcast["Shining Fantasia"] = set_combine(sets.midcast.SongRecast, {range=info.ExtraSongInstrument})
	sets.midcast["Scop's Operetta"] = set_combine(sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

	-- Other general spells and classes.
	sets.midcast.Cure = {main="Serenity",sub="Curatio Grip",ammo="Pemphredo Tathlum",
        head="Gende. Caubeen +1",neck="Incanter's Torque",ear1="Gifted Earring",ear2="Mendi. Earring",
        body="Bunzi's Robe",hands="Kaykaus Cuffs",ring1="Janniston Ring",ring2="Menelaus's Ring",
        back="Tempered Cape +1",waist="Luminary Sash",legs="Carmine Cuisses +1",feet="Kaykaus Boots"}
		
	sets.midcast.Curaga = sets.midcast.Cure
		
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}
		
	sets.midcast['Enhancing Magic'] = {main="Serenity",sub="Fulcio Grip",ammo="Hasty Pinion +1",
		head="Telchine Cap",neck="Voltsurge Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.magic_jse_back,waist="Embla Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
		
	sets.midcast['Elemental Magic'] = {main="Daybreak",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",
		head="C. Palug Crown",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Chironic Doublet",hands="Volte Gloves",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Toro Cape",waist="Sekhmet Corset",legs="Gyve Trousers",feet=gear.chironic_nuke_feet}
		
	sets.midcast['Elemental Magic'].Resistant = {main="Daybreak",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",
		head="C. Palug Crown",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Chironic Doublet",hands="Volte Gloves",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Toro Cape",waist="Yamabuki-no-Obi",legs="Gyve Trousers",feet=gear.chironic_nuke_feet}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",hands="Hieros Mittens",
		back="Oretan. Cape +1",ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt",feet="Vanya Clogs"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff,sub="Clemency Grip"})

	-- Resting sets
	sets.resting = {main="Chatoyant Staff",sub="Umbra Strap",ammo="Staunch Tathlum +1",
		head="Inyanga Tiara +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Inyanga Jubbah +2",hands=gear.chironic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Flume belt",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}
	
	sets.idle = {main=gear.kali_refresh,sub="Genmei shield",ammo="Staunch Tathlum +1",
		head="Inyanga Tiara +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Hearty Earring",
		body="Inyanga Jubbah +2",hands="Inyanga dastanas +2",ring1="Defending Ring",ring2="Inyanga Ring",
		back="Solemnity Cape",waist="Carrier's Sash",legs="Assiduity Pants",feet="Fili Cothurnes +1"}
		
	sets.idle.NoRefresh = {main=gear.kali_refresh,sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Hearty Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Warden's Ring",
		back="Moonbeam Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Fili Cothurnes +1"}

	sets.idle.DT = {main=gear.kali_refresh,sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Hearty Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Warden's Ring",
		back="Moonbeam Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	
	-- Defense sets

	sets.defense.PDT = {main="Terra's Staff", sub="Umbra Strap",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Warden's Ring",
		back="Moonbeam Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.defense.MDT = {main="Terra's Staff", sub="Umbra Strap",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Warden's Ring",
		back="Moonbeam Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.Kiting = {feet="Fili Cothurnes +1"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.TPEat = {neck="Chrys. Torque"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	sets.engaged = {main="Naegling",sub="Genmei Shield",ammo="Aurgelmir Orb +1",
		head="Aya. Zucchetto +2",neck="Lissome Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Defending Ring",ring2="Apate Ring",
		back=gear.brd_tp,waist="Sarissaphoroi belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}

	sets.engaged.DT = {main="Naegling",sub="Genmei Shield",ammo="Aurgelmir Orb +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Nyame Mail",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.brd_tp,waist="Windbuffet Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.engaged.Acc = {main="Naegling",sub="Genmei Shield",ammo="Aurgelmir Orb +1",
		head="Aya. Zucchetto +2",neck="Combatant's Torque",ear1="Digni. Earring",ear2="Telos Earring",
		body="Ayanmo Corazza +22",hands="Aya. Manopolas +2",ring1="Ramuh Ring +1",ring2="Ilabrat Ring",
		back=gear.brd_tp,waist="Olseni Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}

	sets.engaged.DW = {main="Naegling",sub="Blurred Knife",ammo="Aurgelmir Orb +1",
		head="Aya. Zucchetto +2",neck="Lissome Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Defending Ring",ring2="Apate Ring",
		back=gear.brd_tp,waist="Reiki Yotai",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}

	sets.engaged.DW.DT = {main="Naegling",sub="Blurred Knife",ammo="Aurgelmir Orb +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Suppanomimi",ear2="Brutal Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Ilabrat Ring",
		back=gear.brd_tp,waist="Reiki Yotai",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.engaged.DW.Acc = {main="Aeneas",sub="Blurred Knife +1",ammo="Aurgelmir Orb +1",
		head="Aya. Zucchetto +2",neck="Combatant's Torque",ear1="Suppanomimi",ear2="Telos Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Ramuh Ring +1",ring2="Ilabrat Ring",
		back=gear.brd_tp,waist="Reiki Yotai",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}

	sets.engaged.DW.Acc.DT = {main="Aeneas",sub="Blurred Knife +1",ammo="Aurgelmir Orb +1",
		head="Nyame Helm",neck="Combatant's Torque",ear1="Suppanomimi",ear2="Telos Earring",
		body="Ayanmo Corazza +2",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Ilabrat Ring",
		back=gear.brd_tp,waist="Reiki Yotai",legs="Nyame Flanchard",feet="Nyame Sollerets"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(10, 10)
end

state.Weapons:options('None','Naegling','Dagger','DualWeapons','DualNaegling','DualTauret')

autows_list = {['Naegling']='Savage Blade',['Aeneas']="Rudra's Storm",['DualWeapons']="Rudra's Storm",['DualNaegling']='Savage Blade',['DualTauret']='Evisceration',
     ['DualAeolian']='Aeolian Edge'}