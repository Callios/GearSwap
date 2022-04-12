function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc','FullAcc','CroceaEnspell','EnspellOnly')
    state.HybridMode:options('Normal','DT')
	state.WeaponskillMode:options('Match','Proc')
	state.AutoBuffMode:options('Off','Auto','AutoMelee')
	state.CastingMode:options('Normal','Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal','PDT','MDT','DTHippo')
    state.PhysicalDefenseMode:options('PDT','NukeLock')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Crocea','Naegling','Murgleis','Tauret','Club','DualWeapons','DualWeaponsMurg','MurgGleti','DualWeaponsCorcea','SanguineSpam','SanguineSpam2','DualEvisceration','DualClubs','DualBlackHalo','DualAeolian','EnspellOnly')
	
	gear.obi_cure_back = "Tempered Cape +1"
	gear.obi_cure_waist = "Witful Belt"

	gear.obi_low_nuke_back = EnfeebCape
	gear.obi_low_nuke_waist = "Orpheus's Sash"

	gear.obi_high_nuke_back = EnfeebCape
	gear.obi_high_nuke_waist = "Orpheus's Sash"

	--DWCape = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%',}}
	--EnfeebCape = { name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}}

		-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^@!` input /ja "Accession" <me>')
	send_command('bind ^backspace input /ja "Saboteur" <me>')
	send_command('bind !backspace input /ja "Spontaneity" <t>')
	send_command('bind @backspace input /ja "Composure" <me>')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind != input /ja "Penury" <me>')
	send_command('bind @= input /ja "Parsimony" <me>')
	send_command('bind ^delete input /ja "Dark Arts" <me>')
	send_command('bind !delete input /ja "Addendum: Black" <me>')
	send_command('bind @delete input /ja "Manifestation" <me>')
	send_command('bind ^\\\\ input /ma "Protect V" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Reraise" <me>')
	send_command('bind @f10 gs c cycle RecoverMode')
--	send_command('bind ^r gs c set skipprocweapons true;gs c reset weaponskillmode;gs c weapons Default;gs c set unlockweapons false')
	send_command('bind ^q gs c set weapons enspellonly;gs c set unlockweapons true')
	send_command('bind !r gs c set skipprocweapons true;gs c reset weaponskillmode;gs c set weapons none')
--	send_command('bind !q gs c set skipprocweapons false;gs c set weapons DualProcDaggers;gs c set weaponskillmode proc')
	send_command('bind @z gs c cycle UnlockWeapons')
	send_command('wait 20; input /lockstyleset 074')
	
	send_command('bind @r gs c weapons EnspellOnly;gs c update')
	
	select_default_macro_book()
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Chainspell'] = {body="Viti. Tabard +3"}
	sets.precast.JA['Convert'] = {main="Murgleis"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Fast cast sets for spells
	
	sets.precast.FC = {main="Crocea Mors",sub="Sacro Shield",ammo="Sapience Orb",
        head="Atrophy Chapeau +2",								-- 14%
		neck="Voltsurge Torque",
		ear1="Loquacious Earring",ear2="Malignance Earring",	--3% (2 + 1)
		body="Vitiation Tabard +3",								--14%
		hands=MerGloves_FC,										--7%
		ring1="Kishar Ring",ring2="Weatherspoon Ring +1",				--6% (2 + 4)
		back="Perimede Cape",
		waist="Witful Belt",
		legs="Psycloth Lappas",									
		feet=MerBoots_FC}
		
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})
       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
        head="Nyame Helm",
		neck="Fotia Gorget",
		ear2="Brutal Earring",ear1="Sherida Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring2="Rufescent Ring",ring1="Ilabrat Ring",
		back=gear.RDMCape_STRWS,
		waist="Fotia Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"}
		
	sets.precast.WS.Proc = 	{
		head="Malignance Chapeau",neck="Sanctity Necklace",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Ilabrat Ring",ring2="Chirich Ring +1",
		back=DWCape,waist="Kentarch Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = {
		head="Jhakri Coronal +2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
		body="Jhakri Robe +2",hands="Atrophy Gloves +3",ring1="Rufescent Ring",ring2="Ilabrat Ring",
		back=gear.RDMCape_MAGWS,waist="Fotia Belt",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}
	
	sets.precast.WS['Chant Du Cygne'] = {
		head="Nyame Helm",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
		body="Ayanmo Corazza +2",hands="Bunzi's Gloves",ring1="Begrudging Ring",ring2="Ilabrat Ring",
		back=gear.RDMCape_STRWS,waist="Fotia Belt",legs="Nyame Flanchard",feet="Thereoid Greaves"}
		
	sets.precast.WS['Evisceration'] = sets.precast.WS['Chant Du Cygne']

	sets.precast.WS['Savage Blade'] = {
		head="Nyame Helm",neck="Duelist Torque +2",ear1="Moonshade Earring",ear2="Regal Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Metamorph Ring +1",ring2='Epaminondas\'s Ring',
		back=gear.RDMCape_STRWS,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	sets.precast.WS['Black Halo'] = {
			head="Nyame Helm",neck="Duelist Torque +2",ear1="Sherida Earring",ear2="Regal Earring",
			body="Nyame Mail",hands="Nyame Gauntlets",ring1="Metamorph Ring +1",ring2='Epaminondas\'s Ring',
			back=gear.RDMCape_STRWS,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.precast.WS['Death Blossom'] = {
		head="Nyame Helm",neck="Duelist Torque +2",ear1="Moonshade Earring",ear2="Regal Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Metamorph Ring +1",ring2='Epaminondas\'s Ring',
		back=gear.RDMCape_STRWS,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.precast.WS['Sanguine Blade'] = {
		head="Pixie Hairpin +1",neck="Baetyl Pendant",ear1="Regal Earring",ear2="Malignance Earring",
		body="Nyame Mail",hands="Jhakri Cuffs +2",ring1="Archon Ring",ring2="Metamorph Ring +1",
		back=gear.RDMCape_MAGWS,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	sets.precast.WS['Seraph Blade'] = {
		head="Nyame Helm",neck="Sanctity Necklace",ear1="Regal Earring",ear2="Malignance Earring",
		body="Nyame Mail",hands="Jhakri Cuffs +2",ring1="Metamorph Ring +1",ring2="Freke Ring",
		back=gear.RDMCape_MAGWS,waist="Sacro Cord",legs="Jhakri Slops +2",feet="Vitiation Boots +3"}
		
	sets.precast.WS['Aeolian Edge'] = {
		head="Nyame Helm",neck="Baetyl Pendant",ear1="Regal Earring",ear2="Malignance Earring",
		body="Nyame Mail",hands="Jhakri Cuffs +2",ring1='Epaminondas\'s Ring',ring2="Freke Ring",
		back=gear.RDMCape_MAGWS,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	-- Midcast Sets

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {main="Daybreak",sub="Ammurapi Shield", ammo="Ghastly Tathlum +1",
		head="Cath Palug crown",neck="Mizu. Kubikazari",ear1="Friomisi Earring",ear2="Malignance Earring",
		body="Amalric doublet +1",hands="Amalric Gages +1",ring1="Mujin Band",ring2="Locus Ring",
		back=gear.RDMCape_MACC,waist="Orpheus's Sash",legs="Amalric Slops +1",feet="Amalric Nails +1"}
	
	sets.midcast.FastRecast = {main="Colada",sub="Sacro Shield",ammo="Sapience Orb",
        head="Atrophy Chapeau +2",								-- 14%
		neck="Voltsurge Torque",
		ear1="Loquacious Earring",ear2="Malignance Earring",	--3% (2 + 1)
		body="Vitiation Tabard +3",								--14%
		hands=MerGloves_FC,										--7%
		ring1="Kishar Ring",ring2="Weatherspoon Ring +1",				--6% (2 + 4)
		back="Perimede Cape",
		waist="Witful Belt",
		legs="Psycloth Lappas",									
		feet=MerBoots_FC}

    sets.midcast.Cure = {main="Daybreak",sub="Ammurapi Shield",ammo="Regal Gem",
		head="Kaykaus Mitra +1",neck="Incanter's Torque",ear1="Beatific Earring",ear2="Regal Earring",
		body="Kaykaus Bliaut +1",hands="Kaykaus Cuffs +1",ring1="Sirona's Ring",ring2="Stikini Ring",
		back=gear.RDMCape_MACC ,waist="Luminary Sash",legs="Kaykaus Tights +1",feet="Kaykaus Boots +1"}
		
    sets.midcast.LightWeatherCure = {main="Chatoyant Staff",sub="Enki Grip",range=empty,ammo="Regal Gem",
        head="Kaykaus Mitra +1",neck="Incanter's Torque",ear1="Regal Earring",ear2="Mendi. Earring",
        body="Kaykaus Bliaut +1",hands="Kaykaus Cuffs +1",ring1="Sirona's Ring",ring2="Stikini Ring",
        back=gear.RDMCape_MACC,waist="Luminary Sash",legs="Kaykaus Tights +1s",feet="Kaykaus Boots +1"}
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {main="Daybreak",sub="Ammurapi Shield",range=empty,ammo="Regal Gem",
        head="Kaykaus Mitra +1",neck="Incanter's Torque",ear1="Regal Earring",ear2="Mendi. Earring",
        body="Kaykaus Bliaut +1",hands="Kaykaus Cuffs +1",ring1="Sirona's Ring",ring2="Stikini Ring",
        back=gear.RDMCape_MACC,waist="Luminary Sash",legs="Kaykaus Tights +1",feet="Kaykaus Boots +1"}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",hands="Hieros Mittens",
		back="Oretan. Cape +1",ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt",feet="Vanya Clogs"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})
		
	sets.midcast.Curaga = sets.midcast.Cure
	sets.Self_Healing = {ear1="Etiolation Earring",waist="Gishdubar Sash"}
	sets.Cure_Received = {waist="Gishdubar Sash"}
	sets.Self_Refresh = {head="Amalric Coif +1",waist="Gishdubar Sash"}

	sets.midcast['Enhancing Magic'] = {main="Colada",sub="Ammurapi Shield",ammo="Regal Gem",
		head=gear.telchine_ehn_head,
		neck="Duelist's Torque +2",
		ear1="Andoaa Earring",ear2="Mimir Earring",
		body="Vitiation Tabard +3",
		hands="Atrophy Gloves +3",
		ring1="Stikini Ring",ring2="Stikini Ring",
		back="Ghostfyre Cape",
		waist="Embla Sash",
		legs=gear.telchine_ehn_legs,
		feet="Lethargy Houseaux +1"}

	--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.		
	sets.buff.ComposureOther = {
		head="Leth. Chappel +1",
        body="Vitiation Tabard +3",
        hands="Atrophy Gloves +3",
        legs="Leth. Fuseau +1",
        feet="Leth. Houseaux +1"}
		
	--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works
	--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell
	
	sets.EnhancingSkill = {main="Pukulatmuj +1",
		head="Befouled Crown",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Mimir Earring",
		body="Vitiation Tabard +3",hands="Viti. Gloves +3",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Ghostfyre Cape",waist="Olympus Sash",legs="Atrophy Tights +3",feet="Lethargy Houseaux +1"}
		
	sets.midcast.Refresh = {head="Amalric Coif +1",body="Atrophy Tabard +3",legs="Leth. Fuseau +1"}
	sets.midcast.Aquaveil = {head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"}
	sets.midcast.BarElement = {legs="Shedir Seraweels"}
	sets.midcast.Temper = sets.EnhancingSkill
	sets.midcast.Temper.DW = set_combine(sets.midcast.Temper, {sub="Pukulatmuj"})
	sets.midcast.Enspell = sets.midcast.Temper
	sets.midcast.Enspell.DW = set_combine(sets.midcast.Enspell, {sub="Pukulatmuj"})
	sets.midcast.BoostStat = {hands="Viti. Gloves +3"}
	sets.midcast.Stoneskin = {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"}
	sets.midcast.Protect = {ring2="Sheltered Ring"}
	sets.midcast.Shell = {ring2="Sheltered Ring"}
	
	sets.midcast['Phalanx'] = set_combine(sets.EnhancingSkill, {
		head=gear.taeon_phalanx_head,
		body=gear.taeon_phalanx_body,
		hands=gear.taeon_phalanx_hands,
		legs=gear.taeon_phalanx_legs,
		feet=gear.taeon_phalanx_feet,
	})
	
	sets.midcast['Phalanx II'] = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast['Enfeebling Magic'] = {main="Murgleis",sub="Ammurapi Shield",range=empty,ammo="Regal Gem",
		head="Viti. Chapeau +3",neck="Dls. Torque +2",ear1="Snotra Earring",ear2="Malignance Earring",
		body="Lethargy Sayon +1",hands="Kaykaus Cuffs +1",ring1="Kishar Ring",ring2="Stikini Ring",
		back=gear.RDMCape_MACC,waist="Obstinate Sash",legs=gear.chironic_enf_legs,feet="Vitiation Boots +3"}
		
	sets.midcast['Enfeebling Magic'].Resistant = {main="Contemplator +1",sub="Enki Strap",range="Ullr",ammo=empty,
		head="Viti. Chapeau +3",neck="Dls. Torque +2",ear1="Regal Earring",ear2="Snotra Earring",
		body="Atrophy Tabard +3",hands="Kaykaus Cuffs +1",ring1="Metamor. Ring +1",ring2="Stikini Ring",
		back=gear.RDMCape_MACC,waist="Obstinate Sash",legs=gear.chironic_enf_legs,feet="Vitiation Boots +3"}
		
	sets.midcast.DurationOnlyEnfeebling = set_combine(sets.midcast['Enfeebling Magic'], {
		body="Atrophy Tabard +3",
		hands="Regal Cuffs"})
		
	sets.midcast.Silence = sets.midcast.DurationOnlyEnfeebling
	sets.midcast.Silence.Resistant = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast.Sleep = set_combine(sets.midcast.DurationOnlyEnfeebling,{waist="Obstinate Sash"})
	sets.midcast.Sleep.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant,{waist="Obstinate Sash"})
	sets.midcast.Bind = set_combine(sets.midcast.DurationOnlyEnfeebling,{waist="Obstinate Sash"})
	sets.midcast.Bind.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant,{waist="Obstinate Sash"})
	sets.midcast.Break = set_combine(sets.midcast.DurationOnlyEnfeebling,{waist="Obstinate Sash"})
	sets.midcast.Break.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant,{waist="Obstinate Sash"})
	
	sets.midcast.Dispel = sets.midcast['Enfeebling Magic'].Resistant
	
	sets.midcast.SkillBasedEnfeebling = set_combine(sets.midcast['Enfeebling Magic'], {
		neck="Dls. Torque +2",ear1="Vor Earring",
		hands="Kaykaus Cuffs +1",ring1="Stikini Ring",
		waist="Obstinate Sash",legs="Psycloth Lappas"})
	
	sets.midcast['Frazzle II'] = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast['Frazzle III'] = set_combine(sets.midcast.SkillBasedEnfeebling,{
		main="Contemplator +1",sub="Enki Strap",
		neck="Dls. Torque +2"
		})
	sets.midcast['Frazzle III'].Resistant = sets.midcast['Enfeebling Magic'].Resistant
	
	sets.midcast['Distract III'] = set_combine(sets.midcast.SkillBasedEnfeebling,{
		main="Contemplator +1",sub="Enki Strap",
		neck="Dls. Torque +2"})
	sets.midcast['Distract III'].Resistant = sets.midcast['Enfeebling Magic'].Resistant
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia III'] = set_combine(sets.midcast['Enfeebling Magic'], {waist="Obstinate Sash"})
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio III'] = set_combine(sets.midcast['Enfeebling Magic'], {waist="Obstinate Sash"})

    sets.midcast['Elemental Magic'] = {main="Daybreak",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",
		head="Cath Palug crown",
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",ear2="Malignance Earring",
		body="Amalric Doublet +1",
		hands="Amalric Gages +1",
		ring1="Metamorph Ring +1",ring2="Freke Ring",
		back=gear.RDMCape_MACC,
		waist="Orpheus's Sash",
		legs="Amalric Slops +1",
		feet="Amalric Nails +1"}
		
    sets.midcast['Elemental Magic'].Resistant = {main="Daybreak",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",
        head="Cath Palug crown",
		neck="Sanctity Necklace",
		ear1="Regal Earring",ear2="Malignance Earring",
		body="Amalric Doublet +1",
		hands="Amalric Gages +1",
		ring1="Metamorph Ring +1",ring2="Freke Ring",
		back=gear.RDMCape_MACC,
		waist="Orpheus's Sash",
		legs="Amalric Slops +1",
		feet="Vitiation Boots +3"}
		
    sets.midcast['Elemental Magic'].Fodder = {main="Daybreak",sub="Ammurapi Shield",range=empty,ammo="Ghastly Tathlum +1",
        head="Cath Palug crown",
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",ear2="Malignance Earring",
		body="Amalric Doublet +1",
		hands="Amalric Gages +1",
		ring1="Metamorph Ring +1",ring2="Freke Ring",
		back=gear.RDMCape_MACC,
		waist="Orpheus's Sash",
		legs="Amalric Slops +1",
		feet="Amalric Nails +1"}

    sets.midcast['Elemental Magic'].Proc = {main=empty,sub=empty,range=empty,ammo="Impatiens",
        head="Cath Palug Crown",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
        body="Shamash Robe",hands="Regal Cuffs",ring1="Kishar Ring",ring2="Prolix Ring",
        back=EnfeebCape,waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}
		
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {ear1="Regal Earring",ring1="Metamor. Ring +1"})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {ear1="Regal Earring",ring1="Metamor. Ring +1"})
	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = set_combine(sets.midcast['Elemental Magic'].Fodder, {ammo="Pemphredo Tathlum",ear1="Regal Earring",ring1="Metamor. Ring +1"})
		
	sets.midcast.Impact = {main="Daybreak",sub="Ammurapi Shield",range="Ullr",ammo=empty,
		head=empty,neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
		body="Twilight Cloak",hands="Kaykaus Cuffs +1",ring1="Metamor. Ring +1",ring2="Stikini Ring",
		back=gear.RDMCape_MACC,waist="Luminary Sash",legs="Merlinic Shalwar",feet="Vitiation Boots +3"}

	sets.midcast['Dark Magic'] = {main="Maxentius",sub="Ammurapi Shield",range="Ullr",ammo=empty,
		head=MerHat_Nuke,neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
		body="Atrophy Tabard +3",hands="Kaykaus Cuffs +1",ring1="Metamor. Ring +1",ring2="Stikini Ring",
		back=gear.RDMCape_MACC,waist="Luminary Sash",legs=gear.chironic_enf_legs,feet="Vitiation Boots +3"}

    sets.midcast.Drain = {main="Maxentius",sub="Ammurapi Shield",range="Ullr",ammo=empty,
        head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        body="Atrophy Tabard +3",hands="Kaykaus Cuffs +1",ring1="Metamor. Ring +1",ring2="Stikini Ring",
        back=gear.RDMCape_MACC,waist="Fucho-no-obi",legs=gear.chironic_enf_legs,feet="Vitiation Boots +3"}

	sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {main="Daybreak",sub="Ammurapi Shield",range="Ullr",ammo=empty,
		head="Atrophy Chapeau +2",neck="Dls. Torque +2",ear1="Regal Earring",ear2="Malignance Earring",
		body="Atrophy Tabard +3",hands="Kaykaus Cuffs +1",ring1="Metamorph Ring +1",ring2="Stikini Ring",
		back=gear.RDMCape_MACC,waist="Sailfi Belt +1",legs=gear.chironic_enf_legs,feet="Vitiation Boots +3"}
		
	sets.midcast.Stun.Resistant = {main="Daybreak",sub="Ammurapi Shield",range="Ullr",ammo=empty,
		head="Atrophy Chapeau +2",neck="Dls. Torque +2",ear1="Regal Earring",ear2="Malignance Earring",
		body="Atrophy Tabard +3",hands="Kaykaus Cuffs +1",ring1="Metamorph Ring +1",ring2="Stikini Ring",
		back=gear.RDMCape_MACC,waist="Sailfi Belt +1",legs=gear.chironic_enf_legs,feet="Vitiation Boots +3"}

	-- Sets for special buff conditions on spells.
		
	sets.buff.Saboteur = {hands="Leth. Gantherots +1"}
	
	sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",legs="Shedir Seraweels",feet="Jhakri Pigaches +2"}
		
    sets.HPCure = {main="Daybreak",sub="Sors Shield",range=empty,ammo="Regal Gem",
        head="Vanya Hood",neck="Unmoving Collar +1",ear1="Etiolation Earring",ear2="Mendi. Earring",
        body="Viti. Tabard +3",hands="Kaykaus Cuffs +1",ring1="Gelatinous Ring +1",ring2="Meridian Ring",
        back="Moonbeam Cape",waist="Luminary Sash",legs="Carmine Cuisses +1",feet="Vitiation Boots +3"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {main="Chatoyant Staff",sub="Oneiros Grip",range=empty,ammo="Impatiens",
		head="Viti. Chapeau +3",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Amalric doublet +1",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back="Moonbeam Cape",waist="Flume belt +1",legs="Carmine Cuisses +1",feet='Nyame Sollerets'}
	

	-- Idle sets
	sets.idle = {main="Daybreak",sub="Sacro Bulwark",ammo="Homiliary",
		head="Viti. Chapeau +3",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Amalric doublet +1",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back="Moonbeam Cape",waist="Flume belt +1",legs="Carmine Cuisses +1",feet='Malignance Boots'}
		
	sets.idle.PDT = {main="Daybreak",sub="Sacro Bulwark",ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back="Moonbeam Cape",waist="Flume belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.idle.MDT = {main="Daybreak",sub="Sacro Bulwark",ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
		body="Shamash Robe",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back="Moonbeam Cape",waist="Flume belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.idle.Weak = {main="Daybreak",sub="Sacro Bulwark",ammo="Homiliary",
		head="Viti. Chapeau +3",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Eabani Earring",
		body="Amalric doublet +1",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back="Moonbeam Cape",waist="Flume belt +1",legs="Carmine Cuisses +1",feet="Malignance Boots"}
	
	--sets.idle.DTHippo = set_combine(sets.idle.PDT, {back="Umbra Cape",legs="Carmine Cuisses +1",feet="Hippo. Socks +1"})
	
	-- Defense sets
	sets.defense.PDT = {main="Terra's Staff",sub="Umbra Strap",range=empty,ammo="Staunch Tathlum +1 +1",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Dark Ring",
		back="Moonbeam Cape",waist="Flume belt +1 +1",legs="Malignance Tights",feet="Malignance Boots"}

	sets.defense.NukeLock = sets.midcast['Elemental Magic']
		
	sets.defense.MDT = {main="Daybreak",sub="Sacro Bulwark",ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Eabani Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back="Moonbeam Cape",waist="Flume belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.defense.MEVA = {main="Daybreak",sub="Sacro Bulwark",ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Eabani Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back="Moonbeam Cape",waist="Flume belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.TPEat = {neck="Chrys. Torque"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	-- Weapons sets
	--sets.weapons.Sequence = {main="Sequence",sub="Genmei Shield"}
	sets.weapons.Naegling = {main="Naegling",sub="Genmei Shield",range="Ullr",ammo="none"}
	sets.weapons.Crocea = {main="Crocea Mors",sub="Genmei Shield",range="Ullr",ammo="none"}
	sets.weapons.Murgleis = {main="Murgleis", sub="Genmei Shield",range="Ullr",ammo="none"}
	sets.weapons.Tauret = {main="Tauret",sub="Genmei Shield",range="Ullr",ammo="none"}
	sets.weapons.Club = {main="Maxentius",sub="Genmei Shield",range="Ullr",ammo="none"}
	sets.weapons.DualWeapons = {main="Naegling",sub="Machaera +2",range="Ullr",ammo="none"}
	sets.weapons.DualWeaponsMurg = {main="Murgleis",sub="Machaera +2",range="Ullr",ammo="none"}
	sets.weapons.MurgGleti = {main="Murgleis",sub='Gleti\'s Knife',range="Ullr",ammo="none"}
	sets.weapons.DualWeaponsCorcea = {main="Crocea Mors",sub="Machaera +2",range="Ullr",ammo="none"}
	sets.weapons.SanguineSpam = {main="Crocea Mors",sub="Daybreak",range="Ullr",ammo="none"}
	sets.weapons.SanguineSpam2 = {main="Crocea Mors",sub='Gleti\'s Knife',range="Ullr",ammo="none"}
	sets.weapons.DualWeaponsAcc = {main="Naegling",sub='Gleti\'s Knife',range="Ullr",ammo="none"}
	sets.weapons.DualEvisceration = {main="Tauret",sub='Gleti\'s Knife',range="Ullr",ammo="none"}
	sets.weapons.DualAeolian = {main="Tauret",sub="Daybreak",range="Ullr",ammo="none"}
	sets.weapons.DualProcDaggers = {main="Tauret",sub="Atoyac"}
	sets.weapons.EnspellOnly = {main="Ceremonial Dagger",sub="Chicken Knife II",range="Ullr",ammo="none"}
	sets.weapons.DualClubs = {main="Maxentius",sub="Daybreak",range="Ullr",ammo="none"}
	sets.weapons.DualBlackHalo = {main="Maxentius",sub="Machaera +2",range="Ullr",ammo="none"}
	--sets.weapons.DualAlmace = {main="Almace",sub="Sequence"}
	sets.weapons.DualBow = {main="Naegling",sub="Tauret",range="Ullr",ammo="none"}
	sets.weapons.BowMacc = {range="Ullr",ammo=empty}
	
    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.Dagger.Accuracy.Evasion
	
	-- Normal melee group
--	sets.engaged = {ammo="Ginsen",
--		head="Aya. Zucchetto +2",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
--		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
--		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.engaged = {ammo="Ginsen",
		head="Malignance Chapeau",neck="Anu Torque",ear1="Sherida Earring",ear2="Telos Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Ilabrat Ring",ring2="Chirich Ring +1",
		back=gear.RDMCape_TP,waist="Sailfi Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.engaged.CroceaEnspell = {range="Ullr",
		head="Umuthi Hat",neck="Dls. Torque +2",ear1="Suppanomimi",ear2="Digni. Earring",
		body="Viti. Tabard +3",hands="Aya. Manopolas +2",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back="Ghostfyre Cape",waist="Orpheus's Sash",legs="Malignance Tights",feet="Carmine Greaves +1"}

	sets.engaged.Acc = {ammo="Ginsen",
		head="Malignance Chapeau",neck="Anu Torque",ear1="Cessance Earring",ear2="Telos Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.RDMCape_TP,waist="Kentarch Belt +1",legs="Malignance Tights",feet="Malignance Boots"}	
		
	sets.engaged.FullAcc = {ammo="Ginsen",
		head="Malignance Chapeau",neck="Sanctity Necklace",ear1="Dignitary's Earring",ear2="Telos Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.RDMCape_TP,waist="Kentarch Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

	sets.engaged.DT = {
		head="Malignance Chapeau",neck="Sanctity Necklace",ear1="Dignitary's Earring",ear2="Telos Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Chirich Ring +1",
		back=gear.RDMCape_TP,waist="Sailfi Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.engaged.Acc.DT = {
		head="Malignance Chapeau",neck="Sanctity Necklace",ear1="Dignitary's Earring",ear2="Telos Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Ilabrat Ring",ring2="Chirich Ring +1",
		back=gear.RDMCape_TP,waist="Kentarch Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.engaged.FullAcc.DT = {
		head="Malignance Chapeau",neck="Sanctity Necklace",ear1="Dignitary's Earring",ear2="Telos Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Ilabrat Ring",ring2="Chirich Ring +1",
		back=gear.RDMCape_TP,waist="Kentarch Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.engaged.DW = {ammo="Ginsen",
		head="Malignance Chapeau",neck="Anu Torque",ear1="Sherida Earring",ear2="Telos Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Ilabrat Ring",ring2="Chirich Ring +1",
		back=gear.RDMCape_DW,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.engaged.DW.Acc = {
		head="Malignance Chapeau",neck="Sanctity Necklace",ear1="Cessance Earring",ear2="Telos Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Ilabrat Ring",ring2="Chirich Ring +1",
		back=gear.RDMCape_DW,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.engaged.DW.FullAcc = {
		head="Malignance Chapeau",neck="Sanctity Necklace",ear1="Dignitary's Earring",ear2="Telos Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Ilabrat Ring",ring2="Chirich Ring +1",
		back=gear.RDMCape_DW,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.engaged.DW.DT = {
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Dignitary's Earring",ear2="Telos Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Ilabrat Ring",ring2="Chirich Ring +1",
		back=gear.RDMCape_DW,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.engaged.DW.Acc.DT = {
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Dignitary's Earring",ear2="Telos Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Ilabrat Ring",ring2="Chirich Ring +1",
		back="Moonbeam Cape",waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.engaged.DW.FullAcc.DT = {
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Suppanomimi",ear2="Telos Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Chirich Ring +1",
		back="Moonbeam Cape",waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.engaged.DW.Enspell = {
		head="Malignance Chapeau",neck="Dls. Torque +2",ear1="Digni. Earring",ear2="Telos Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.RDMCape_DW,waist="Orpheus's Sash",legs="Malignance Tights",feet="Malignance Boots"}

	sets.engaged.DW.EnspellOnly = {
		head="Malignance Chapeau",neck="Sanctity Necklace",ear1="Suppanomimi",ear2="Hollow Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back="Ghostfyre Cape",waist="Orpheus's Sash",legs="Malignance Tights",feet="Malignance Boots"}

	sets.engaged.EnspellOnly = {
		head="Malignance Chapeau",neck="Sanctity Necklace",ear1="Suppanomimi",ear2="Hollow Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back="Ghostfyre Cape",waist="Orpheus's Sash",legs="Malignance Tights",feet="Malignance Boots"}
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	if player.sub_job == 'DNC' then
		set_macro_page(1, 18)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 18)
	elseif player.sub_job == 'BLM' then
		set_macro_page(1, 18)
	else
		set_macro_page(1, 18)
	end
end

--Job Specific Trust Overwrite
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not data.areas.cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()

				if spell_recasts[980] < spell_latency and not have_trust("Yoran-Oran") then
					windower.chat.input('/ma "Yoran-Oran (UC)" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[984] < spell_latency and not have_trust("August") then
					windower.chat.input('/ma "August" <me>')
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
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.chat.input('/ma "Selh\'teus" <me>')
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