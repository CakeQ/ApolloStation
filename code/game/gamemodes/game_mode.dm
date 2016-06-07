//This file was auto-corrected by findeclaration.exe on 25.5.2012 20:42:31

/*
 * GAMEMODES (by Rastaf0)
 *
 * In the new mode system all special roles are fully supported.
 * You can have proper wizards/traitors/changelings/cultists during any mode.
 * Only two things really depends on gamemode:
 * 1. Starting roles, equipment and preparations
 * 2. Conditions of finishing the round.
 *
 */


/datum/game_mode
	var/name = "invalid"
	var/config_tag = null
	var/intercept_hacked = 0
	var/votable = 1
	var/probability = 0
	var/station_was_nuked = 0 //see nuclearbomb.dm and malfunction.dm
	var/explosion_in_progress = 0 //sit back and relax
	var/list/datum/mind/modePlayer = new
	var/list/restricted_jobs = list()	// Jobs it doesn't make sense to be.  I.E chaplain or AI cultist
	var/list/protected_jobs = list()	// Jobs that can't be traitors because
	var/list/persistant_traitors = list()
	var/required_players = 0
	var/required_players_secret = 0 //Minimum number of players for that game mode to be chose in Secret
	var/required_enemies = 0
	var/recommended_enemies = 0
	var/newscaster_announcements = null
	var/ert_disabled = 0
	var/shuttle_delay = 1
	var/uplink_welcome = "Illegal Uplink Console:"
	var/uplink_uses = 10
	var/list/datum/uplink_item/uplink_items = list(
		"Highly Visible and Dangerous Weapons" = list(
			 new/datum/uplink_item(/obj/item/weapon/gun/projectile, 6000, "Revolver", "RE"),
			 new/datum/uplink_item(/obj/item/ammo_magazine/a357, 2000, "Ammo-357", "RA"),
			 new/datum/uplink_item(/obj/item/weapon/gun/energy/crossbow, 5000, "Energy Crossbow", "XB"),
			 new/datum/uplink_item(/obj/item/weapon/melee/energy/sword, 4000, "Energy Sword", "ES"),
			 new/datum/uplink_item(/obj/item/mecha_parts/mecha_equipment/weapon/energy/riggedlaser, 6000, "Exosuit Rigged Laser", "RL"),
			 new/datum/uplink_item(/obj/item/weapon/storage/box/syndicate, 10000, "Mercenary Bundle", "BU"),
			 new/datum/uplink_item(/obj/item/weapon/storage/box/emps, 3000, "5 EMP Grenades", "EM"),
			 new/datum/uplink_item(/obj/item/weapon/grenade/spawnergrenade/bhole, 10000, "Black Hole Grenade", "BH")
			),
		"Stealthy and Inconspicuous Weapons" = list(
			new/datum/uplink_item(/obj/item/weapon/soap/syndie, 1000, "Subversive Soap", "SP"),
			new/datum/uplink_item(/obj/item/weapon/cartridge/syndicate, 3000, "Detomatix PDA Cartridge", "DC"),
			new/datum/uplink_item(/obj/item/weapon/cane/pois_cane, 3000, "Poison Tipped Cane", "PC"),
			new/datum/uplink_item(/obj/item/device/flash/syndicamera, 2000, "Flashy Camera", "CF")
			),
		"Stealth and Camouflage Items" = list(
			new/datum/uplink_item(/obj/item/clothing/shoes/syndigaloshes, 2000, "No-Slip Shoes", "SH")
			),
		"Devices and Tools" = list(
			new/datum/uplink_item(/obj/item/weapon/card/emag, 4000, "Cryptographic Sequencer", "CS"),
			new/datum/uplink_item(/obj/item/weapon/card/emag/weak, 1000, "Encryptic Sequencer", "CE"),
			new/datum/uplink_item(/obj/item/weapon/reagent_containers/tube/syndicream, 2000, "Syndicream Tube", "SC"),
			new/datum/uplink_item(/obj/item/weapon/storage/box/syndie_kit/spybug, 2000, "Spybug Kit", "SK" ),
			new/datum/uplink_item(/obj/item/weapon/storage/toolbox/syndicate, 1000, "Fully Loaded Toolbox", "ST"),
			new/datum/uplink_item(/obj/item/weapon/storage/box/syndie_kit/clerical, 3000, "Morphic Clerical Kit", "CK"),
			new/datum/uplink_item(/obj/item/weapon/storage/box/syndie_kit/space, 3000, "Space Suit", "SS"),
			new/datum/uplink_item(/obj/item/clothing/glasses/thermal/syndi, 3000, "Thermal Imaging Glasses", "TM"),
			new/datum/uplink_item(/obj/item/device/encryptionkey/binary, 3000, "Binary Translator Key", "BT"),
			new/datum/uplink_item(/obj/item/weapon/aiModule/syndicate, 7000, "Hacked AI Upload Module", "AI"),
			new/datum/uplink_item(/obj/item/weapon/plastique, 2000, "C-4 (Destroys walls)", "C4"),
			new/datum/uplink_item(/obj/item/device/powersink, 5000, "Powersink (DANGER!)", "PS",),
			new/datum/uplink_item(/obj/item/device/radio/beacon/syndicate, 7000, "Singularity Beacon (DANGER!)", "SB"),
			new/datum/uplink_item(/obj/item/weapon/circuitboard/teleporter, 20000, "Teleporter Circuit Board", "TP")
			),
		"Implants" = list(
			new/datum/uplink_item(/obj/item/weapon/storage/box/syndie_kit/imp_explosive, 6000, "Explosive Implant (DANGER!)", "EI")
			),
		"Fun and Games" = list(
			new/datum/uplink_item(/obj/item/weapon/storage/box/lube, 3000, "6 Lube Grenades", "LG"),
			new/datum/uplink_item(/obj/item/weapon/reagent_containers/spray/pepper/alcohol, 2000, "Alcospray", "AS"),
			),
		"(Pointless) Badassery" = list(
			new/datum/uplink_item(/obj/item/toy/syndicateballoon, 10000, "For showing that You Are The BOSS (Useless Balloon)", "BS"),
			new/datum/uplink_item(/obj/item/weapon/gun/projectile/automatic/bb_gun, 10000, "BB Gun", "BB"),
			)
		)

