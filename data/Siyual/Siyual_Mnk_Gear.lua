function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc', 'Fodder')
    state.WeaponskillMode:options('Match','Normal', 'SomeAcc', 'Acc', 'FullAcc', 'Fodder')
    state.HybridMode:options('Normal', 'PDT')
    state.PhysicalDefenseMode:options('PDT', 'HP')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT')
	state.Weapons:options('Verethragna','Godhands','Spharai')

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
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs on use
	sets.precast.JA['Hundred Fists'] = 
	{
		legs	= "Hesychast's Hose +1"
	}
	sets.precast.JA['Boost'] = 
	{
		hands	= "Anch. Gloves +1",
	}
	sets.precast.JA['Boost'].OutOfCombat = set_combine(sets.precast.JA['Boost'], {})

	sets.precast.JA['Dodge'] = 
	{
		feet	= "Anchorite's Gaiters +2"
	}

	sets.precast.JA['Focus'] = 
	{
		head	= "Anchorite's Crown +1"
	}

	sets.precast.JA['Counterstance'] = 
	{
		feet	= "Hesychast's Gaiters +1"
	}

	sets.precast.JA['Footwork'] = 
	{
		feet	= "Bhikku Gaiters +1"
	}
	
	sets.precast.JA['Formless Strikes'] = 
	{
		body	= "Hesychast's Cyclas"
	}

	sets.precast.JA['Mantra'] = 
	{
		feet	= "Hes. Gaiters +1"
	}

	sets.precast.JA['Chi Blast'] = 
	{
		head	= "Hes. Crown +1"
	}
	
	sets.precast.JA['Chakra'] = 
	{
		head	= "Hiza. Somen　+2",
		body	= "Anch. Cyclas +2",
		hands	= "Hes. Gloves +1",
		legs	= "Anch. Hose +1",
		feet	= "Hiza. Sune-Ate +2",
		ear1	= "Handler's Earring +1",
		ring1	= "Niqmaddu Ring",
		ring2	= "Iota Ring",
		back	= gear.AmbuCape_MNK_VIT_WSD
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
		head	= "Hiza. Somen　+2",
		body	= gear.HercBody_WSD,
		hands	= "Malignance Gloves",
		legs	= "Hiza. Hizayoroi +2",
		feet	= gear.HercFeet_STR,
		neck	= "Fotia Gorget",
		waist	= "Fotia Belt",
		ear1	= "Moonshade Earring",
		ear2	= "Sherida Earring",
		ring1	= "Niqmaddu Ring",
		ring2	= "Gere Ring",
		back	= gear.AmbuCape_MNK_STR_DA
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

	sets.precast.WS['Raging Fists']    = 
	{
		ammo	= "Knobkierrie",
		head	= "Hiza. Somen　+2",
		body	= gear.HercBody_WSD,
		hands	= "Malignance Gloves",
		legs	= "Hiza. Hizayoroi +2",
		feet	= gear.HercFeet_STR,
		neck	= "Fotia Gorget",
		waist	= "Moonbow Belt",
		ear1	= "Moonshade Earring",
		ear2	= "Sherida Earring",
		ring1	= "Niqmaddu Ring",
		ring2	= "Gere Ring",
		back	= gear.AmbuCape_MNK_STR_DA
	}

	sets.precast.WS['Howling Fist']    = 
	{
		ammo	= "Knobkierrie",
		head    = gear.HercHead_WSD,
        body	= gear.HercBody_WSD,
        hands   = gear.HercHand_DEX,
        legs    = "Hiza. Hizayoroi +2",
        feet    = gear.HercFeet_TA,
        neck    = "Fotia Gorget",
        waist   = "Moonbow Belt",
        ear1    = "Moonshade Earring",
        ear2    = "Sherida Earring",
        ring1   = "Niqmaddu Ring",
        ring2   = "Gere Ring",
        back    = gear.AmbuCape_MNK_VIT_WSD
	}

	sets.precast.WS['Asuran Fists']    = 
	{
		ammo	= "Knobkierrie",
		head	= "Malignance Chapeau",
		body	= "Malignance Tabard",
		hands	= "Malignance Gloves",
		legs	= "Malignance Tights",
		feet	= "Malignance Boots",
        neck    = "Fotia Gorget",
        waist   = "Fotia Belt",
        ear1    = "Cessance Earring",
        ear2    = "Mache Earring +1",
        ring1   = "Rufescent Ring",
        ring2   = "Niqmaddu Ring",
        back    = gear.AmbuCape_MNK_VIT_WSD
	}

	sets.precast.WS["Ascetic's Fury"]  = 
	{
		ammo	= "Knobkierrie",
		head	= "Hiza. Somen　+2",
		body	= gear.HercBody_WSD,
		hands	= "Malignance Gloves",
		legs	= "Hiza. Hizayoroi +2",
		feet	= gear.HercFeet_STR,
		neck	= "Fotia Gorget",
		waist	= "Moonbow Belt",
		ear1	= "Moonshade Earring",
		ear2	= "Sherida Earring",
		ring1	= "Niqmaddu Ring",
		ring2	= "Gere Ring",
		back	= gear.AmbuCape_MNK_VIT_WSD
	}

	sets.precast.WS["Victory Smite"]   = 
	{
		ammo	= "Knobkierrie",
		head	= "Hiza. Somen　+2",
		body	= gear.HercBody_WSD,
		hands	= "Malignance Gloves",
		legs	= "Hiza. Hizayoroi +2",
		feet	= gear.HercFeet_STR,
		neck	= "Fotia Gorget",
		waist	= "Moonbow Belt",
		ear1	= "Moonshade Earring",
		ear2	= "Sherida Earring",
		ring1	= "Niqmaddu Ring",
		ring2	= "Gere Ring",
		back	= gear.AmbuCape_MNK_VIT_WSD
	}

	sets.precast.WS['Shijin Spiral']   = 
	{
		ammo	= "Knobkierrie",
		head	= gear.HercHead_DEX,
		body	= "Malignance Tabard",
		hands	= gear.HercHand_DEX,
		legs	= "Hiza. Hizayoroi +2",
		feet	= "Malignance Boots",
		neck	= "Fotia Gorget",
		waist	= "Fotia Belt",
		ear1	= "Mache Earring +1",
		ear2	= "Sherida Earring",
		ring1	= "Apate Ring",
		ring2	= "Gere Ring",
		back	= gear.AmbuCape_MNK_VIT_WSD
	}

	sets.precast.WS['Dragon Kick']     = 
	{
		ammo	= "Knobkierrie",
		head	= "Malignance Chapeau",
		body	= "Malignance Tabard",
		hands	= "Malignance Gloves",
		legs	= "Malignance Tights",
		feet	= "Malignance Boots",
		neck	= "Fotia Gorget",
		waist	= "Fotia Belt",
		ear1	= "Moonshade Earring",
		ear2	= "Sherida Earring",
		ring1	= "Niqmaddu Ring",
		ring2	= "Gere Ring",
		back	= gear.AmbuCape_MNK_VIT_WSD
	}

	sets.precast.WS['Tornado Kick']    = 
	{
		ammo	= "Knobkierrie",
		head	= "Malignance Chapeau",
		body	= "Malignance Tabard",
		hands	= "Malignance Gloves",
		legs	= "Malignance Tights",
		feet	= "Malignance Boots",
		neck	= "Fotia Gorget",
		waist	= "Fotia Belt",
		ear1	= "Moonshade Earring",
		ear2	= "Sherida Earring",
		ring1	= "Niqmaddu Ring",
		ring2	= "Gere Ring",
		back	= gear.AmbuCape_MNK_VIT_WSD
	}

	sets.precast.WS['Spinning Attack'] = 
	{
		ammo	= "Knobkierrie",
		head	= "Hiza. Somen　+2",
		body	= gear.HercBody_WSD,
		hands	= "Malignance Gloves",
		legs	= "Hiza. Hizayoroi +2",
		feet	= gear.HercFeet_STR,
		neck	= "Fotia Gorget",
		waist	= "Moonbow Belt",
		ear1	= "Moonshade Earring",
		ear2	= "Sherida Earring",
		ring1	= "Niqmaddu Ring",
		ring2	= "Gere Ring",
		back	= gear.AmbuCape_MNK_VIT_WSD
	}

	sets.precast.WS['Final Heaven'] = 
	{
		ammo	= "Knobkierrie",
		head	= gear.HercHead_WSD,
		body	= gear.HercBody_WSD,
		hands	= gear.HercHand_DEX,
		legs	= "Hiza. Hizayoroi +2",
		feet	= "Malignance Boots",
		neck	= "Fotia Gorget",
		waist	= "Moonbow Belt",
		ear1	= "Ishvara Earring",
		ear2	= "Sherida Earring",
		ring1	= "Niqmaddu Ring",
		ring2	= "Gere Ring",
		back	= gear.AmbuCape_MNK_VIT_WSD
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
		ear1	= "Brutal Earring",
		ear2	= "Sherida Earring"
	}
	sets.AccMaxTP = 
	{
		ear1	= "Mache Earring +1",
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
		ammo	= "Ginsen",
		head	= "Malignance Chapeau",
		body	= "Hiza. Haramaki +2",
		hands	= "Malignance Gloves",
		legs	= "Malignance Tights",
		feet	= "Malignance Boots",
		neck	= "Twilight Torque",
		waist	= "Moonbow Belt",
		ear1	= "Cessance Earring",
		ear2	= "Sherida Earring",
		ring1	= "Niqmaddu Ring",
		ring2	= "Defending Ring",
		back	= gear.AmbuCape_MNK_STR_DA
	}

	sets.idle.Weak = 
	{
		ammo	= "Ginsen",
		head	= "Malignance Chapeau",
		body	= "Hiza. Haramaki +2",
		hands	= "Malignance Gloves",
		legs	= "Malignance Tights",
		feet	= "Malignance Boots",
		neck	= "Twilight Torque",
		waist	= "Moonbow Belt",
		ear1	= "Cessance Earring",
		ear2	= "Sherida Earring",
		ring1	= "Niqmaddu Ring",
		ring2	= "Defending Ring",
		back	= gear.AmbuCape_MNK_STR_DA
	}

	sets.idle.PDT = 
	{
		ammo	= "Ginsen",
		head	= "Malignance Chapeau",
		body	= "Malignance Tabard",
		hands	= "Malignance Gloves",
		legs	= "Malignance Tights",
		feet	= "Malignance Boots",
		neck	= "Twilight Torque",
		waist	= "Moonbow Belt",
		ear1	= "Cessance Earring",
		ear2	= "Sherida Earring",
		ring1	= "Niqmaddu Ring",
		ring2	= "Defending Ring",
		back	= gear.AmbuCape_MNK_STR_DA
	}		

	-- Defense sets
	sets.defense.PDT = 
	{
		ammo	= "Ginsen",
		head	= "Malignance Chapeau",
		body	= "Malignance Tabard",
		hands	= "Malignance Gloves",
		legs	= "Malignance Tights",
		feet	= "Malignance Boots",
		neck	= "Twilight Torque",
		waist	= "Moonbow Belt",
		ear1	= "Cessance Earring",
		ear2	= "Sherida Earring",
		ring1	= "Niqmaddu Ring",
		ring2	= "Defending Ring",
		back	= gear.AmbuCape_MNK_STR_DA
	}
		
	-- Defense sets
	sets.defense.HP = 
	{
		ammo	= "Ginsen",
		head	= "Malignance Chapeau",
		body	= "Malignance Tabard",
		hands	= "Malignance Gloves",
		legs	= "Malignance Tights",
		feet	= "Malignance Boots",
		neck	= "Twilight Torque",
		waist	= "Moonbow Belt",
		ear1	= "Cessance Earring",
		ear2	= "Sherida Earring",
		ring1	= "Niqmaddu Ring",
		ring2	= "Defending Ring",
		back	= gear.AmbuCape_MNK_STR_DA
	}

	sets.defense.MDT = 
	{
		ammo	= "Ginsen",
		head	= "Malignance Chapeau",
		body	= "Malignance Tabard",
		hands	= "Malignance Gloves",
		legs	= "Malignance Tights",
		feet	= "Malignance Boots",
		neck	= "Twilight Torque",
		waist	= "Moonbow Belt",
		ear1	= "Cessance Earring",
		ear2	= "Sherida Earring",
		ring1	= "Niqmaddu Ring",
		ring2	= "Defending Ring",
		back	= gear.AmbuCape_MNK_STR_DA
	}
		
	sets.defense.MEVA = 
	{
		ammo	= "Ginsen",
		head	= "Malignance Chapeau",
		body	= "Malignance Tabard",
		hands	= "Malignance Gloves",
		legs	= "Malignance Tights",
		feet	= "Malignance Boots",
		neck	= "Twilight Torque",
		waist	= "Moonbow Belt",
		ear1	= "Cessance Earring",
		ear2	= "Sherida Earring",
		ring1	= "Niqmaddu Ring",
		ring2	= "Defending Ring",
		back	= gear.AmbuCape_MNK_STR_DA
	}

	sets.Kiting = 
	{
		feet	= "Herald's Gaiters"
	}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee sets
	sets.engaged = 
	{
		ammo	= "Ginsen",
		head	= "Adhemar Bonnet +1",
		body	= "Bhikku Cyclas +1",
		hands	= "Adhemar Wrist. +1",
		legs	= "Bhikku Hose +1",
		feet	= "Anch. Gaiters +2",
		neck	= "Clotharius Torque",
		waist	= "Moonbow Belt",
		ear1	= "Cessance Earring",
		ear2	= "Sherida Earring",
		ring1	= "Niqmaddu Ring",
		ring2	= "Gere Ring",
		back	= gear.AmbuCape_MNK_STR_DA
	}
	sets.engaged.SomeAcc 	= set_combine(sets.engaged, {})
	sets.engaged.Acc 		= set_combine(sets.engaged, {})
	sets.engaged.FullAcc 	= set_combine(sets.engaged, {})
	sets.engaged.Fodder 	= set_combine(sets.engaged, {})

	-- Defensive melee hybrid sets
	sets.engaged.PDT = 
	{
		ammo	= "Ginsen",
		head	= "Malignance Chapeau",
		body	= "Malignance Tabard",
		hands	= "Malignance Gloves",
		legs	= "Malignance Tights",
		feet	= "Malignance Boots",
		neck	= "Twilight Torque",
		waist	= "Moonbow Belt",
		ear1	= "Cessance Earring",
		ear2	= "Sherida Earring",
		ring1	= "Niqmaddu Ring",
		ring2	= "Defending Ring",
		back	= gear.AmbuCape_MNK_STR_DA
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

	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {}
	sets.buff.Impetus = 
	{
		body	= "Bhikku Cyclas +1"
	}
	sets.buff.Footwork = 
	{
		feet	= "Bhikku Gaiters +1"
	}
	sets.buff.Boost = 
	{
		waist	= "Ask Sash"
	}
	
	sets.FootworkWS = 
	{
		feet	= "Bhikku Gaiters +1"
	}
	
	sets.DayIdle 	= {}
	sets.NightIdle 	= {}
    sets.Knockback 	= {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {
		body	= gear.HercBody_TH,
		legs	= gear.HercLegs_TH
	})

	sets.Skillchain = {}
	
	-- Weapons sets
	sets.weapons.Godhands = {main="Godhands"}
	sets.weapons.Barehanded = {main=empty}
	sets.weapons.Verethragna = {main="Verethragna"}
	sets.weapons.Spharai = {main="Spharai"}

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(6, 12)
end