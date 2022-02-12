function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc')
	state.HybridMode:options('Normal','DT')
    state.CastingMode:options('Normal','Resistant','AoE')
    state.IdleMode:options('Normal','NoRefresh','DT')
	state.Weapons:options('None','Carnwenhan','Naegling','Aeneas','DualWeapons','DualNaegling','DualTauret','DualAeolian')

	--gear.melee_jse_back = {name="Intarabus's Cape",augments={'Accuracy+20 Attack+20'}}
	--gear.magic_jse_back = {name="Intarabus's Cape",augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}}
	gear.BRD_MACC_FC = {name ="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+6','"Fast Cast"+10',}}
	gear.BRD_MELEE = {name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}

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
	send_command('bind @z gs c cycle UnlockWeapons')

	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Weapons sets
	sets.weapons.Carnwenhan = {main="Carnwenhan",sub="Genmei Shield"}
	sets.weapons.Aeneas = {main="Aeneas",sub="Genmei Shield"}
	sets.weapons.DualWeapons = {main="Aeneas",sub="Fusetto +2"}
	sets.weapons.DualNaegling = {main="Naegling",sub="Fusetto +2"}
	sets.weapons.Naegling = {main="Naegling",sub="Genmei Shield"}
	sets.weapons.DualTauret = {main="Tauret",sub="Fusetto +2"}
	sets.weapons.DualAeolian = {main="Tauret",sub="Malevolence"}

    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {

		main="Vampirism",head="Bunzi's Hat",neck="Baetyl Pendant",ear1="Enchntr. earring +1",ear2="Loquac. Earring",			
		body="Inyanga jubbah +2",hands="Leyline gloves",ring1="Kishar ring",ring2="Rahab ring",				
		back=gear.BRD_MACC_FC,waist="Witful belt",legs="Kaykaus tights +1",feet="Bihu Slippers +3"	

		}

	sets.precast.FC.DT = {

		main="Vampirism",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Bunzi's Hat",neck="Loricate Torque +1",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Inyanga Jubbah +2",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
		back=gear.BRD_MACC_FC,waist="Witful Belt",legs="Aya. Cosciales +2",feet="Bihu Slippers +3"
	}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {
		main="Daybreak",
		ear1="Mendicant's earring",
		head="Kaykaus mitra +1",
		body="Inyanga jubbah +2",
		legs="Doyen pants",
		feet="Kaykaus boots +1"
		})

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	sets.precast.FC['Stoneskin'] = set_combine(sets.precast.FC, {head="Umuthi hat",legs="Doyen pants"})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})
	
	sets.precast.FC.BardSong = set_combine(sets.precast.FC, {
		range="Gjallarhorn",
		head="Fili calot",			--13
		body="Brioso justaucorps +3",	--15
		legs="Kaykaus tights +1",		--10
		feet="Bihu Slippers +3",
		back=gear.BRD_MACC_FC,
	})

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
		
	
	-- Precast sets to enhance JAs
	
	sets.precast.JA.Nightingale = {feet="Bihu Slippers +3"}
	sets.precast.JA.Troubadour = {body="Bihu Jstcorps +3"}
	sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions +3"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {range="Linos",
		head="Ayanmo zucchetto +2",neck="Caro necklace",ear1="Ishvara earring",ear2="Moonshade earring",
		body="Bihu Jstcorps. +3",hands="Nyame gauntlets",ring1="Epaminondas's ring",ring2="Ilabrat ring",
		back=gear.BRD_MELEE,waist="Grunfeld rope",legs="Lustratio subligar +1",feet="Lustratio leggings +1"}
		
	sets.precast.WS.Acc = {range="Linos",
		head="Ayanmo zucchetto +2",neck="Caro necklace",ear1="Ishvara earring",ear2="Moonshade earring",
		body="Bihu Jstcorps. +3",hands="Nyame gauntlets",ring1="Epaminondas's ring",ring2="Ilabrat ring",
		back=gear.BRD_MELEE,waist="Grunfeld rope",legs="Lustratio subligar +1",feet="Lustratio leggings +1"}
		
	sets.precast.WS['Savage Blade'] = {range="Linos",
		head="Nyame Helm",neck="Fotia gorget",ear1="Brutal earring",ear2="Moonshade earring",
		body="Bihu Jstcorps. +3",hands="Nyame gauntlets",ring1="Metamorph Ring +1",ring2="Epaminondas's ring",
		back=gear.BRD_MELEE,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame sollerets"}

	sets.precast.WS['Mordant Rime'] = {range="Linos",
		head="Bihu roundlet +3",neck="Moonbow Whistle +1",ear1="Brutal earring",ear2="Regal Earring",
		body="Bihu Jstcorps. +3",hands="Bihu Cuffs +3",ring1="Epaminondas's ring",ring2="Ilabrat ring",
		back=gear.BRD_MELEE,waist="Grunfeld rope",legs="Lustratio subligar +1",feet="Bihu Slippers +3"}
		

	sets.precast.WS['Rudra\'s Storm'] = set_combine(sets.precast.WS, {
		legs="Lustr. Subligar +1",
        feet="Lustra. Leggings +1",
        waist="Kentarch Belt",
        })

	sets.precast.WS['Aeolian Edge'] = {

		ammo="Pemphredo tathlum",
		head="Nyame Helm",
		neck="Sanctity Necklace",
		ear1="Moonshade Earring",
		ear2="Friomisi Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Epaminondas's ring",
		ring2="Metamorph Ring +1",
		back=gear.BRD_MELEE,
		waist="Orpheus's Sash",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		ammo="Ghastly Tathlum +1"
	}

	sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {
        head="Nyame Helm",
		hands="Bunzi's Gloves",
        legs="Lustr. Subligar +1",
        ring1="Begrudging Ring",
        back=gear.BRD_MELEE,
        waist="Fotia Belt",
        })

		
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring",ear2="Telos Earring",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = set_combine(sets.precast.FC)

	-- Gear to enhance certain classes of songs
	sets.midcast.Ballad = {legs="Fili Rhingrave +1"}
	sets.midcast.Lullaby = {range="Marsyas", hands="Brioso Cuffs +2"}
	sets.midcast.Lullaby.Resistant = {range="Daurdabla", hands="Brioso Cuffs +2"}
	sets.midcast['Horde Lullaby'] = {range="Marsyas",hands="Brioso Cuffs +2"}
	sets.midcast['Horde Lullaby'].Resistant = {range="Daurdabla",hands="Brioso Cuffs +2"}
	sets.midcast['Horde Lullaby'].AoE = {range="Daurdabla",hands="Brioso Cuffs +2"}
	sets.midcast['Horde Lullaby II'] = {range="Marsyas",hands="Brioso Cuffs +2"}
	sets.midcast['Horde Lullaby II'].Resistant = {range="Daurdabla",hands="Brioso Cuffs +2"}
	sets.midcast['Horde Lullaby II'].AoE = {range="Daurdabla",hands="Brioso Cuffs +2"}
	sets.midcast.Madrigal = {head="Fili Calot +1", back=gear.BRD_MACC_FC}
	sets.midcast.Paeon = {head="Brioso roundlet +2"}
	sets.midcast.March = {hands="Fili Manchettes"}
	sets.midcast['Honor March'] = set_combine(sets.midcast.March,{range="Marsyas"})
	sets.midcast.Minuet = {body="Fili Hongreline +1"}
	sets.midcast.Minne = {}
	sets.midcast.Carol = {}
	sets.midcast["Sentinel's Scherzo"] = {feet="Fili Cothurnes +1"}
	sets.midcast['Magic Finale'] = set_combine(sets.midcast.SongDebuff, {hands="Bewegt Cuffs",legs="Fili Rhingrave +1",})
	sets.midcast.Mazurka = {range="Marsyas"}
	

	-- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffect = {main="Carnwenhan",sub="Genmei shield",range="Gjallarhorn",
		head="Fili calot",neck="Moonbow Whistle +1",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Fili hongreline +1",hands="Fili Manchettes",ring1="Defending ring",ring2="Inyanga ring",
		back=gear.BRD_MACC_FC,waist="Flume belt",legs="Inyanga shalwar +2",feet="Brioso Slippers +3"}
		
	sets.midcast.SongEffect.DW = {main="Carnwenhan",sub="Tauret"}

	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {main="Carnwenhan",sub="Ammurapi shield",range="Gjallarhorn",
		head="Brioso roundlet +2",neck="Moonbow Whistle +1",ear1="Regal earring",ear2="Dignitary's Earring",
		body="Brioso justaucorps +3",hands="Inyanga dastanas +2",ring1="Metamor. ring +1",ring2="Stikini ring",
		back=gear.BRD_MACC_FC,waist="Luminary Sash",legs="Brioso Cannions +3",feet="Brioso Slippers +3"}
		
	sets.midcast.SongDebuff.DW = {main="Carnwenhan",sub="Tauret"}

	-- For song defbuffs (accuracy primary, duration secondary)
	sets.midcast.SongDebuff.Resistant = {main="Carnwenhan",sub="Ammurapi shield",range="Gjallarhorn",
		head="Brioso roundlet +2",neck="Moonbow Whistle +1",ear1="Regal earring",ear2="Dignitary's Earring",
		body="Brioso justaucorps +3",hands="Inyanga dastanas +2",ring1="Metamor. ring +1",ring2="Stikini ring",
		back=gear.BRD_MACC_FC,waist="Porous rope",legs="Brioso cannions +3",feet="Brioso Slippers +3"}

	-- Song-specific recast reduction
	sets.midcast.SongRecast = set_combine(sets.precast.FC.BardSong)
		
	sets.midcast.SongDebuff.DW = {}

	-- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = {main="Earth staff",sub="Enki Strap",range=info.ExtraSongInstrument,
		head="Inyanga tiara +2",neck="Loricate torque +1",ear1="Enchntr. Earring +1",ear2="Loquacious earring",
		body="Inyanga jubbah +2",hands="Inyanga dastanas +2",ring1="Defending ring",ring2="Gelatinous Ring +1",
		back=gear.BRD_MACC_FC,waist="Flume Belt",legs="Inyanga shalwar +2",feet="Inyanga crackows +2"}

	-- Other general spells and classes.
	sets.midcast.Cure = {main="Daybreak",sub="Enki Strap",ammo="Pemphredo Tathlum",
		head="Kaykaus mitra +1",neck="Incanter's torque",ear1="Mendicant's earring",ear2="Novia earring",
		body="Kaykaus bliaut +1",hands="Kaykaus cuffs +1",ring1="Sirona's ring",ring2="Lebeche ring",
		back="Tempered cape +1",waist="Porous rope",legs="Kaykaus tights +1",feet="Kaykaus boots +1"}
		
	sets.midcast.Curaga = sets.midcast.Cure
		
	sets.Self_Healing = {waist="Gishdubar Sash"}
	sets.Cure_Received = {waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
		
	sets.midcast['Enhancing Magic'] = {sub="Ammurapi shield",
		gear.telchine_enh_head,neck="Incanter's torque",ear1="Andoaa earring",
		body=gear.telchine_enh_body,hands=gear.telchine_enh_hands,ring1="Stikini ring",ring2="Stikini ring",
		back="Fi Follet Cape +1",waist="Embla sash",legs=gear.telchine_enh_legs,feet="Rubeus boots"}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
		
	sets.midcast['Elemental Magic'] = {main="Daybreak",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",
		head="C. Palug Crown",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Chironic Doublet",hands="Volte Gloves",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Toro Cape",waist="Sekhmet Corset",legs="Gyve Trousers",feet=gear.chironic_nuke_feet}
		
	sets.midcast['Elemental Magic'].Resistant = {main="Daybreak",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",
		head="C. Palug Crown",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Chironic Doublet",hands="Volte Gloves",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Toro Cape",waist="Yamabuki-no-Obi",legs="Gyve Trousers",feet=gear.chironic_nuke_feet}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {	head="Vanya hood",neck="Incanter's torque",
		body="Vanya robe",hands="Vanya cuffs",ring1="Sirona's ring",
		back="Tempered cape +1",waist="Bishop's sash",legs="Vanya slops",feet="Vanya clogs"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})

	-- Resting sets
	sets.resting = {main="Chatoyant Staff",sub="Umbra Strap",ammo="Staunch Tathlum +1",
		head=empty,neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Respite Cloak",hands=gear.chironic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Flume Belt +1",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}
	
	sets.idle = {main="Carnwenhan",sub="Genmei shield",range="Nibiru Harp",
		head="Bunzi's Hat",neck="Bathy choker +1",ear1="Infused earring",ear2="Odnowa earring +1",
		body="Inyanga jubbah +2",hands="Inyanga dastanas +2",ring1="Defending ring",ring2="Inyanga ring",
		back="Solemnity cape",waist="Fucho-no-obi",legs="Assiduity pants +1",feet="Fili cothurnes +1"}
		
	sets.idle.NoRefresh = {main="Daybreak",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa earring +1",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Moonbeam Ring",
		back="Moonlight Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Fili Cothurnes +1"}

	sets.idle.DT = {main="Daybreak",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa earring +1",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Moonbeam Ring",
		back="Moonbeam Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	
	-- Defense sets

	sets.defense.PDT = {range="Nibiru harp",
		head="Bunzi's Hat",neck="Loricate torque +1",ear1="Genmei earring",ear2="Odnowa earring +1",
		body="Bihu Jstcorps. +3",hands="Bihu Cuffs +3",ring1="Defending ring",ring2="Gelatinous ring +1",
		back="Solemnity cape",waist="Flume belt",legs="Brioso cannions +3",feet="Nyame Sollerets"}

	sets.defense.MDT = {range="Nibiru harp",
		head="Bunzi's Hat",neck="Warder's charm +1",ear1="Etiolation earring",ear2="Odnowa earring +1",
		body="Inyanga jubbah +2",hands="Inyanga dastanas +2",ring1="Defending ring",ring2="Dark ring",
		back="Solemnity cape",waist="Carrier's sash",legs="Brioso cannions +3",feet="Nyame Sollerets"}

	sets.Kiting = {feet="Fili Cothurnes +1"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.TPEat = {neck="Chrys. Torque"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	sets.engaged = {main="Naegling", range="linos",
		head="Nyame Helm",neck="Combatant's torque",ear1="Telos Earring",ear2="Cessance Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Chirich ring +1",ring2="Chirich ring +1",
		back=gear.BRD_MELEE,waist="Sailfi Belt +1",legs="Nyame flanchard",feet="Nyame Sollerets"}

	sets.engaged.DT = {main="Naegling", range="linos",
		head="Nyame Helm",neck="Combatant's torque",ear1="Telos Earring",ear2="Cessance Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Chirich ring +1",ring2="Chirich ring +1",
		back=gear.BRD_MELEE,waist="Sailfi Belt +1",legs="Nyame flanchard",feet="Nyame Sollerets"}

	sets.engaged.Acc = {main="Naegling", range="linos",
		head="Nyame Helm",neck="Combatant's torque",ear1="Telos Earring",ear2="Cessance Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Chirich ring +1",ring2="Chirich ring +1",
		back=gear.BRD_MELEE,waist="Sailfi Belt +1",legs="Nyame flanchard",feet="Nyame Sollerets"}

	sets.engaged.DW = {main="Naegling", sub="Fusetto +2", range="linos",
		head="Nyame Helm",neck="Combatant's torque",ear1="Suppanomimi",ear2="Eabani Earring",
		body="Ayanmo Corazza +2",hands="Bunzi's Gloves",ring1="Chirich ring +1",ring2="Chirich ring +1",
		back=gear.BRD_MELEE,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.engaged.DW.DT = {main="Naegling", sub="Fusetto +2", range="linos",
		head="Nyame Helm",neck="Combatant's torque",ear1="Suppanomimi",ear2="Eabani Earring",
		body="Nyame Mail",hands="Bunzi's Gloves",ring1="Chirich ring +1",ring2="Chirich ring +1",
		back=gear.BRD_MELEE,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.engaged.DW.Acc = {main="Naegling", sub="Gleti's Knife", range="linos",
		head="Nyame Helm",neck="Combatant's torque",ear1="Suppanomimi",ear2="Eabani Earring",
		body="Ayanmo Corazza +2",hands="Bunzi's Gloves",ring1="Chirich ring +1",ring2="Chirich ring +1",
		back=gear.BRD_MELEE,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.engaged.DW.Acc.DT = {main="Naegling",sub="Gleti's Knife",ammo="Aurgelmir Orb +1",
		head="Nyame Helm",neck="Combatant's Torque",ear1="Suppanomimi",ear2="Telos Earring",
		body="Ayanmo Corazza +2",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Ilabrat Ring",
		back=gear.BRD_MELEE,waist="Reiki Yotai",legs="Nyame Flanchard",feet="Nyame Sollerets"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 10)
end

state.Weapons:options('None','Naegling','Carnwenhan','Aeneas','DualWeapons','DualNaegling','DualTauret','DualAeolian')

autows_list = {['Naegling']='Savage Blade',['Aeneas']="Rudra's Storm",['DualWeapons']="Rudra's Storm",['DualNaegling']='Savage Blade',['DualTauret']='Evisceration',
     ['DualAeolian']='Aeolian Edge'}