// Items removed from above:
/*
/obj/item/weapon/cloaking_device:4:Cloaking Device;	//Replacing cloakers with thermals.	-Pete
*/

/datum/game_mode/proc/announce() //to be calles when round starts
	world << "<B>Notice</B>: [src] did not define announce()"


///can_start()
///Checks to see if the game can be setup and ran with the current number of players or whatnot.
/datum/game_mode/proc/can_start()
	var/playerC = 0
	for(var/mob/new_player/player in player_list)
		if((player.client)&&(player.ready))
			playerC++

	if(master_mode=="secret")
		if(playerC >= required_players_secret)
			return 1
	else
		if(playerC >= required_players)
			return 1
	return 0


///pre_setup()
///Attempts to select players for special roles the mode might have.
/datum/game_mode/proc/pre_setup()
	return 1

/datum/game_mode/proc/persistant_antag_pre_setup()
	var/list/players = list()
	var/list/candidates = list()

	// Assemble a list of active players without jobbans.
	for(var/mob/new_player/player in player_list)
		if( player.client && player.ready )
			if( !jobban_isbanned(player, "Syndicate" ))
				players += player

	// Shuffle the players list so that it becomes ping-independent.
	players = shuffle(players)

	// Get a list of all the people who want to be the antagonist for this round
	for(var/mob/new_player/player in players)
		if( player.client.prefs.selected_character && player.client.prefs.selected_character.isPersistantAntag() )
			log_debug("[player.key] is a persistant antag.")
			candidates += player.mind
			players -= player

	var/num_traitors = 1

	// yes this is hardcoded, yes i know its bad, yes go away please
	num_traitors = max(1, round( num_players()/5 ))

	for(var/j = 0, j < num_traitors, j++)
		if (!candidates.len)
			log_debug("No candidates for persistant antag.")
			break
		var/datum/mind/traitor = pick(candidates)

		log_debug("Picked [traitor.name] for persistant antag.")
		persistant_traitors += traitor
		var/faction = traitor.current.client.prefs.selected_character.getAntagFaction() // please dont break

		traitor.antagonist = new /datum/antagonist/traitor/persistant( traitor, faction )
		candidates.Remove(traitor)

	if(!persistant_traitors.len)
		return 0
	return 1

/datum/game_mode/proc/persistant_antag_post_setup()
	for(var/datum/mind/traitor in persistant_traitors)
		spawn(rand(10,100))
			if(istype(traitor.current, /mob/living/silicon/ai))
				traitor.antagonist.faction = /datum/faction/syndicate/self
			traitor.antagonist.setup()

	return 1

