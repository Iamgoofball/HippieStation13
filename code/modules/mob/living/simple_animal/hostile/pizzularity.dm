/mob/living/simple_animal/hostile/pizza
	name = "Meat pizza"
	desc = "A living pizza."
	icon_state = "pizzularity"
	icon_living = "pizzularity"
	icon_dead = "pizzularity_idle"
	icon_gib = "pizzularity"
	speak_chance = 0
	turns_per_move = 5
	// meat_type = "/obj/item/weapon/reagent_containers/food/snacks/sliceable/pizza/meatpizza"
	// meat_amount = 1
	response_help = "attempts to touch"
	response_disarm = "gently pushes aside"
	response_harm = "hits"
	speed = 0
	maxHealth = 200
	health = 100
	faction = list("pizza")
	harm_intent_damage = 0
	melee_damage_lower = 1
	melee_damage_upper = 4
	attacktext = "chomps"
	attack_sound = 'sound/effects/phasein.ogg'
	var/pizza_type = "/obj/item/weapon/reagent_containers/food/snacks/sliceable/pizza/meatpizza"
	var/power = 0//How many things it has eaten

/mob/living/simple_animal/hostile/pizza/Process_Spacemove(var/movement_dir = 0)
	return 1	//No drifting in space for meat pizza!	//original comment STOLEN

/mob/living/simple_animal/hostile/pizza/FindTarget()
	. = ..()
	if(.)
		emote("me", 1, "looks at [.]!")

	var/teleloc = target.loc
	for(var/atom/movable/stuff in teleloc)
		if(!stuff.anchored && stuff.loc)
			do_teleport(stuff, stuff, 10)
			LoseTarget()
			playsound(src.loc, 'sound/effects/phasein.ogg', 30, 1)
	power++

	if(power >= 10)
		power = 0
		health += 10
		if(health > maxHealth)
			health = maxHealth

	// damage_resistance = Clamp(damage_resistance, 0, 50)
	return
