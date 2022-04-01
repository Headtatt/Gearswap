-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
	state.OffenseMode:options('Normal','Acc')
	state.HybridMode:options('Normal','DTLite','DT')
	state.RangedMode:options('Normal','Acc','Fodder')
	state.WeaponskillMode:options('Match','Normal', 'Acc')
	state.IdleMode:options('Normal', 'PDT')
	state.Weapons:options('Default','DualWeapons','DualSavageWeapons','DualEviscerationWeapons','DualMagicWeapons','DualMalevolence')
	
	--Ikenga_vest_bonus = 190  -- It is 190 at R20. Uncomment if you need to manually adjust because you are using below R20
	
	WeaponType =  {['Fail-Not'] = "Bow",
                   ['Fomalhaut'] = "Gun",
				   ['Ataktos'] = "Gun",
                   }

	DefaultAmmo = {
		['Bow']  = {['Default'] = "Eminent Arrow",
					['WS'] = "Eminent Arrow",
					['Acc'] = "Eminent Arrow",
					['Magic'] = "Eminent Arrow",
					['MagicAcc'] = "Eminent Arrow",
					['Unlimited'] = "Hauksbok Arrow",
					['MagicUnlimited'] ="Hauksbok Arrow",
					['MagicAccUnlimited'] ="Hauksbok Arrow"},
					
		['Gun']  = {['Default'] = "Chrono Bullet",
					['WS'] = "Chrono Bullet",
					['Acc'] = "Chrono Bullet",
					['Magic'] = "Orichalc. Bullet",
					['MagicAcc'] = "Orichalc. Bullet",
					['Unlimited'] = "Hauksbok Bullet",
					['MagicUnlimited'] = "Hauksbok Bullet",
					['MagicAccUnlimited'] ="Animikii Bullet"},
					
		['Crossbow'] = {['Default'] = "Eminent Bolt",
						['WS'] = "Eminent Bolt",
						['Acc'] = "Eminent Bolt",
						['Magic'] = "Eminent Bolt",
						['MagicAcc'] = "Eminent Bolt",
						['Unlimited'] = "Hauksbok Bolt",
						['MagicUnlimited'] = "Hauksbok Bolt",
						['MagicAccUnlimited'] ="Hauksbok Bolt"}
	}
	
	gear.tp_ranger_jse_back = {name="Belenus's Cape",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}}
	gear.wsd_ranger_jse_back = {name="Belenus's Cape",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}}
	gear.snapshot_jse_back = {name="Belenus's Cape",augments={'"Snapshot"+10',}}
	
	    -- Additional local binds
    send_command('bind !` input /ra <t>')
	send_command('bind !backspace input /ja "Bounty Shot" <t>')
	send_command('bind @f7 gs c toggle RngHelper')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind !r gs c weapons MagicWeapons;gs c update')
	send_command('bind ^q gs c weapons SingleWeapon;gs c update')
	
	select_default_macro_book()

end

