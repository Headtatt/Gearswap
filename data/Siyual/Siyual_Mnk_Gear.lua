function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','PDT')
    state.WeaponskillMode:options('Match','Normal', 'SomeAcc', 'Acc', 'FullAcc', 'Fodder')
    state.HybridMode:options('Normal', 'PDT')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT')
	state.Weapons:options('Verethragna','Godhands','Spharai','Xoanon')

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
	-- Weapons sets
	sets.weapons.Godhands 		= { main = "Godhands" }
	sets.weapons.Verethragna	= { main = "Verethragna" }
	sets.weapons.Spharai		= { main = "Spharai" }
	sets.weapons.Xoanon			= { main = "Xoanon", sub = "Alber Strap" }

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	MNK_Relic_Head		= "Hesychast's Crown +1"
	MNK_Relic_Body		= "Hesychast's Cyclas +1"
	MNK_Relic_Hand		= "Hesychast's Gloves +1"
	MNK_Relic_Legs		= "Hesychast's Hose +1"
	MNK_Relic_Feet		= "Hesychast's Gaiters +1"

	MNK_AF_Head			= "Anchorite's Crown +1"
	MNK_AF_Body			= "Anchorite's Cyclas +2"
	MNK_AF_Hand			= "Anchorite's Gloves +2"
	MNK_AF_Legs			= "Anchorite's Hose +2"
	MNK_AF_Feet			= "Anchorite's Gaiters +2"

	MNK_Empy_Head		= "Bhikku Crown +1"
	MNK_Empy_Body		= "Bhikku Cyclas +1"
	MNK_Empy_Hand		= "Bhikku Gloves +1"
	MNK_Empy_Legs		= "Bhikku Hose +1"
	MNK_Empy_Feet		= "Bhikku Gaiters +1"

	AmbuCape_MD			= { name="Segomo's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%',}}
    AmbuCape_WS_VIT		= { name="Segomo's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%',}}
    AmbuCape_TP_STR		= { name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','System: 1 ID: 640 Val: 4',}}

	ChirichRing_Ring1	= { name = "Chirich Ring +1", bag = "wardrobe3" }
	ChirichRing_Ring2	= { name = "Chirich Ring +1", bag = "wardrobe4" }

	HercBody_TH			= { name="Herculean Vest", augments={'"Mag.Atk.Bns."+30','AGI+6','"Treasure Hunter"+2','Mag. Acc.+14 "Mag.Atk.Bns."+14',}}
    HercLegs_TH			= { name="Herculean Trousers", augments={'Mag. Acc.+1','MND+4','"Treasure Hunter"+2','Mag. Acc.+17 "Mag.Atk.Bns."+17',}}
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs on use
	sets.precast.JA['Hundred Fists'] 	= { legs = MNK_Relic_Legs }
	sets.precast.JA['Dodge'] 			= { feet = MNK_AF_Feet }
	sets.precast.JA['Focus'] 			= { head = MNK_AF_Head }
	sets.precast.JA['Counterstance'] 	= { feet = MNK_Relic_Feet }
	sets.precast.JA['Footwork'] 		= { feet = "Shukuyu Sune-Ate" }	
	sets.precast.JA['Formless Strikes']	= { body = MNK_Relic_Body }
	sets.precast.JA['Mantra'] 			= { feet = MNK_Relic_Feet }
	sets.precast.JA['Chi Blast'] 		= { head = MNK_Relic_Head }

	sets.precast.JA['Boost'] = 
	{
		hands	= MNK_AF_Hand,
		waist	= "Ask Sash"
	}
	sets.precast.JA['Boost'].OutOfCombat = set_combine(sets.precast.JA['Boost'], {})
	
	sets.precast.JA['Chakra'] = 
	{
		ammo	= "Crepuscular Pebble",
		head	= "Genmei Kabuto",
		body	= MNK_AF_Body,
		hands	= MNK_Relic_Hand,
		legs	= "Tatena. Haidate +1",
		feet	= "Nyame Sollerets",
		neck	= "Unmoving Collar +1",
		waist	= "Moonbow Belt +1",
		ear1	= "Handler's Earring +1",
		ear2	= "Odnowa Earring +1",
		ring1	= "Niqmaddu Ring",
		ring2	= "Petrov Ring",
		back	= AmbuCape_WS_VIT
	}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {}
	sets.precast.Flourish1 = {}

	-- Fast cast sets for spells
	
	sets.precast.FC = 
	{
		ammo	= "Sapience Orb",
		neck    = "Voltsurge Torque",
        ear2    = "Loquac. Earring",
        ring2   = "Prolix Ring"
	}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = 
	{
		ammo	= "Knobkierrie",
		head	= "Nyame Helm",
		body	= "Nyame Mail",
		hands	= "Nyame Gauntlets",
		legs	= "Nyame Flanchard",
		feet	= "Nyame Sollerets",
		neck	= "Fotia Gorget",
		waist	= "Fotia Belt",
		ear1	= "Moonshade Earring",
		ear2	= "Sherida Earring",
		ring1	= "Niqmaddu Ring",
		ring2	= "Gere Ring",
		back	= AmbuCape_MNK_VIT_WSD
	}
	sets.precast.WSSomeAcc 	= {}
	sets.precast.WSAcc 		= {}
	sets.precast.WSFullAcc 	= {}
	sets.precast.WSFodder 	= {}

	sets.precast.WS.SomeAcc	= set_combine(sets.precast.WS, sets.precast.WSSomeAcc)	
	sets.precast.WS.Acc 	= set_combine(sets.precast.WS, sets.precast.WSAcc)
	sets.precast.WS.FullAcc	= set_combine(sets.precast.WS, sets.precast.WSFullAcc)
	sets.precast.WS.Fodder	= set_combine(sets.precast.WS, sets.precast.WSFodder)

	-- Specific weaponskill sets.

	sets.precast.WS['Raging Fists'] = 
	{
		ammo	= "Coiste Bodhar",
		head	= "Mpaca's Cap",
		body	= "Mpaca's Doublet",
		hands	= "Mpaca's Gloves",
		legs	= "Tatena. Haidate +1",
		feet	= "Mpaca's Boots",
		neck	= "Mnk. Nodowa +2",
		waist	= "Moonbow Belt +1",
		ear1	= "Schere Earring",
		ear2	= "Sherida Earring",
		ring1	= "Niqmaddu Ring",
		ring2	= "Gere Ring",
		back	= AmbuCape_TP_STR
	}

	sets.precast.WS['Howling Fist'] = 
	{
		ammo	= "Coiste Bodhar",
		head	= "Mpaca's Cap",
		body	= "Nyame Mail",
		hands	= "Nyame Gauntlets",
		legs	= "Mpaca's Hose",
		feet	= "Mpaca's Boots",
		neck	= "Mnk. Nodowa +2",
		waist	= "Moonbow Belt +1",
		ear1	= "Moonshade Earring",
		ear2	= "Sherida Earring",
		ring1	= "Niqmaddu Ring",
		ring2	= "Gere Ring",
		back	= AmbuCape_WS_VIT
	}

	sets.precast.WS['Asuran Fists'] = 
	{
		ammo	= "Coiste Bodhar",
		head	= "Nyame Helm",
		body	= "Nyame Mail",
		hands	= "Nyame Gauntlets",
		legs	= "Nyame Flanchard",
		feet	= "Nyame Sollerets",
		neck	= "Fotia Gorget",
		waist	= "Fotia Belt",
		ear1	= "Mache Earring +1",
		ear2	= "Sherida Earring",
		ring1	= ChirichRing_Ring1,
		ring2	= ChirichRing_Ring2,
		back	= AmbuCape_WS_VIT
	}

	sets.precast.WS["Ascetic's Fury"] = 
	{
		ammo	= "Knobkierrie",
		head	= "Nyame Helm",
		body	= "Nyame Mail",
		hands	= "Nyame Gauntlets",
		legs	= "Nyame Flanchard",
		feet	= "Nyame Sollerets",
		neck	= "Fotia Gorget",
		waist	= "Moonbow Belt +1",
		ear1	= "Moonshade Earring",
		ear2	= "Sherida Earring",
		ring1	= "Niqmaddu Ring",
		ring2	= "Gere Ring",
		back	= AmbuCape_WS_VIT
	}

	sets.precast.WS["Victory Smite"] = 
	{
		ammo	= "Coiste Bodhar",
		head	= "Adhemar Bonnet +1",
		body	= "Mpaca's Doublet",
		hands	= "Adhemar Wrist. +1",
		legs	= "Mpaca's Hose",
		feet	= "Mpaca's Boots",
		neck	= "Mnk. Nodowa +2",
		waist	= "Moonbow Belt +1",
		ear1	= "Odr Earring",
		ear2	= "Sherida Earring",
		ring1	= "Niqmaddu Ring",
		ring2	= "Gere Ring",
		back	= AmbuCape_TP_STR
	}

	sets.precast.WS['Shijin Spiral'] = 
	{
		ammo	= "Knobkierrie",
		head	= "Mpaca's Cap",
		body	= "Malignance Tabard",
		hands	= "Malignance Gloves",
		legs	= "Tatena. Haidate +1",
		feet	= "Malignance Boots",
		neck	= "Mnk. Nodowa +2",
		waist	= "Moonbow Belt +1",
		ear1	= "Mache Earring +1",
		ear2	= "Sherida Earring",
		ring1	= "Niqmaddu Ring",
		ring2	= "Gere Ring",
		back	= AmbuCape_WS_VIT
	}

	sets.precast.WS['Dragon Kick'] = 
	{
		ammo	= "Knobkierrie",
		head	= "Mpaca's Cap",
		body	= "Nyame Mail",
		hands	= "Adhemar Wrist. +1",
		legs	= "Mpaca's Hose",
		feet	= MNK_AF_Feet,
		neck	= "Mnk. Nodowa +2",
		waist	= "Moonbow Belt +1",
		ear1	= "Moonshade Earring",
		ear2	= "Sherida Earring",
		ring1	= "Niqmaddu Ring",
		ring2	= "Gere Ring",
		back	= AmbuCape_TP_STR,
	}

	sets.precast.WS['Tornado Kick'] = 
	{
		ammo	= "Knobkierrie",
		head	= "Mpaca's Cap",
		body	= "Nyame Mail",
		hands	= "Adhemar Wrist. +1",
		legs	= "Mpaca's Hose",
		feet	= MNK_AF_Feet,
		neck	= "Mnk. Nodowa +2",
		waist	= "Moonbow Belt +1",
		ear1	= "Moonshade Earring",
		ear2	= "Sherida Earring",
		ring1	= "Niqmaddu Ring",
		ring2	= "Gere Ring",
		back	= AmbuCape_TP_STR,
	}

	sets.precast.WS['Spinning Attack'] = 
	{
		ammo	= "Coiste Bodhar",
		head	= "Adhemar Bonnet +1",
		body	= "Mpaca's Doublet",
		hands	= "Adhemar Wrist. +1",
		legs	= "Mpaca's Hose",
		feet	= "Mpaca's Boots",
		neck	= "Mnk. Nodowa +2",
		waist	= "Moonbow Belt +1",
		ear1	= "Odr Earring",
		ear2	= "Sherida Earring",
		ring1	= "Niqmaddu Ring",
		ring2	= "Gere Ring",
		back	= AmbuCape_TP_STR
	}

	sets.precast.WS['Final Heaven'] = 
	{
		ammo	= "Knobkierrie",
		head	= "Nyame Helm",
		body	= "Nyame Mail",
		hands	= "Nyame Gauntlets",
		legs	= "Nyame Flanchard",
		feet	= "Nyame Sollerets",
		neck	= "Fotia Gorget",
		waist	= "Moonbow Belt +1",
		ear1	= "Ishvara Earring",
		ear2	= "Sherida Earring",
		ring1	= "Niqmaddu Ring",
		ring2	= "Epaminondas's Ring",
		back	= AmbuCape_WS_VIT
	}

	sets.precast.WS['Cataclysm'] = 
	{
		ammo	= "Knobkierrie",
		head	= "Pixie Hairpin +1",
		body	= "Nyame Mail",
		hands	= "Nyame Gauntlets",
		legs	= "Nyame Flanchard",
		feet	= "Nyame Sollerets",
		neck	= "Sibyl Scarf",
		waist	= "Acuity Belt +1",
		ear1	= "Friomisi Earring",
		ear2	= "Hecate's Earring",
		ring1	= "Epaminondas's Ring",
		ring2	= "Archon Ring",
		back	= AmbuCape_MD
	}

	sets.precast.WS["Raging Fists"].SomeAcc 	= set_combine(sets.precast.WS["Raging Fists"], 		sets.precast.WSSomeAcc)
	sets.precast.WS["Howling Fist"].SomeAcc 	= set_combine(sets.precast.WS["Howling Fist"], 		sets.precast.WSSomeAcc)
	sets.precast.WS["Asuran Fists"].SomeAcc 	= set_combine(sets.precast.WS["Asuran Fists"], 		sets.precast.WSSomeAcc)
	sets.precast.WS["Ascetic's Fury"].SomeAcc 	= set_combine(sets.precast.WS["Ascetic's Fury"], 	sets.precast.WSSomeAcc)
	sets.precast.WS["Victory Smite"].SomeAcc 	= set_combine(sets.precast.WS["Victory Smite"], 	sets.precast.WSSomeAcc)
	sets.precast.WS["Shijin Spiral"].SomeAcc 	= set_combine(sets.precast.WS["Shijin Spiral"], 	sets.precast.WSSomeAcc)
	sets.precast.WS["Dragon Kick"].SomeAcc 		= set_combine(sets.precast.WS["Dragon Kick"], 		sets.precast.WSSomeAcc)
	sets.precast.WS["Tornado Kick"].SomeAcc 	= set_combine(sets.precast.WS["Tornado Kick"], 		sets.precast.WSSomeAcc)
	sets.precast.WS["Final Heaven"].SomeAcc 	= set_combine(sets.precast.WS["Final Heaven"], 		sets.precast.WSSomeAcc)

	sets.precast.WS["Raging Fists"].Acc 		= set_combine(sets.precast.WS["Raging Fists"], 		sets.precast.WSAcc)
	sets.precast.WS["Howling Fist"].Acc 		= set_combine(sets.precast.WS["Howling Fist"], 		sets.precast.WSAcc)
	sets.precast.WS["Asuran Fists"].Acc 		= set_combine(sets.precast.WS["Asuran Fists"], 		sets.precast.WSAcc)
	sets.precast.WS["Ascetic's Fury"].Acc 		= set_combine(sets.precast.WS["Ascetic's Fury"], 	sets.precast.WSAcc)
	sets.precast.WS["Victory Smite"].Acc 		= set_combine(sets.precast.WS["Victory Smite"], 	sets.precast.WSAcc)
	sets.precast.WS["Shijin Spiral"].Acc 		= set_combine(sets.precast.WS["Shijin Spiral"], 	sets.precast.WSAcc)
	sets.precast.WS["Dragon Kick"].Acc 			= set_combine(sets.precast.WS["Dragon Kick"], 		sets.precast.WSAcc)
	sets.precast.WS["Tornado Kick"].Acc 		= set_combine(sets.precast.WS["Tornado Kick"], 		sets.precast.WSAcc)
	sets.precast.WS["Final Heaven"].Acc 		= set_combine(sets.precast.WS["Final Heaven"], 		sets.precast.WSAcc)

	sets.precast.WS["Raging Fists"].FullAcc 	= set_combine(sets.precast.WS["Raging Fists"], 		sets.precast.WSFullAcc)
	sets.precast.WS["Howling Fist"].FullAcc 	= set_combine(sets.precast.WS["Howling Fist"], 		sets.precast.WSFullAcc)
	sets.precast.WS["Asuran Fists"].FullAcc 	= set_combine(sets.precast.WS["Asuran Fists"], 		sets.precast.WSFullAcc)
	sets.precast.WS["Ascetic's Fury"].FullAcc 	= set_combine(sets.precast.WS["Ascetic's Fury"], 	sets.precast.WSFullAcc)
	sets.precast.WS["Victory Smite"].FullAcc 	= set_combine(sets.precast.WS["Victory Smite"], 	sets.precast.WSFullAcc)
	sets.precast.WS["Shijin Spiral"].FullAcc 	= set_combine(sets.precast.WS["Shijin Spiral"], 	sets.precast.WSFullAcc)
	sets.precast.WS["Dragon Kick"].FullAcc 		= set_combine(sets.precast.WS["Dragon Kick"], 		sets.precast.WSFullAcc)
	sets.precast.WS["Tornado Kick"].FullAcc 	= set_combine(sets.precast.WS["Tornado Kick"], 		sets.precast.WSFullAcc)
	sets.precast.WS["Final Heaven"].FullAcc 	= set_combine(sets.precast.WS["Final Heaven"], 		sets.precast.WSFullAcc)

	sets.precast.WS["Raging Fists"].Fodder 		= set_combine(sets.precast.WS["Raging Fists"], 		sets.precast.WSFodder)
	sets.precast.WS["Howling Fist"].Fodder 		= set_combine(sets.precast.WS["Howling Fist"], 		sets.precast.WSFodder)
	sets.precast.WS["Asuran Fists"].Fodder 		= set_combine(sets.precast.WS["Asuran Fists"], 		sets.precast.WSFodder)
	sets.precast.WS["Ascetic's Fury"].Fodder 	= set_combine(sets.precast.WS["Ascetic's Fury"], 	sets.precast.WSFodder)
	sets.precast.WS["Victory Smite"].Fodder 	= set_combine(sets.precast.WS["Victory Smite"], 	sets.precast.WSFodder)
	sets.precast.WS["Shijin Spiral"].Fodder 	= set_combine(sets.precast.WS["Shijin Spiral"], 	sets.precast.WSFodder)
	sets.precast.WS["Dragon Kick"].Fodder 		= set_combine(sets.precast.WS["Dragon Kick"], 		sets.precast.WSFodder)
	sets.precast.WS["Tornado Kick"].Fodder 		= set_combine(sets.precast.WS["Tornado Kick"], 		sets.precast.WSFodder)
	sets.precast.WS["Final Heaven"].Fodder 		= set_combine(sets.precast.WS["Final Heaven"], 		sets.precast.WSFodder)
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = 
	{
		ear1	= "Schere Earring",
		ear2	= "Sherida Earring"
	}
	sets.AccMaxTP = 
	{
		ear1	= "Schere Earring",
		ear2	= "Sherida Earring"
	}
	
	-- Midcast Sets
	sets.midcast.FastRecast = {}
		
	-- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {})
		
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {}
	

	-- Idle sets
	sets.idle = 
	{
		ammo	= "Coiste Bodhar",
		head	= "Malignance Chapeau",
		body	= "Malignance Tabard",
		hands	= "Malignance Gloves",
		legs	= "Malignance Tights",
		feet	= "Malignance Boots",
		neck	= "Mnk. Nodowa +2",
		waist	= "Moonbow Belt +1",
		ear1	= "Schere Earring",
		ear2	= "Sherida Earring",
		ring1	= "Niqmaddu Ring",
		ring2	= "Defending Ring",
		back	= AmbuCape_TP_STR,
	}

	sets.idle.Weak = 
	{
		ammo	= "Coiste Bodhar",
		head	= "Malignance Chapeau",
		body	= "Malignance Tabard",
		hands	= "Malignance Gloves",
		legs	= "Malignance Tights",
		feet	= "Malignance Boots",
		neck	= "Mnk. Nodowa +2",
		waist	= "Moonbow Belt +1",
		ear1	= "Schere Earring",
		ear2	= "Sherida Earring",
		ring1	= "Niqmaddu Ring",
		ring2	= "Defending Ring",
		back	= AmbuCape_TP_STR,
	}

	sets.idle.PDT = 
	{
		ammo	= "Coiste Bodhar",
		head	= "Malignance Chapeau",
		body	= "Malignance Tabard",
		hands	= "Malignance Gloves",
		legs	= "Malignance Tights",
		feet	= "Malignance Boots",
		neck	= "Mnk. Nodowa +2",
		waist	= "Moonbow Belt +1",
		ear1	= "Schere Earring",
		ear2	= "Sherida Earring",
		ring1	= "Niqmaddu Ring",
		ring2	= "Defending Ring",
		back	= AmbuCape_TP_STR,
	}		

	-- Defense sets
	sets.defense.PDT = 
	{
		ammo	= "Coiste Bodhar",
		head	= "Malignance Chapeau",
		body	= "Malignance Tabard",
		hands	= "Malignance Gloves",
		legs	= "Malignance Tights",
		feet	= "Malignance Boots",
		neck	= "Mnk. Nodowa +2",
		waist	= "Moonbow Belt +1",
		ear1	= "Schere Earring",
		ear2	= "Sherida Earring",
		ring1	= "Niqmaddu Ring",
		ring2	= "Defending Ring",
		back	= AmbuCape_TP_STR,
	}
		
	-- Defense sets
	sets.defense.HP = 
	{
		ammo	= "Coiste Bodhar",
		head	= "Malignance Chapeau",
		body	= "Malignance Tabard",
		hands	= "Malignance Gloves",
		legs	= "Malignance Tights",
		feet	= "Malignance Boots",
		neck	= "Mnk. Nodowa +2",
		waist	= "Moonbow Belt +1",
		ear1	= "Schere Earring",
		ear2	= "Sherida Earring",
		ring1	= "Niqmaddu Ring",
		ring2	= "Defending Ring",
		back	= AmbuCape_TP_STR,
	}

	sets.defense.MDT = 
	{
		ammo	= "Coiste Bodhar",
		head	= "Malignance Chapeau",
		body	= "Malignance Tabard",
		hands	= "Malignance Gloves",
		legs	= "Malignance Tights",
		feet	= "Malignance Boots",
		neck	= "Mnk. Nodowa +2",
		waist	= "Moonbow Belt +1",
		ear1	= "Schere Earring",
		ear2	= "Sherida Earring",
		ring1	= "Niqmaddu Ring",
		ring2	= "Defending Ring",
		back	= AmbuCape_TP_STR,
	}
		
	sets.defense.MEVA = 
	{
		ammo	= "Coiste Bodhar",
		head	= "Malignance Chapeau",
		body	= "Malignance Tabard",
		hands	= "Malignance Gloves",
		legs	= "Malignance Tights",
		feet	= "Malignance Boots",
		neck	= "Mnk. Nodowa +2",
		waist	= "Moonbow Belt +1",
		ear1	= "Schere Earring",
		ear2	= "Sherida Earring",
		ring1	= "Niqmaddu Ring",
		ring2	= "Defending Ring",
		back	= AmbuCape_TP_STR,
	}

	sets.Kiting = 
	{
		ring1	= "Shneddick Ring",
		feet	= "Hippo. Socks +1"
	}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee sets
	sets.engaged = 
	{
		ammo	= "Coiste Bodhar",
		head	= "Adhemar Bonnet +1",
		body	= "Mpaca's Doublet",
		hands	= "Mpaca's Gloves",
		legs	= "Mpaca's Hose",
		feet	= "Malignance Boots",
		neck	= "Mnk. Nodowa +2",
		waist	= "Moonbow Belt +1",
		ear1	= "Schere Earring",
		ear2	= "Sherida Earring",
		ring1	= "Niqmaddu Ring",
		ring2	= "Gere Ring",
		back	= AmbuCape_TP_STR,
	}
	sets.engaged.SomeAcc 	= set_combine(sets.engaged, {})
	sets.engaged.Acc 		= set_combine(sets.engaged, {})
	sets.engaged.FullAcc 	= set_combine(sets.engaged, {})
	sets.engaged.Fodder 	= set_combine(sets.engaged, {})

	-- Defensive melee hybrid sets
	sets.engaged.PDT = 
	{
		ammo	= "Coiste Bodhar",
		head	= "Malignance Chapeau",
		body	= "Malignance Tabard",
		hands	= "Malignance Gloves",
		legs	= "Malignance Tights",
		feet	= "Malignance Boots",
		neck	= "Mnk. Nodowa +2",
		waist	= "Moonbow Belt +1",
		ear1	= "Schere Earring",
		ear2	= "Sherida Earring",
		ring1	= "Niqmaddu Ring",
		ring2	= "Defending Ring",
		back	= AmbuCape_TP_STR,
	}
	sets.engaged.SomeAcc.PDT 	= set_combine(sets.engaged.PDT, {})
	sets.engaged.Acc.PDT 		= set_combine(sets.engaged.PDT, {})
	sets.engaged.FullAcc.PDT 	= set_combine(sets.engaged.PDT, {})
	sets.engaged.Fodder.PDT 	= set_combine(sets.engaged.PDT, {})

	-- Hundred Fists/Impetus melee set mods
	sets.engaged.HF 		= set_combine(sets.engaged, {})
	sets.engaged.SomeAcc.HF = set_combine(sets.engaged.SomeAcc, {})
	sets.engaged.Acc.HF 	= set_combine(sets.engaged.Acc, {})
	sets.engaged.FullAcc.HF = set_combine(sets.engaged.FullAcc, {})
	sets.engaged.Fodder.HF 	= set_combine(sets.engaged.Fodder, {})

	sets.buff.Doom 			= set_combine(sets.buff.Doom, {})
	sets.buff.Sleep 		= {}
	--sets.buff.Impetus 		= { body = MNK_Empy_Body }
	sets.buff.Footwork 		= { feet = "Shukuyu Sune-Ate" }
	sets.FootworkWS			= { feet = "Shukuyu Sune-Ate" }
	sets.buff.ImpetusWS		= { body = MNK_Empy_Body }
	sets.buff.Boost			= { waist = "Ask Sash" }
	
	sets.DayIdle 	= {}
	sets.NightIdle 	= {}
    sets.Knockback 	= {}

	sets.TreasureHunter = set_combine(sets.TreasureHunter, 
	{
		body	= HercBody_TH,
		legs	= HercLegs_TH
	})

	sets.Skillchain = {}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(6, 12)
end