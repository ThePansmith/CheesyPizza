#region object list

function cyop_objectlist()
{
	// Autogenerated with this UTMT script that I made in 1 minute
	/*
		var str = "";
		foreach (var i in Data.GameObjects) {
			str += $"\"{i.Name.Content}\",\n";
		}
		return str;
	*/
	
	return [
		obj_bossdoor,
		obj_hardmode,
		obj_bosskeynoise,
		obj_grindrailslope,
		obj_banditochicken_dynamite,
		obj_lightsource,
		obj_followcharacter,
		obj_doorRobot,
		obj_tubeleft,
		obj_introprop,
		obj_fakepepboss,
		obj_escapecollect,
		obj_tubeenter,
		obj_geromeanim,
		obj_ratprop,
		obj_hillbillymonster,
		obj_rattumble,
		obj_editor,
		obj_tubeexitmach,
		obj_bosshitbox,
		par_boss,
		obj_mortfollow,
		obj_mach3solid,
		obj_deadjohn1,
		obj_solid_goblinraid,
		obj_baddiebutton,
		obj_endgamefade,
		obj_hotmetalblock,
		obj_olivebubbledeco,
		obj_moustachehitbox,
		obj_fakepeplimb,
		obj_piraneapple_spawn,
		obj_farmerbaddie2,
		obj_forknight_pizzahead,
		obj_secrettile,
		obj_pf_fakepep,
		obj_chargeenemyhitbox,
		obj_bigspaceblock,
		obj_trash,
		obj_ghoul,
		obj_vigilantebazooka,
		obj_audioconfig,
		obj_soundtest_pause,
		obj_raceend,
		obj_kentukybomb,
		obj_vigilanteNPC,
		obj_snowparticle,
		obj_pizzafaceboss_p3,
		obj_motorboat,
		obj_charswitch_intro,
		obj_negativenumber,
		obj_backgroundreplace,
		obj_pigdark,
		obj_baddiehurtbox,
		obj_stick_forsale,
		obj_sausageeyes,
		obj_cowspawner,
		obj_spaceshuttlestop,
		"obj_debugcontroller",
		obj_bigspitcheesespike,
		obj_mainmenu_jumpscare,
		obj_ventilatorleaf,
		obj_timesupwar,
		obj_deadjohnparent,
		obj_pizzahead_cog,
		obj_ufobullet,
		obj_pizzaface_showerprop,
		obj_monstertrackingrooms,
		obj_credits,
		obj_pizzamech,
		obj_afterimagecontroller,
		obj_noisejetpack,
		obj_pf_fakepepgianthead,
		obj_golfhoop,
		obj_farmer2,
		obj_playerprop_macheffect,
		obj_grandma,
		obj_brickcomeback,
		obj_pizzahead_blackfade,
		obj_confettieffect,
		obj_pepperman,
		obj_chieftainNPC,
		obj_transfotip,
		obj_dialogcontroller,
		obj_racestart,
		obj_railswitchslow,
		obj_pizzafacebrick,
		obj_factoryswitch,
		obj_platformvigi,
		obj_marbleblock,
		obj_fakesantapresent,
		obj_noisefollower,
		obj_knightplatform,
		obj_trap,
		obj_weeniehitbox,
		obj_menutv2,
		obj_stringycheese,
		obj_pizzaball_golfhit,
		obj_secretportal,
		obj_piraneapple_sign,
		obj_chainsawpuff,
		obj_bee,
		obj_tiledestroy,
		obj_noiseyspawner2,
		obj_tubeexitdownexit,
		obj_weenie,
		obj_PTG,
		obj_conveyorspawner,
		obj_pepper_marbleblock,
		obj_peppinoswitch,
		obj_toppinprop,
		obj_horsey,
		obj_pizzaball,
		obj_pizzaheadminigun,
		obj_kentukylenny,
		obj_tutorialtargetblock,
		obj_fmod,
		obj_pizzaheadsword,
		obj_bossdark,
		obj_tiledintroprop,
		obj_stick,
		obj_blackoutline,
		obj_destroyablegolf,
		obj_nosand,
		obj_meatgrinder,
		obj_toxicbutton,
		obj_instanttemp,
		obj_noisekeytell,
		obJ_fakepephallwayend,
		obj_gnomecustomerblockfinal,
		obj_fakepeptauntspawner,
		obj_cowstampede,
		obj_menutv3,
		obj_toxiccloud,
		obj_mine,
		obj_clownmatoOLD,
		obj_peppermanGIANTbowlingball,
		obj_vigilanteshot,
		obj_pizzafaceboss_p2,
		obj_reversespaceblock,
		obj_ammocollect,
		obj_dynamiteexplosion_boss,
		obj_ratmountgroundpound,
		obj_fakepepsolid,
		obj_farmer3projectile,
		obj_gustavoswitch,
		obj_soundtest_next,
		obj_speedlinesup,
		obj_tutorialblock,
		obj_icicle_spawner,
		obj_burd,
		obj_noisebigkey,
		obj_pizzaheadTVspawner,
		"obj_noisebossOLD",
		obj_endingeffect,
		"obj_musicOLD",
		obj_johnresurrection_peppino,
		obj_destructible_goblinraid,
		obj_noisewashingmachinetower,
		obj_collectgolf,
		obj_donkey,
		obj_loophallway,
		obj_johnresurrection_gerome,
		obj_farmerprojectile,
		obj_skateboardnoise,
		obj_noisebigbomb,
		obj_pizzaheadportrait,
		obj_tvtrap,
		obj_hiddenobjecttrigger,
		obj_gustavograbbable,
		obj_king,
		obj_fakepepclone,
		obj_geromeexit,
		obj_poodebris,
		obj_shotgunback,
		obj_johnecheese_spawner,
		obj_kidspartybg,
		obj_noisettecafe,
		obj_text,
		obj_movingplatform,
		obj_baddietombcontroller,
		obj_factorygate,
		obj_farmerbaddie,
		obj_soundtest,
		obj_noisettefinale,
		obj_keyconfig,
		obj_mrstickcardboard,
		obj_longintro,
		obj_targetguy,
		obj_computer,
		obj_pepper_marblestatue,
		obj_baddiecollisionboxTEST,
		obj_ratblock1x1,
		obj_cullingsystem,
		obj_clownmato,
		obj_globaltimer,
		obj_factorycreateeffect,
		obj_playerprop,
		obj_patroller,
		obj_noisecrushertrail,
		obj_moving_hstop,
		obj_bottletreasure,
		obj_secrettrigger,
		obj_cheftask,
		obj_whoophand,
		obj_cow,
		obj_totemthunder,
		obj_millionpunchhitbox,
		obj_pizzakinparent,
		obj_freezeddragon,
		obj_vigilantecow,
		obj_pizzahead_finalecutscene,
		obj_exitgustavo,
		obj_snotty,
		obj_actor,
		obj_smallletters,
		obj_mrsticknotification,
		obj_sausageman,
		obj_vigilante_duelintro,
		obj_geromeblock,
		obj_pineappleprojectilespawn,
		obj_uziprojectile,
		obj_pistolbullet,
		obj_chickenpickup,
		obj_pepanimatronicfollow,
		obj_pizzafaceboss_p2OLD,
		obj_micnoise,
		obj_uparrowhitbox,
		obj_taxitransition,
		obj_touchall,
		obj_farmer2projectile,
		obj_stickfollower,
		obj_hppickup,
		obj_priesthazard,
		obj_textureloading,
		obj_viginoiseyspawner,
		obj_farmerbaddie2_projectile,
		"obj_vigilantebossOLD",
		obj_hallwaymonster,
		obj_doorG,
		obj_startgate_hats,
		obj_farmer2follow,
		obj_hiddenobject,
		obj_totemcloud,
		obj_frontcanonbomb,
		obj_startgate_pizza,
		obj_magnet,
		obj_hubelevator,
		obj_secretportalstart,
		obj_playereffectprop,
		obj_ratblock,
		obj_balloongrabbableeffect,
		obj_jumpscare,
		obj_shuttleparts,
		obj_pizzaarrowtrap,
		obj_chunktimer,
		obj_antigravbubbleeffect,
		obj_startgate_treasure,
		obj_motorcycleblock,
		obj_ghostknight,
		obj_screensizer,
		obj_stickycheeseprojectile,
		obj_moving_vstop,
		obj_fakepephead,
		obj_policebooth,
		obj_johnresurrection,
		obj_pizzaheadbrickball,
		obj_particlesystem,
		obj_destroyable_respawner,
		obj_mainmenu,
		obj_rocket,
		obj_deliveryfollower,
		obj_railswitchnone,
		obj_lightsource_expand,
		obj_policecar,
		obj_railparent,
		obj_textbutton,
		obj_dungeonblock,
		obj_morthook,
		obj_cheeseballspawner,
		obj_baddiegibsstick,
		obj_brickball,
		obj_fakepeplimb2,
		obj_exitfollower,
		obj_stick_target,
		obj_trapghost,
		obj_exitfollowercollect,
		obj_horseydown,
		obj_lapportalentrance,
		obj_heatafterimage,
		obj_ghostdrapes,
		obj_bosscontroller,
		obj_ladderhorizontal,
		obj_johnghost,
		obj_mortflyaway,
		obj_treasureeffect,
		obj_chateaulight,
		obj_peppermanbowlingballspawner,
		obj_ghostblock,
		obj_patrolcone,
		obj_tubedown,
		obj_soldier,
		obj_knighttrap,
		obj_farmerbaddie3,
		obj_snicktower,
		obj_ghosthazard,
		obj_laundrymachine,
		obj_hamkuff,
		obj_secretmanager,
		obj_pineabreakdancehitbox,
		obj_monsterslope,
		obj_farmer3follow,
		obj_escapespawn,
		obj_technicaldifficulty,
		obj_backtohub_fadeout,
		obj_cowfall,
		obj_spaceshuttlecutscene,
		obj_nuketerminal,
		obj_pizzice_projectile,
		obj_hurtstars,
		obj_spaceshuttle,
		obj_peppermanbrick,
		obj_moneynumber,
		obj_slugbullet,
		obj_noisebosscrate,
		obj_pizzafacebaddie,
		obj_bossplayerdeath,
		obj_pepperman_pepportrait,
		obj_enemybullet,
		obj_soundtest_button,
		obj_ghostdashpad,
		obj_totem,
		obj_snowmanhead,
		obj_bazookabaddie,
		obj_roomcheck,
		obj_johnecheese,
		obj_noisey,
		obj_farmer1follow,
		obj_surprisebox_boss,
		obj_arenadoor,
		obj_stick_forsale2,
		obj_spawner_goblinraid,
		obj_superattackeffect,
		obj_finalhallwayface,
		obj_finishereffect,
		obj_horseyright,
		obj_hungrypillarflash,
		obj_badratspawner,
		obj_coopplayerfollow,
		obj_grannypizzasign,
		obj_horseyup,
		obj_treasureviewer,
		obj_crosspriest_cross,
		obj_smokingprojectile,
		obj_peppermanvengeful,
		obj_frontcanoncrosshair,
		obj_optiondoor,
		obj_playerspikecheese,
		obj_pizzaface_thunderdark,
		obj_graffiti,
		obj_menutv1,
		obj_timecollect,
		obj_ramp,
		obj_meatballtower,
		obj_deadjohn2,
		obj_weenieOLD,
		obj_fakepepprojectile,
		obj_soundtrap,
		obj_farmerbaddie3_projectile,
		obj_horseyblock,
		obj_clownballoon,
		obj_johnresurrection_pizzahead,
		obj_revolvershot,
		obj_tank,
		obj_pizzaheadbomb,
		obj_superpinballmachine,
		obj_pizzice,
		obj_smokingpizzaslice,
		obj_stairs,
		obj_noisehotairempty,
		obj_soundtest_prev,
		obj_minecart_rail,
		obj_hpeffect,
		obj_farmerpeasanto,
		obj_whoop,
		obj_levelselect,
		obj_gusbrickfightball,
		obj_chickenfollow,
		obj_warplaserhoming,
		obj_brickballspeedline,
		obj_geromedoor,
		obj_spider,
		obj_antigravbubble,
		obj_flamethrowerhurtbox,
		obj_fakeobject,
		obj_menutv,
		obj_beedeco,
		obj_robotmonster,
		obj_pinballtrap,
		obj_tea,
		obj_clownballoon_projectile,
		obj_clerk,
		obj_alienbyebye,
		obj_climbablewall,
		obj_pepper_groundpoundspot,
		obj_rubble,
		obj_spiderweb,
		obj_characterswitch,
		obj_lightsource_attach,
		obj_gustavodestroyable,
		obj_iceblock_breakable,
		obj_farmerpeasantoprojectile,
		obj_deadjohn3,
		obj_turret,
		obj_climbingupstairs,
		obj_electricwall,
		obj_beatbox,
		obj_freezerblock,
		obj_pizzafacepart,
		obj_robotmonsterhand,
		obj_beer,
		obj_gravecorpse,
		obj_wartimer,
		obj_bigbeer,
		obj_savesystem,
		obj_palettedresser,
		obj_bossvulnerable,
		obj_johndestructible,
		obj_farmerparent,
		obj_cutoffsmall,
		obj_ufoexterior,
		obj_stickycheese,
		obj_monstersolid,
		obj_noisekey,
		obj_arcprojectile,
		obj_wirewall,
		obj_hamburger,
		obj_notes,
		obj_poweringupeffect,
		obj_doorMonster,
		obj_lapportal,
		obj_pizzasona_points,
		obj_fakepephallwaystart,
		obj_getingetin,
		obj_papertreasure,
		obj_peppinoclone,
		obj_bounceplank,
		obj_peppermanbowlingball,
		obj_vigilantedynamite,
		obj_taxicardboard,
		obj_cheesedragontower,
		obj_fakepepflash,
		obj_noisebombboss,
		obj_bubbles,
		obj_button,
		obj_pizzaheadstomp,
		obj_deliveryfolloweranim,
		obj_gerome,
		obj_electricpotato,
		obj_rancherbullet_debris,
		obj_pistolpickup,
		obj_smallforestblock,
		obj_fallingplatform,
		obj_hattreasure,
		obj_ghostcollectibles,
		obj_achievement_enemiesdead,
		obj_eggplantdisclaimer,
		obj_cutoff,
		obj_genericfade,
		obj_pizzafacefallout,
		obj_frontcanongoblin_trigger,
		obj_playersmokehitbox,
		obj_endingprop,
		obj_frontcanongoblin,
		obj_vigilanteboss,
		obj_cheeseboat,
		obj_miniufo_grounded,
		obj_noiseballooncrash,
		obj_drawcontroller,
		obj_rocketdead,
		obj_noiseboss,
		obj_pizzaarrow,
		obj_bigforestblock,
		obj_pizzafacehitbox,
		obj_cleaningwater,
		obj_deliverytimer,
		obj_arena_pizzaportal,
		obj_noisebossbomb,
		obj_haystackrope,
		obj_monstergate,
		obj_pizzahead_haywire,
		obj_baddiespawnernograv,
		obj_spaceblock,
		obj_gusbrickchase,
		obj_priest,
		obj_tutorialbook,
		obj_mrstickboss,
		obj_baddiebutton_perma,
		obj_fakepeppinospawner,
		obj_titlecard,
		obj_baddiegate,
		obj_vigilantefollower,
		obj_tubeup,
		obj_sandparticle,
		obj_gusbrickhurt,
		obj_asteroid,
		obj_startgate_secreteye,
		obj_golfdemon,
		obj_filedoor,
		obj_forknightspawner,
		obj_tuberight,
		obj_combotitle,
		obj_factoryblock,
		obj_wordhitbox,
		obj_bazooka,
		obj_deliverypizzabox,
		obj_slope,
		obj_solid,
		obj_thunder,
		obj_swordstone,
		obj_bombexplosion,
		obj_boilingsauce,
		obj_puppetsafezone,
		obj_dummyTEST,
		obj_tinyslimedude,
		obj_pizzagoblinbomb,
		obj_camerapatrol,
		obj_canongoblinbomb,
		obj_player,
		obj_player2,
		obj_player1,
		obj_pause,
		obj_music,
		obj_tv,
		obj_bosshealth,
		obj_camera,
		obj_playerexplosion,
		obj_toppinwarriorattack,
		obj_destructibles,
		obj_bigdestructibles,
		obj_saveroom,
		obj_panicdebris,
		obj_kentukylenny_projectile,
		obj_controller,
		obj_stylebar,
		obj_parallax,
		obj_pizzacoinindicator,
		obj_secretfound,
		obj_cooppointer,
		obj_stick_gateprop,
		obj_coopflag,
		obj_escapecollectbig,
		obj_roomname,
		obj_timeattack,
		obj_vigidelete,
		obj_pigtotal,
		obj_anchortrap,
		epicboogaloo,
		obj_inputAssigner,
		obj_title,
		obj_mainmenuselect,
		obj_option,
		obj_erasegame,
		obj_lungehitbox,
		"obj_keyconfigOLD",
		obj_cursor,
		obj_menuselections,
		obj_hard,
		obj_controls,
		obj_file1,
		obj_file3,
		obj_mrmooney,
		obj_file2,
		obj_retry,
		obj_exit,
		obj_manual,
		obj_characterselect,
		obj_peppinoselect,
		obj_noiseselect,
		obj_mouthhitbox,
		obj_rank,
		obj_generaldestroyable,
		obj_noiseyspawner,
		obj_timesup,
		obj_rattumble_big,
		obj_slaphitbox,
		obj_canonexplosion,
		obj_gasolinetreasure,
		obj_bomb,
		obj_swordhitbox,
		obj_introscooter,
		obj_haystack,
		obj_firemouth_projectile,
		obj_junk,
		obj_throwableparent,
		obj_stampedecloud,
		obj_breakabletv,
		obj_shotgunbullet,
		obj_metalblock,
		obj_shotgunbullet857,
		obj_dynamiteexplosion,
		obj_car_dead,
		obj_baddiecollisionbox,
		obj_slaphitbox2,
		obj_hurtbox,
		obj_pizzaface_thunder,
		obj_swingdinghitbox,
		obj_playerbomb,
		obj_dynamite,
		obj_pizzaheadbomb_explosion,
		obj_mortblock,
		obj_morthitbox,
		obj_kentukykenny_projectile,
		obj_pizzard_bolt,
		obj_pepgoblin_kickhitbox,
		obj_rancher_bullet,
		obj_minijohn_hitbox,
		obj_spike,
		obj_vigilantebazookatrail,
		obj_warblock,
		obj_conveyordespawner,
		obj_fightballblock,
		obj_baddie,
		obj_thug_red,
		obj_parryhitbox,
		obj_baddiecollisionboxother,
		obj_destructiblerockblock,
		obj_boss,
		obj_ghostfollow,
		obj_baddiedead,
		obj_robotknife,
		obj_spitcheesespike,
		obj_pineahitbox,
		obj_sausagemancigar,
		obj_verticalhallway,
		obj_forkhitbox,
		obj_slipnslide,
		obj_warplaser,
		obj_baddieragehitbox,
		obj_noisegoblin_arrow,
		obj_banditochicken_projectile,
		obj_junkenemy,
		obj_sausageman_dead,
		obj_enemybird,
		obj_slimedead,
		obj_enemybandaid,
		obj_cheeseslime,
		obj_thug_blue,
		obj_thug_green,
		obj_treasureguy,
		obj_treasureguybox,
		obj_minijohn,
		obj_piraneapple,
		obj_banditochicken,
		obj_snowman,
		obj_cheeserobot,
		obj_pizzaboy,
		obj_robot,
		obj_kentukykenny,
		obj_pizzagoblin,
		obj_noisegoblin,
		obj_canongoblin,
		obj_flush,
		obj_autocanon,
		obj_tvtrigger,
		obj_pizzard,
		obj_pickle,
		obj_rancher,
		obj_swedishmonkey,
		obj_randomobject,
		obj_pepgoblin,
		obj_johnresurrection_treasure,
		obj_pinballlauncher,
		obj_bigcheese,
		obj_ballgoal,
		"obj_pizzaballOLDOLD",
		obj_spitcheese,
		obj_trashOLD,
		obj_invtrash,
		obj_peasanto,
		obj_ninja,
		obj_forknight,
		obj_tankOLD,
		obj_coolpineapple,
		obj_ancho,
		obj_soundtest_gus,
		obj_miniufo,
		obj_indiancheese,
		obj_fencer,
		obj_sausagemanOLD,
		obj_grandpa,
		obj_weeniesquireOLD,
		obj_alienpickup,
		obj_weeniemount,
		obj_baddiespawner,
		obj_agressivebaddiespawner,
		obj_supriseenemyarea,
		obj_arenagate,
		obj_supriseenemy,
		obj_escapeenemy,
		obj_arenaspawn,
		obj_arenalimit,
		obj_arenaspawnpoint,
		obj_superspring,
		obj_gusbrickhub,
		obj_balloon,
		obj_timedgate,
		"obj_pizzafaceboss_p3OLD",
		obj_pizzaballOLD,
		obj_peppermandestroyable,
		"obj_peppermanOLD",
		obj_graffititreasure,
		obj_peppermancharge,
		obj_fakepeppino,
		obj_crushershockwave,
		obj_pepperbombspawner,
		obj_cheesedragon,
		obj_cheesedragonflames,
		obj_peppermanbomb,
		obj_enemyrain,
		obj_pizzaface,
		obj_onebyone,
		obj_platform,
		obj_destroyable,
		obj_ladder,
		obj_rollblock,
		obj_secretblock,
		obj_grabbiehandOLD,
		obj_desertdestroyable,
		obj_destroyable2,
		obj_destroyable3,
		obj_secretdestroyable,
		obj_onewaybigblock,
		obj_secretbigblock,
		obj_secretmetalblock,
		obj_destroyable2_big,
		obj_cheeseballblock,
		obj_barrelblock,
		obj_reverseminipillar,
		obj_minipillar,
		obj_movingoutlet,
		obj_null,
		obj_unclimbablewall,
		obj_grindrail,
		obj_bombblock,
		obj_enemyblock,
		obj_shotgunblock,
		obj_weaponmachine,
		obj_shotgun,
		obj_treasure,
		obj_giantkey,
		obj_pizzaboxunopen,
		obj_collect,
		obj_pizzapepper,
		obj_bigcollectgolf,
		obj_pizzashield_collectible,
		obj_pizzashield,
		obj_pizzakinshroom,
		obj_pizzakincheese,
		obj_pizzakintomato,
		obj_pizzakinsausage,
		obj_pizzakinpineapple,
		obj_noisebomb,
		obj_bigcollect,
		obj_giantcollect,
		obj_key,
		obj_pizzaslice,
		obj_pizzacoin,
		obj_phonebooth,
		obj_hungrypillar,
		obj_exitgate,
		obj_exitdoorsignground,
		obj_snicklevelend,
		obj_portalentrance,
		obj_portalend,
		obj_costumerdoor,
		obj_costumer,
		obj_costumerpizza,
		obj_cheeseball,
		obj_pineapplemonster,
		obj_wetfloor,
		obj_beertreasure,
		obj_noisebombspawner,
		obj_sidesuperspring,
		obj_beartrap,
		obj_bowlingball,
		obj_skateboard,
		obj_pizzacutterthwomp2,
		obj_pizzacutterthwomp1,
		obj_taxi,
		obj_stopsign,
		obj_mort_inline,
		obj_taxidud,
		obj_keydoor,
		obj_breakabledoor,
		obj_door,
		obj_goldendoor,
		obj_badrat,
		obj_doorblocked,
		obj_startgate,
		obj_boxofpizza,
		obj_hallway,
		obj_pitfall,
		obj_door2,
		obj_doorA,
		obj_doorB,
		obj_doorC,
		obj_doorD,
		obj_doorE,
		obj_pizzacutter1,
		obj_pizzacutter2,
		obj_destructibleplatform,
		obj_iceblock,
		obj_peppermanartdude,
		obj_risingboilingsauce,
		obj_noisetrap_rock,
		obj_dashpad,
		obj_tntblock,
		obj_noisedynamite,
		obj_boulder,
		obj_rockblock,
		obj_crosspriest,
		obj_noiserock,
		obj_boulderspawner,
		obj_firemouthflame,
		obj_freemilk,
		obj_tombstone,
		obj_ghostwall,
		obj_metaldetector,
		obj_noisehotair,
		obj_noisematch,
		obj_mortfollowerexit,
		obj_pizzafaceshower,
		obj_hookup,
		obj_pizzafaceboss_p2background,
		obj_mort,
		obj_lavapotfall,
		obj_mortgrain,
		obj_well,
		obj_warppoint,
		obj_gusbrickpoker,
		obj_lap2visual,
		obj_timedgateclock,
		obj_tomatoblock,
		obj_teleporter,
		obj_water,
		obj_woodbarrel,
		obj_barrel,
		obj_current,
		obj_barrelspawner,
		obj_gustavopizza,
		obj_gnomecustomer,
		obj_doornexthub,
		obj_gnomecustomerblock,
		obj_ratrunaway,
		obj_mushroom,
		obj_gnomehouse1,
		obj_gnomehouse2,
		obj_gnomehouse3,
		obj_gnomehouse4,
		obj_gnomehouse5,
		obj_washingmachinemount,
		obj_grabbiehand,
		obj_boxcrusher,
		obj_iceblock_temp,
		obj_hubtreasure,
		obj_cheeseblob,
		obj_cheesemaker,
		obj_railv,
		obj_railh2,
		obj_pizzacollectphy,
		obj_railh,
		obj_car,
		obj_vsscreen,
		obj_pizzasonacollect,
		obj_goalsign,
		obj_flushcount,
		obj_siren,
		obj_exitdoorsign,
		obj_plusseconds,
		obj_ranksign,
		obj_gustavo_warmissile,
		obj_donesign,
		obj_Hranksign,
		obj_press,
		obj_uparrow,
		obj_pizzaheadTV_bg,
		obj_creditimages,
		obj_leveltitles,
		obj_easy,
		obj_pizzafacep3_prop,
		obj_100,
		obj_80,
		obj_movingspike,
		obj_40,
		obj_gustavo_kidsparty,
		obj_20,
		obj_pizzaball_rank,
		obj_smallnumber,
		obj_cowboyhat,
		obj_treasureshadow,
		obj_Opeppino,
		obj_itspizzatime,
		obj_grabmarker,
		obj_parentparticle,
		obj_balloongrabbable,
		obj_baddiegibs,
		obj_fakesanta,
		obj_doorF,
		obj_washingmachine,
		obj_wooddebris,
		obj_slapstar,
		obj_pizzadebris,
		obj_debris,
		obj_dripspawner,
		object189,
		obj_explosive_goblinraid,
		obj_bulletcollectible,
		obj_knightdebris,
		obj_boxxeddebris,
		obj_glassdebris,
		obj_vomit,
		obj_slimedebris,
		obj_metaldebris,
		obj_meatblock,
		obj_drip,
		obj_skateboarddebris1,
		obj_lock,
		obj_pizzaloss,
		obj_skateboarddebris2,
		obj_tntblockdebris,
		obj_fallingHUDface,
		obj_cheesedragonshadow,
		obj_hubwater,
		obj_gusbrickcloud,
		obj_shakeanddie,
		obj_noisesatellite,
		obj_glassblock,
		obj_tutorialtrap,
		obj_crashingplane,
		obj_crashplaneblock,
		obj_pizzaballblock,
		obj_ventilator,
		obj_toppinwarrior,
		obj_toppinwarriorbutton,
		obj_logoprop,
		obj_solidpillar,
		obj_lightlamp,
		obj_farmer3,
		obj_lampost,
		obj_pillarentrance,
		obj_hardmode_ghost,
		obj_speedlines,
		obj_pizzaportalfade,
		obj_angrycloud,
		obj_sweat,
		obj_balloonpop,
		obj_fakepepfollower,
		obj_bulletimpact,
		obj_bulletdisappear,
		obj_chargeeffect,
		obj_superchargeeffect,
		obj_pogoeffect,
		obj_chainsaweffect,
		obj_vigilantespot,
		obj_explosioneffect,
		obj_pistoleffect,
		obj_shotgunjumpeffect,
		obj_superslameffect,
		obj_spikehurteffect,
		obj_stompeffect,
		obj_jumpdust,
		obj_superdashcloud,
		obj_highjumpcloud1,
		obj_highjumpcloud2,
		obj_grindeffect,
		obj_world5john,
		obj_brickgustavo,
		obj_punchdust,
		obj_fadeout,
		obj_pausefadeout,
		obj_endlevelfade,
		obj_bossdefeatflash,
		obj_bangeffect,
		obj_blackbars,
		obj_bumpeffect,
		obj_keyeffect,
		obj_doortransition,
		obj_doortransitionend,
		obj_doortransition2,
		obj_slidecloud,
		obj_puppetmonster,
		obj_landcloud,
		obj_dashcloud,
		obj_dashcloud2,
		obj_cloudeffect,
		obj_machalleffect,
		obj_afterimage,
		obj_crazyruneffect,
		obj_crazyrunothereffect,
		obj_taunteffect,
		obj_baddietaunteffect,
		obj_tauntafterimage,
		obj_toxicfan,
		obj_tauntaftereffectspawner,
		obj_flash,
		obj_ghosttransparency,
		obj_piranneapplewater,
		obj_bombdelete,
		obj_fakepepgianthead,
		obj_mrstickblock,
		obj_parryeffect,
		obj_golflauncher,
		obj_genericpoofeffect,
		obj_pizzafaceboss_p3intro,
		obj_snickexe,
		obj_SAGE2019achievementmarker,
		obj_snickchallengedoor,
		obj_cowboytask,
		obj_bossspotlight,
		obj_pepbat,
		obj_dresser,
		obj_achievementviewer,
		obj_presentbox,
		obj_iceblockminiboss,
		obj_santanoise,
		obj_santasleight,
		obj_santasleight2,
		obj_blank,
		obj_alienfollow,
		obj_clock,
		obj_lavapot,
		obj_objecticontracker,
		obj_hoop,
		obj_pizzaheadbullet,
		object474,
		obj_gustavo,
		obj_noisevengeful,
		obj_tinytaunt,
		obj_cutscene_handler,
		obj_customeractor,
		obj_pizzacustomer,
		obj_peasantohitbox,
		obj_mrstickhub,
		obj_taxi_cutscene,
		obj_gnome_checklist,
		obj_beachsandparticle,
		obj_mach3effect,
		obj_motodude,
		obj_baddiecameraspawner,
		obj_kentukybombfire,
		obj_priestangel,
		obj_gravesurfing,
		obj_kentukybomber,
		obj_golfburger,
		obj_planetparticle,
		obj_banditobomb,
		obj_iceblockslope,
		obj_burgertreasure,
		obj_checkpoint,
		obj_medievalprojectile,
		obj_smallspaceblock,
		obj_objectlist,
		obj_achievementtracker,
		obj_pizzafaceboss,
		obj_loadingscreen,
		obj_endingrank,
		obj_comboend,
		obj_geromefollow,
		obj_ending,
		obj_vigilanteunsure,
		obj_bosskeyspawn,
		obj_pizzaheadgetout,
		obj_fakepepheaddebris,
		obj_vigilantecrate,
		obj_evilbanana,
		obj_icicle,
		obj_ham,
		"obj_bosscontrollerOLD",
		"obj_pauseOLD",
		obj_gustavo_war,
		obj_enguardehitbox,
		obj_pineapplemonsterzone,
		obj_shotgunblast,
		obj_gustavofollower,
		obj_snottyexit,
		obj_playernoisearrow,
		obj_cracker,
		obj_pigcitizen,
		obj_pizzahead_whitefade,
		obj_tutorialtarget,
		obj_achievement_custom,
		obj_weeniesquire,
		obj_timedgatespawn,
		obj_blobmonster,
		obj_peppermanNPC,
		"obj_pizzafacebossOLD",
		obj_spaceblockswitch,
		obj_giantkeyfollow,
		obj_fakepepspawner,
		obj_toxicspray,
		obj_factorysensor,
		obj_pizzaheadswordstone,
		obj_horseyleft,
		obj_graffiticount,
		obj_monster,
		obj_version,
		obj_pepper_marblespot,
		obj_dialognpc,
		obj_screenconfirm,
		obj_keyfollow,
		obj_spaceshuttletrans,
		obj_pizzahead_attackhitbox,
		obj_antigrav,
		obj_peppermanfollower,
		obj_tile_precision_check,
		obj_tubeexitSjump,
		obj_bosskey,
		obj_fakesuperspring,
		obj_endingcard,
		obj_johnresurrection_pillar,
		obj_possessable,
		obj_bigtombstone,
		obj_minecart,
		"obj_rmEditor",
		"obj_editorInst",
		"obj_modAssets",
		"obj_editorBG",
		obj_levelLoader,
		"obj_tilemapDrawer",
		"obj_customRoomTransition",
		"obj_customBG",
		obj_sprite,
		"obj_customAudio",
		"obj_menutvcustom",
		"obj_modMenu",
		"obj_pizzasona_spawn",
		"obj_towerBrowser",
		"obj_camera_region",
		"obj_warp_number",
		"obj_teleporter_receptor",
		obj_destroyable2_bigescape, //obj_destroyable2_big_escape,
		obj_destroyable2_escape,
		obj_destroyable_escape,
		obj_destroyable3_escape,
	];
}

