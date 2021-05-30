//Counter-Life Stuff
#include "entities"
//Counter-Strike 1.6 Weapons Project 
//Credits to D.N.I.O. 071/R4to0/KernCore and all its contributors:
//https://github.com/KernCore91/-SC-Counter-Strike-1.6-Weapons-Project/blob/main/cs16_credits.txt
#include "../cs16/weapons"
#include "BuyMenu"

void PluginInit()
{
	g_Module.ScriptInfo.SetAuthor( "Rizulix" );
	g_Module.ScriptInfo.SetContactInfo( "https://discord.gg/svencoop" );

	//Register Buy menu stuff
	BuyMenu::RegisterBuyMenuCCVars();
}

void MapInit()
{
	g_CLMenu.RemoveItems();

	//Helper method to register all weapons
	RegisterAll();
	//Register Counter-Life entities
	RegisterCounterLifeEntities();

	//Add items to BuyMenu
	BuyMenuAddItems();

	//Initializes hooks and precaches used by the Buy Menu Plugin
	BuyMenu::MoneyInit();
}

void BuyMenuAddItems()
{
	//Pistols and Handguns
	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_GLOCK18::WPN_NAME, CS16_GLOCK18::GetName(), 550, "handgun" ) );
	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_GLOCK18::AMMO_NAME, CS16_GLOCK18::GetAmmoName(), CS16_GLOCK18::AMMO_PRICE, "ammo", "handgun" ) );

	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_USP::WPN_NAME, CS16_USP::GetName(), 650, "handgun" ) );
	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_USP::AMMO_NAME, CS16_USP::GetAmmoName(), CS16_USP::AMMO_PRICE, "ammo", "handgun" ) );

	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_P228::WPN_NAME, CS16_P228::GetName(), 800, "handgun" ) );
	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_P228::AMMO_NAME, CS16_P228::GetAmmoName(), CS16_P228::AMMO_PRICE, "ammo", "handgun" ) );

	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_57::WPN_NAME, CS16_57::GetName(), 850, "handgun" ) );
	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_57::AMMO_NAME, CS16_57::GetAmmoName(), CS16_57::AMMO_PRICE, "ammo", "handgun" ) );

	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_ELITES::WPN_NAME, CS16_ELITES::GetName(), 1000, "handgun" ) );
	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_ELITES::AMMO_NAME, CS16_ELITES::GetAmmoName(), CS16_ELITES::AMMO_PRICE, "ammo", "handgun" ) );

	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_DEAGLE::WPN_NAME, CS16_DEAGLE::GetName(), 1100, "handgun" ) );
	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_DEAGLE::AMMO_NAME, CS16_DEAGLE::GetAmmoName(), CS16_DEAGLE::AMMO_PRICE, "ammo", "handgun" ) );


	//Shotguns
	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_M3::WPN_NAME, CS16_M3::GetName(), 2300, "shotgun" ) );
	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_M3::AMMO_NAME, CS16_M3::GetAmmoName(), CS16_M3::AMMO_PRICE, "ammo", "shotgun" ) );

	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_XM1014::WPN_NAME, CS16_XM1014::GetName(), 4100, "shotgun" ) );
	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_XM1014::AMMO_NAME, CS16_XM1014::GetAmmoName(), CS16_XM1014::AMMO_PRICE, "ammo", "shotgun" ) );


	//Submachine guns
	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_MAC10::WPN_NAME, CS16_MAC10::GetName(), 1700, "smg" ) );
	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_MAC10::AMMO_NAME, CS16_MAC10::GetAmmoName(), CS16_MAC10::AMMO_PRICE, "ammo", "smg" ) );

	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_TMP::WPN_NAME, CS16_TMP::GetName(), 1900, "smg" ) );
	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_TMP::AMMO_NAME, CS16_TMP::GetAmmoName(), CS16_TMP::AMMO_PRICE, "ammo", "smg" ) );

	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_MP5::WPN_NAME, CS16_MP5::GetName(), 2050, "smg" ) );
	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_MP5::AMMO_NAME, CS16_MP5::GetAmmoName(), CS16_MP5::AMMO_PRICE, "ammo", "smg" ) );

	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_UMP45::WPN_NAME, CS16_UMP45::GetName(), 2300, "smg" ) );
	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_UMP45::AMMO_NAME, CS16_UMP45::GetAmmoName(), CS16_UMP45::AMMO_PRICE, "ammo", "smg" ) );

	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_P90::WPN_NAME, CS16_P90::GetName(), 3200, "smg" ) );
	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_P90::AMMO_NAME, CS16_P90::GetAmmoName(), CS16_P90::AMMO_PRICE, "ammo", "smg" ) );


	//Assault Rifles & Sniper Rifles
	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_FAMAS::WPN_NAME, CS16_FAMAS::GetName(), 2750, "rifle" ) );
	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_FAMAS::AMMO_NAME, CS16_FAMAS::GetAmmoName(), CS16_FAMAS::AMMO_PRICE, "ammo", "rifle" ) );

	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_GALIL::WPN_NAME, CS16_GALIL::GetName(), 3100, "rifle" ) );
	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_GALIL::AMMO_NAME, CS16_GALIL::GetAmmoName(), CS16_GALIL::AMMO_PRICE, "ammo", "rifle" ) );

	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_AK47::WPN_NAME, CS16_AK47::GetName(), 3800, "rifle" ) );
	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_AK47::AMMO_NAME, CS16_AK47::GetAmmoName(), CS16_AK47::AMMO_PRICE, "ammo", "rifle" ) );

	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_M4A1::WPN_NAME, CS16_M4A1::GetName(), 4250, "rifle" ) );
	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_M4A1::AMMO_NAME, CS16_M4A1::GetAmmoName(), CS16_M4A1::AMMO_PRICE, "ammo", "rifle" ) );

	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_AUG::WPN_NAME, CS16_AUG::GetName(), 4800, "rifle" ) );
	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_AUG::AMMO_NAME, CS16_AUG::GetAmmoName(), CS16_AUG::AMMO_PRICE, "ammo", "rifle" ) );

	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_SG552::WPN_NAME, CS16_SG552::GetName(), 4800, "rifle" ) );
	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_SG552::AMMO_NAME, CS16_SG552::GetAmmoName(), CS16_SG552::AMMO_PRICE, "ammo", "rifle" ) );

	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_SCOUT::WPN_NAME, CS16_SCOUT::GetName(), 3750, "rifle" ) );
	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_SCOUT::AMMO_NAME, CS16_SCOUT::GetAmmoName(), CS16_SCOUT::AMMO_PRICE, "ammo", "rifle" ) );

	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_AWP::WPN_NAME, CS16_AWP::GetName(), 6500, "rifle" ) );
	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_AWP::AMMO_NAME, CS16_AWP::GetAmmoName(), CS16_AWP::AMMO_PRICE, "ammo", "rifle" ) );

	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_SG550::WPN_NAME, CS16_SG550::GetName(), 5750, "rifle" ) );
	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_SG550::AMMO_NAME, CS16_SG550::GetAmmoName(), CS16_SG550::AMMO_PRICE, "ammo", "rifle" ) );

	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_G3SG1::WPN_NAME, CS16_G3SG1::GetName(), 6850, "rifle" ) );
	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_G3SG1::AMMO_NAME, CS16_G3SG1::GetAmmoName(), CS16_G3SG1::AMMO_PRICE, "ammo", "rifle" ) );


	//Light Machine Guns
	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_M249::WPN_NAME, CS16_M249::GetName(), 7900, "lmg" ) );
	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_M249::AMMO_NAME, CS16_M249::GetAmmoName(), CS16_M249::AMMO_PRICE, "ammo", "lmg" ) );


	//Explosives and Equipment
	g_CLMenu.AddItem( BuyMenu::BuyableItem( ITEM_HEALTHKIT::ITEM_NAME, ITEM_HEALTHKIT::GetName(), 100, "equip" ) );

	g_CLMenu.AddItem( BuyMenu::BuyableItem( ITEM_KEVLAR::ITEM_NAME, ITEM_KEVLAR::GetName(), 650, "equip" ) );

	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_HEGRENADE::WPN_NAME, CS16_HEGRENADE::GetName(), 300, "equip" ) );

	g_CLMenu.AddItem( BuyMenu::BuyableItem( CS16_C4::WPN_NAME, CS16_C4::GetName(), 1500, "equip" ) );
}
