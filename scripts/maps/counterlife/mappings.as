array<ItemMapping@> g_ItemMappings = {
	//crowbar
	ItemMapping( "weapon_crowbar", "item_cash" ),
	//pipewrench
	ItemMapping( "weapon_pipewrench", "item_cash" ),
	//grapple
	ItemMapping( "weapon_grapple", "item_cash" ),
	//glock
	ItemMapping( "weapon_9mmhandgun", "item_cash" ), ItemMapping( "weapon_glock", "item_cash" ),
		ItemMapping( "ammo_9mmclip", "item_cash" ), ItemMapping( "ammo_glockclip", "item_cash" ),
	//357
	ItemMapping( "weapon_357", "item_cash" ), ItemMapping( "weapon_python", "item_cash" ),
		ItemMapping( "ammo_357", "item_cash" ),
	//eagle
	ItemMapping( "weapon_eagle", "item_cash" ),
	//uzi
	ItemMapping( "weapon_uzi", "item_cash" ),
	//uziakimbo
	ItemMapping( "weapon_uziakimbo", "item_cash" ),
	//mp5
	ItemMapping( "weapon_9mmAR", "item_cash" ), ItemMapping( "weapon_9mmar", "item_cash" ), ItemMapping( "weapon_mp5", "item_cash" ),
		ItemMapping( "ammo_9mmAR", "item_cash" ), ItemMapping( "ammo_9mmar", "item_cash" ), ItemMapping( "ammo_mp5clip", "item_cash" ), ItemMapping( "ammo_9mmbox", "item_cash" ),
		ItemMapping( "ammo_ARgrenades", "item_cash" ), ItemMapping( "ammo_argrenades", "item_cash" ), ItemMapping( "ammo_mp5grenades", "item_cash" ),
	//shotgun
	ItemMapping( "weapon_shotgun", "item_cash" ),
		ItemMapping( "ammo_buckshot", "item_cash" ),
	//crossbow
	ItemMapping( "weapon_crossbow", "item_cash" ),
		ItemMapping( "ammo_crossbow", "item_cash" ),
	//m16
	ItemMapping( "weapon_m16", "item_cash" ),
		ItemMapping( "ammo_556clip", "item_cash" ),
	//rpg
	ItemMapping( "weapon_rpg", "item_cash" ),
		ItemMapping( "ammo_rpgclip", "item_cash" ),
	//gauss
	ItemMapping( "weapon_gauss", "item_cash" ), 
		ItemMapping( "ammo_gaussclip", "item_cash" ),
	//egon
	ItemMapping( "weapon_egon", "item_cash" ),
		ItemMapping( "ammo_egonclip", "item_cash" ),
	//hornetgun
	ItemMapping( "weapon_hornetgun", "item_cash" ),
	//handgrenade
	ItemMapping( "weapon_handgrenade", "item_cash" ),
	//satchel
	ItemMapping( "weapon_satchel", "item_cash" ),
	//tripmine
	ItemMapping( "weapon_tripmine", "item_cash" ),
	//snark
	ItemMapping( "weapon_snark", "item_cash" ),
	//sniperrifle
	ItemMapping( "weapon_sniperrifle", "item_cash" ),
		ItemMapping( "ammo_762", "item_cash" ),
	//m249
	ItemMapping( "weapon_m249", "item_cash" ), ItemMapping( "weapon_saw", "item_cash" ),
		ItemMapping( "ammo_556", "item_cash" ),
	//sporelauncher
	ItemMapping( "weapon_sporelauncher", "item_cash" ),
		ItemMapping( "ammo_sporeclip", "item_cash" ), ItemMapping( "ammo_spore", "item_cash" ),
	//displacer
	ItemMapping( "weapon_displacer", "item_cash" ),
	//shockrifle
	ItemMapping( "weapon_shockrifle", "item_cash" ),
	//minigun
	ItemMapping( "weapon_minigun", "item_cash" ),
	//battery
	ItemMapping( "item_battery", "item_kevlar" )
};

namespace CounterLife
{

// From Insurgency Weapons Project
// https://github.com/KernCore91/-SC-Insurgency-Weapons-Project/blob/master/scripts/maps/ins2/maps/suspension.as#L219-L250
// Credits to D.N.I.O. 071/Norman The Loli Pirate/R4to0/D.G.F./KernCore and all its contributors:
// https://github.com/KernCore91/-SC-Insurgency-Weapons-Project/blob/master/ins2_credits_1st_release.txt
HookReturnCode PickupObjectMaterialize( CBaseEntity@ pEntity )
{
	Vector origin, angles;
	string targetname, target, netname;

	for( uint j = 0; j < g_ItemMappings.length(); ++j )
	{
		if( pEntity.pev.ClassNameIs( g_ItemMappings[j].get_From() ) )
		{
			origin = pEntity.pev.origin;
			angles = pEntity.pev.angles;
			targetname = pEntity.pev.targetname;
			target = pEntity.pev.target;
			netname = pEntity.pev.netname;

			g_EntityFuncs.Remove( pEntity );
			CBaseEntity@ pNewEnt = g_EntityFuncs.Create( g_ItemMappings[j].get_To(), origin, angles, true );

			if( targetname != "" )
				g_EntityFuncs.DispatchKeyValue( pNewEnt.edict(), "targetname", targetname );

			if( target != "" )
				g_EntityFuncs.DispatchKeyValue( pNewEnt.edict(), "target", target );

			if( netname != "" )
				g_EntityFuncs.DispatchKeyValue( pNewEnt.edict(), "netname", netname );

			g_EntityFuncs.DispatchSpawn( pNewEnt.edict() );
		}
	}
	return HOOK_HANDLED;
}

}
