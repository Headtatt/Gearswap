function user_job_setup()

    -- Options: Override default values	
	state.OffenseMode:options('Normal','Acc')
    state.HybridMode:options('Tank','DDTank','Normal')
    state.WeaponskillMode:options('Match','Normal', 'Acc')
    state.CastingMode:options('Normal','SIRD')
	state.Passive:options('None','AbsorbMP')
    state.PhysicalDefenseMode:options('PDT_HP','PDT','PDT_Reraise')
    state.MagicalDefenseMode:options('MDT_HP','MDT','MDT_Reraise')
	state.ResistDefenseMode:options('MEVA_HP','MEVA')
	state.IdleMode:options('Tank','Kiting','PDT','Block','MDT','Normal')
	state.Weapons:options('None','SakpataAegis','SakpataOchain','NaeglingBlurred','ClubOchain')
	
    state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None','MP','Twilight'}
	
	gear.fastcast_jse_back = {name="Rudianos's Mantle",augments={'INT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10',}}
	gear.enmity_jse_back = {name="Rudianos's Mantle",augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10',}}

	-- Additional local binds
	send_command('bind !` gs c SubJobEnmity')
	send_command('bind ^backspace input /ja "Shield Bash" <t>')
	send_command('bind @backspace input /ja "Cover" <stpt>')
	send_command('bind !backspace input /ja "Sentinel" <me>')
	send_command('bind @= input /ja "Chivalry" <me>')
	send_command('bind != input /ja "Palisade" <me>')
	send_command('bind ^delete input /ja "Provoke" <stnpc>')
	send_command('bind !delete input /ma "Cure IV" <stal>')
	send_command('bind @delete input /ma "Flash" <stnpc>')
    send_command('bind !f11 gs c cycle ExtraDefenseMode')
	send_command('bind @` gs c cycle RuneElement')
	send_command('bind ^pause gs c toggle AutoRuneMode')
	send_command('bind ^q gs c set IdleMode Kiting')
	send_command('bind !q gs c set IdleMode PDT')
	send_command('bind @f8 gs c toggle AutoTankMode')
	send_command('bind @f10 gs c toggle TankAutoDefense')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	
    select_default_macro_book()
    update_defense_mode()
end

function init_gear_sets()
	
	--------------------------------------
	-- Precast sets
	--------------------------------------
	
    sets.Enmity = {main="Sakpata's Sword",sub="Ochain",ammo="Paeapua",
        head="Loess Barbuta +1",neck="Moonlight Necklace",ear1="Friomisi Earring",ear2="Trux Earring",
        body="Souv. Cuirass +1",hands="Macabre Gaunt. +1",ring1="Apeile Ring +1",ring2="Apeile Ring",
        back=gear.enmity_jse_back,waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Eschite Greaves"}
		
    sets.Enmity.SIRD = {main="Sakpata's Sword",sub="Sacro Bulwark",ammo="Staunch Tathlum +1",
		head="Loess Barbuta +1",neck="Moonlight Necklace",ear1="Friomisi Earring",ear2="Trux Earring",
		body="Souv. Cuirass +1",hands="Macabre Gaunt. +1",ring1="Apeile Ring +1",ring2="Moonlight Ring",
		back=gear.enmity_jse_back,waist="Rumination Sash",legs="Founder's Hose",feet="Odyssean Greaves"}
		
    sets.Enmity.DT = {ammo="Staunch Tathlum +1",
        head="Souv. Schaller +1",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Rev. Surcoat +3",hands="Souv. Handsch. +1",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
    -- Precast sets to enhance JAs
    sets.precast.JA['Invincible'] = set_combine(sets.Enmity,{legs="Cab. Breeches +1"})
    sets.precast.JA['Holy Circle'] = set_combine(sets.Enmity,{feet="Rev. Leggings +3"})
    sets.precast.JA['Sentinel'] = set_combine(sets.Enmity,{feet="Cab. Leggings +1"})
    sets.precast.JA['Rampart'] = set_combine(sets.Enmity,{}) --head="Valor Coronet" (Also Vit?)
    sets.precast.JA['Fealty'] = set_combine(sets.Enmity,{body="Cab. Surcoat +1"})
    sets.precast.JA['Divine Emblem'] = set_combine(sets.Enmity,{feet="Chev. Sabatons +1"})
    sets.precast.JA['Cover'] = set_combine(sets.Enmity, {body="Cab. Surcoat +1"}) --head="Rev. Coronet +1",
	
    sets.precast.JA['Invincible'].DT = set_combine(sets.Enmity.DT,{legs="Cab. Breeches +1"})
    sets.precast.JA['Holy Circle'].DT = set_combine(sets.Enmity.DT,{feet="Rev. Leggings +3"})
    sets.precast.JA['Sentinel'].DT = set_combine(sets.Enmity.DT,{feet="Cab. Leggings +1"})
    sets.precast.JA['Rampart'].DT = set_combine(sets.Enmity.DT,{}) --head="Valor Coronet" (Also Vit?)
    sets.precast.JA['Fealty'].DT = set_combine(sets.Enmity.DT,{body="Cab. Surcoat +1"})
    sets.precast.JA['Divine Emblem'].DT = set_combine(sets.Enmity.DT,{feet="Chev. Sabatons +1"})
    sets.precast.JA['Cover'].DT = set_combine(sets.Enmity.DT, {body="Cab. Surcoat +1"}) --head="Rev. Coronet +1",
	
    -- add mnd for Chivalry
    sets.precast.JA['Chivalry'] = {ammo="Paeapua",
		head="Nyame Helm",neck="Unmoving Collar +1",ear1="Nourish. Earring",ear2="Nourish. Earring +1",
		body="Rev. Surcoat +3",hands="Cab. Gauntlets +1",ring1="Stikini Ring +1",ring2="Rufescent Ring",
		back=gear.enmity_jse_back,waist="Luminary Sash",legs="Nyame Flanchard",feet="Carmine Greaves +1"}
		
    sets.precast.JA['Chivalry'].DT = {ammo="Paeapua",
		head="Nyame Helm",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
		body="Rev. Surcoat +3",hands="Cab. Gauntlets +1",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
		back="Moonlight Cape",waist="Luminary Sash",legs="Nyame Flanchard",feet="Carmine Greaves +1"}

	sets.precast.JA['Shield Bash'] = set_combine(sets.Enmity, {hands="Cab. Gauntlets +1"})		
    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Palisade'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Intervene'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
	
	sets.precast.JA['Shield Bash'].DT = set_combine(sets.Enmity.DT, {hands="Cab. Gauntlets +1"})		
    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Palisade'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Intervene'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Aurgelmir Orb +1",
		head="Nyame Helm",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
		body="Rev. Surcoat +3",hands="Regal Gauntlets",ring1="Asklepian Ring",ring2="Valseur's Ring",
		back="Moonlight Cape",waist="Chaac Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    
    sets.precast.Step = {ammo="Aurgelmir Orb +1",
        head="Carmine Mask +1",neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Telos Earring",
        body="Flamma Korazin +2",hands="Regal Gauntlets",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back="Ground. Mantle +1",waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Flam. Gambieras +2"}
		
	sets.precast.JA['Violent Flourish'] = {ammo="Aurgelmir Orb +1",
        head="Flam. Zucchetto +2",neck="Erra Pendant",ear1="Gwati Earring",ear2="Digni. Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Defending Ring",ring2="Stikini Ring +1",
        back="Ground. Mantle +1",waist="Olseni Belt",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
		
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    -- Fast cast sets for spells
    
    sets.precast.FC = {main="Sakpata's Sword",sub="Chanter's Shield",ammo="Impatiens",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Rev. Surcoat +3",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Kishar Ring",
		back=gear.fastcast_jse_back,waist="Creed Baudrier",legs=gear.odyssean_fc_legs,feet="Odyssean Greaves"}
		
    sets.precast.FC.DT = {main="Sakpata's Sword",ammo="Impatiens",
        head="Souv. Schaller +1",neck="Voltsurge Torque",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Rev. Surcoat +3",hands="Souv. Handsch. +1",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	sets.precast.FC['Enhancing Magic'].DT = set_combine(sets.precast.FC.DT, {waist="Siegel Sash"})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {neck="Diemer Gorget",ear1="Nourish. Earring",ear2="Nourish. Earring +1",body="Jumalik Mail"})
  
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
		body=gear.valorous_wsd_body,hands=gear.odyssean_wsd_hands,ring1="Regal Ring",ring2="Rufescent Ring",
		back="Bleating Mantle",waist="Fotia Belt",legs="Sulev. Cuisses +2",feet="Sulev. Leggings +2"}
		
    sets.precast.WS.DT = {ammo="Staunch Tathlum +1",
        head="Souv. Schaller +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Rev. Surcoat +3",hands="Souv. Handsch. +1",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}

    sets.precast.WS.Acc = {ammo="Hasty Pinion +1",
        head="Ynglinga Sallet",neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Telos Earring",
        body=gear.valorous_wsd_body,hands="Sakpata's Gauntlets",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back="Ground. Mantle +1",waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Sulev. Leggings +2"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring"})
    sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS.Acc, {neck="Fotia Gorget",ear1="Mache Earring +1",ear2="Moonshade Earring"})

	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring"})
    sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS.Acc, {neck="Fotia Gorget",ear1="Mache Earring +1",ear2="Moonshade Earring"})

	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",ear1="Ishvara Earring",ear2="Moonshade Earring"})
    sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {ear1="Mache Earring +1",ear2="Telos Earring"})
	
	sets.precast.WS['Flat Blade'] = {ammo="Aurgelmir Orb +1",
        head="Flam. Zucchetto +2",neck="Erra Pendant",ear1="Gwati Earring",ear2="Digni. Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Defending Ring",ring2="Stikini Ring +1",
        back="Ground. Mantle +1",waist="Olseni Belt",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}

    sets.precast.WS['Sanguine Blade'] = {ammo="Ghastly Tathlum +1",
        head="Pixie Hairpin +1",neck="Fotia Gorget",ear1="Friomisi Earring",ear2="Crematio Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Archon Ring",ring2="Metamor. Ring +1",
        back="Toro Cape",waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.precast.WS['Atonement'] = {ammo="Paeapua",
        head="Loess Barbuta +1",neck="Moonlight Necklace",ear1="Friomisi Earring",ear2="Trux Earring",
        body="Souv. Cuirass +1",hands="Macabre Gaunt. +1",ring1="Apeile Ring +1",ring2="Apeile Ring",
        back=gear.enmity_jse_back,waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Eschite Greaves"}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}


	--------------------------------------
	-- Midcast sets
	--------------------------------------

    sets.midcast.FastRecast = {main="Sakpata's Sword",sub="Chanter's Shield",ammo="Hasty Pinion +1",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Rev. Surcoat +3",hands="Leyline Gloves",ring1="Gelatinous Ring +1",ring2="Kishar Ring",
		back=gear.fastcast_jse_back,waist="Creed Baudrier",legs=gear.odyssean_fc_legs,feet="Odyssean Greaves"}
		
	sets.midcast.FastRecast.DT = {main="Sakpata's Sword",sub="Ochain",ammo="Staunch Tathlum +1",
        head="Souv. Schaller +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Rev. Surcoat +3",hands="Souv. Handsch. +1",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}

    sets.midcast.Flash = set_combine(sets.Enmity, {})
	sets.midcast.Flash.SIRD = set_combine(sets.Enmity.SIRD, {})
    sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast.Stun.SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast.Cocoon = set_combine(sets.Enmity.SIRD, {})

    sets.midcast.Cure = {main="Sakpata's Sword",sub="Sacro Bulwark",ammo="Staunch Tathlum +1",
		head="Loess Barbuta +1",neck="Sacro Gorget",ear1="Nourish. Earring",ear2="Nourish. Earring +1",
		body="Jumalik Mail",hands="Macabre Gaunt. +1",ring1="Defending Ring",ring2="Moonlight Ring",
		back=gear.enmity_jse_back,waist="Creed Baudrier",legs="Carmine Cuisses +1",feet="Odyssean Greaves"}
		
    sets.midcast.Cure.SIRD = {main="Deacon Sword",sub="Sacro Bulwark",ammo="Staunch Tathlum +1",
		head="Souveran Schaller +1",neck="Loricate Torque +1",ear1="Nourish. Earring",ear2="Nourish. Earring +1",
		body="Jumalik Mail",hands="Macabre Gaunt. +1",ring1="Defending Ring",ring2="Moonlight Ring",
		back=gear.enmity_jse_back,waist="Creed Baudrier",legs="Founder's Hose",feet="Odyssean Greaves"}
		
    sets.midcast.Cure.DT = {main="Deacon Sword",sub="Sacro Bulwark",ammo="Staunch Tathlum +1",
        head="Souv. Schaller +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Rev. Surcoat +3",hands="Souv. Handsch. +1",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
    sets.midcast.Reprisal = {main="Sakpata's Sword",sub="Forfend +1",ammo="Staunch Tathlum +1",
		head="Loess Barbuta +1",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Rev. Surcoat +3",hands="Souv. Handsch. +1",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Creed Baudrier",legs="Arke Cosc. +1",feet="Souveran Schuhs +1"}

	sets.Self_Healing = {main="Deacon Sword",sub="Sacro Bulwark",ammo="Staunch Tathlum +1",
		head="Souv. Schaller +1",neck="Sacro Gorget",ear1="Nourish. Earring",ear2="Nourish. Earring +1",
		body="Souv. Cuirass +1",hands="Macabre Gaunt. +1",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
		back="Moonlight Cape",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
	sets.Self_Healing.SIRD = {main="Deacon Sword",sub="Sacro Bulwark",ammo="Staunch Tathlum +1",
		head="Souv. Schaller +1",neck="Loricate Torque +1",ear1="Nourish. Earring",ear2="Nourish. Earring +1",
		body="Souv. Cuirass +1",hands="Macabre Gaunt. +1",ring1="Defending Ring",ring2="Moonlight Ring",
		back="Solemnity Cape",waist="Flume Belt +1",legs="Founder's Hose",feet="Odyssean Greaves"}
		
	sets.Self_Healing.DT = {main="Deacon Sword",sub="Sacro Bulwark",ammo="Staunch Tathlum +1",
        head="Souv. Schaller +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Rev. Surcoat +3",hands="Souv. Handsch. +1",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}

	sets.Cure_Received = {hands="Souv. Handsch. +1",feet="Souveran Schuhs +1"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}

    sets.midcast['Enhancing Magic'] = {main="Colada",sub="Ochain",ammo="Staunch Tathlum +1",
		head="Carmine Mask +1",neck="Incanter's Torque",ear1="Mimir Earring",ear2="Andoaa Earring",
		body="Shab. Cuirass +1",hands="Regal Gauntlets",ring1="Defending Ring",ring2="Kishar Ring",
		back="Merciful Cape",waist="Olympus Sash",legs="Carmine Cuisses +1",feet="Odyssean Greaves"}
		
    sets.midcast['Enhancing Magic'].SIRD = {main="Colada",sub="Ochain",ammo="Staunch Tathlum +1",
		head="Souv. Schaller +1",neck="Incanter's Torque",ear1="Mimir Earring",ear2="Tuisto Earring",
		body="Shab. Cuirass +1",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Moonlight Ring",
		back="Merciful Cape",waist="Olympus Sash",legs="Rev. Leggings +3",feet="Odyssean Greaves"}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	
	sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {main="Sakpata's Sword",sub="Forfend +1",hands="Souv. Handsch. +1",back="Weard Mantle",legs="Sakpata's Cuisses",feet="Souveran Schuhs +1"})
	sets.midcast.Phalanx.SIRD = set_combine(sets.midcast['Enhancing Magic'].SIRD, {main="Sakpata's Sword",sub="Ochain",hands="Souv. Handsch. +1",back="Weard Mantle",feet="Souveran Schuhs +1"})
	sets.midcast.Phalanx.DT = set_combine(sets.midcast.Phalanx.SIRD, {})	
	sets.Phalanx_Received = {main="Sakpata's Sword",hands="Souv. Handsch. +1",back="Weard Mantle",legs="Sakpata's Cuisses",feet="Souveran Schuhs +1"}
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

    sets.resting = {ammo="Homiliary",
		head="Jumalik Helm",neck="Coatl Gorget +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Jumalik Mail",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Moonlight Cape",waist="Fucho-no-obi",legs="Sulev. Cuisses +2",feet="Cab. Leggings +1"}

    -- Idle sets
    sets.idle = {main="Malignance Sword",sub="Ochain",ammo="Homiliary",
		head="Jumalik Helm",neck="Coatl Gorget +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Jumalik Mail",hands="Regal Gauntlets",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Hippo. Socks +1"}
		
    sets.idle.PDT = {main="Sakpata's Sword",sub="Sacro Bulwark",ammo="Eluder's Sachet",
		head="Sakpata's Helm",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Gelatinous Ring +1",ring2="Warden's Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
		
    sets.idle.Block = {main="Deacon Sword",sub="Ochain",ammo="Staunch Tathlum +1",
		head="Chevalier's Armet +1",neck="Diemer Gorget",ear1="Creed Earring",ear2="Thureous Earring",
		body="Sakpata's Breastplate",hands="Souv. Handsch. +1",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
		back="Shadow Mantle",waist="Flume Belt +1",legs="Sakpata's Cuisses",feet="Souveran Schuhs +1"}
		
    sets.idle.MDT = {main="Sakpata's Sword",sub="Aegis",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Archon Ring",ring2="Shadow Ring",
		back=gear.fastcast_jse_back,waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.idle.Tank = {main="Sakpata's Sword",sub="Ochain",ammo="Staunch Tathlum +1",
		head="Chev. Armet +1",neck="Warder's Charm +1",ear1="Creed Earring",ear2="Thureous Earring",
		body="Sakpata's Breastplate",hands="Souv. Handsch. +1",ring1="Gelatinous Ring +1",ring2="Shadow Ring",
		back="Shadow Mantle",waist="Flume Belt +1",legs="Chev. Cuisses +1",feet="Souveran Schuhs +1"}
		
	sets.idle.Kiting = {main="Sakpata's Sword",sub="Sacro Bulwark",ammo="Eluder's Sachet",
		head="Sakpata's Helm",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Gelatinous Ring +1",ring2="Warden's Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Hippo. Socks +1"}

	sets.Kiting = {legs="Carmine Cuisses +1"}

	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.latent_regen = {ring1="Apeile Ring +1",ring2="Apeile Ring"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	--------------------------------------
    -- Defense sets
    --------------------------------------
    
    -- Extra defense sets.  Apply these on top of melee or defense sets.
	sets.Knockback = {}
    sets.MP = {head="Chev. Armet +1",neck="Coatl Gorget +1",ear2="Ethereal Earring",waist="Flume Belt +1",feet="Rev. Leggings +3"}
	sets.passive.AbsorbMP = {head="Chev. Armet +1",neck="Coatl Gorget +1",ear2="Ethereal Earring",waist="Flume Belt +1",feet="Rev. Leggings +3"}
    sets.MP_Knockback = {}
    sets.Twilight = {head="Twilight Helm", body="Twilight Mail"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.SakpataAegis = {main="Sakpata's Sword",sub="Aegis"}
	sets.weapons.NaeglingBlurred = {main="Naegling",sub="Blurred Shield"}
	sets.weapons.SakpataOchain = {main="Sakpata's Sword",sub="Ochain"}
	sets.weapons.ClubOchain = {main="Mafic Cudgel",sub="Ochain"}
	sets.weapons.DualWeapons = {main="Naegling",sub="Demersal Degen +1"}
    
    sets.defense.Block = {main="Sakpata's Sword",sub="Ochain",ammo="Eluder's Sachet",
		head="Chev. Armet +1",neck="Diemer Gorget",ear1="Creed Earring",ear2="Thureous Earring",
		body="Sakpata's Breastplate",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Warden's Ring",
		back="Shadow Mantle",waist="Flume Belt +1",legs="Sakpata's Cuisses",feet="Souveran Schuhs +1"}
		
	sets.defense.PDT = {main="Sakpata's Sword",sub="Ochain",ammo="Eluder's Sachet",
		head="Sakpata's Helm",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Gelatinous Ring +1",ring2="Warden's Ring",
		back="Shadow Mantle",waist="Flume Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
		
    sets.defense.PDT_HP = {main="Sakpata's Sword",sub="Ochain",ammo="Eluder's Sachet",
        head="Souv. Schaller +1",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Rev. Surcoat +3",hands="Souv. Handsch. +1",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Creed Baudrier",legs="Arke Cosc. +1",feet="Souveran Schuhs +1"}
		
	sets.defense.MDT = {main="Malignance Sword",sub="Aegis",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Archon Ring",ring2="Shadow Ring",
		back=gear.fastcast_jse_back,waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
    sets.defense.MDT_HP = {main="Sakpata's Sword",sub="Aegis",ammo="Staunch Tathlum +1",
        head="Sakpata's Helm",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Carrier's Sash",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}

	sets.defense.MEVA = {main="Malignance Sword",sub="Aegis",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Purity Ring",ring2="Shadow Ring",
		back=gear.fastcast_jse_back,waist="Asklepian Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
    sets.defense.MEVA_HP = {main="Malignance Sword",sub="Aegis",ammo="Staunch Tathlum +1",
        head="Sakpata's Helm",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Asklepian Belt",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
		
    sets.defense.PDT_Reraise = set_combine(sets.defense.PDT_HP,{head="Twilight Helm",body="Twilight Mail"})
    sets.defense.MDT_Reraise = set_combine(sets.defense.MDT_HP,{head="Twilight Helm",body="Twilight Mail"})
		
	--------------------------------------
	-- Engaged sets
	--------------------------------------
    
	sets.engaged = {main="Sakpata's Sword",sub="Ochain",ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
		body=gear.valorous_wsd_body,hands="Sakpata's Gauntlets",ring1="Flamma Ring",ring2="Petrov Ring",
		back="Bleating Mantle",waist="Windbuffet Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}

    sets.engaged.Acc = {main="Sakpata's Sword",sub="Ochain",ammo="Hasty Pinion +1",
        head="Flam. Zucchetto +2",neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Telos Earring",
        body=gear.valorous_wsd_body,hands="Sakpata's Gauntlets",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back="Ground. Mantle +1",waist="Tempus Fugit",legs="Carmine Cuisses +1",feet="Sulev. Leggings +2"}

    sets.engaged.DW = {}

    sets.engaged.DW.Acc = {}

	sets.engaged.Tank = {main="Sakpata's Sword",sub="Ochain",ammo="Staunch Tathlum +1",
		head="Chev. Armet +1",neck="Loricate Torque +1",ear1="Creed Earring",ear2="Thureous Earring",
		body="Tartarus Platemail",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Shadow Ring",
		back="Shadow Mantle",waist="Flume Belt +1",legs="Chev. Cuisses +1",feet="Souveran Schuhs +1"}
		
	sets.engaged.DDTank = {ammo="Hasty Pinion +1",
		head="Sakpata's Helm",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Tartarus Platemail",hands="Sakpata's Gauntlets",ring1="Defending Ring",ring2="Patricius Ring",
		back="Weard Mantle",waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
		
	sets.engaged.Acc.DDTank = {ammo="Hasty Pinion +1",
		head="Sakpata's Helm",neck="Loricate Torque +1",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Tartarus Platemail",hands="Sakpata's Gauntlets",ring1="Defending Ring",ring2="Patricius Ring",
		back="Weard Mantle",waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
		
	sets.engaged.NoShellTank = {main="Sakpata's Sword",sub="Ochain",ammo="Staunch Tathlum +1",
        head="Jumalik Helm",neck="Loricate Torque +1",ear1="Thureous Earring",ear2="Etiolation Earring",
        body="Rev. Surcoat +3",hands="Sakpata's Gauntlets",ring1="Defending Ring",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs=gear.odyssean_fc_legs,feet="Cab. Leggings +1"}
		
    sets.engaged.Reraise = set_combine(sets.engaged.Tank, sets.Reraise)
    sets.engaged.Acc.Reraise = set_combine(sets.engaged.Acc.Tank, sets.Reraise)
		
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {neck="Vim Torque +1"}
    sets.buff.Cover = {body="Cab. Surcoat +1"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'NIN' then
        set_macro_page(2, 4)
    elseif player.sub_job == 'RUN' then
        set_macro_page(9, 4)
    elseif player.sub_job == 'RDM' then
        set_macro_page(6, 4)
    elseif player.sub_job == 'BLU' then
        set_macro_page(8, 4)
    elseif player.sub_job == 'DNC' then
        set_macro_page(4, 4)
    else
        set_macro_page(1, 4) --War/Etc
    end
end