// Counter-Life Stuff
#include "mappings"

// HLSP Stuff
#include "../point_checkpoint"
#include "../hlsp/trigger_suitcheck"

void MapInit()
{
	// HLSP Stuff
	RegisterPointCheckPointEntity();
	RegisterTriggerSuitcheckEntity();
	g_EngineFuncs.CVarSetFloat( "mp_hevsuit_voice", 0 );

	// Counter-Life
	g_Game.PrecacheModel( "sprites/counterlife/logo.spr" );
	g_SoundSystem.PrecacheSound( "counterlife/letsgo.wav" );
	g_Game.PrecacheGeneric( "sound/counterlife/letsgo.wav" );
	g_Game.PrecacheModel( "models/counterlife/w_kevlar.mdl" );

	// Initialize classic mode (item mapping only)
	g_ClassicMode.SetItemMappings( @g_ItemMappings );
	g_ClassicMode.ForceItemRemap( true );
	g_Hooks.RegisterHook( Hooks::PickupObject::Materialize, @CounterLife::PickupObjectMaterialize );
}
