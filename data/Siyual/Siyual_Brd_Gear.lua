function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc')
	state.HybridMode:options('Normal','DT')
    state.CastingMode:options('Normal','Resistant','AoE')
    state.IdleMode:options('Normal','DT')
	state.Weapons:options('None','Naegling','DualNaegling','DualTauret')

	gear.melee_jse_back = { name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+9','"Store TP"+10','Damage taken-5%',}}
	gear.magic_jse_back = { name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}}

	-- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Daurdabla'
	-- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 2
	
	-- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(false, 'Use Custom Timers')
	
	-- Additional local binds
    send_command('bind ^` gs c cycle ExtraSongsMode')
	send_command('bind !` input /ma "Chocobo Mazurka" <me>')
	--send_command('bind @` gs c cycle MagicBurstMode')
	--send_command('bind @f10 gs c cycle RecoverMode')
	--send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !r gs c weapons None;gs c update')
	send_command('bind !q gs c weapons NukeWeapons;gs c update')
	send_command('bind ^q gs c weapons Swords;gs c update')

	select_default_macro_book()
end

function init_gear_sets()

	AmbuCape_FC 		= { name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}}
	AmbuCape_TP 		= { name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}}
	AmbuCape_WS			= { name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}}
	AmbuCape_MD			= { name="Intarabus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%',}}

	Linos_TP			= { name="Linos", augments={'Accuracy+19','"Store TP"+4','Quadruple Attack +3',}}
	Linos_WS			= { name="Linos", augments={'Accuracy+14 Attack+14','Weapon skill damage +3%','STR+6 CHR+6',}}
	Linos_FC			= { name="Linos", augments={'"Fast Cast"+6',}}
	Linos_MD			= { name="Linos", augments={'"Mag.Atk.Bns."+18','Weapon skill damage +3%','INT+8',}}
	Linos_DT			= { name="Linos", augments={'Mag. Evasion+15','Phys. dmg. taken -4%','VIT+8',}}

	Chironic_Hand_STR	= { name="Chironic Gloves", augments={'Attack+23','STR+15','Accuracy+5',}}
	Chironic_Feet_FC	= { name="Chironic Slippers", augments={'"Fast Cast"+7','CHR+4','Mag. Acc.+2','"Mag.Atk.Bns."+5',}}

	GendewithaHand_FC	= { name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','Song spellcasting time -5%',}}
	TelchineFeet_FC_Reg	= { name="Telchine Pigaches", augments={'Mag. Evasion+23','Song spellcasting time -7%','"Regen" potency+3',}}

	TelchineHead_EMD_CP	= { name="Telchine Cap", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}}
	TelchineBody_EMD_CP	= { name="Telchine Chas.", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}}
	TelchineHand_EMD_CP	= { name="Telchine Gloves", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}}
	TelchineLegs_EMD_CP	= { name="Telchine Braconi", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}}
	TelchineFeet_EMD_CP	= { name="Telchine Pigaches", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}}

	BRD_Relic_Head		= "Bihu Roundlet +2"
	BRD_Relic_Body		= "Bihu Justaucorps +3"
	BRD_Relic_Hand		= "Bihu Cuffs +1"
	BRD_Relic_Legs		= "Bihu Cannions +1"
	BRD_Relic_Feet		= "Bihu Slippers +3"

	BRD_AF_Head			= "Brioso Roundlet +2"
	BRD_AF_Body			= "Brioso Justaucorps +2"
	BRD_AF_Hand			= "Brioso Cuffs +3"
	BRD_AF_Legs			= "Brioso Cannions +2"
	BRD_AF_Feet			= "Brioso Slippers +3"

	BRD_Empy_Head		= "Fili Calot +1"
	BRD_Empy_Body		= "Fili Hongreline +1"
	BRD_Empy_Hand		= "Fili Manchettes +1"
	BRD_Empy_Legs		= "Fili Rhingrave +1"
	BRD_Empy_Feet		= "Fili Cothurnes +1"

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Weapons sets
	sets.weapons.Aeneas = 
	{
		main	= "Aeneas",
		sub		= "Genmei Shield"
	}
	
	sets.weapons.DualNaegling = 
	{
		main	= "Naegling",
		sub		= "Fusetto +2"
	}

	sets.weapons.Naegling = 
	{
		main	= "Naegling",
		sub		= "Ammurapi Shield"
	}

	sets.weapons.Xoanon = 
	{
		main	= "Xoanon",
		sub		= "Alber Strap"
	}
	
	sets.weapons.DualTauret = 
	{
		main	= "Malevolence",--"Tauret",
		sub		= "Fusetto +2"--Levante Dagger"
	}

    sets.buff.Sublimation 	= { waist = "Embla Sash" }
	sets.buff.DTSublimation = { waist = "Embla Sash" }
	
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = 
	{
		range	= Linos_FC,
		head	= "Bunzi's Hat",
		body	= "Inyanga Jubbah +2",
		hands	= GendewithaHand_FC,
		legs	= "Aya. Cosciales +2",
		feet	= Chironic_Feet_FC,
		neck	= "Voltsurge Torque",
		waist	= "Witful Belt",
		ear1	= "Ethereal Earring",
		ear2	= "Loquac. Earring",
		ring1	= "Lebeche Ring",
		ring2	= "Prolix Ring",
		back	= AmbuCape_FC,
	}
		
	sets.precast.FC.DT = set_combine(sets.precast.FC, {})
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, { waist = "Siegel Sash" })

	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, 
	{
		main	= "Daybreak", 
		sub		= "Ammurapi Shield" 
	})
	
	sets.precast.FC.BardSong = 
	{
		range	= "Gjallarhorn",
		head	= BRD_Empy_Head,
		body	= "Inyanga Jubbah +2",
		hands	= GendewithaHand_FC,
		legs	= "Aya. Cosciales +2",
		feet	= TelchineFeet_FC_Reg,
		neck	= "Voltsurge Torque",
		waist	= "Embla Sash",
		ear1	= "Ethereal Earring",
		ear2	= "Loquac. Earring",
		ring1	= "Kishar Ring",
		ring2	= "Defending Ring",
		back	= AmbuCape_FC,
	}

	sets.precast.FC.SongDebuff 						= set_combine(sets.precast.FC.BardSong, { range = "Gjallarhorn" })
	sets.precast.FC.SongDebuff.Resistant 			= set_combine(sets.precast.FC.BardSong, { range = "Gjallarhorn" })
	sets.precast.FC.Lullaby 						= set_combine(sets.precast.FC.BardSong, { range = "Gjallarhorn" })
	sets.precast.FC.Lullaby.Resistant 				= set_combine(sets.precast.FC.BardSong, { range = "Gjallarhorn" })
	sets.precast.FC['Horde Lullaby'] 				= set_combine(sets.precast.FC.BardSong, { range = "Daurdabla" })
	sets.precast.FC['Horde Lullaby'].Resistant 		= set_combine(sets.precast.FC.BardSong, { range = "Daurdabla" })
	sets.precast.FC['Horde Lullaby'].AoE 			= set_combine(sets.precast.FC.BardSong, { range = "Daurdabla" })
	sets.precast.FC['Horde Lullaby II'] 			= set_combine(sets.precast.FC.BardSong, { range = "Daurdabla" })
	sets.precast.FC['Horde Lullaby II'].Resistant 	= set_combine(sets.precast.FC.BardSong, { range = "Daurdabla" })
	sets.precast.FC['Horde Lullaby II'].AoE 		= set_combine(sets.precast.FC.BardSong, { range = "Daurdabla" })
	sets.precast.FC.Mazurka 						= set_combine(sets.precast.FC.BardSong, { range = "Marsyas" })
	sets.precast.FC['Honor March'] 					= set_combine(sets.precast.FC.BardSong, { range = "Marsyas" })
	sets.precast.FC["Goddess's Hymnus"]				= set_combine(sets.precast.FC.BardSong, { range = "Marsyas" })

	sets.precast.FC.Daurdabla 	= set_combine(sets.precast.FC.BardSong, {range = info.ExtraSongInstrument})
	sets.precast.DaurdablaDummy	= sets.precast.FC.Daurdabla
		
	-- Precast sets to enhance JAs
	sets.precast.JA.Nightingale 	= { feet = BRD_Relic_Feet }
	sets.precast.JA.Troubadour 		= { body = BRD_Relic_Body }
	sets.precast.JA['Soul Voice'] 	= { legs = BRD_Relic_Legs }

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = 
	{
		range	= Linos_WS,
		head	= "Nyame Helm",
		body	= "Nyame Mail",
		hands	= "Nyame Gauntlets",
		legs	= "Nyame Flanchard",
		feet	= "Nyame Sollerets",
		neck	= "Bard's Charm +2",
		waist	= "Fotia Belt",
		ear1	= "Moonshade Earring",
		ear2	= "Mache Earring +1",		
		ring1	= "Ilabrat Ring",
		ring2	= "Epaminondas's Ring",
		back	= AmbuCape_WS,		
	}
		
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {})
	
	sets.precast.WS['Mordant Rime'] = 
	{
		range	= Linos_WS,
		head	= "Nyame Helm",
		body	= BRD_Relic_Body,
		hands	= "Nyame Gauntlets",
		legs	= "Nyame Flanchard",
		feet	= BRD_Relic_Feet,
		neck	= "Republican Platinum Medal",
		waist	= "Sailfi Belt +1",
		ear1	= "Moonshade Earring",
		ear2	= "Ishvara Earring",		
		ring1	= "Metamorph Ring +1",
		ring2	= "Epaminondas's Ring",
		back	= AmbuCape_WS,	
	}

	sets.precast.WS['Savage Blade'] = 
	{
		range	= Linos_WS,
		head	= "Nyame Helm",
		body	= BRD_Relic_Body,
		hands	= "Nyame Gauntlets",
		legs	= "Nyame Flanchard",
		feet	= "Nyame Sollerets",
		neck	= "Republican Platinum Medal",
		waist	= "Sailfi Belt +1",
		ear1	= "Moonshade Earring",
		ear2	= "Ishvara Earring",		
		ring1	= "Ilabrat Ring",
		ring2	= "Epaminondas's Ring",
		back	= AmbuCape_WS,	
	}

	sets.precast.WS['Aeolian Edge'] = 
	{
		range	= Linos_MD,
		head	= "Nyame Helm",
		body	= "Nyame Mail",
		hands	= "Nyame Gauntlets",
		legs	= "Nyame Flanchard",
		feet	= "Nyame Sollerets",
		neck	= "Baetyl Pendant",
    	waist	= "Refoccilation Stone",
    	ear1	= "Friomisi Earring",
    	ear2	= "Moonshade Earring",
    	ring1	= "Shiva Ring +1",
    	ring2	= "Epaminondas's Ring",
		back	= AmbuCape_MD,
	}

	sets.precast.WS['Evisceration'] = 
	{
		range	= Linos_WS,
		head	= "Blistering Sallet +1",
		body	= "Ayanmo Corazza +2",
		hands	= "Bunzi's Gloves",
		legs	= "Aya. Cosciales +2",
		feet	= "Aya. Gambieras +2",
		neck	= "Fotia Gorget",
		waist	= "Fotia Belt",
		ear1	= "Moonshade Earring",
		ear2	= "Mache Earring +1",		
		ring1	= "Apate Ring",
    	ring2	= "Ilabrat Ring",
		back	= AmbuCape_WS,	
	}

	sets.precast.WS["Rudra's Storm"] = 
	{
		range	= Linos_WS,
		head	= "Bunzi's Hat",
		body	= BRD_Relic_Body,
		hands	= "Bunzi's Gloves",
		legs	= "Aya. Cosciales +2",
		feet	= "Aya. Gambieras +2",
		neck	= "Bard's Charm +2",
		waist	= "Sailfi Belt +1",
		ear1	= "Moonshade Earring",
		ear2	= "Ishvara Earring",		
		ring1	= "Ilabrat Ring",
    	ring2	= "Epaminondas's Ring",
		back	= AmbuCape_WS,	
	}

	sets.precast.WS['Gust Slash'] = 
	{
		range	= Linos_MD,
		head	= "Nyame Helm",
		body	= "Nyame Mail",
		hands	= "Nyame Gauntlets",
		legs	= "Nyame Flanchard",
		feet	= "Nyame Sollerets",
		neck	= "Baetyl Pendant",
    	waist	= "Refoccilation Stone",
    	ear1	= "Friomisi Earring",
    	ear2	= "Moonshade Earring",
    	ring1	= "Shiva Ring +1",
    	ring2	= "Epaminondas's Ring",
		back	= AmbuCape_MD,
	}

	sets.precast.WS['Cyclone'] = 
	{
		range	= Linos_MD,
		head	= "Nyame Helm",
		body	= "Nyame Mail",
		hands	= "Nyame Gauntlets",
		legs	= "Nyame Flanchard",
		feet	= "Nyame Sollerets",
		neck	= "Baetyl Pendant",
    	waist	= "Refoccilation Stone",
    	ear1	= "Friomisi Earring",
    	ear2	= "Moonshade Earring",
    	ring1	= "Shiva Ring +1",
    	ring2	= "Epaminondas's Ring",
		back	= AmbuCape_MD,
	}

	sets.precast.WS['Cataclysm'] = 
	{
		range	= Linos_MD,
		head	= "Pixie Hairpin +1",
		body	= "Nyame Mail",
		hands	= "Nyame Gauntlets",
		legs	= "Nyame Flanchard",
		feet	= "Nyame Sollerets",
		neck	= "Baetyl Pendant",
    	waist	= "Refoccilation Stone",
    	ear1	= "Friomisi Earring",
    	ear2	= "Moonshade Earring",
    	ring1	= "Archon Ring",
    	ring2	= "Epaminondas's Ring",
		back	= AmbuCape_MD,
	}
		
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = 
	{
		ear1	= "Telos Earring",
		ear2	= "Ishvara Earring",
	}

	sets.AccMaxTP = 
	{
		ear1 	= "Telos Earring",
		ear2	= "Mache Earring +1",
	}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = 
	{
		head	= BRD_Empy_Head,
		body	= "Inyanga Jubbah +2",
		hands	= GendewithaHand_FC,
		legs	= "Aya. Cosciales +2",
		feet	= TelchineFeet_FC_Reg,
		neck	= "Voltsurge Torque",
		waist	= "Witful Belt",
		ear1	= "Ethereal Earring",
		ear2	= "Loquac. Earring",
		ring1	= "Lebeche Ring",
		ring2	= "Prolix Ring",
		back	= AmbuCape_FC,
	}

	-- Gear to enhance certain classes of songs
	sets.midcast.Madrigal 						= { head = BRD_Empy_Head }
	sets.midcast.Minuet 						= { body = BRD_Empy_Body }
	sets.midcast.March 							= { hands = BRD_Empy_Hand }
	sets.midcast.Ballad 						= { } --legs = BRD_Empy_Legs }	
	sets.midcast["Sentinel's Scherzo"] 			= { feet = BRD_Empy_Feet }
	
	sets.midcast.Paeon 							= { head = BRD_AF_Head }

	sets.midcast.Etude							= { head = "Mousai Turban +1" }
	sets.midcast.Threnody						= { body = "Mousai Manteel +1" }
	sets.midcast.Carol 							= { hands = "Mousai Gages +1" }
	sets.midcast.Minne 							= { legs = "Mousai Seraweels +1" }
	sets.midcast.Mambo							= { feet = "Mousai Crackows +1" }

	sets.midcast.Lullaby 						= { hands = BRD_AF_Hand, range = "Gjallarhorn" }
	sets.midcast.Lullaby.Resistant 				= { hands = BRD_AF_Hand, range = "Gjallarhorn" }
	sets.midcast['Horde Lullaby'] 				= { hands = BRD_AF_Hand, range = "Daurdabla" }
	sets.midcast['Horde Lullaby'].Resistant 	= { hands = BRD_AF_Hand, range = "Daurdabla" }
	sets.midcast['Horde Lullaby'].AoE 			= { hands = BRD_AF_Hand, range = "Daurdabla" }
	sets.midcast['Horde Lullaby II'] 			= { hands = BRD_AF_Hand, range = "Daurdabla" }
	sets.midcast['Horde Lullaby II'].Resistant 	= { hands = BRD_AF_Hand, range = "Daurdabla" }
	sets.midcast['Horde Lullaby II'].AoE 		= { hands = BRD_AF_Hand, range = "Daurdabla" }

	sets.midcast['Magic Finale'] 				= { range = "Gjallarhorn" }
	sets.midcast.Mazurka 						= { range = "Marsyas" }	
	sets.midcast["Goddess's Hymnus"]			= { range = "Marsyas" }	

	sets.midcast['Honor March'] 				= set_combine(sets.midcast.March, { range = "Marsyas" })

	-- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffect = 
	{
		main	= "Carnwenhan",
		sub		= "Ammurapi Shield",
		range	= "Gjallarhorn",
		head	= BRD_Empy_Head,
		body	= BRD_Empy_Body,
		hands	= BRD_Empy_Hand,
		legs	= "Inyanga Shalwar +2",
		feet	= BRD_AF_Feet,
		neck	= "Moonbow Whistle +1",
		ring1	= "Stikini Ring +1",
		ring2	= "Defending Ring",
		back	= AmbuCape_FC,
	}
		
	sets.midcast.SongEffect.DW = 
	{
		main	= "Carnwenhan",
		sub		= "Kali"
	}

	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = 
	{
		main	= "Carnwenhan",
		sub		= "Ammurapi Shield",
		range	= "Gjallarhorn",
		head	= BRD_AF_Head,
		body	= BRD_AF_Body,
		hands	= "Inyanga Dastanas +2",
		legs	= BRD_AF_Legs,
		feet	= BRD_AF_Feet,
		neck	= "Moonbow Whistle +1",
		waist	= "Acuity Belt +1",
		ear1	= "Regal Earring",
		ear2	= "Digni. Earring",
		ring1	= "Stikini Ring +1",
		ring2	= "Stikini Ring +1",
		back	= AmbuCape_FC,
	}
		
	sets.midcast.SongDebuff.DW = 
	{
		main	= "Carnwenhan",
		sub		= "Kali"
	}

	-- For song defbuffs (accuracy primary, duration secondary)
	sets.midcast.SongDebuff.Resistant = set_combine(sets.midcast.SongDebuff, {})

	-- Song-specific recast reduction
	sets.midcast.SongRecast = set_combine(sets.precast.FC.BardSong, {})
		
	sets.midcast.SongDebuff.DW = {}

	-- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = { range = info.ExtraSongInstrument }

	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = set_combine(sets.midcast.SongRecast, { range = info.ExtraSongInstrument })

	-- Other general spells and classes.
	sets.midcast.Cure = 
	{
		range	= Linos_FC,
		head	= "Bunzi's Hat",
		body	= "Bunzi's Robe",
		hands	= TelchineHand_EMD_CP,
		legs	= "Bunzi's Pants",
		feet	= TelchineFeet_EMD_CP,
		neck	= "Voltsurge Torque",
		waist	= "Witful Belt",
		ear1	= "Mendicant's Earring",
		ear2	= "Loquac. Earring",
		ring1	= "Lebeche Ring",
		ring2	= "Defending Ring",
		back	= "Oretan. Cape +1",
	}
		
	sets.midcast.Curaga = sets.midcast.Cure
		
	sets.Self_Healing = {waist="Gishdubar Sash"}
	sets.Cure_Received = {waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}

	sets.midcast['Enfeebling Magic'] = 
	{
		main	= "Carnwenhan",
		sub		= "Ammurapi Shield",
		range	= Linos_FC,
		head	= BRD_AF_Head,
    	body	= BRD_AF_Body,
    	hands	= "Inyanga Dastanas +2",
		legs	= BRD_AF_Legs,
		feet	= BRD_AF_Feet,
		neck	= "Incanter's Torque",
		waist	= "Acuity Belt +1",
		ear1	= "Ethereal Earring",
		ear2	= "Loquac. Earring",
		ring1	= "Stikini Ring +1",
		ring2	= "Metamorph Ring +1",
		back	= AmbuCape_MD,
	}

	sets.midcast.Dispelga = set_combine(sets.midcast['Enfeebling Magic'], 
	{
		main	= "Daybreak",
		sub		= "Ammurapi Shield"
	})
		
	sets.midcast['Enhancing Magic'] = 
	{
		sub		= "Ammurapi Shield",
		head	= TelchineHead_EMD_CP,
		body	= TelchineBody_EMD_CP,
		hands	= TelchineHand_EMD_CP,
		legs	= TelchineLegs_EMD_CP,
		feet	= TelchineFeet_EMD_CP,
		neck	= "Incanter's Torque",
		waist	= "Embla Sash",
		ear1	= "Ethereal Earring",
		ear2	= "Mendi. Earring",
		ring1	= "Stikini Ring +1",
		ring2	= "Stikini Ring +1",
		back	= AmbuCape_FC
	}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], 
	{
		neck	= "Nodens Gorget",
		waist	= "Siegel Sash",
		legs	= "Shedir Seraweels"
	})
		
	sets.midcast['Elemental Magic'] 			= {}
	sets.midcast['Elemental Magic'].Resistant 	= {}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, 
	{
		hands	= "Hieros Mittens",
		feet	= "Vanya Clogs",
		neck	= "Debilis Medallion",
		waist	= "Witful Belt",
		ring1	= "Haoma's Ring",
		ring2	= "Menelaus's Ring",
		back	= "Oretan. Cape +1",
	})
		
	sets.midcast.StatusRemoval = {}

	-- Resting sets
	sets.resting = {}
	
	sets.idle = 
	{
		main	= "Carnwenhan",
		sub		= "Ammurapi Shield",
		range	= Linos_DT,
		head	= "Nyame Helm",
		body	= "Nyame Mail",
		hands	= "Nyame Gauntlets",
		legs	= "Nyame Flanchard",
		feet	= "Nyame Sollerets",
		neck	= "Warder's Charm +1",
		waist	= "Carrier's Sash",
		ear1	= "Odnowa Earring +1",
		ear2	= "Eabani Earring",
		ring1	= "Stikini Ring +1",
		ring2	= "Defending Ring",
		back	= AmbuCape_FC
	}

	sets.idle.DT = set_combine(sets.idle, {})
	
	-- Defense sets

	sets.defense.PDT = {}
	sets.defense.MDT = {}

	sets.Kiting 				= { feet = BRD_Empy_Feet }
	sets.latent_refresh 		= { }
	sets.latent_refresh_grip 	= { }
	sets.TPEat 					= { neck = "Chrys. Torque" }

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	sets.engaged = 
	{
		range	= Linos_TP,
		head	= "Aya. Zucchetto +2",
		body	= "Ayanmo Corazza +2",
		hands	= "Bunzi's Gloves",
		legs	= "Aya. Cosciales +2",
		feet	= "Bunzi's Sabots",
		neck	= "Bard's Charm +2",
		waist	= "Sailfi Belt +1",
		ear1	= "Telos Earring",
		ear2	= "Brutal Earring",
		ring1	= "Chirich Ring +1",
		ring2	= "Chirich Ring +1",
		back	= AmbuCape_TP,
	}

	sets.engaged.DT 		= set_combine(sets.engaged, {})
	sets.engaged.Acc 		= set_combine(sets.engaged, {})

	sets.engaged.DW 		= set_combine(sets.engaged)
	sets.engaged.DW.DT 		= set_combine(sets.engaged.DW, {})
	sets.engaged.DW.Acc 	= set_combine(sets.engaged.DW, {})
	sets.engaged.DW.Acc.DT	= set_combine(sets.engaged.DW, {})
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(6, 14)
end