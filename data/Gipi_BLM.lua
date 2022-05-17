-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')
    	
    state.MagicBurst = M(false, 'Magic Burst')
	state.WeaponLock = M(false, 'Weapon Lock')
	gear.default.obi_waist = "Sacro Cord"
		
    -- Additional local binds
    send_command('bind ^` input /ma Stun <t>')
    send_command('bind ^delete gs c toggle MagicBurst')
	send_command('bind @w gs c toggle WeaponLock')

    select_default_macro_book()
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind @`')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
	include('Gipi_augmented-items.lua')
	
    ---- Precast Sets ----
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Mana Wall'] = {feet="Goetia Sabots +2"}

    sets.precast.JA.Manafont = {body="Sorcerer's Coat +2"}
    
    -- equip to maximize HP (for Tarus) and minimize MP loss before using convert
    sets.precast.JA.Convert = {}


    -- Fast cast sets for spells

    sets.precast.FC = {
		ammo="Sapience Orb", 			--2
		main="Mpaca's Staff",			--5     
		sub="Khonsu",
		head="Amalric Coif +1",			--11
		neck="Orunmila's torque",		--5
		ear1="Loquac. Earring",			--2
		ear2="Malignance Earring",		--4
		body=gear.MerlinBodyFC,			--12
		hands=gear.MerlinHandsFC,		--7
		ring1="Kishar Ring",			--4
		ring2="Rahab Ring",				--2
		back="Fi Follet Cape +1",		--10
		waist="Witful Belt",			--3
		legs="Volte Brais",				--8
		feet=gear.MerlinFeetFC			--12
	}		--87

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {})
    sets.precast.FC.Cure = set_combine(sets.precast.FC, {})
    sets.precast.FC.Curaga = sets.precast.FC.Cure
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak", sub="Ammurapi Shield"})
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
    
	-- Weaponskill sets
	
    sets.precast.WS = {ammo="Crepuscular Pebble",
        head="Nyame Helm",neck="Combatant's Torque",ear1="Telos Earring",ear2="Crep. Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Shukuyu Ring",
        back="Aurist's Cape +1",waist="Grunfeld Rope",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    -- MAGIC WS
    
	sets.precast.WS['Earth Crusher'] = set_combine(sets.precast.WS, {		
		neck="Sorcerer's Stole +2",
		ear1="Regal Earring",
		ear2="Malignance Earring",	
		ring1="Freke Ring",
		back=gear.TaranusMB,
		waist="Orpheus's Sash"
		})
    
	sets.precast.WS['Starburst'] = set_combine(sets.precast.WS['Earth Crusher'], {})
	sets.precast.WS['Sunburst'] = set_combine(sets.precast.WS['Earth Crusher'], {})
	sets.precast.WS['Cataclysm'] = set_combine(sets.precast.WS['Earth Crusher'], {head="Pixie Hairpin +1",ring2="Archon Ring",})
	sets.precast.WS['Vidohunir'] = set_combine(sets.precast.WS['Cataclysm'], {})
    
    ---- Midcast Sets ----

    sets.midcast.FastRecast = set_combine(sets.precast.FC, {
		head="Amalric Coif +1",
		hands="Amalric Gages +1",
		legs="Lengo Pants",
		ear2="Magnetic Earring",
		feet="Amalric Nails +1",
		})

    sets.midcast.Cure = {main="Daybreak",sub="Ammurapi shield",ammo="Impatiens",
        head="Vanya hood",neck="Incanter's torque",ear1="Regal Earring",ear2="Mendicant's earring",
        body="Vanya robe",hands="Vanya cuffs",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back="Aurist's Cape +1",waist="Bishop's sash",legs="Vanya slops",feet="Vanya clogs"}

    sets.midcast.Curaga = sets.midcast.Cure
	sets.midcast.Cursna = {feet="Vanya clogs"}
	
	--Enhancing Magic
	
	sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {main=gear.GadaENH,sub="Ammurapi shield",
		head="Umuthi hat",neck="Incanter's torque",ear1="Andoaa earring",ear2="Mimir Earring",
		body="Telchine chasuble",hands="Telchine Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Fi Follet Cape +1",waist="Olympus sash",legs="Shedir seraweels",feet="Rubeus boots"})

	sets.midcast.EnhancingDuration = set_combine(sets.midcast['Enhancing Magic'], {
		main=gear.GadaENH,
		sub="Ammurapi shield",
		head=gear.TelchineHeadDURATION,
		body=gear.TelchineBodyDURATION,
		hands=gear.TelchineHandsDURATION,
		legs=gear.TelchineLegsDURATION,
		feet=gear.TelchineFeetDURATION,
		waist="Embla Sash",
		})
	
	sets.midcast.Regen = set_combine(sets.midcast.EnhancingDuration, {main="Bolelabunga"})
	sets.midcast['Haste'] = sets.midcast.EnhancingDuration
	sets.midcast['Flurry'] = sets.midcast.EnhancingDuration
	sets.midcast['Refresh'] = set_combine(sets.midcast.EnhancingDuration, {head="Amalric Coif +1",waist="Gishdubar sash"})
	sets.midcast.Storm = set_combine(sets.midcast.EnhancingDuration, {})		
	sets.midcast['Blink'] = sets.midcast.EnhancingDuration
	
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		neck="Stone gorget",legs="Shedir seraweels",waist="Siegel Sash"})

	sets.midcast.Aquaveil = set_combine(sets.midcast.EnhancingDuration, {
		hands="Regal Cuffs",
		legs="Shedir seraweels"
		})
		
    sets.midcast.Protectra = {ring1="Sheltered Ring"}

    sets.midcast.Shellra = {ring1="Sheltered Ring"}

	--Enfeebling Magic
		
    sets.midcast['Enfeebling Magic'] = {main="Contemplator +1",sub="Enki strap",ammo="Pemphredo tathlum",
        head="Amalric Coif +1",neck="Erra pendant",ear1="Dignitary's Earring",ear2="Malignance Earring",
        body="Amalric Doublet +1",hands="Regal Cuffs",ring1="Kishar ring",ring2="Stikini Ring +1",
        back="Aurist's Cape +1",waist="Luminary sash",legs="Jhakri Slops +2",feet="Medium's sabots"}
        
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {ring1="Stikini Ring +1",waist="Acuity Belt +1",feet="Jhakri Pigaches +2",})	
	sets.midcast.Dispelga = set_combine(sets.midcast['Enfeebling Magic'], {main="Daybreak", sub="Ammurapi Shield"})	
	sets.midcast.Impact = set_combine(sets.midcast.ElementalEnfeeble, {
		head=empty,
		body="Twilight cloak",
		})
	
	--Dark Magic
	
    sets.midcast['Dark Magic'] = {main="Rubicundity",sub="Ammurapi shield",ammo="Pemphredo tathlum",
        head="Amalric Coif +1",neck="Incanter's torque",ear1="Dignitary's Earring",ear2="Malignance Earring",
        body=gear.MerlinBodyMB,hands="Regal Cuffs",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back=gear.TaranusMB,waist="Acuity Belt +1",legs=gear.MerlinLegsMB,feet=gear.MerlinFeetMB}

    sets.midcast.Drain = {main="Rubicundity",sub="Ammurapi shield",ammo="Pemphredo tathlum",
        head="Pixie hairpin +1",neck="Erra pendant",ear1="Dignitary's Earring",ear2="Malignance Earring",
        body=gear.MerlinBodyMB,hands="Regal Cuffs",ring1="Archon ring",ring2="Evanescence ring",
        back=gear.TaranusMB,waist="Fucho-no-obi",legs=gear.MerlinLegsMB,feet=gear.MerlinFeetMB}
    
    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Stun = {main="Mpaca's Staff",sub="Enki Strap",ammo="Pemphredo tathlum",
        head="Amalric Coif +1",neck="Orunmila's torque",ear1="Enchanter earring +1",ear2="Malignance Earring",
        body=gear.MerlinBodyMB,hands="Regal Cuffs",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back="Aurist's Cape +1",waist="Acuity Belt +1",legs="Psycloth lappas",feet=gear.MerlinFeetMB}
		
	sets.midcast.Stun.Resistant = set_combine(sets.midcast.Stun, {neck="Erra Pendant",})

    -- Elemental Magic sets
    
    sets.midcast['Elemental Magic'] = {main="Mpaca's Staff",sub="Enki Strap",ammo="Ghastly Tathlum +1",
        head=empty,neck="Sibyl Scarf",ear1="Regal earring",ear2="Malignance Earring",
        body="Cohort Cloak +1",hands="Amalric Gages +1",ring1="Metamor. Ring +1",ring2="Freke Ring",
        back=gear.TaranusMB,waist=gear.ElementalObi,legs="Amalric Slops +1",feet="Amalric Nails +1"}

    sets.midcast['Elemental Magic'].Resistant = {main="Marin's Staff +1",sub="Enki Strap",ammo="Ghastly Tathlum +1",
        head="Ea Hat +1",neck="Sorcerer's Stole +2",ear1="Regal earring",ear2="Malignance Earring",
        body="Ea Houppelande +1",hands="Amalric Gages +1",ring1="Mujin band",ring2="Freke Ring",
        back=gear.TaranusMB,waist=gear.ElementalObi,legs="Ea Slops +1",feet="Amalric Nails +1"}
		

    -- Idle sets
    
    -- Normal refresh idle set
    sets.idle = {main="Daybreak",sub="Genmei shield",ammo="Staunch Tathlum +1",
        head="Befouled Crown",neck="Bathy Choker +1",ear1="Infused earring",ear2="Lugalbanda Earring",
        body="Shamash Robe",hands="Nyame Gauntlets",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back="Moonbeam cape",waist="Fucho-no-obi",legs="Assiduity pants +1",feet="Volte Gaiters"}

    sets.idle.PDT = {main="Daybreak",sub="Genmei shield",ammo="Staunch Tathlum +1",
        head="Nyame Helm",neck="Warder's Charm +1",ear1="Sanare Earring",ear2="Lugalbanda Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Purity Ring",
        back="Moonbeam cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.idle.Weak = sets.idle.PDT
    sets.idle.Town = sets.idle
	sets.resting = sets.idle
        
    -- Defense sets

    sets.defense.PDT = set_combine(sets.idle.PDT, {})
    sets.defense.MDT = set_combine(sets.idle.PDT, {})
    sets.Kiting = {ring2="Shneddick Ring"}
    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    
    sets.buff['Mana Wall'] = {back=gear.TaranusMB,feet="Goetia Sabots +2"}

    sets.magic_burst = {main="Marin's Staff +1",sub="Enki Strap",ammo="Ghastly Tathlum +1",
        head="Ea Hat +1",neck="Sorcerer's Stole +2",ear1="Regal earring",ear2="Malignance Earring",
        body="Ea Houppelande +1",hands="Amalric Gages +1",ring1="Mujin band",ring2="Freke Ring",
        back=gear.TaranusMB,waist=gear.ElementalObi,legs="Ea Slops +1",feet="Amalric Nails +1"}

    -- Engaged sets

    sets.engaged = {range="Crepuscular Pebble",
		head="Nyame Helm",neck="Combatant's Torque",ear1="Telos Earring",ear2="Crep. Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back="Aurist's Cape +1",waist="Goading Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spellMap == 'Cure' or spellMap == 'Curaga' then
        gear.default.obi_waist = "Bishop's sash"
    elseif spell.skill == 'Elemental Magic' then
        gear.default.obi_waist = "Sacro Cord"
        if state.CastingMode.value == 'Proc' then
            classes.CustomClass = 'Proc'
        end
    end
end


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)

end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' and state.MagicBurst.value then
        equip(sets.magic_burst)
    end
end

function job_aftercast(spell, action, spellMap, eventArgs)
    -- Lock feet after using Mana Wall.
    if not spell.interrupted then
        if spell.english == 'Mana Wall' then
            enable('feet')
            equip(sets.buff['Mana Wall'])
            disable('feet')
        elseif spell.skill == 'Elemental Magic' then
            state.MagicBurst:reset()
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    -- Unlock feet when Mana Wall buff is lost.
    if buff == "Mana Wall" and not gain then
        enable('feet')
        handle_equipping_gear(player.status)
    end
end

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
end

function job_state_change(stateField, newValue, oldValue)
    if state.WeaponLock.value == true then
        disable('main','sub')
    else
        enable('main','sub')
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble' then
        --[[ No real need to differentiate with current gear.
        if lowTierNukes:contains(spell.english) then
            return 'LowTierNuke'
        else
            return 'HighTierNuke'
        end
        --]]
    end
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    
    return idleSet
end


-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 12)
end
