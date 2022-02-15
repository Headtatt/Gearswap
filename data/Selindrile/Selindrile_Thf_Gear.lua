-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal','DT')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Match','Normal','DT','SomeAcc','Acc','FullAcc','Fodder','Proc')
	state.IdleMode:options('Normal', 'Sphere')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Aeneas','Aeolian','Savage','ProcWeapons','Evisceration','Throwing','SwordThrowing','Bow')

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','Suppa','DWMax','Parry'}
	state.AmbushMode = M(false, 'Ambush Mode')

	gear.da_jse_back = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
	gear.wsd_jse_back = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}

    -- Additional local binds
    send_command('bind ^` input /ja "Flee" <me>')
    send_command('bind !` input /ra <t>')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind @f10 gs c toggle AmbushMode')
	send_command('bind ^backspace input /item "Thief\'s Tools" <t>')
	send_command('bind ^q gs c weapons ProcWeapons;gs c set WeaponSkillMode proc;')
	send_command('bind !q gs c weapons SwordThrowing')
	send_command('bind !backspace input /ja "Hide" <me>')
	send_command('bind ^r gs c weapons Default;gs c set WeaponSkillMode match') --Requips weapons and gear.
	send_command('bind !r gs c weapons MagicWeapons')
	send_command('bind ^\\\\ input /ja "Despoil" <t>')
	send_command('bind !\\\\ input /ja "Mug" <t>')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Special sets (required by rules)
    --------------------------------------

	sets.TreasureHunter = {hands="Plunderer's Armlets +1",waist="Chaac Belt",feet="Skulk. Poulaines +1"}
    sets.Kiting = {feet="Skd. Jambeaux +1"}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	
    sets.buff['Sneak Attack'] = {}
    sets.buff['Trick Attack'] = {"Pill. Armlets +3"}

    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
	sets.Suppa = {ear1="Suppanomimi", ear2="Sherida Earring"}
	sets.DWEarrings = {ear1="Dudgeon Earring",ear2="Heartseeker Earring"}
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",body="Adhemar Jacket +1",hands="Floral Gauntlets",waist="Reiki Yotai"}
	sets.Parry = {hands="Turms Mittens +1",ring1="Defending Ring"}
	sets.Ambush = {} --body="Plunderer's Vest +1"
	
	-- Weapons sets
	sets.weapons.Aeneas = {main="Aeneas",sub="Gleti's Knife"}
	sets.weapons.Aeolian = {main="Malevolence",sub="Malevolence"}
	sets.weapons.Savage = {main="Naegling",sub="Gleti's Knife"}
	sets.weapons.ProcWeapons = {main="Blurred Knife +1",sub="Atoyac"}
	sets.weapons.Evisceration = {main="Tauret",sub="Gleti's Knife"}
	sets.weapons.Throwing = {main="Aeneas",sub="Gleti's Knife",range="Raider's Bmrng.",ammo=empty}
	sets.weapons.SwordThrowing = {main="Naegling",sub="Gleti's Knife",range="Raider's Bmrng.",ammo=empty}
	sets.weapons.Bow = {main="Aeneas",sub="Kustawi +1",range="Kaja Bow",ammo="Chapuli Arrow"}
	
    -- Actions we want to use to tag TH.
    sets.precast.Step = {ammo="C. Palug Stone",
        head="Malignance Chapeau",neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Odr Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back=gear.da_jse_back,waist="Olseni Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.precast.JA['Violent Flourish'] = {ammo="C. Palug Stone",
        head="Malignance Chapeau",neck="Combatant's Torque",ear1="Digni. Earring",ear2="Odr Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back=gear.da_jse_back,waist="Olseni Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.precast.JA['Animated Flourish'] = sets.TreasureHunter
	sets.precast.JA.Provoke = sets.TreasureHunter

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Collaborator'] = {"Skulker's Bonnet"}
    sets.precast.JA['Accomplice'] = {"Skulker's Bonnet"}
    sets.precast.JA['Flee'] = {} --feet="Pillager's Poulaines +1"
    sets.precast.JA['Hide'] = {body="Pillager's Vest +3"}
    sets.precast.JA['Conspirator'] = {body="Skulker's Vest"} 
    sets.precast.JA['Steal'] = {} --feet="Pillager's Poulaines +1"
	sets.precast.JA['Mug'] = {}
    sets.precast.JA['Despoil'] = {legs="Skulker's Culottes",feet="Skulk. Poulaines +1"}
    sets.precast.JA['Perfect Dodge'] = {hands="Plunderer's Armlets +1"}
    sets.precast.JA['Feint'] = {} -- {legs="Assassin's Culottes +2"}

    sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
    sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Yamarang",
        head="Mummu Bonnet +2",neck="Unmoving Collar +1",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
        body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonlight Cape",waist="Chaac Belt",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}

	sets.Self_Waltz = {head="Mummu Bonnet +2",body="Passion Jacket",ring1="Asklepian Ring"}
		
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}


    -- Fast cast sets for spells
    sets.precast.FC = {ammo="Impatiens",
		head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Dread Jupon",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Prolix Ring",
		legs="Rawhide Trousers"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})


    -- Ranged snapshot gear
    sets.precast.RA = {}


    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="C. Palug Stone",
        head="Pill. Bonnet +3",neck="Caro Necklace",ear1="Brutal Earring",ear2="Sherida Earring",
        body="Adhemar Jacket +1",hands="Meg. Gloves +2",ring1="Ilabrat Ring",ring2="Regal Ring",
        back=gear.da_jse_back,waist="Grunfeld Rope",legs="Samnuha Tights",feet=gear.herculean_wsd_feet}
    sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {neck="Combatant's Torque"})
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Odr Earring",body="Meg. Cuirie +2",waist="Olseni Belt",legs="Meg. Chausses +2",feet="Malignance Boots"})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Odr Earring",body="Meg. Cuirie +2",waist="Olseni Belt",legs="Meg. Chausses +2",feet="Malignance Boots"})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {neck="Caro Necklace",ear1="Moonshade Earring",ear2="Odr Earring",back=gear.wsd_jse_back})
    sets.precast.WS["Rudra's Storm"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {neck="Caro Necklace",ear1="Moonshade Earring",body="Meg. Cuirie +2",back=gear.wsd_jse_back})
    sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS.Acc, {ear1="Moonshade Earring",body="Meg. Cuirie +2",back=gear.wsd_jse_back})
	sets.precast.WS["Rudra's Storm"].FullAcc = set_combine(sets.precast.WS.FullAcc, {back=gear.wsd_jse_back})
    sets.precast.WS["Rudra's Storm"].Fodder = set_combine(sets.precast.WS["Rudra's Storm"], {body=gear.herculean_wsd_body})
	sets.precast.WS["Rudra's Storm"].DT = set_combine(sets.precast.WS["Rudra's Storm"],{neck="Loricate Torque +1",ring1="Defending Ring",ring2="Dark Ring"})
    sets.precast.WS["Rudra's Storm"].SA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila +1",body="Meg. Cuirie +2",legs="Pill. Culottes +3"})
    sets.precast.WS["Rudra's Storm"].TA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila +1",body="Meg. Cuirie +2",hands="Pill. Armlets +3",legs="Pill. Culottes +3"})
    sets.precast.WS["Rudra's Storm"].SATA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila +1",body="Meg. Cuirie +2",hands="Pill. Armlets +3",legs="Pill. Culottes +3"})

    sets.precast.WS["Mandalic Stab"] = set_combine(sets.precast.WS, {neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",body="Meg. Cuirie +2",back=gear.wsd_jse_back})
    sets.precast.WS["Mandalic Stab"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {neck="Caro Necklace",ear1="Moonshade Earring",body="Meg. Cuirie +2",back=gear.wsd_jse_back})
    sets.precast.WS["Mandalic Stab"].Acc = set_combine(sets.precast.WS.Acc, {ear1="Moonshade Earring",body="Meg. Cuirie +2",back=gear.wsd_jse_back})
	sets.precast.WS["Mandalic Stab"].FullAcc = set_combine(sets.precast.WS.FullAcc, {back=gear.wsd_jse_back})
    sets.precast.WS["Mandalic Stab"].Fodder = set_combine(sets.precast.WS["Mandalic Stab"], {ammo="C. Palug Stone",body=gear.herculean_wsd_body})
    sets.precast.WS["Mandalic Stab"].SA = set_combine(sets.precast.WS["Mandalic Stab"].Fodder, {ammo="Yetshila +1",head="Adhemar Bonnet +1",body="Meg. Cuirie +2",legs="Pill. Culottes +3"})
    sets.precast.WS["Mandalic Stab"].TA = set_combine(sets.precast.WS["Mandalic Stab"].Fodder, {ammo="Yetshila +1",head="Adhemar Bonnet +1",body="Meg. Cuirie +2",hands="Pill. Armlets +3",legs="Pill. Culottes +3"})
    sets.precast.WS["Mandalic Stab"].SATA = set_combine(sets.precast.WS["Mandalic Stab"].Fodder, {ammo="Yetshila +1",head="Adhemar Bonnet +1",body="Meg. Cuirie +2",hands="Pill. Armlets +3",legs="Pill. Culottes +3"})

    sets.precast.WS["Shark Bite"] = set_combine(sets.precast.WS, {neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",body="Meg. Cuirie +2",back=gear.wsd_jse_back})
    sets.precast.WS["Shark Bite"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {neck="Caro Necklace",ear1="Moonshade Earring",body="Meg. Cuirie +2",back=gear.wsd_jse_back})
    sets.precast.WS["Shark Bite"].Acc = set_combine(sets.precast.WS.Acc, {ear1="Moonshade Earring",body="Meg. Cuirie +2",back=gear.wsd_jse_back})
	sets.precast.WS["Shark Bite"].FullAcc = set_combine(sets.precast.WS.FullAcc, {back=gear.wsd_jse_back})
    sets.precast.WS["Shark Bite"].Fodder = set_combine(sets.precast.WS["Shark Bite"], {ammo="C. Palug Stone",body=gear.herculean_wsd_body})
    sets.precast.WS["Shark Bite"].SA = set_combine(sets.precast.WS["Shark Bite"].Fodder, {ammo="Yetshila +1",body="Meg. Cuirie +2",legs="Pill. Culottes +3"})
    sets.precast.WS["Shark Bite"].TA = set_combine(sets.precast.WS["Shark Bite"].Fodder, {ammo="Yetshila +1",body="Meg. Cuirie +2",hands="Pill. Armlets +3",legs="Pill. Culottes +3"})
    sets.precast.WS["Shark Bite"].SATA = set_combine(sets.precast.WS["Shark Bite"].Fodder, {ammo="Yetshila +1",body="Meg. Cuirie +2",hands="Pill. Armlets +3",legs="Pill. Culottes +3"})
	
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {ammo="Yetshila +1",head="Adhemar Bonnet +1",ear1="Moonshade Earring",ear2="Odr Earring",neck="Fotia Gorget",body="Abnoba Kaftan",hands="Mummu Wrists +2",ring1="Begrudging Ring",waist="Fotia Belt",legs="Pill. Culottes +3",feet="Mummu Gamash. +2"})
    sets.precast.WS['Evisceration'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ammo="Yetshila +1",head="Adhemar Bonnet +1",ear1="Moonshade Earring",ear2="Odr Earring",neck="Fotia Gorget",body="Abnoba Kaftan",hands="Mummu Wrists +2",ring1="Begrudging Ring",waist="Fotia Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
    sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Yetshila +1",head="Mummu Bonnet +2",ring1="Begrudging Ring",neck="Fotia Gorget",body="Sayadio's Kaftan",hands="Mummu Wrists +2",waist="Fotia Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS['Evisceration'].FullAcc = set_combine(sets.precast.WS.FullAcc, {ammo="Yetshila +1",head="Mummu Bonnet +2",body="Mummu Jacket +2",hands="Mummu Wrists +2",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS['Evisceration'].Fodder = set_combine(sets.precast.WS['Evisceration'], {})
	
    sets.precast.WS["Savage Blade"] = set_combine(sets.precast.WS, {neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",body="Adhemar Jacket +1",back=gear.wsd_jse_back,waist="Sailfi Belt +1"})
    sets.precast.WS["Savage Blade"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {neck="Caro Necklace",ear1="Moonshade Earring",body="Meg. Cuirie +2",back=gear.wsd_jse_back})
    sets.precast.WS["Savage Blade"].Acc = set_combine(sets.precast.WS.Acc, {ear1="Moonshade Earring",body="Meg. Cuirie +2",back=gear.wsd_jse_back})
	sets.precast.WS["Savage Blade"].FullAcc = set_combine(sets.precast.WS.FullAcc, {back=gear.wsd_jse_back})
    sets.precast.WS["Savage Blade"].Fodder = set_combine(sets.precast.WS["Savage Blade"],{ammo="C. Palug Stone",body=gear.herculean_wsd_body,waist="Sailfi Belt +1"})
	sets.precast.WS["Savage Blade"].DT = set_combine(sets.precast.WS["Savage Blade"],{neck="Loricate Torque +1",ring1="Defending Ring",ring2="Dark Ring"})
    sets.precast.WS["Savage Blade"].SA = set_combine(sets.precast.WS["Savage Blade"].Fodder, {ammo="Yetshila +1",body="Meg. Cuirie +2",legs="Pill. Culottes +3"})
    sets.precast.WS["Savage Blade"].TA = set_combine(sets.precast.WS["Savage Blade"].Fodder, {ammo="Yetshila +1",body="Meg. Cuirie +2",legs="Pill. Culottes +3"})
    sets.precast.WS["Savage Blade"].SATA = set_combine(sets.precast.WS["Savage Blade"].Fodder, {ammo="Yetshila +1",body="Meg. Cuirie +2",legs="Pill. Culottes +3"})

    sets.precast.WS.Proc = {ammo="Yamarang",
        head="Malignance Chapeau",neck="Voltsurge Torque",ear1="Digni. Earring",ear2="Heartseeker Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Varar Ring +1",ring2="Varar Ring +1",
        back="Ground. Mantle +1",waist="Olseni Belt",legs="Malignance Tights",feet="Malignance Boots"}

    sets.precast.WS['Last Stand'] = {
        head="Pill. Bonnet +3",neck="Fotia Gorget",ear1="Telos Earring",ear2="Enervating Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Apate Ring",ring2="Regal Ring",
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.precast.WS['Empyreal Arrow'] = {
        head="Pill. Bonnet +3",neck="Fotia Gorget",ear1="Telos Earring",ear2="Enervating Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Apate Ring",ring2="Regal Ring",
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.precast.WS['Aeolian Edge'] = {ammo="Seeth. Bomblet +1",
        head=gear.herculean_nuke_head,neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Crematio Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Metamor. Ring +1",ring2="Shiva Ring +1",
        back=gear.wsd_jse_back,waist="Chaac Belt",legs="Nyame Flanchard",feet=gear.herculean_nuke_feet}

    sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring",ear2="Sherida Earring"}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Sherida Earring"}

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Defending Ring",ring2="Prolix Ring",
        back="Moonlight Cape",waist="Tempus Fugit",legs="Rawhide Trousers",feet="Malignance Boots"}

    -- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})

	sets.midcast.Dia = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)

    -- Ranged gear

    sets.midcast.RA = {
        head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Apate Ring",ring2="Regal Ring",
        back=gear.da_jse_back,waist="Chaac Belt",legs="Malignance Tights",feet="Malignance Boots"}

    sets.midcast.RA.Acc = {
        head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Apate Ring",ring2="Regal Ring",
        back=gear.da_jse_back,waist="Chaac Belt",legs="Malignance Tights",feet="Malignance Boots"}

    --------------------------------------
    -- Idle/resting/defense sets
    --------------------------------------

    -- Resting sets
    sets.resting = {}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.idle.Sphere = set_combine(sets.idle, {body="Mekosu. Harness"})

    sets.idle.Weak = set_combine(sets.idle, {})

	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.ExtraRegen = {hands="Turms Mittens +1"}

    -- Defense sets

    sets.defense.PDT = {ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back="Shadow Mantle",waist="Flume Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

    sets.defense.MDT = {ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Shadow Ring",
        back="Engulfer Cape +1",waist="Engraved Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.defense.MEVA = {ammo="Staunch Tathlum +1",
		head=gear.herculean_fc_head,neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Adhemar Jacket +1",hands="Malignance Gloves",ring1="Vengeful Ring",ring2="Purity Ring",
		back="Mujin Mantle",waist="Engraved Belt",legs="Malignance Tights",feet="Malignance Boots"}


    --------------------------------------
    -- Melee sets  
    --------------------------------------

    -- Normal melee group
    sets.engaged = {ammo="Aurgelmir Orb +1",
        head="Dampening Tam",neck="Iskur Gorget",ear1="Dedition Earring",ear2="Sherida Earring",
        body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Gere Ring",ring2="Epona's Ring",
        back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}
		
    sets.engaged.SomeAcc = {ammo="Aurgelmir Orb +1",
        head="Dampening Tam",neck="Combatant's Torque",ear1="Brutal Earring",ear2="Sherida Earring",
        body="Pillager's Vest +3",hands="Adhemar Wrist. +1",ring1="Gere Ring",ring2="Epona's Ring",
        back=gear.da_jse_back,waist="Reiki Yotai",legs="Samnuha Tights",feet=gear.herculean_ta_feet}
    
	sets.engaged.Acc = {ammo="Yamarang",
        head="Pill. Bonnet +3",neck="Combatant's Torque",ear1="Telos Earring",ear2="Sherida Earring",
        body="Pillager's Vest +3",hands="Floral Gauntlets",ring1="Ilabrat Ring",ring2="Regal Ring",
        back=gear.da_jse_back,waist="Olseni Belt",legs="Pill. Culottes +3",feet="Malignance Boots"}
		
    sets.engaged.FullAcc = {ammo="C. Palug Stone",
        head="Pill. Bonnet +3",neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Odr Earring",
        body="Pillager's Vest +3",hands="Pill. Armlets +3",ring1="Ramuh Ring +1",ring2="Regal Ring",
        back=gear.da_jse_back,waist="Olseni Belt",legs="Pill. Culottes +3",feet="Malignance Boots"}

    sets.engaged.Fodder = {ammo="Aurgelmir Orb +1",
        head="Dampening Tam",neck="Iskur Gorget",ear1="Dedition Earring",ear2="Sherida Earring",
        body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Gere Ring",ring2="Epona's Ring",
        back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}

    sets.engaged.DT = {ammo="Aurgelmir Orb +1",
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Sherida Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back=gear.da_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}

    sets.engaged.SomeAcc.DT = {ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Suppanomimi",ear2="Sherida Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.engaged.Acc.DT = {ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Suppanomimi",ear2="Odr Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}

    sets.engaged.FullAcc.DT = {ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Suppanomimi",ear2="Odr Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.engaged.Fodder.DT = {ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Suppanomimi",ear2="Sherida Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(8, 5)
    elseif player.sub_job == 'WAR' then
        set_macro_page(7, 5)
    elseif player.sub_job == 'NIN' then
        set_macro_page(10, 5)
    else
        set_macro_page(6, 5)
    end
end

function user_job_lockstyle()
	if player.equipment.main == nil or player.equipment.main == 'empty' then
		windower.chat.input('/lockstyleset 001')
	elseif res.items[item_name_to_id(player.equipment.main)].skill == 3 then --Sword in main hand.
		if player.equipment.sub == nil or player.equipment.sub == 'empty' then --Sword/Nothing.
				windower.chat.input('/lockstyleset 007')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Sword/Dagger.
			windower.chat.input('/lockstyleset 007')
		else
			windower.chat.input('/lockstyleset 007') --Catchall just in case something's weird.
		end
	elseif res.items[item_name_to_id(player.equipment.main)].skill == 2 then --Dagger in main hand.
		if player.equipment.sub == nil or player.equipment.sub == 'empty' then --Dagger/Nothing.
			windower.chat.input('/lockstyleset 008')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Dagger/Dagger.
			windower.chat.input('/lockstyleset 008')
		else
			windower.chat.input('/lockstyleset 008') --Catchall just in case something's weird.
		end
	end
end

autows_list = {['Aeneas']="Rudra's Storm",['Aeolian']='Aeolian Edge',['Savage']='Savage Blade',['Throwing']="Rudra's Storm",['SwordThrowing']='Savage Blade',['Evisceration']='Evisceration',['ProcWeapons']='Wasp Sting',['Bow']='Empyreal Arrow'}