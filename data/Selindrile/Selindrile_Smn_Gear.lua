-- Setup vars that are user-dependent.  Can override this function in a sidecar.
function user_job_setup()
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant','OccultAcumen')
    state.IdleMode:options('Normal','PDT')
	state.Weapons:options('None','Gridarvor','Khatvanga')

    gear.perp_staff = {name="Gridarvor"}
	
	gear.magic_jse_back = {name="Campestres's Cape",augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10',}}
	gear.phys_jse_back = {name="Campestres's Cape",augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Haste+10',}}
	
    send_command('bind !` input /ja "Release" <me>')
	send_command('bind @` gs c cycle MagicBurst')
	send_command('bind ^` gs c toggle PactSpamMode')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation.
	send_command('bind ^q gs c weapons Khatvanga;gs c set CastingMode OccultAcumen')
	send_command('bind !q gs c weapons default;gs c reset CastingMode')
	
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast Sets
    --------------------------------------
    
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.merlinic_treasure_feet})
	
    -- Precast sets to enhance JAs
    sets.precast.JA['Astral Flow'] = {head="Glyphic Horn"}
    
    sets.precast.JA['Elemental Siphon'] = {main="Espiritus",sub="Vox Grip",ammo="Esper Stone +1",
        head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Lodurr Earring",
        body="Telchine Chasuble",hands="Baayami Cuffs",ring1="Evoker's Ring",ring2="Stikini Ring +1",
        back="Conveyance Cape",waist="Kobo Obi",legs="Telchine Braconi",feet="Beck. Pigaches +1"}

    sets.precast.JA['Mana Cede'] = {hands="Beck. Bracers +1"}

    -- Pact delay reduction gear
    sets.precast.BloodPactWard = {main="Espiritus",sub="Vox Grip",ammo="Epitaph",
		head="Beckoner's Horn +1",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Lodurr Earring",
        body="Baayami Robe",hands="Baayami Cuffs",ring1="Evoker's Ring",ring2="Stikini Ring +1",
        back="Conveyance Cape",waist="Kobo Obi",legs="Baayami Slops",feet="Baayami Sabots"}
		
    sets.precast.BloodPactRage = sets.precast.BloodPactWard

    -- Fast cast sets for spells
    
    sets.precast.FC = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Impatiens",
		head="Amalric Coif +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		body="Inyanga Jubbah +2",hands="Volte Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
		back="Perimede Cape",waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {main="Serenity",sub="Clerisy Strap +1"})
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})
	
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})       
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})
	
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Myrkr'] = {ammo="Epitaph",
        head="Beckoner's Horn +1",neck="Sanctity Necklace",ear1="Etiolation Earring",ear2="Gifted Earring",
        body="Con. Doublet +3",hands="Regal Cuffs",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
        back="Conveyance Cape",waist="Luminary Sash",legs="Psycloth Lappas",feet="Beck. Pigaches +1"}

    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Amalric Coif +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		body="Inyanga Jubbah +2",hands="Volte Gloves",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Lengo Pants",feet="Regal Pumps +1"}
	
    sets.midcast.Cure = {main=gear.gada_healing_club,sub="Sors Shield",ammo="Hasty Pinion +1",
        head="Vanya Hood",neck="Incanter's Torque",ear1="Mendicant's Earring",ear2="Gifted Earring",
        body="Vrikodara Jupon",hands="Telchine Gloves",ring1="Janniston Ring",ring2="Menelaus's Ring",
        back="Tempered Cape +1",waist="Austerity Belt +1",legs="Gyve Trousers",feet="Vanya Clogs"}
		
	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",hands="Hieros Mittens",
		back="Oretan. Cape +1",ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff,sub="Clemency Grip"})

	sets.midcast['Summoning Magic'] = {main="Malignance Pole",sub="Umbra Strap",ammo="Epitaph",
        head="Convoker's Horn +3",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Lodurr Earring",
        body="Baayami Robe",hands="Baayami Cuffs",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back=gear.magic_jse_back,waist="Emphatikos Rope",legs="Assid. Pants +1",feet="Baayami Sabots"}
		
	sets.midcast['Elemental Magic'] = {main="Daybreak",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",
        head="Bunzi's Hat",neck="Baetyl Pendant",ear1="Crematio Earring",ear2="Friomisi Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Freke Ring",
		back="Toro Cape",waist="Sekhmet Corset",legs="Merlinic Shalwar",feet="Amalric Nails +1"}
		
	sets.midcast['Elemental Magic'].Resistant = {main="Daybreak",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",
        head="Bunzi's Hat",neck="Baetyl Pendant",ear1="Crematio Earring",ear2="Friomisi Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Freke Ring",
		back="Toro Cape",waist="Sekhmet Corset",legs="Merlinic Shalwar",feet="Amalric Nails +1"}
		
    sets.midcast['Elemental Magic'].OccultAcumen = {main="Khatvanga",sub="Bloodrain Strap",ammo="Seraphic Ampulla",
        head=gear.merlinic_nuke_head,neck="Combatant's Torque",ear1="Dedition Earring",ear2="Telos Earring",
        body=gear.merlinic_occult_body,hands=gear.merlinic_occult_hands,ring1="Rajas Ring",ring2="Petrov Ring",
        back="Toro Cape",waist="Oneiros Rope",legs="Perdition Slops",feet=gear.merlinic_occult_feet}
		
	sets.midcast.Impact = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head=empty,neck="Erra Pendant",ear1="Enchntr. Earring +1",ear2="Gwati Earring",
		body="Twilight Cloak",hands="Regal Cuffs",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back="Toro Cape",waist="Acuity Belt +1",legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}
		
	sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].OccultAcumen, {head=empty,body="Twilight Cloak"})

    sets.midcast['Divine Magic'] = {main="Daybreak",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",
        head=gear.merlinic_nuke_head,neck="Baetyl Pendant",ear1="Crematio Earring",ear2="Friomisi Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Freke Ring",
		back="Toro Cape",waist="Sekhmet Corset",legs="Merlinic Shalwar",feet="Amalric Nails +1"}
		
    sets.midcast['Dark Magic'] = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Incanter's Torque",ear1="Digni. Earring",ear2="Gwati Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
        back="Aurist's Cape +1",waist="Yamabuki-no-Obi",legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}
	
	sets.midcast.Drain = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Incanter's Torque",ear1="Digni. Earring",ear2="Gwati Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Archon Ring",ring2="Evanescence Ring",
        back="Aurist's Cape +1",waist="Fucho-no-obi",legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}
    
    sets.midcast.Aspir = sets.midcast.Drain
		
    sets.midcast.Stun = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Amalric Coif +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		body="Inyanga Jubbah +2",hands="Volte Gloves",ring1="Kishar Ring",ring2="Stikini Ring +1",
		back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}
		
    sets.midcast.Stun.Resistant = {main="Daybreak",sub="Ammurapi Shield",ammo="Hasty Pinion +1",
		head="Amalric Coif +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Gwati Earring",
		body="Inyanga Jubbah +2",hands="Volte Gloves",ring1="Kishar Ring",ring2="Stikini Ring +1",
		back="Aurist's Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet=gear.merlinic_aspir_feet}
		
	sets.midcast['Enfeebling Magic'] = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Befouled Crown",neck="Erra Pendant",ear1="Digni. Earring",ear2="Gwati Earring",
		body=gear.merlinic_nuke_body,hands="Regal Cuffs",ring1="Kishar Ring",ring2="Stikini Ring +1",
		back="Aurist's Cape +1",waist="Luminary Sash",legs="Psycloth Lappas",feet="Uk'uxkaj Boots"}
		
	sets.midcast['Enfeebling Magic'].Resistant = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Befouled Crown",neck="Erra Pendant",ear1="Digni. Earring",ear2="Gwati Earring",
		body=gear.merlinic_nuke_body,hands="Regal Cuffs",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,waist="Luminary Sash",legs="Psycloth Lappas",feet="Skaoi Boots"}
		
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
		
	sets.midcast['Enhancing Magic'] = {main=gear.gada_enhancing_club,sub="Ammurapi Shield",ammo="Hasty Pinion +1",
		head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Perimede Cape",waist="Embla Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}
		
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Genmei Shield",head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})

    -- Avatar pact sets.  All pacts are Ability type.
    
    sets.midcast.Pet.BloodPactWard = {main="Espiritus",sub="Vox Grip",ammo="Epitaph",
        head="Convoker's Horn +3",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Lodurr Earring",
        body="Baayami Robe",hands="Baayami Cuffs",ring1="Evoker's Ring",ring2="Stikini Ring +1",
        back="Conveyance Cape",waist="Kobo Obi",legs="Baayami Slops",feet="Baayami Sabots"}

    sets.midcast.Pet.DebuffBloodPactWard = {main="Espiritus",sub="Vox Grip",ammo="Epitaph",
        head="C. Palug Crown",neck="Adad Amulet",ear1="Lugalbanda Earring",ear2="Enmerkar Earring",
        body="Con. Doublet +3",hands=gear.merlinic_magpact_hands,ring1="Evoker's Ring",ring2="C. Palug Ring",
        back=gear.magic_jse_back,waist="Incarnation Sash",legs="Tali'ah Sera. +2",feet="Convo. Pigaches +3"}
        
    sets.midcast.Pet.DebuffBloodPactWard.Acc = sets.midcast.Pet.DebuffBloodPactWard
    
    sets.midcast.Pet.PhysicalBloodPactRage = {main="Gridarvor",sub="Elan Strap +1",ammo="Epitaph",
        head="Helios Band",neck="Shulmanu Collar",ear1="Lugalbanda Earring",ear2="Gelos Earring",
        body="Con. Doublet +3",hands=gear.merlinic_physpact_hands,ring1="Varar Ring +1",ring2="C. Palug Ring",
        back=gear.phys_jse_back,waist="Incarnation Sash",legs="Apogee Slacks +1",feet="Apogee Pumps +1"}
		
    sets.midcast.Pet.PhysicalBloodPactRage.Acc = {feet="Convo. Pigaches +3"}

    sets.midcast.Pet.MagicalBloodPactRage = {main=gear.grioavolr_pet_staff,sub="Elan Strap +1",ammo="Epitaph",
        head="Apogee Crown +1",neck="Adad Amulet",ear1="Lugalbanda Earring",ear2="Gelos Earring",
        body="Con. Doublet +3",hands=gear.merlinic_magpact_hands,ring1="Varar Ring +1",ring2="Varar Ring +1",
        back=gear.magic_jse_back,waist="Regal Belt",legs="Enticer's Pants",feet="Apogee Pumps +1"}

    sets.midcast.Pet.MagicalBloodPactRage.Acc = {head="C. Palug Crown",feet="Convo. Pigaches +3"}

    -- Spirits cast magic spells, which can be identified in standard ways.
    
    sets.midcast.Pet.WhiteMagic = {} --legs="Summoner's Spats"
    
    sets.midcast.Pet['Elemental Magic'] = set_combine(sets.midcast.Pet.MagicalBloodPactRage, {}) --legs="Summoner's Spats"

    sets.midcast.Pet['Elemental Magic'].Resistant = {}
    
	sets.midcast.Pet['Impact'] = sets.midcast.Pet.DebuffBloodPactWard

	sets.midcast.Pet['Flaming Crush'] = {main=gear.grioavolr_pet_staff,sub="Elan Strap +1",ammo="Epitaph",
        head="Apogee Crown +1",neck="Adad Amulet",ear1="Lugalbanda Earring",ear2="Gelos Earring",
        body="Con. Doublet +3",hands=gear.merlinic_magpact_hands,ring1="Varar Ring +1",ring2="Varar Ring +1",
        back=gear.phys_jse_back,waist="Regal Belt",legs="Apogee Slacks +1",feet="Apogee Pumps +1"}
		
	sets.midcast.Pet['Flaming Crush'].Acc = {head="C. Palug Crown",feet="Convo. Pigaches +3"}
	
	sets.midcast.Pet['Mountain Buster'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Mountain Buster'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
	sets.midcast.Pet['Rock Buster'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Rock Buster'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
	sets.midcast.Pet['Crescent Fang'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Crescent Fang'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
	sets.midcast.Pet['Eclipse Bite'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Eclipse Bite'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
	sets.midcast.Pet['Blindside'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Blindside'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    -- Resting sets
    sets.resting = {main="Mpaca's Staff",sub="Umbra Strap",ammo="Staunch Tathlum +1",
        head="Beckoner's Horn +1",neck="Loricate Torque +1",ear1="C. Palug Earring",ear2="Ethereal Earring",
        body="Shomonjijoe +1",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Sheltered Ring",
        back="Umbra Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Baayami Sabots"}
    
    -- Idle sets
    sets.idle = {main="Mpaca's Staff",sub="Umbra Strap",ammo="Staunch Tathlum +1",
        head="Convoker's Horn +3",neck="Loricate Torque +1",ear1="C. Palug Earring",ear2="Ethereal Earring",
        body="Shomonjijoe +1",hands=gear.merlinic_refresh_hands,ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back="Umbra Cape",waist="Regal Belt",legs="Assid. Pants +1",feet="Baayami Sabots"}

    sets.idle.PDT = {main="Malignance Pole",sub="Umbra Strap",ammo="Staunch Tathlum +1",
        head="Convoker's Horn +3",neck="Loricate Torque +1",ear1="C. Palug Earring",ear2="Ethereal Earring",
        body="Shomonjijoe +1",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Regal Belt",legs="Assid. Pants +1",feet="Baayami Sabots"}
		
    -- perp costs:
    -- spirits: 7
    -- carby: 11 (5 with mitts)
    -- fenrir: 13
    -- others: 15
    -- avatar's favor: -4/tick
    
    -- Max useful -perp gear is 1 less than the perp cost (can't be reduced below 1)
    -- Aim for -14 perp, and refresh in other slots.
    
    -- Can make due without either the head or the body, and use +refresh items in those slots.
    
    sets.idle.Avatar = {main="Gridarvor",sub="Umbra Strap",ammo="Epitaph",
        head="Beckoner's Horn +1",neck="Caller's Pendant",ear1="C. Palug Earring",ear2="Evans Earring",
        body="Shomonjijoe +1",hands=gear.merlinic_refresh_hands,ring1="Evoker's Ring",ring2="Stikini Ring +1",
        back="Moonlight Cape",waist="Lucidity Sash",legs="Assid. Pants +1",feet="Convo. Pigaches +3"}
		
    sets.idle.PDT.Avatar = {main="Malignance Pole",sub="Umbra Strap",ammo="Epitaph",
        head="Beckoner's Horn +1",neck="Loricate Torque +1",ear1="C. Palug Earring",ear2="Evans Earring",
        body="Shomonjijoe +1",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Regal Belt",legs="Assid. Pants +1",feet="Convo. Pigaches +3"}

    sets.idle.Spirit = {main="Gridarvor",sub="Umbra Strap",ammo="Epitaph",
        head="Convoker's Horn +3",neck="Caller's Pendant",ear1="C. Palug Earring",ear2="Ethereal Earring",
        body="Shomonjijoe +1",hands=gear.merlinic_refresh_hands,ring1="Evoker's Ring",ring2="Stikini Ring +1",
        back="Conveyance Cape",waist="Lucidity Sash",legs="Assid. Pants +1",feet="Convo. Pigaches +3"}
		
    sets.idle.PDT.Spirit = {main="Malignance Pole",sub="Umbra Strap",ammo="Epitaph",
        head="Convoker's Horn +3",neck="Loricate Torque +1",ear1="C. Palug Earring",ear2="Evans Earring",
        body="Shomonjijoe +1",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
        back="Umbra Cape",waist="Lucidity Sash",legs="Assid. Pants +1",feet="Battlecast Gaiters"}
		
	--Favor always up and head is best in slot idle so no specific items here at the moment.
    sets.idle.Avatar.Favor = {}
    sets.idle.Avatar.Engaged = {}
	
	sets.idle.Avatar.Engaged.Carbuncle = {}
	sets.idle.Avatar.Engaged['Cait Sith'] = {}
        
    sets.perp = {}
    -- Caller's Bracer's halve the perp cost after other costs are accounted for.
    -- Using -10 (Gridavor, ring, Conv.feet), standard avatars would then cost 5, halved to 2.
    -- We can then use Hagondes Coat and end up with the same net MP cost, but significantly better defense.
    -- Weather is the same, but we can also use the latent on the pendant to negate the last point lost.
    sets.perp.Day = {}
    sets.perp.Weather = {}
	
	sets.perp.Carbuncle = {}
    sets.perp.Diabolos = {}
    sets.perp.Alexander = sets.midcast.Pet.BloodPactWard

	-- Not really used anymore, was for the days of specific staves for specific avatars.
    sets.perp.staff_and_grip = {}
    
    -- Defense sets
    sets.defense.PDT = {main="Malignance Pole",sub="Umbra Strap",ammo="Epitaph",
        head="Beckoner's Horn +1",neck="Loricate Torque +1",ear1="Handler's Earring +1",ear2="Enmerkar Earring",
        body="Shomonjijoe +1",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Regal Belt",legs="Assid. Pants +1",feet="Baayami Sabots"}

    sets.defense.MDT = {main="Malignance Pole",sub="Umbra Strap",ammo="Epitaph",
        head="Beckoner's Horn +1",neck="Loricate Torque +1",ear1="Handler's Earring +1",ear2="Enmerkar Earring",
        body="Shomonjijoe +1",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Regal Belt",legs="Assid. Pants +1",feet="Baayami Sabots"}

    sets.defense.MEVA = {main="Malignance Pole",sub="Enki Strap",ammo="Epitaph",
        head="Amalric Coif +1",neck="Warder's Charm +1",ear1="Lugalbanda Earring",ear2="Sanare Earring",
		body="Inyanga Jubbah +2",hands="Telchine Gloves",ring1="Vengeful Ring",Ring2="Purity Ring",
        back="Aurist's Cape +1",waist="Luminary Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}
		
    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.TPEat = {neck="Chrys. Torque"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	sets.HPDown = {head="Apogee Crown +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Seidr Cotehardie",hands="Hieros Mittens",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",legs="Apogee Slacks +1",feet="Apogee Pumps +1"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {neck="Sacrifice Torque"}

	-- Weapons sets
	sets.weapons.Gridarvor = {main="Gridarvor", sub="Elan Strap +1"}
	sets.weapons.Khatvanga = {main="Khatvanga",sub="Bloodrain Strap"}

    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
    --------------------------------------
    -- Engaged sets
    --------------------------------------
    
    -- Normal melee group
    sets.engaged = {main="Gridarvor",sub="Bloodrain Strap",ammo="Epitaph",
        head="Beckoner's Horn +1",neck="Shulmanu Collar",ear1="Digni. Earring",ear2="Telos Earring",
        body="Con. Doublet +3",hands="Gazu Bracelet +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back=gear.phys_jse_back,waist="Olseni Belt",legs="Assid. Pants +1",feet="Convo. Pigaches +3"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book(reset)
    if reset == 'reset' then
        -- lost pet, or tried to use pact when pet is gone
    end
    
    -- Default macro set/book
    set_macro_page(4, 17)
end