#endregion

global.custom_rooms = []; // [[runtime_room_index, json]]
global.custom_audio = -1; // ds_map
global.custom_sprites = -1; // ds_map
global.custom_tiles = -1; // ds_map
global.room_map = -1; // ds_map
global.asset_cache = -1; // ds_map
global.custom_fill = 4000;
global.custom_path = "";
global.custom_hub_level = "";
global.custom_level_name = "";
global.custom_tower_name = "";
global.is_hubworld = false;

function cyop_cleanup()
{
	global.is_hubworld = false;
	global.custom_level_name = "";
	global.custom_tower_name = "";
	cyop_freemusic();
	
	// sprites
	var i = ds_map_find_first(global.custom_sprites);
	while !is_undefined(i)
	{
		sprite_delete(global.custom_sprites[?i]);
		i = ds_map_find_next(global.custom_sprites, i);
	}
	ds_map_clear(global.custom_sprites);
	ds_map_clear(global.custom_tiles);
	
	// audio
	audio_stop_all();
	
	var i = ds_map_find_first(global.custom_audio);
	while !is_undefined(i)
	{
		audio_destroy_stream(global.custom_audio[?i]);
		i = ds_map_find_next(global.custom_audio, i);
	}
	ds_map_clear(global.custom_audio);
	
	// etc
	with obj_cyop_tilelayer
		instance_destroy();
	ds_map_clear(global.room_map);
	ds_map_clear(global.asset_cache);
	ds_list_clear(global.cyop_broken_tiles);
}
function cyop_asset(str)
{
	var find = global.asset_cache[?str];
	if !is_undefined(find)
		return find;
	else
	{
		var store = asset_get_index(str);
		ds_map_add(global.asset_cache, str, store);
		return store;
	}
}
function cyop_load(ini)
{
	with obj_player
	{
		state = states.door;
		sprite_index = spr_lookdoor;
		image_index = image_number - 1;
	}
	with instance_create(0, 0, obj_loadingscreen)
	{
		cyop_tower = ini;
		scr_pause_activate_objects(false);
	}
}
function cyop_load_internal(ini)
{
	// load ini
	ini_open(ini);
	var type = ini_read_real("properties", "type", 0); // 0 - tower, 1 - level
	global.custom_tower_name = ini_read_string("properties", "name", "");
	var mainlevel = ini_read_string("properties", "mainlevel", "");
	ini_close();
	
	// target level
	global.custom_path = filename_dir(ini);
	with obj_levelLoader
		gamestart = true;
	
	gamesave_async_load();
	trace("Switched savefiles: ", get_savefile_ini());
	
	var targetLevel = concat(global.custom_path, "/levels/", mainlevel, "/level.ini");
	if !file_exists(targetLevel)
		return "This tower has no Main Level.";
	
	var loader = instance_create_unique(0, 0, obj_cyop_assetloader);
	recursive_func = function(folder, prefix)
	{
		if directory_exists(folder)
		{
			// files
			var recursion = [];
			
			var file = file_find_first(concat(folder, "/*"), fa_directory);
			while file != ""
			{
				if directory_exists(concat(folder, "/", file))
					array_push(recursion, file);
				else
				{
					var ext = filename_ext(file);
					
					#region SPRITE
					
					if ext == ".png"
					{
						var filename = filename_change_ext(file, ""); // image
						var filepath = concat(folder, "/", file); // c:/path/image.png
						
						// properties
						ini_open(filename_change_ext(filepath, ".ini"));
						var images = ini_read_real("properties", "images", 0);
						var image_width = ini_read_real("properties", "image_width", 0);
					
						var centered = ini_read_real("offset", "centered", false);
						var x_offset = ini_read_real("offset", "x", 0);
						var y_offset = ini_read_real("offset", "y", 0);
					
						var tileset_size = ini_read_real("tileset", "size", 0);
						ini_close();
						
						// add sprite
						var wd = 0, ht = 0;
						if image_width != 0 or centered
							wd = image_get_width(filepath);
						
						if image_width != 0
							images = floor(wd / image_width);
						if centered
						{
							if image_width != 0
								x_offset += image_width / 2;
							else
								x_offset += wd / 2;
							y_offset += image_get_height(filepath) / 2;
						}
						
						// GAMEMAKER BUG: Sprites get cropped wrong with sprite_add_ext
						// Use BETA 2023.11. It fixes this
						var spr = sprite_add_ext(filepath, images == -1 ? 1 : images, x_offset, y_offset, false);
						trace($"Loading sprite: {spr}");
						ds_list_add(obj_cyop_assetloader.to_load, spr);
						
						// Old method
						//var spr = sprite_add(filepath, images == -1 ? 1 : images, false, false, x_offset, y_offset, false);
						
						// add to map(s)
						ds_map_add(global.custom_sprites, prefix + filename, spr);
						if tileset_size > 0
							ds_map_add(global.custom_tiles, prefix + filename, [spr, tileset_size]);
					}
					
					#endregion
					#region AUDIO
					
					if ext == ".ogg"
					{
						var filename = string_replace(file, ext, "");
						var filepath = concat(folder, "/", file);
					
						// properties
						ini_open(concat(folder, "/", filename, ".ini"));
						var loop_start = ini_read_real("loopPoints", "start", 0);
						var loop_end = ini_read_real("loopPoints", "end", 0);
						ini_close();
					
						// add sound
						var snd = audio_create_stream(filepath);
						if loop_start > 0
							audio_sound_loop_start(snd, loop_start);
						if loop_end > 0
							audio_sound_loop_end(snd, loop_end);
						
						ds_map_add(global.custom_audio, prefix + filename, snd);
					}
					
					#endregion
				}
				file = file_find_next();
			}
			file_find_close();
			
			// look through subfolders
			while array_length(recursion) > 0
			{
				var bwah = array_pop(recursion);
				recursive_func(concat(folder, "/", bwah), concat(bwah, "/"));
			}
		}
	}
	
	// load sprites and audio
	recursive_func(concat(filename_path(ini), "sprites"), "");
	recursive_func(concat(filename_path(ini), "audio"), "");
	
	// if we're somehow done loading
	loader.wait();
	
	// load into the main level
	if type == 0
		global.custom_hub_level = targetLevel;
	else
		global.custom_hub_level = "";
	
	return cyop_load_level_internal(targetLevel);
}
function cyop_load_level(ini)
{
	with instance_create(0, 0, obj_loadingscreen)
	{
		cyop_level = ini;
		scr_pause_activate_objects(false);
	}
}
function cyop_load_level_internal(ini)
{
	// load ini
	ini_open(ini);
	global.is_hubworld = ini_read_real("data", "isWorld", false);
	global.srank = ini_read_real("data", "pscore", 8000);
	global.custom_level_name = ini_read_string("data", "name", "");
	global.custom_fill = ini_read_real("data", "escape", 4000);
	var titlecardSprite = ini_read_string("data", "titlecardSprite", "no titlecard");
	var titleSprite = ini_read_string("data", "titleSprite", "");
	var titleSong = ini_read_string("data", "titleSong", "");
	ini_close();
	
	// rooms folder
	var rooms_path = concat(filename_path(ini), "rooms");
	if !directory_exists(rooms_path)
		return "Rooms folder doesn't exist";
	
	try
	{
		ds_map_clear(global.room_map);
		var version_warned = false;
		
		// loop through jsons
		var room_file = file_find_first(concat(rooms_path, "/*.json"), fa_none);
		for(var r = 0; room_file != ""; r++)
		{
			trace("Loading room: ", room_file);
			
			// read file
			var reader = buffer_load(concat(rooms_path, "/", room_file));
			var json = json_parse(buffer_read(reader, buffer_text));
			buffer_delete(reader);
			
			// version mismatch
			if !version_warned && json.editorVersion > 5
				show_message(concat("Expected editorVersion 5, got ", json.editorVersion));
			
			// load room
			if array_length(global.custom_rooms) > r
			{
				var _room = global.custom_rooms[r][0];
				room_assign(_room, custom_room_parent);
				global.custom_rooms[r] = [_room, json];
			}
			else
			{
				var _room = room_add();
				room_assign(_room, custom_room_parent);
				array_push(global.custom_rooms, [_room, json]);
			}
			ds_map_add(global.room_map, filename_change_ext(room_file, ""), r);
			
			// properties
			var prop = json.properties;
			room_set_width(_room, prop.levelWidth - prop.roomX);
			room_set_height(_room, prop.levelHeight - prop.roomY);
			
			view_camera[0] = camera_create_view(0, 0, room_width, room_height);
			room_set_camera(_room, 0, view_camera[0]);
			
			room_file = file_find_next();
		}
		file_find_close();
	}
	catch(e)
	{
		trace(e);
		
		// clean
		ds_map_clear(global.room_map);
		file_find_close();
		
		return "Error loading rooms";
	}
	trace("Done loading rooms");
	
	// load in
	if global.is_hubworld
		global.leveltorestart = noone;
	else
		global.leveltorestart = "main";
	global.leveltosave = string_lower(filename_name(filename_dir(ini)));
	
	var reset = global.levelreset;
	global.levelreset = false;
	
	scr_playerreset(false, true);
	with obj_player1
	{
		if !reset
		{
			visible = false;
			state = -1;
			targetDoor = "A";
			
			with obj_camera
				lock = true;
		}
		else
			targetDoor = "HUB";
		targetRoom = "main";
	}
	
	if titlecardSprite != "no titlecard"
	{
		titlecardSprite = cyop_resolvevalue(titlecardSprite, "sprite_index");
		titleSprite = cyop_resolvevalue(titleSprite, "sprite_index");
		titleSong = cyop_resolvevalue(titleSong, "sound");
	}
	
	if !is_string(titlecardSprite) && titlecardSprite != spr_null && !global.is_hubworld
	{
		if instance_exists(obj_cyop_assetloader)
		{
			with obj_cyop_assetloader
			{
				done_func = method({titlecardSprite: titlecardSprite, titleSprite: titleSprite, titleSong: titleSong}, function()
				{
					obj_cyop_assetloader.titlecard = noone;
					obj_cyop_assetloader.done_func = noone;
				
					with instance_create(0, 0, obj_titlecard)
					{
						titlecard_sprite = other.titlecardSprite;
						titlecard_index = 0;
						title_index = 0;
						title_sprite = other.titleSprite;
						title_music = other.titleSong;
					}
				});
				titlecard = titlecardSprite;
				wait();
			}
		}
		else with instance_create(0, 0, obj_titlecard)
		{
			titlecard_sprite = titlecardSprite;
			titlecard_index = 0;
			title_index = 0;
			title_sprite = titleSprite;
			title_music = titleSong;
		}
	}
	else
	{
		if instance_exists(obj_cyop_assetloader)
		{
			with obj_cyop_assetloader
			{
				done_func = function() {
					instance_create(0, 0, obj_fadeout);
				}
				wait();
			}
		}
		else
			instance_create(0, 0, obj_fadeout);
	}
}
function cyop_resolvevalue(value, varname)
{
	if varname == "content" or varname == "objectlist"
	{
		var return_value = cyop_asset(value);
		if object_exists(return_value)
			return return_value;
		else
			return obj_null;
	}
	if string_pos("spr", varname) > 0
	{
		var return_value = SPRITES[? value];
		if return_value != undefined
			return return_value;
		else
		{
			return_value = global.custom_sprites[? value];
			if !is_undefined(return_value)
				return return_value;
			else
				return spr_blanksprite;
		}
	}
	if varname == "sound" or varname == "title_music"
	{
		return_value = ds_map_find_value(global.custom_audio, value);
		if !is_undefined(return_value)
			return return_value;
		else
			return value;
	}
	//if varname == "visible" or varname == "start"
	{
		if value == "true"
			value = 1;
		if value == "false"
			value = 0;
	}
	return value;
}
function cyop_room_goto(str)
{
	if is_string(str)
	{
		var r = ds_map_find_value(global.room_map, str);
		if is_undefined(r)
		{
			show_message($"Custom room {str} doesn't exist");
			exit;
		}
	}
	else
	{
		// please, avoid this.
		var f = ds_map_find_first(global.room_map);
		while f != undefined
		{
			var r = global.room_map[? f];
			if global.custom_rooms[r][0] == str
				break;
			f = ds_map_find_next(global.room_map, f);
		}
		if f == undefined
		{
			room_goto(str);
			exit;
		}
		else
			str = f;
	}
	
	room_goto(global.custom_rooms[r][0]);
	with obj_levelLoader
	{
		alarm[0] = 1;
		_room = global.custom_rooms[r][1];
		room_name = str;
		room_ind = r;
	}
}