///post_setup()
///Everyone should now be on the station and have their normal gear.  This is the place to give the special roles extra things
/datum/game_mode/proc/post_setup()
	spawn (ROUNDSTART_LOGOUT_REPORT_TIME)
		display_roundstart_logout_report()

	feedback_set_details("round_start","[time2text(world.realtime)]")
	if(ticker && ticker.mode)
		feedback_set_details("game_mode","[ticker.mode]")
	feedback_set_details("server_ip","[world.internet_address]:[world.port]")
	return 1


///process()
///Called by the gameticker
/datum/game_mode/proc/process()
	return 0


/datum/game_mode/proc/check_finished() //to be called by ticker
	if(emergency_shuttle.returned() || station_was_nuked)
		return 1
	return 0

/datum/game_mode/proc/cleanup()	//This is called when the round has ended but not the game, if any cleanup would be necessary in that case.
	return

/datum/game_mode/proc/declare_completion()
	var/clients = 0
	var/surviving_humans = 0
	var/surviving_total = 0
	var/ghosts = 0
	var/escaped_humans = 0
	var/escaped_total = 0
	var/escaped_on_pod_1 = 0
	var/escaped_on_pod_2 = 0
	var/escaped_on_pod_3 = 0
	var/escaped_on_pod_5 = 0
	var/escaped_on_shuttle = 0

	var/list/area/escape_locations = list(/area/shuttle/escape/centcom, /area/shuttle/escape_pod1/centcom, /area/shuttle/escape_pod2/centcom, /area/shuttle/escape_pod3/centcom, /area/shuttle/escape_pod5/centcom)

	for(var/mob/M in player_list)
		if(M.client)
			clients++
			if(ishuman(M))
				if(M.stat != DEAD)
					surviving_humans++
					if(M.loc && M.loc.loc && M.loc.loc.type in escape_locations)
						escaped_humans++
			if(M.stat != DEAD)
				surviving_total++
				if(M.loc && M.loc.loc && M.loc.loc.type in escape_locations)
					escaped_total++

				if(M.loc && M.loc.loc && M.loc.loc.type == /area/shuttle/escape/centcom)
					escaped_on_shuttle++

				if(M.loc && M.loc.loc && M.loc.loc.type == /area/shuttle/escape_pod1/centcom)
					escaped_on_pod_1++
				if(M.loc && M.loc.loc && M.loc.loc.type == /area/shuttle/escape_pod2/centcom)
					escaped_on_pod_2++
				if(M.loc && M.loc.loc && M.loc.loc.type == /area/shuttle/escape_pod3/centcom)
					escaped_on_pod_3++
				if(M.loc && M.loc.loc && M.loc.loc.type == /area/shuttle/escape_pod5/centcom)
					escaped_on_pod_5++

			if(isobserver(M))
				ghosts++

	var/text = ""
	if(surviving_total > 0)
		text += "<br>There [surviving_total>1 ? "were <b>[surviving_total] survivors</b>" : "was <b>one survivor</b>"]</b>"
		text += " (<b>[escaped_total>0 ? escaped_total : "none"] [emergency_shuttle.evac ? "escaped" : "transferred"]</b>) and <b>[ghosts] ghosts</b>.</b><br>"
	else
		text += "There were <b>no survivors</b> (<b>[ghosts] ghosts</b>).</b><br>"

	if( !config.canon )
		text += "<h2>This round was NOT canon.</h2><br>"

	world << text

	if(clients > 0)
		feedback_set("round_end_clients",clients)
	if(ghosts > 0)
		feedback_set("round_end_ghosts",ghosts)
	if(surviving_humans > 0)
		feedback_set("survived_human",surviving_humans)
	if(surviving_total > 0)
		feedback_set("survived_total",surviving_total)
	if(escaped_humans > 0)
		feedback_set("escaped_human",escaped_humans)
	if(escaped_total > 0)
		feedback_set("escaped_total",escaped_total)
	if(escaped_on_shuttle > 0)
		feedback_set("escaped_on_shuttle",escaped_on_shuttle)
	if(escaped_on_pod_1 > 0)
		feedback_set("escaped_on_pod_1",escaped_on_pod_1)
	if(escaped_on_pod_2 > 0)
		feedback_set("escaped_on_pod_2",escaped_on_pod_2)
	if(escaped_on_pod_3 > 0)
		feedback_set("escaped_on_pod_3",escaped_on_pod_3)
	if(escaped_on_pod_5 > 0)
		feedback_set("escaped_on_pod_5",escaped_on_pod_5)

	send2mainirc("A round of [src.name] has ended - [surviving_total] survivors, [ghosts] ghosts.")



	return 0

