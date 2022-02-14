--Gearsets your character will use among multiple jobs.
sets.BehemothSuit = {body="Behemoth Suit +1",hands=empty,legs=empty,feet=empty}
sets.Sheltered = {ring2="Sheltered Ring"}
sets.Capacity = {back="Mecisto. Mantle"}

sets.buff.Doom = {neck="Nicander's Necklace",waist="Gishdubar Sash",ring1="Eshmun's Ring",ring2="Eshmun's Ring"}
sets.TreasureHunter = {head="Wh. Rarab Cap +1",waist="Chaac Belt",ammo="Perfect Lucky Egg"}

sets.precast.Item['Hallowed Water'] = {}
sets.precast.Item['Holy Water'] = {}

--Augmented items that you'll use among multiple jobs.

-- Chironic 

gear.chironic_enf_legs = {name="Chironic Hose", augments={'Mag. Acc.+30','MND+13',}}


-- Taeon Pet Stuff 
gear.taeon_pet_body = {name="Taeon Tabard",augments={'Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}}


-- Taeon Phalanx / SIRD

gear.taeon_phalanx_head = {name="Taeon Chapeau", augments={'Spell interruption rate down -5%','Phalanx +3',}}
gear.taeon_phalanx_body = {name="Taeon Tabard", augments={'Spell interruption rate down -9%','Phalanx +3',}}
gear.taeon_phalanx_hands = {name ="Taeon Gloves", augments={'Spell interruption rate down -7%','Phalanx +3',}}
gear.taeon_phalanx_legs = {name="Taeon Tights", augments={'Spell interruption rate down -9%','Phalanx +3',}}
gear.taeon_phalanx_feet = {name="Taeon Boots", augments={'Spell interruption rate down -10%','Phalanx +3',}}

gear.taeon_DW_feet = {name="Taeon Boots", augments={'Accuracy+23','"Dual Wield"+3',}}
gear.taeon_Snap_head = {name="Taeon Chapeau", augments={'Rng.Acc.+19','"Snapshot"+3','"Snapshot"+5',}}

-- Telchine Enhancing Stuff

    gear.telchine_ehn_head ={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}}
    gear.telchine_enh_body ={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}}
    gear.telchine_enh_hands ={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}}
    gear.telchine_enh_legs ={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}}

--gear.telchine_ehn_head
---gear.telchine_enh_body
---gear.telchine_enh_hands
--gear.telchine_enh_legs
--gear.telchine_enh_feet 

