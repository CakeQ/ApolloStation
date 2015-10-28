/obj/structure/broodswam/hive_pit/halloween
	var/list/pumpkins = list()

/obj/structure/broodswam/hive_pit/halloween/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/spec_pumpkin))
		user << "You throw the [W.name] into the pit!"
		if(pumpkins.len<6)
			if(pumpkins.Find(W.icon_state))
				user << "This jack-o-lantern has already been thrown in the pit! Find the others"
				return
			else
				pumpkins.Add(W.icon_state)
			for(var/mob/living/M in hearers(src,7))
				M << "\blue <b>A [pumpkins.len < 4 ? "noise" : "groan"] echo's from the bottom of the pit!</b>"
				M << "<span class='notice'><b>Halloween Secret - [pumpkins.len] out of 7 have been thrown in!</b></span>"
		else if(pumpkins.len==7)
			user << "\blue <b>The broodmother has already been defeated!</b>"
			return
		else
			for(var/mob/living/M in hearers(src,7))	// Same condition to win it
				M << "<b>The floor begins to shake!</b>"
				shake_camera(M,15,1)
				M <<"<h1>The broodmother has surfaced!</h1>"
				M << "<span class='notice'><b>Halloween Secret - Defeat the broodmother to unlock your reward!</b></span>"

			new /mob/living/simple_animal/hostile/alien/queen/halloween(src.loc)

	else if(istype(W, /obj/item/weapon/reagent_containers/food/snacks/grown/pumpkin))	// ooo secretss
		user << "<span class='notice'><b>Halloween Uber Secret - Congradulations! You've unlocked the broodmother mask! Show it off to your friends or something</b></span>"
		log_acc_item_to_db(user.ckey,/obj/item/clothing/mask/broodmask)
	else
		user << "\red You don't think whatever is down there will like that.."
		user << "\blue You throw it down anyway!"

	qdel(W)

// The boss mob is an alien queen with more health
/mob/living/simple_animal/hostile/alien/queen/halloween
	name = "Broodmother"
	icon = 'icons/mob/broodmother.dmi'
	icon_state = "broodmother"
	icon_living = "broodmother"
	icon_dead = "broodmother"
	maxHealth = 300		//Since it does more damage - reduced health
	health = 300

/mob/living/simple_animal/hostile/alien/queen/halloween/attackby()
	//Attack back if you get attacked GAWD
	AttackingTarget()


/mob/living/simple_animal/hostile/alien/queen/halloween/death()
	for(var/mob/living/M in hearers(src,7))	// Should give anyone near broodmo the item
		M << "<span class='notice'><b>Halloween Secret - Congratulations! You've defeated the broodmother. The Bone Necklace has been added to your account as a reward.</b></span>"
		log_acc_item_to_db(M.ckey,/obj/item/clothing/mask/broodlace)

	..()