-- Set up all gear sets.
function init_gear_sets()
	--------------------------------------
	-- Precast sets
	--------------------------------------

	
	
	-- Precast sets to enhance JAs
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.precast.JA['Bounty Shot'] = set_combine(sets.TreasureHunter, {hands="Amini Glove. +1"})
	sets.precast.JA['Camouflage'] = {body="Orion Jerkin +1"}
	sets.precast.JA['Scavenge'] = {feet="Orion Socks +1"}
	sets.precast.JA['Shadowbind'] = {hands="Orion Bracers +1"}
	sets.precast.JA['Sharpshot'] = {legs="Orion Braccae +3"}
	sets.precast.JA['Double Shot'] = {back=gear.tp_ranger_jse_back}


	-- Fast cast sets for spells

    sets.precast.FC = {
        head="Carmine Mask +1",neck="Baetyl Pendant",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Prolix Ring",ring2="Lebeche Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Rawhide Trousers",feet="Carmine Greaves +1"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})


	-- Ranged sets (snapshot)
	
	sets.precast.RA = {
		head="Amini Gapette +1", --7
		body="Amini Caban +1",hands="Carmine Fin. Ga. +1",ring1="Crepuscular Ring", --11
		back=gear.snapshot_jse_back,waist="Impulse Belt",legs="Orion Braccae +3",feet="Meg. Jam. +2"} --38
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {head="Orion Beret +3",waist="Yemaya Belt",legs="Adhemar Kecks +1"})


	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Orion Beret +3",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Telos Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Dingir Ring",
        back=gear.wsd_ranger_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}
		
    sets.precast.WS.Acc = {
        head="Orion Beret +3",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Telos Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Dingir Ring",
        back=gear.wsd_ranger_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}

    sets.precast.WS['Wildfire'] = {
        head="Orion Beret +3",neck="Baetyl Pendant",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Samnuha Coat",hands="Carmine Fin. Ga. +1",ring1="Regal Ring",ring2="Dingir Ring",
        back=gear.wsd_ranger_jse_back,waist="Eschan Stone",legs="Gyve Trousers",feet=gear.herculean_nuke_feet}

    sets.precast.WS['Wildfire'].Acc = {
        head="Orion Beret +3",neck="Sanctity Necklace",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Samnuha Coat",hands="Leyline Gloves",ring1="Regal Ring",ring2="Dingir Ring",
        back=gear.wsd_ranger_jse_back,waist="Eschan Stone",legs="Gyve Trousers",feet=gear.herculean_nuke_feet}
		
    sets.precast.WS['Aeolian Edge'] = {
        head=gear.herculean_nuke_head,neck="Sanctity Necklace",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Samnuha Coat",hands="Leyline Gloves",ring1="Metamor. Ring +1",ring2="Dingir Ring",
        back=gear.wsd_ranger_jse_back,waist="Eschan Stone",legs="Gyve Trousers",feet=gear.herculean_nuke_feet}
		
    sets.precast.WS['Trueflight'] = {
        head="Orion Beret +3",neck="Baetyl Pendant",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Samnuha Coat",hands="Carmine Fin. Ga. +1",ring1="Regal Ring",ring2="Dingir Ring",
        back=gear.wsd_ranger_jse_back,waist="Eschan Stone",legs="Gyve Trousers",feet=gear.herculean_nuke_feet}

    sets.precast.WS['Trueflight'].Acc = {
        head="Orion Beret +3",neck="Sanctity Necklace",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Samnuha Coat",hands="Leyline Gloves",ring1="Regal Ring",ring2="Dingir Ring",
        back=gear.wsd_ranger_jse_back,waist="Eschan Stone",legs="Gyve Trousers",feet=gear.herculean_nuke_feet}
		
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


	--------------------------------------
	-- Midcast sets
	--------------------------------------

	-- Fast recast for spells
	
    sets.midcast.FastRecast = {
        head="Carmine Mask +1",neck="Baetyl Pendant",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Rawhide Trousers",feet="Carmine Greaves +1"}
		
	-- Ranged sets

    sets.midcast.RA = {
        head="Malignance Chapeau",neck="Iskur Gorget",ear1="Enervating Earring",ear2="Telos Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Crepuscular Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Yemaya Belt",legs="Malignance Tights",feet="Malignance Boots"}
	
    sets.midcast.RA.Acc = {
        head="Malignance Chapeau",neck="Iskur Gorget",ear1="Enervating Earring",ear2="Telos Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Yemaya Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.midcast.RA.Fodder = {
        head="Malignance Chapeau",neck="Iskur Gorget",ear1="Dedition Earring",ear2="Telos Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Crepuscular Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Yemaya Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
	--These sets will overlay based on accuracy level, regardless of other options.
	sets.buff.Camouflage = {body="Orion Jerkin +1"}
	sets.buff.Camouflage.Acc = {}
	sets.buff['Double Shot'] = {back=gear.tp_ranger_jse_back}
	sets.buff['Double Shot'].Acc = {}
	sets.buff.Barrage = {hands="Orion Bracers +1"}
	
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
    sets.midcast.Utsusemi = sets.midcast.FastRecast
	
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {}

	-- Idle sets
    sets.idle = {
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Sanare Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Carrier's Sash",legs="Malignance Tights",feet="Malignance Boots"}
    
    -- Defense sets
    sets.defense.PDT = {
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Sanare Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

    sets.defense.MDT = {
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Sanare Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Shadow Ring",
        back="Moonlight Cape",waist="Carrier's Sash",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.defense.MEVA = {
        head="Malignance Chapeau",neck="Warder's Charm +1",ear1="Genmei Earring",ear2="Sanare Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Vengeful Ring",
        back="Moonlight Cape",waist="Carrier's Sash",legs="Malignance Tights",feet="Malignance Boots"}

    sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.BulletPouch = {waist="Chr. Bul. Pouch"}
	
	-- Weapons sets
	sets.weapons.Default = {main="Kustawi +1",sub="Nusku Shield",range="Fomalhaut"}
	sets.weapons.DualWeapons = {main="Kustawi +1",sub="Kustawi",range="Fomalhaut"}
	sets.weapons.DualSavageWeapons = {main="Naegling",sub="Blurred Knife +1",range="Fomalhaut"}
	sets.weapons.DualEviscerationWeapons = {main="Tauret",sub="Blurred Knife +1",range="Fomalhaut"}
	sets.weapons.DualMalevolence = {main="Malevolence",sub="Malevolence",range="Fomalhaut"}
	sets.weapons.DualMagicWeapons = {main="Tauret",sub="Naegling",range="Fomalhaut"}

	--------------------------------------
	-- Engaged sets
	--------------------------------------

    -- Normal melee group
    sets.engaged = {
		head="Dampening Tam",neck="Iskur Gorget",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Malignance Tabard",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Petrov Ring",
		back=gear.tp_ranger_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}
    
    sets.engaged.Acc = {
		head="Dampening Tam",neck="Combatant's Torque",ear1="Cessance Earring",ear2="Telos Earring",
		body="Malignance Tabard",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Petrov Ring",
		back=gear.tp_ranger_jse_back,waist="Olseni Belt",legs="Samnuha Tights",feet="Malignance Boots"}

    sets.engaged.DTLite = {
		head="Malignance Chapeau",neck="Iskur Gorget",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Petrov Ring",
		back=gear.tp_ranger_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.engaged.DT = {
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Dark Ring",
		back=gear.tp_ranger_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

    sets.engaged.DW = {
		head="Dampening Tam",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Adhemar Jacket +1",hands="Floral Gauntlets",ring1="Epona's Ring",ring2="Petrov Ring",
		back=gear.tp_ranger_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}
		
    sets.engaged.DW.DT = {
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Suppanomimi",ear2="Brutal Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Dark Ring",
		back=gear.tp_ranger_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
    
    sets.engaged.DW.Acc = {
		head="Dampening Tam",neck="Combatant's Torque",ear1="Digni. Earring",ear2="Telos Earring",
		body="Adhemar Jacket +1",hands="Floral Gauntlets",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back=gear.tp_ranger_jse_back,waist="Olseni Belt",legs="Meg. Chausses +2",feet="Malignance Boots"}

	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'NIN' then
        set_macro_page(1, 19)
    elseif player.sub_job == 'DNC' then
		set_macro_page(1, 19)
    elseif player.sub_job == 'DRG' then
        set_macro_page(3, 19)
    else
        set_macro_page(1, 19)
    end
end