-- RDM Stuffs

    gear.RDMCape_TP  =   {name="Sucellos's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+1','"Dbl.Atk."+10'}}
    gear.RDMCape_MACC =  {name="Sucellos's cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%'}}
    gear.RDMCape_DW  =   {name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dual Wield"+10'}}
    gear.RDMCape_STRWS = {name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%'}}
    gear.RDMCape_MAGWS = {name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Weapon skill damage +10%'}}

--- MNK Stuff
    gear.MNK_TP = {name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10'}}
    gear.MNK_WS = {name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%'}}


--- THF Stuff

    gear.THFCape_TP    = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','"Store TP"+10'}}
    gear.THFCape_DEXWS = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%'}}


--- PLD Stuff --- 

	gear.Weard = { name="Weard Mantle", augments={'VIT+1','DEX+3','Enmity+5','Phalanx +3'}}
    gear.PLDTP = { name="Rudianos's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}}
    gear.PLDWS = { name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
    gear.PLDFC = { name="Rudianos's Mantle", augments={'"Fast Cast"+10',}}
    gear.PLDEnm = { name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10',}}

    gear.odyssean_SIRDFeet = { name="Odyssean Greaves", augments={'Rng.Atk.+16','Accuracy+30','"Refresh"+1','Mag. Acc.+6 "Mag.Atk.Bns."+6',}}
    gear.odyssean_WSBODY = { name="Odyss. Chestplate", augments={'Accuracy+15','Weapon skill damage +5%','STR+9',}}
    gear.odyssean_MagWSFeet = { name="Odyssean Greaves", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','Weapon skill damage +4%','INT+4','"Mag.Atk.Bns."+10',}}
    gear.odyssean_MagWSHead = { name="Odyssean Helm", augments={'Magic Damage +5','"Mag.Atk.Bns."+7','Accuracy+19 Attack+19','Mag. Acc.+18 "Mag.Atk.Bns."+18',}}
    gear.odyssean_MagFCLegs = { name="Odyssean Cuisses", augments={'"Fast Cast"+5','Mag. Acc.+7','"Mag.Atk.Bns."+7',}}
    gear.odyssean_PhalanxBody = {name="Odyss. Chestplate", augments={'"Snapshot"+4','Mag. Acc.+17','Phalanx +3',}}


--- COR Stuff
    
    gear.COR_STRWSD = { name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
    gear.COR_AGIWSD = { name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Weapon skill damage +10%',}}
    gear.COR_TP = { name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}} -- Callios needs to edit this when cape is done
    gear.COR_RNG = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+5','"Store TP"+10',}}
    gear.COR_SNAP = { name="Camulus's Mantle", augments={'Snapshot +10'}}

--- RNG Stuff
    
    gear.RNG_RATP   = { name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10',}}
    gear.RNG_RAWSD  = { name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}}
    gear.RNG_SNAP   = { name="Belenus's Cape", augments={'Snapshot +10'}}

--- HERC Stuff

    gear.Herculean_HercFeetFC = {name="Herculean Boots", augments={'"Mag.Atk.Bns."+12','"Fast Cast"+6','Mag. Acc.+1',}}
    gear.HercLegsFC = {name="Herculean Trousers", augments={'"Fast Cast"+5','MND+5',}}
    gear.HercHeadFC = {name="Herculean Helm", augments={'"Fast Cast"+3','INT+4','Mag. Acc.+3','"Mag.Atk.Bns."+6',}}
    gear.HercFeetTP = {name="Herculean Boots", augments={'Accuracy+14 Attack+14','"Triple Atk."+3','Accuracy+15',}}


gear.valorous_wsd_legs = { name="Valorous Hose", augments={'"Subtle Blow"+3','Magic Damage +3','Weapon skill damage +9%','Accuracy+17 Attack+17',}}
gear.valorous_magical_wsd_head = {name="Valorous Mask",augments={'"Mag.Atk.Bns."+17','Weapon skill damage +5%','Attack+10',}}
gear.valorous_wsd_head = {name="Valorous Mask",augments={'Accuracy+10 Attack+10','Weapon skill damage +4%','STR+4','Attack+10',}}
gear.valorous_pet_head = {name="Valorous Mask",augments={'Pet: "Mag.Atk.Bns."+25','Pet: "Regen"+3','Pet: INT+14','Pet: Accuracy+2 Pet: Rng. Acc.+2',}}
gear.valorous_pet_body = {name="Valorous Mail",augments={'Pet: "Mag.Atk.Bns."+26','"Dbl.Atk."+3','Pet: INT+8','Pet: Accuracy+13 Pet: Rng. Acc.+13','Pet: Attack+12 Pet: Rng.Atk.+12',}}
gear.valorous_wsd_body = {name="Valorous Mail",augments={'Accuracy+25 Attack+25','Weapon skill damage +4%','Accuracy+10','Attack+12',}}
gear.valorous_wsd_hands = {name="Valorous Mitts",augments={'Accuracy+30','Weapon skill damage +2%','STR+10','Attack+10',}}
gear.valorous_acc_hands = {name="Valorous Mitts",augments={'Accuracy+21 Attack+21','"Store TP"+4','Accuracy+15','Attack+9',}}
gear.valorous_physical_pet_legs = {name="Valor. Hose",augments={'Pet: Attack+29 Pet: Rng.Atk.+29','Pet: "Dbl.Atk."+3 Pet: Crit.hit rate +3','Pet: STR+8','Pet: Accuracy+8 Pet: Rng. Acc.+8',}}
gear.valorous_magical_pet_legs = { name="Valor. Hose",augments={'Pet: "Mag.Atk.Bns."+28','Pet: "Regen"+3','Pet: INT+13','Pet: Attack+2 Pet: Rng.Atk.+2',}}
gear.valorous_magical_pet_feet = {name="Valorous Greaves",augments={'Pet: "Mag.Atk.Bns."+29','Pet: "Dbl.Atk."+1 Pet: Crit.hit rate +1','Pet: INT+9','Pet: Accuracy+1 Pet: Rng. Acc.+1','Pet: Attack+4 Pet: Rng.Atk.+4',}}
gear.valorous_wsd_feet = {name="Valorous Greaves",augments={'Accuracy+25','Weapon skill damage +4%','STR+5',}}