// persistant antag related stuff for after the game ends
/datum/game_mode/proc/persistant_antag_game_end()
	for( var/datum/mind/traitor in persistant_traitors )
		var/datum/antagonist/antag = traitor.antagonist
		if( antag )	continue // admin removed them or something, idk

		// antag got caught check goes here

		var/notoriety = traitor.original_character.antag_data["notoriety"]
		var/contract_requirement = round( ( notoriety + 1 ) / 2 )
		if( antag.completed_contracts.len > contract_requirement )
			notoriety++
			traitor.current << "<span class='notice'>You have gained notoriety for completing [antag.completed_contracts.len > contract_requirement ? "more than" : ""] [contract_requirement] contracts!</span>"
		else if( antag.completed_contracts.len < ( notoriety - contract_requirement ))
			notoriety--
			traitor.current << "<span class='warning'>You have lost notoriety for not completing enough contracts!</span>"
		else if( antag.failed_contracts.len > antag.completed_contracts.len )
			notoriety--
			traitor.current << "<span class='warning'>You have lost notoriety for failing more contracts than you completed!</span>"
		traitor.original_character.antag_data["notoriety"] = notoriety
		traitor.original_character.antag_data["career_length"]++

		traitor.current << "<span class='notice'>Your career length is now [traitor.character.antag_data["career_length"]] rounds!</span>"


/datum/game_mode/proc/check_win() //universal trigger to be called at mob death, nuke explosion, etc. To be called from everywhere.
	return 0


/datum/game_mode/proc/send_intercept()
	var/intercepttext = "<FONT size = 3><B>Cent. Com. Update</B> Requested status information:</FONT><HR>"
	intercepttext += "<B> In case you have misplaced your copy, attached is a list of personnel whom reliable sources&trade; suspect may be affiliated with subversive elements:</B><br>"


	var/list/suspects = list()
	for(var/mob/living/carbon/human/man in player_list) if(man.client && man.mind)
		// NT relation option
		var/special_role = man.mind.special_role
		if (special_role == "Wizard" || special_role == "Ninja" || special_role == "Mercenary" || special_role == "Vox Raider")
			continue	//NT intelligence ruled out possiblity that those are too classy to pretend to be a crew.
		if(man.client.prefs.selected_character.nanotrasen_relation == "Opposed" && prob(50) || \
		   man.client.prefs.selected_character.nanotrasen_relation == "Skeptical" && prob(20))
			suspects += man
		// Antags
		else if(special_role == "traitor" && prob(40) || \
		   special_role == "Changeling" && prob(50) || \
		   special_role == "Cultist" && prob(30) || \
		   special_role == "Head Revolutionary" && prob(30))
			suspects += man

			// If they're a traitor or likewise, give them extra TC in exchange.
			var/obj/item/device/uplink/hidden/suplink = man.mind.find_syndicate_uplink()
			if(suplink)
				var/extra = 4
				suplink.uses += extra
				man << "<span class='alert'>We have received notice that enemy intelligence suspects you to be linked with us. We have thus invested significant resources to increase your uplink's capacity.</span>"
			else
				// Give them a warning!
				man << "<span class='alert'>They are on to you!</span>"

		// Some poor people who were just in the wrong place at the wrong time..
		else if(prob(10))
			suspects += man
	for(var/mob/M in suspects)
		switch(rand(1, 100))
			if(1 to 50)
				intercepttext += "Someone with the job of <b>[M.mind.assigned_role]</b> <br>"
			else
				intercepttext += "<b>[M.name]</b>, the <b>[M.mind.assigned_role]</b> <br>"

	for (var/obj/machinery/computer/communications/comm in machines)
		if (!(comm.stat & (BROKEN | NOPOWER)) && comm.prints_intercept)
			var/obj/item/weapon/paper/intercept = new /obj/item/weapon/paper( comm.loc )
			intercept.name = "Cent. Com. Status Summary"
			intercept.info = intercepttext

			comm.messagetitle.Add("Cent. Com. Status Summary")
			comm.messagetext.Add(intercepttext)
	world << sound('sound/AI/commandreport.ogg')

