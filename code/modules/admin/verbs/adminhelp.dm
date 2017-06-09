/client/verb/adminhelp(msg as text)
	set category = "Admin"
	set name = "Adminhelp"

	if(say_disabled)	//This is here to try to identify lag problems
		usr << "\red Speech is currently admin-disabled."
		return

	//handle muting and automuting
	if(prefs.muted & MUTE_ADMINHELP)
		src << "<font color='red'>Error: Admin-PM: You cannot send adminhelps (Muted).</font>"
		return

	if(src.mob)
		if(jobban_isbanned(src.mob, "AHELP"))
			src << "<span class='danger'>You have been banned from Adminhelp.</span>"
			return

	adminhelped = 1 //Determines if they get the message to reply by clicking the name.

	if(src.handle_spam_prevention(msg,MUTE_ADMINHELP))
		return

	//clean the input msg
	if(!msg)
		return
	msg = sanitize(msg)
	if(!msg)
		return

	if(!mob) //this doesn't happen
		return

	//show it to the person adminhelping too
	src << "<font color='blue'>PM to-<b>Staff </b>: [msg]</font>"
	log_admin("HELP: [key_name(src)]: [msg]", src, 0)

	msg = "\blue <b><font color=red>Request for Help:: </font>[get_options_bar(mob, 2, 1, 1)]:</b> [msg]"

	for(var/client/X in admins)
		if((R_ADMIN|R_MOD|R_SERVER) & X.holder.rights)
			if(X.prefs.toggles & SOUND_ADMINHELP)
				X << 'sound/effects/adminhelp.ogg'
			X << msg

	return

