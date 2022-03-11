function user_job_setup()
	-- Options: Override default values
	state.CastingMode:options('Normal','Resistant','OccultAcumen')
	state.OffenseMode:options('Normal')
	state.IdleMode:options('Normal','PDT')
	state.Weapons:options('None','Laevateinn','Dagger')

	gear.obi_cure_waist = "Witful Belt"
	gear.obi_low_nuke_waist = "Acuity Belt +1"
	gear.obi_high_nuke_waist = "Refoccilation Stone"
	
	gear.nuke_jse_back = {name="Taranus's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}
	gear.stp_jse_back = {name="Taranus's Cape",augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}

		-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode') 
	send_command('bind ~^` gs c cycleback ElementalMode') --Robbiewobbie's idea
	send_command('bind !\\\\ input /ja "Manawell" <me>')
	send_command('bind !` gs c cycle TPEatMode')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f9 gs c cycle DeathMode')
	send_command('bind @^` input /ja "Parsimony" <me>')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.
	send_command('bind ^backspace input /ma "Stun" <t>')
	send_command('bind !backspace input /ja "Enmity Douse" <t>')
	send_command('bind @backspace input /ja "Alacrity" <me>')
	send_command('bind != input /ja "Light Arts" <me>')
	send_command('bind @= input /ja "Addendum: White" <me>')
	send_command('bind ^delete input /ja "Dark Arts" <me>')
	send_command('bind !delete input /ja "Addendum: Black" <me>')
	send_command('bind @delete input /ja "Manifestation" <me>')
    
	select_default_macro_book()
end

function init_gear_sets()

    AmbuCape_FC 		= { name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}}
	AmbuCape_MD 		= { name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}
	AmbuCape_DT			= { name="Taranus's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Damage taken-5%',}}
	AmbuCape_WS			= { name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%',}}
	AmbuCape_TP			= { name="Taranus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-1%',}}

	Gada_EMD			= { name="Gada", augments={'Enh. Mag. eff. dur. +6','VIT+9','Mag. Acc.+20','"Mag.Atk.Bns."+6','DMG:+7',}}
	TelchineHead_EMD_CP	= { name="Telchine Cap", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}}
	TelchineBody_EMD_CP	= { name="Telchine Chas.", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}}
	TelchineHand_EMD_CP	= { name="Telchine Gloves", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}}
	TelchineLegs_EMD_CP	= { name="Telchine Braconi", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}}
	TelchineFeet_EMD_CP	= { name="Telchine Pigaches", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}}

	Grioavolr_Death		= { name="Grioavolr", augments={'Mag. crit. hit dmg. +7%','MP+108','"Mag.Atk.Bns."+12','Magic Damage +2',}}
	MerlinicHead_FC		= { name="Merlinic Hood", augments={'"Fast Cast"+7','"Mag.Atk.Bns."+14',}}
	MerlinicBody_FC		= { name="Merlinic Jubbah", augments={'"Fast Cast"+7','CHR+4','Mag. Acc.+9','"Mag.Atk.Bns."+10',}}
	MerlinicHand_FC		= { name="Merlinic Dastanas", augments={'"Fast Cast"+7','AGI+10','"Mag.Atk.Bns."+8',}}
	MerlinicFeet_FC		= { name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+15','"Fast Cast"+7','MND+4',}}
	PsyclothLegs_FC		= { name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}}

	MerlinicHead_OA		= { name="Merlinic Hood", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','"Occult Acumen"+11',}}
	MerlinicBody_OA		= { name="Merlinic Jubbah", augments={'"Occult Acumen"+11','MND+5','Mag. Acc.+10',}}
	MerlinicHand_OA		= { name="Merlinic Dastanas", augments={'Accuracy+5','"Occult Acumen"+11','CHR+1','Mag. Acc.+13',}}
	MerlinicFeet_OA		= { name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+28','"Occult Acumen"+11','MND+4',}}

	MerlinicBody_Drain	= { name="Merlinic Jubbah", augments={'Mag. Acc.+3','"Drain" and "Aspir" potency +11','CHR+3',}}
    MerlinicHand_Drain	= { name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+25','"Drain" and "Aspir" potency +10','CHR+7',}}

	MerlinicLegs_Phx	= { name="Merlinic Shalwar", augments={'AGI+8','Pet: Mag. Acc.+13','Phalanx +1','Mag. Acc.+13 "Mag.Atk.Bns."+13',}}
    MerlinicHand_Phx	= { name="Merlinic Dastanas", augments={'Weapon skill damage +3%','Attack+13','Phalanx +2',}}

	BLM_Relic_Head		= "Archmage's Petasos +3"
	BLM_Relic_Body		= "Archmage's Coat +3"
	BLM_Relic_Hand		= "Archmage's Gloves +3"
	BLM_Relic_Legs		= "Archmage's Tonban +3"
	BLM_Relic_Feet		= "Archmage's Sabots +3"

	BLM_AF_Head			= "Spaekona's Petasos +1"
	BLM_AF_Body			= "Spaekona's Coat +3"
	BLM_AF_Hand			= "Spaekona's Gloves +1"
	BLM_AF_Legs			= "Spaekona's Tonban +3"
	BLM_AF_Feet			= "Spaekona's Sabots +1"

	BLM_Empy_Head		= "Wicce Petasos"
	BLM_Empy_Body		= "Wicce Coat"
	BLM_Empy_Hand		= "Wicce Gloves"
	BLM_Empy_Legs		= "Wicce Tonban"
	BLM_Empy_Feet		= "Wicce Sabots +1"

    --------------------------------------
    -- Start defining the sets
    --------------------------------------
	
	-- Weapons sets
	sets.weapons.Dagger = 
	{
		main	= "Levante Dagger",
		sub		= "Ammurapi Shield"
	}

	sets.weapons.Laevateinn = 
	{
		main	= "Laevateinn",
		sub		= "Enki Strap"
	}
	
    sets.buff.Sublimation 	= { waist = "Embla Sash" }
    sets.buff.DTSublimation	= { waist = "Embla Sash" }	
	
	-- Treasure Hunter
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
    
    ---- Precast Sets ----
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Mana Wall'] = 
	{
		back	= AmbuCape_DT,
		feet	= BLM_Empy_Feet
	}

    sets.precast.JA.Manafont = 
	{
		body	= BLM_Relic_Body
	}
    
    -- equip to maximize HP (for Tarus) and minimize MP loss before using convert
    sets.precast.JA.Convert = {}

    -- Fast cast sets for spells
    sets.precast.FC = 
	{
		ammo	= "Sapience Orb",
        head	= MerlinicHead_FC,
		neck	= "Baetyl pendant",
		ear1	= "Malignance Earring",
		ear2	= "Loquacious Earring",
        body	= MerlinicBody_FC,
		hands	= MerlinicHand_FC,
		ring1	= "Prolix Ring",
		ring2	= "Lebeche Ring",
        back	= AmbuCape_FC,
		waist	= "Witful Belt",
		legs	= PsyclothLegs_FC,
		feet	= MerlinicFeet_FC
	}
		
    sets.precast.FC['Enhancing Magic']	= set_combine(sets.precast.FC, {})
	sets.precast.FC.Stoneskin			= set_combine(sets.precast.FC['Enhancing Magic'], { legs = "Doyen Pants" })

    sets.precast.FC['Elemental Magic']	= set_combine(sets.precast.FC, {})
	sets.precast.FC.Cure				= set_combine(sets.precast.FC, {})
    sets.precast.FC.Curaga				= set_combine(sets.precast.FC.Cure, {})
	
	sets.precast.FC.Impact = set_combine(sets.precast.FC, 
	{
		head	= empty,
		body	= "Twilight Cloak"
	})

	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, 
	{
		main	= "Daybreak",
		sub		= "Ammurapi Shield"
	})

	sets.precast.FC.Death = set_combine(sets.precast.FC, 
	{
		neck	= "Voltsurge Torque",
		ring1	= "Mephitas's Ring +1",
	})

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Vidohunir'] = 
	{
		ammo	= "Ghastly Tathlum +1",
		head	= "Pixie Hairpin +1",
		body	= "Nyame Mail",
		hands	= "Jhakri Cuffs +2",
		legs	= BLM_Relic_Legs,
		feet	= BLM_Relic_Feet,
		neck	= "Saevus Pendant +1",
		waist	= "Refoccilation Stone",
		ear1	= "Malignance Earring",
		ear2	= "Friomisi Earring",
		ring1	= "Epaminondas's Ring",
		ring2	= "Archon Ring",
		back	= AmbuCape_WS,
	}

    sets.precast.WS['Myrkr'] = 
	{
		ammo	= "Ghastly Tathlum +1",
		head	= "Pixie Hairpin +1",
		body	= "Ea Houppelande +1",
		hands	= "Nyame Gauntlets",
		legs	= BLM_AF_Legs,
		feet	= "Nyame Sollerets",
		neck	= "Morgana's Choker",
		waist	= "Acuity Belt +1",
		ear1	= "Loquac. Earring",
		ear2	= "Moonshade Earring",
		ring1	= "Mephitas's Ring +1",
		ring2	= "Metamor. Ring +1",
		back	= AmbuCape_FC,
	}

	sets.precast.WS['Cataclysm'] = 
	{
		ammo	= "Ghastly Tathlum +1",
		head	= "Pixie Hairpin +1",
		body	= "Nyame Mail",
		hands	= "Jhakri Cuffs +2",
		legs	= BLM_Relic_Legs,
		feet	= BLM_Relic_Feet,
		neck	= "Saevus Pendant +1",
		waist	= "Refoccilation Stone",
		ear1	= "Malignance Earring",
		ear2	= "Friomisi Earring",
		ring1	= "Epaminondas's Ring",
		ring2	= "Archon Ring",
		back	= AmbuCape_WS,
	}

	sets.precast.WS['Aeolian Edge'] = 
	{
		ammo	= "Ghastly Tathlum +1",
		head	= BLM_Relic_Head,
		body	= "Nyame Mail",
		hands	= "Jhakri Cuffs +2",
		legs	= BLM_Relic_Legs,
		feet	= BLM_Relic_Feet,
		neck	= "Saevus Pendant +1",
		waist	= "Refoccilation Stone",
		ear1	= "Malignance Earring",
		ear2	= "Friomisi Earring",
		ring1	= "Epaminondas's Ring",
		ring2	= "Freke Ring",
		back	= AmbuCape_WS,
	}
		
	sets.MaxTPMyrkr = {}
    
    
    ---- Midcast Sets ----

    sets.midcast.FastRecast = set_combine(sets.precast.FC, {})

    sets.midcast.Cure = 
    {
        head	= TelchineHead_EMD_CP,
		body	= TelchineBody_EMD_CP,
		hands	= TelchineHand_EMD_CP,
		legs	= TelchineLegs_EMD_CP,
		feet	= TelchineFeet_EMD_CP,
    }
		
    sets.midcast.LightWeatherCure = 
    {
        head	= TelchineHead_EMD_CP,
		body	= TelchineBody_EMD_CP,
		hands	= TelchineHand_EMD_CP,
		legs	= TelchineLegs_EMD_CP,
		feet	= TelchineFeet_EMD_CP,
        waist   = "Hachirin-no-Obi"
    }

    sets.midcast.LightDayCure = 
    {
        head	= TelchineHead_EMD_CP,
		body	= TelchineBody_EMD_CP,
		hands	= TelchineHand_EMD_CP,
		legs	= TelchineLegs_EMD_CP,
		feet	= TelchineFeet_EMD_CP,
        waist   = "Hachirin-no-Obi"
    }

    sets.midcast.Curaga	= set_combine(sets.midcast.Cure, {})
	sets.midcast.Cursna	= set_combine(sets.midcast.Cure, 
	{
		neck	= "Debilis Medallion",
		hands	= "Hieros Mittens",
		ring1	= "Haoma's Ring",
		ring2	= "Menelaus's Ring",
		back	= "Oretan. Cape +1"
	})
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})

	sets.midcast['Enhancing Magic'] = 
	{
		main	= Gada_EMD,
		sub		= "Ammurapi Shield",
		ammo	= "Ghastly Tathlum +1",
		head	= TelchineHead_EMD_CP,
		body	= TelchineBody_EMD_CP,
		hands	= TelchineHand_EMD_CP,
		legs	= TelchineLegs_EMD_CP,
		feet	= TelchineFeet_EMD_CP,
		neck	= "Incanter's Torque",
		waist	= "Embla Sash",
		ear1	= "Malignance Earring",
		ear2	= "Mendi. Earring",
		ring1	= "Stikini Ring +1",
		ring2	= "Stikini Ring +1",
		back	= AmbuCape_FC
	}
    
    sets.midcast.Stoneskin	= set_combine(sets.midcast['Enhancing Magic'], { neck = "Nodens Gorget" })
	sets.midcast.Refresh	= set_combine(sets.midcast['Enhancing Magic'], { waist = "Gishdubar Sash", feet = "Inspirited Boots" })
	sets.midcast.Aquaveil	= set_combine(sets.midcast['Enhancing Magic'], { main = "Vadose Rod", legs = "Shedir Seraweels" })
	sets.midcast.BarElement	= set_combine(sets.midcast['Enhancing Magic'], { legs = "Shedir Seraweels" })
	sets.midcast.Phalanx	= set_combine(sets.midcast['Enhancing Magic'], { hands = MerlinicHand_Phx, legs = MerlinicLegs_Phx })

    sets.midcast['Enfeebling Magic'] = 
	{
		main	= "Maxentius",
		sub		= "Ammurapi Shield",
		ammo	= "Ghastly Tathlum +1",
		head	= "Ea Hat +1",
    	body	= BLM_AF_Body,
    	hands	= "Jhakri Cuffs +2",
		legs	= BLM_AF_Legs,
		feet	= BLM_Relic_Feet,
		neck	= "Sorcerer's Stole +2",
		waist	= "Acuity Belt +1",
		ear1	= "Malignance Earring",
		ear2	= "Barkarole Earring",
		ring1	= "Stikini Ring +1",
		ring2	= "Metamorph Ring +1",
		back	= AmbuCape_MD,
	}
		
    sets.midcast['Enfeebling Magic'].Resistant = set_combine(sets.midcast['Enfeebling Magic'], {})
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], 
	{
		head	= BLM_Relic_Head,
		body	= BLM_Relic_Body,
		hands	= BLM_Relic_Hand,
		legs	= BLM_Relic_Legs,
		feet	= BLM_Relic_Feet,
	})

    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, 
	{
		head	= BLM_Relic_Head,
		body	= BLM_Relic_Body,
		hands	= BLM_Relic_Hand,
		legs	= BLM_Relic_Legs,
		feet	= BLM_Relic_Feet,
	})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})

    sets.midcast['Dark Magic'] = 
    {
		main	= "Laevateinn",
		sub		= "Enki Strap",
		ammo	= "Ghastly Tathlum +1",
		head	= "Pixie Hairpin +1",
		body	= MerlinicBody_Drain,
		hands	= MerlinicHand_Drain,
		legs	= BLM_AF_Legs,
		feet	= "Agwu's Pigaches",
		neck	= "Erra Pendant",
		waist	= "Fucho-no-Obi",
		ear1	= "Malignance Earring",
		ear2	= "Friomisi Earring",
		ring1	= "Evanescence Ring",
		ring2	= "Archon Ring",
		back	= AmbuCape_MD,
	}

    sets.midcast.Drain = sets.midcast['Dark Magic']    
    sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast.Aspir.Death = 
	{
		main	= "Laevateinn",
		sub		= "Enki Strap",
		ammo	= "Pemphredo Tathlum",
        head	= "Pixie Hairpin +1",
		body	= MerlinicBody_Drain,
		hands	= BLM_Relic_Hand,
		legs	= BLM_AF_Legs,
		feet	= "Agwu's Pigaches",
		neck	= "Erra Pendant",
		ear1	= "Malignance Earring",
		ear2	= "Regal Earring",
		ring1	= "Evanescence Ring",
		ring2	= "Archon Ring",
        waist	= "Fucho-no-obi",
		back	= AmbuCape_MD,
	}
	
	sets.midcast.Death = 
	{
		ammo	= "Pemphredo Tathlum",
        head	= "Pixie Hairpin +1",
		body	= BLM_Relic_Body,
		hands	= BLM_Relic_Hand,
		legs	= BLM_Relic_Legs,
		feet	= BLM_Relic_Feet,
		neck	= "Sorcerer's Stole +2",
		ear1	= "Malignance Earring",
		ear2	= "Friomisi Earring",
		ring1	= "Freke Ring",
		ring2	= "Archon Ring",
        waist	= "Acuity Belt +1",
		back	= AmbuCape_FC,
	}

    sets.midcast.Stun = {}
		
    sets.midcast.Stun.Resistant = {}

    sets.midcast.BardSong = {}
		
	sets.midcast.Impact = 
	{
		ammo	= "Ghastly Tathlum +1",
		head	= empty,
		body	= "Twilight Cloak",
		hands	= BLM_Relic_Hand,
		legs	= BLM_AF_Legs,
		feet	= BLM_Relic_Feet,
		neck	= "Sorcerer's Stole +2",
		ear1	= "Malignance Earring",
		ear2	= "Friomisi Earring",
		ring1	= "Stikini Ring +1",
		ring2	= "Metamor. Ring +1",
		waist	= "Acuity Belt +1",
		back	= AmbuCape_MD,
	}

	sets.midcast.Dispelga = set_combine(sets.midcast['Enfeebling Magic'], 
	{
		main	= "Daybreak",
		sub		= "Genmei Shield"
	})
		
    -- Elemental Magic sets
    
    sets.midcast['Elemental Magic'] = 
	{
		main	= "Laevateinn",
		sub		= "Enki Strap",
		ammo	= "Ghastly Tathlum +1",
		head	= BLM_Relic_Head,
		body	= BLM_Relic_Body,
		hands	= BLM_Relic_Hand,
		legs	= BLM_Relic_Legs,
		feet	= BLM_Relic_Feet,
		neck	= "Saevus Pendant +1",
		waist	= "Acuity Belt +1",
		ear1	= "Malignance Earring",
		ear2	= "Friomisi Earring",
		ring1	= "Freke Ring",
		ring2	= "Shiva Ring +1",
		back	= AmbuCape_MD,
	}
    sets.midcast['Elemental Magic'].Resistant 				= set_combine(sets.midcast['Elemental Magic'], 
	{
		neck	= "Sorcerer's Stole +2",
		ring1	= "Stikini Ring +1",
		ring2	= "Metamor. Ring +1",
	})

	sets.midcast['Elemental Magic'].HighTierNuke 			= set_combine(sets.midcast['Elemental Magic'], 
	{
		waist	= "Refoccilation Stone"
	})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant 	= set_combine(sets.midcast['Elemental Magic'].HighTierNuke, 
	{
		neck	= "Sorcerer's Stole +2",
		ring1	= "Stikini Ring +1",
		ring2	= "Metamor. Ring +1",
		waist	= "Acuity Belt +1"
	})
	
	sets.midcast.Helix 										= set_combine(sets.midcast['Elemental Magic'], {})
	sets.midcast.Helix.Resistant 							= set_combine(sets.midcast['Elemental Magic'].Resistant, {})
		
		-- Minimal damage gear, maximum recast gear for procs.
    sets.midcast['Elemental Magic'].Proc 					= set_combine(sets.midcast['Elemental Magic'], {})		
    sets.midcast['Elemental Magic'].OccultAcumen 			= set_combine(sets.midcast['Elemental Magic'], 
	{
		ammo	= "Seraphic Ampulla",
    	head	= MerlinicHead_OA,
    	body	= MerlinicBody_OA,
    	hands	= MerlinicHand_OA,
    	legs	= "Perdition Slops",
    	feet	= MerlinicFeet_OA,
    	neck	= "Lissome Necklace",
    	ear1	= "Telos Earring",
		ear2	= "Dedition Earring",
    	ring1	= "Chirich Ring +1",
    	ring2	= "Chirich Ring +1",
		waist	= "Oneiros Rope",
    	back	= AmbuCape_TP,
	})
		
    sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].OccultAcumen, 
	{
		head	= empty,
		body	= "Twilight Cloak"
	})

	sets.midcast.Death.OccultAcumen = set_combine(sets.midcast.Death,
	{
		ammo	= "Seraphic Ampulla",
    	head	= MerlinicHead_OA,
    	body	= MerlinicBody_OA,
    	hands	= MerlinicHand_OA,
    	legs	= "Perdition Slops",
    	feet	= MerlinicFeet_OA,
		neck	= "Lissome Necklace",
    	ear1	= "Telos Earring",
		ear2	= "Dedition Earring",
    	ring1	= "Chirich Ring +1",
    	ring2	= "Chirich Ring +1",
		waist	= "Oneiros Rope",
    	back	= AmbuCape_TP,
	})
	
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {}
    
    -- Idle sets
    
    -- Normal refresh idle set
    sets.idle = 
    {
		main	= "Laevateinn",
		sub		= "Enki Strap",
		ammo	= "Crepuscular Pebble",
		head	= "Nyame Helm",
		body	= BLM_Relic_Body,
		hands	= "Nyame Gauntlets",
		legs	= "Nyame Flanchard",
		feet	= "Nyame Sollerets",
		neck	= "Twilight Torque",
		waist	= "Carrier's Sash",
		ear1	= "Malignance Earring",
		ear2	= "Ethereal Earring",
		ring1	= "Stikini Ring +1",
		ring2	= "Defending Ring",
		back	= AmbuCape_DT
	}

    -- Idle mode that keeps PDT gear on, but doesn't prevent normal gear swaps for precast/etc.
    sets.idle.PDT = 
    {
		main	= "Laevateinn",
		sub		= "Enki Strap",
    	ammo	= "Crepuscular Pebble",
    	head	= "Nyame Helm",
		body	= "Nyame Mail",
		hands	= "Nyame Gauntlets",
		legs	= "Nyame Flanchard",
		feet	= "Nyame Sollerets",
    	neck	= "Twilight Torque",
    	waist	= "Carrier's Sash",
    	ear1	= "Malignance Earring",
    	ear2	= "Ethereal Earring",
    	ring1	= "Warden's Ring",
    	ring2	= "Defending Ring",
        back	= AmbuCape_DT,
	}

	sets.idle.Death = 
	{
		main	= "Laevateinn",
		sub		= "Enki Strap",
		ammo	= "Staunch Tathlum +1",
		head	= BLM_Relic_Head,
		body	= BLM_Relic_Body,
		hands	= BLM_Relic_Hand,
		legs	= BLM_Relic_Legs,
		feet	= BLM_Relic_Feet,
		neck	= "Loricate Torque +1",
		ear1	= "Gifted Earring",
		ear2	= "Etiolation Earring",
		ring1	= "Mephitas's Ring +1",
		ring2	= "Mephitas's Ring",
		waist	= "Fucho-no-obi",
		back	= "Umbra Cape",
	}

    sets.idle.Weak 		= set_combine(sets.idle.PDT, {})

    -- Defense sets

    sets.defense.PDT 	= set_combine(sets.idle.PDT, {})
    sets.defense.MDT 	= set_combine(sets.idle.PDT, {})		
    sets.defense.MEVA 	= set_combine(sets.idle.PDT, {})

	sets.Kiting 				= { feet="Herald's Gaiters" }
    sets.latent_refresh 		= { waist="Fucho-no-obi" }
	sets.latent_refresh_grip 	= { }
	sets.TPEat 					= { neck="Chrys. Torque" }
	sets.DayIdle 				= {}
	sets.NightIdle 				= {}
	
    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
	
	sets.HPDown = {}
	sets.HPCure = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
    sets.buff['Mana Wall'] = 
	{
		back	= AmbuCape_DT,
		feet	= BLM_Empy_Feet
	}
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = 
	{
		body	= BLM_AF_Body
	}
	-- Gear for Magic Burst mode.
    sets.MagicBurst = 
	{
		neck	= "Sorcerer's Stole +2",
		head	= "Ea Hat +1",
    	body	= "Ea Houppelande +1",
		hands	= "Amalric Gages +1",
		legs	= "Ea Slops +1",
		feet	= "Amalric Nails +1",
		ring1	= "Freke Ring",
		ring2	= "Mujin Band",
		ear2	= "Barkarole Earring",
		back	= AmbuCape_MD
	}

	sets.RecoverBurst = set_combine(sets.MagicBurst, 
	{
		body	= BLM_AF_Body,
		feet	= "Agwu's Pigaches"
	})

	sets.ResistantMagicBurst = set_combine(sets.MagicBurst, 
	{
		ring1	= "Freke Ring",
		ring2	= "Metamorph Ring +1",
		waist	= "Acuity Belt +1"
	})

	sets.ResistantRecoverBurst = set_combine(sets.ResistantMagicBurst,
	{
		body	= BLM_AF_Body,
		feet	= "Agwu's Pigaches"
	})
	
	-- Gear for specific elemental nukes.
	sets.element.Dark = 
	{
		head	= "Pixie Hairpin +1",
		ring2	= "Archon Ring"
	}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = 
	{
		ammo	= "Amar Cluster",
		head	= "Nyame Helm",
		body	= "Nyame Mail",
		hands	= "Nyame Gauntlets",
		legs	= "Nyame Flanchard",
		feet	= "Nyame Sollerets",
		neck	= "Clotharius Torque",
		waist	= "Eschan Stone",
		ear1	= "Telos Earring",
		ear2	= "Cessance Earring",
		ring1	= "Chirich Ring +1",
		ring2	= "Chirich Ring +1",
		back	= AmbuCape_TP
	}

	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {waist="Gishdubar Sash"}
	sets.Cure_Received = {waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}
		
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(6, 2)
end