/*	command_alert("Summary downloaded and printed out at all communications consoles.", "Enemy communication intercept. Security Level Elevated.")
	for(var/mob/M in player_list)
		if(!istype(M,/mob/new_player))
			M << sound('sound/AI/intercept.ogg')
	if(security_level < SEC_LEVEL_BLUE)
		set_security_level(SEC_LEVEL_BLUE)*/


/datum/game_mode/proc/get_players_for_role(var/role, override_jobbans=0)
	var/list/players = list()
	var/list/candidates = list()
	//var/list/drafted = list()
	//var/datum/mind/applicant = null

	var/roletext
	switch(role)
		if(BE_CHANGELING)	roletext="changeling"
		if(BE_TRAITOR)		roletext="traitor"
		if(BE_OPERATIVE)	roletext="operative"
		if(BE_WIZARD)		roletext="wizard"
		if(BE_REV)			roletext="revolutionary"
		if(BE_CULTIST)		roletext="cultist"
		if(BE_NINJA)		roletext="ninja"
		if(BE_RAIDER)		roletext="raider"
		if(BE_ALIEN)        roletext="alien"

	// Assemble a list of active players without jobbans.
	for(var/mob/new_player/player in player_list)
		if( player.client && player.ready )
			if(!jobban_isbanned(player, "Syndicate") && !jobban_isbanned(player, roletext))
				players += player

	// Shuffle the players list so that it becomes ping-independent.
	players = shuffle(players)

	// Get a list of all the people who want to be the antagonist for this round
	for(var/mob/new_player/player in players)
		if(player.client.prefs.beSpecial() & role)
			log_debug("[player.key] had [roletext] enabled, so we are drafting them.")
			candidates += player.mind
			players -= player

	// If we don't have enough antags, draft people who voted for the round.
	if(candidates.len < recommended_enemies)
		for(var/key in round_voters)
			for(var/mob/new_player/player in players)
				if(player.ckey == key)
					log_debug("[player.key] voted for this round, so we are drafting them.")
					candidates += player.mind
					players -= player
					break

	// Remove candidates who want to be antagonist but have a job that precludes it
	if(restricted_jobs)
		for(var/datum/mind/player in candidates)
			for(var/job in restricted_jobs)
				if(player.assigned_role == job)
					candidates -= player

	/*if(candidates.len < recommended_enemies)
		for(var/mob/new_player/player in players)
			if(player.client && player.ready)
				if(!(player.client.prefs.beSpecial() & role)) // We don't have enough people who want to be antagonist, make a seperate list of people who don't want to be one
					if(!jobban_isbanned(player, "Syndicate") && !jobban_isbanned(player, roletext)) //Nodrak/Carn: Antag Job-bans
						drafted += player.mind

	if(restricted_jobs)
		for(var/datum/mind/player in drafted)				// Remove people who can't be an antagonist
			for(var/job in restricted_jobs)
				if(player.assigned_role == job)
					drafted -= player

	drafted = shuffle(drafted) // Will hopefully increase randomness, Donkie

	while(candidates.len < recommended_enemies)				// Pick randomlly just the number of people we need and add them to our list of candidates
		if(drafted.len > 0)
			applicant = pick(drafted)
			if(applicant)
				candidates += applicant
				log_debug("[applicant.key] was force-drafted as [roletext], because there aren't enough candidates.")
				drafted.Remove(applicant)

		else												// Not enough scrubs, ABORT ABORT ABORT
			break

	if(candidates.len < recommended_enemies && override_jobbans) //If we still don't have enough people, we're going to start drafting banned people.
		for(var/mob/new_player/player in players)
			if (player.client && player.ready)
				if(jobban_isbanned(player, "Syndicate") || jobban_isbanned(player, roletext)) //Nodrak/Carn: Antag Job-bans
					drafted += player.mind

	if(restricted_jobs)
		for(var/datum/mind/player in drafted)				// Remove people who can't be an antagonist
			for(var/job in restricted_jobs)
				if(player.assigned_role == job)
					drafted -= player

	drafted = shuffle(drafted) // Will hopefully increase randomness, Donkie

	while(candidates.len < recommended_enemies)				// Pick randomlly just the number of people we need and add them to our list of candidates
		if(drafted.len > 0)
			applicant = pick(drafted)
			if(applicant)
				candidates += applicant
				drafted.Remove(applicant)
				log_debug("[applicant.key] was force-drafted as [roletext], because there aren't enough candidates.")

		else												// Not enough scrubs, ABORT ABORT ABORT
			break
	*/

	return candidates		// Returns: The number of people who had the antagonist role set to yes, regardless of recomended_enemies, if that number is greater than recommended_enemies
							//			recommended_enemies if the number of people with that role set to yes is less than recomended_enemies,
							//			Less if there are not enough valid players in the game entirely to make recommended_enemies.

///////////////////////////////////
//Picks some antags for the round//
///////////////////////////////////
/datum/game_mode/proc/pick_antagonists(var/role, var/num_antags)
	var/list/possible_antags = get_players_for_role(role)
	var/list/chosen_antags = list()
	var/list/clients = list()

	// track the top weight and discard candidates below this top weight
	// antags are then picked from a list of players with that weight
	var/top_weight
	for( var/datum/mind/M in possible_antags )
		if( M.antagonist || ( M.assigned_role in restricted_jobs ))
			possible_antags -= M
			continue

		var/weight = 0
		var/client/C = M.current.client
		if( !C )
			possible_antags -= M
			continue
		clients += C

		// antag token/commendation weight
		if( !C.character_tokens["Antagonist"] )
			C.character_tokens["Antagonist"] = 0
		weight += ( C.character_tokens["Antagonist"] * 2 )

		// last played as antag weight
		weight += C.no_antag_weight
		C.no_antag_weight++ // set to 0 for chosen antags later

		if(!top_weight || weight >= top_weight)
			top_weight = weight
		else
			possible_antags -= M

	if( !possible_antags.len )
		return chosen_antags

	for( var/i = 0, i < num_antags, i++ )
		if( !possible_antags.len )
			break

		var/datum/mind/antag = pick(possible_antags)
		var/client/C = antag.current.client
		if( !C )
			possible_antags -= antag
			continue

		C.no_antag_weight = 0

		chosen_antags += antag
		possible_antags -= antag

	// there has to be a better way to do this
	for( var/client/C in clients )
		C.saveAntagWeights()

	return chosen_antags


/datum/game_mode/proc/latespawn(var/mob)

/*
/datum/game_mode/proc/check_player_role_pref(var/role, var/mob/new_player/player)
	if(player.preferences.beSpecial() & role)
		return 1
	return 0
*/

/datum/game_mode/proc/num_players()
	. = 0
	for(var/mob/new_player/P in player_list)
		if(P.client && P.ready)
			. ++


///////////////////////////////////
//Keeps track of all living heads//
///////////////////////////////////
/datum/game_mode/proc/get_living_heads()
	var/list/heads = list()
	for(var/mob/living/carbon/human/player in mob_list)
		if(player.stat!=2 && player.mind && (player.mind.assigned_role in command_positions))
			heads += player.mind
	return heads


////////////////////////////
//Keeps track of all heads//
////////////////////////////
/datum/game_mode/proc/get_all_heads()
	var/list/heads = list()
	for(var/mob/player in mob_list)
		if(player.mind && (player.mind.assigned_role in command_positions))
			heads += player.mind
	return heads

/datum/game_mode/proc/check_antagonists_topic(href, href_list[])
	return 0

/datum/game_mode/New()
	newscaster_announcements = pick(newscaster_standard_feeds)

//////////////////////////
//Reports player logouts//
//////////////////////////
proc/display_roundstart_logout_report()
	var/msg = "<span class='notice'><b>Roundstart logout report\n\n</span>"
	for(var/mob/living/L in mob_list)

		if(L.ckey)
			var/found = 0
			for(var/client/C in clients)
				if(C.ckey == L.ckey)
					found = 1
					break
			if(!found)
				msg += "<b>[L.name]</b> ([L.ckey]), the [L.job] (<font color='#ffcc00'><b>Disconnected</b></font>)\n"


		if(L.ckey && L.client)
			if(L.client.inactivity >= (ROUNDSTART_LOGOUT_REPORT_TIME / 2))	//Connected, but inactive (alt+tabbed or something)
				msg += "<b>[L.name]</b> ([L.ckey]), the [L.job] (<font color='#ffcc00'><b>Connected, Inactive</b></font>)\n"
				continue //AFK client
			if(L.stat)
				if(L.suiciding)	//Suicider
					msg += "<b>[L.name]</b> ([L.ckey]), the [L.job] (<font color='red'><b>Suicide</b></font>)\n"
					continue //Disconnected client
				if(L.stat == UNCONSCIOUS)
					msg += "<b>[L.name]</b> ([L.ckey]), the [L.job] (Dying)\n"
					continue //Unconscious
				if(L.stat == DEAD)
					msg += "<b>[L.name]</b> ([L.ckey]), the [L.job] (Dead)\n"
					continue //Dead

			continue //Happy connected client
		for(var/mob/dead/observer/D in mob_list)
			if(D.mind && (D.mind.original == L || D.mind.current == L))
				if(L.stat == DEAD)
					if(L.suiciding)	//Suicider
						msg += "<b>[L.name]</b> ([ckey(D.mind.key)]), the [L.job] (<font color='red'><b>Suicide</b></font>)\n"
						continue //Disconnected client
					else
						msg += "<b>[L.name]</b> ([ckey(D.mind.key)]), the [L.job] (Dead)\n"
						continue //Dead mob, ghost abandoned
				else
					if(D.can_reenter_corpse)
						msg += "<b>[L.name]</b> ([ckey(D.mind.key)]), the [L.job] (<font color='red'><b>This shouldn't appear.</b></font>)\n"
						continue //Lolwhat
					else
						msg += "<b>[L.name]</b> ([ckey(D.mind.key)]), the [L.job] (<font color='red'><b>Ghosted</b></font>)\n"
						continue //Ghosted while alive



	for(var/mob/M in mob_list)
		if(M.client && M.client.holder)
			M << msg


proc/get_nt_opposed()
	var/list/dudes = list()
	for(var/mob/living/carbon/human/man in player_list)
		if(man.client)
			if(man.client.prefs.selected_character.nanotrasen_relation == "Opposed")
				dudes += man
			else if(man.client.prefs.selected_character.nanotrasen_relation == "Skeptical" && prob(50))
				dudes += man
	if(dudes.len == 0) return null
	return pick(dudes)

//Announces objectives/generic antag text.
/proc/show_generic_antag_text(var/datum/mind/player)
	if(player.current)
		player.current << \
		"You are an antagonist! <font color=blue>Within the rules,</font> \
		try to act as an opposing force to the crew. Further RP and try to make sure \
		other players have <i>fun</i>! If you are confused or at a loss, always adminhelp, \
		and before taking extreme actions, please try to also contact the administration! \
		Think through your actions and make the roleplay immersive! <b>Please remember all \
		rules aside from those without explicit exceptions apply to antagonists.</b>"

/proc/show_objectives(var/datum/mind/player)

	if(!player || !player.current) return

	if(config.objectives_disabled)
		show_generic_antag_text(player)
		return

	var/obj_count = 1
	player.current << "<span class='notice'>Your current objectives:</span>"
	for(var/datum/objective/objective in player.objectives)
		player.current << "<B>Objective #[obj_count]</B>: [objective.explanation_text]"
		obj_count++

/datum/game_mode/proc/print_player_lite(var/datum/mind/ply)
	var/role = ply.assigned_role == "MODE" ? "\improper[ply.special_role]" : "\improper[ply.assigned_role]"
	var/text = "<br><b>[ply.name]</b> as \a <b>[role]</b> ("
	if(ply.current)
		if(ply.current.stat == DEAD)
			text += "died"
		else
			text += "survived"
		if(ply.current.real_name != ply.name)
			text += " as <b>[ply.current.real_name]</b>"
	else
		text += "body destroyed"
	text += ")"

	return text

/datum/game_mode/proc/print_player_full(var/datum/mind/ply)
	var/text = print_player_lite(ply)

	var/money_spent = 0
	var/uplink_true = 0
	var/purchases = ""
	for(var/obj/item/device/uplink/H in world_uplinks)
		if(H && H.uplink_owner && H.uplink_owner == ply)
			money_spent = H.uplink_owner.antagonist.money_spent
			uplink_true = 1
			var/list/refined_log = new()
			for(var/datum/uplink_item/UI in H.purchase_log)
				var/obj/I = new UI.path
				refined_log.Add("[H.purchase_log[UI]]x\icon[I][UI.name]")
				qdel(I)
			purchases = english_list(refined_log, nothing_text = "")
	if(uplink_true)
		text += " (Spent $[money_spent])"
		if(purchases)
			text += "<br>[purchases]"

	return text
