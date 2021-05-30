namespace ITEM_CASH
{

const string MODEL	= "models/counterlife/w_cash.mdl";
const string SOUND	= "counterlife/cash_pickup.wav";
uint PICKUP_VALUE	= 50;
uint SHARED_VALUE	= 20;

class item_cash : ScriptBasePlayerAmmoEntity
{
	void Spawn()
	{
		Precache();
		g_EntityFuncs.SetSize( self.pev, Vector( -7.5, -4, 0 ), Vector( 7.5, 4, 3 ) );
		g_EntityFuncs.SetModel( self, MODEL );
		BaseClass.Spawn();
	}

	void Precache()
	{
		g_Game.PrecacheModel( MODEL );
		g_SoundSystem.PrecacheSound( SOUND );
		g_Game.PrecacheGeneric( "sound/" + SOUND );
		BaseClass.Precache();
	}

	bool AddAmmo( CBaseEntity@ pOther )
	{
		CBasePlayer@ pPlayer = cast<CBasePlayer@>( pOther );

		if( pPlayer !is null )
		{
			BuyMenu::BuyMenuCVARS@ g_CS16 = @BuyMenu::BuyMenuCVARS();

			for( int i = 1; i <= g_Engine.maxClients; ++i )
			{
				CBasePlayer@ pTargets = g_PlayerFuncs.FindPlayerByIndex( i );

				if( i == pPlayer.entindex() )
				{
					int BuyPoints = int(BuyMenu::BuyPoints[g_CS16.PlayerID(pPlayer)]);

					if( BuyPoints < BuyMenu::MaxMoney )
					{
						if( BuyPoints + PICKUP_VALUE > BuyMenu::MaxMoney )
							BuyMenu::BuyPoints[g_CS16.PlayerID(pPlayer)] = BuyMenu::MaxMoney;
						else
							BuyMenu::BuyPoints[g_CS16.PlayerID(pPlayer)] = BuyPoints + PICKUP_VALUE;

						g_CS16.ShowPointsSprite( pPlayer );
					}
					continue;
				}
				else if( pTargets !is null )
				{
					int BuyPoints = int(BuyMenu::BuyPoints[g_CS16.PlayerID(pTargets)]);

					if( BuyPoints < BuyMenu::MaxMoney )
					{
						if( BuyPoints + SHARED_VALUE > BuyMenu::MaxMoney )
							BuyMenu::BuyPoints[g_CS16.PlayerID(pTargets)] = BuyMenu::MaxMoney;
						else
							BuyMenu::BuyPoints[g_CS16.PlayerID(pTargets)] = BuyPoints + SHARED_VALUE;

						g_CS16.ShowPointsSprite( pTargets );
					}
				}
			}
			g_SoundSystem.EmitSound( pPlayer.edict(), CHAN_ITEM, SOUND, 1, ATTN_NORM );
			g_EntityFuncs.Remove( self );
			return true;
		}
		return false;
	}
}

string GetName()
{
	return "item_cash";
}

void Register()
{
	if( g_CustomEntityFuncs.IsCustomEntity( GetName() ) )
		return;

	g_CustomEntityFuncs.RegisterCustomEntity( "ITEM_CASH::item_cash", GetName() );
	g_Game.PrecacheOther( GetName() );
}

}

namespace ITEM_KEVLAR
{

const string MODEL	= "models/counterlife/w_kevlar.mdl";
const string SOUND	= "counterlife/kevlar_pickup.wav";

string ITEM_NAME	= "Kevlar Armor\n";
uint ITEM_PRICE		= 250;

class item_kevlar : ScriptBasePlayerAmmoEntity
{
	void Spawn()
	{ 
		Precache();
		g_EntityFuncs.SetSize( self.pev, Vector( -20, -15, 0 ), Vector( 20, 15, 15 ) );
		g_EntityFuncs.SetModel( self, MODEL );
		self.pev.body = 1;
		BaseClass.Spawn();
	}

	void Precache()
	{
		g_Game.PrecacheModel( MODEL );
		g_SoundSystem.PrecacheSound( SOUND );
		g_Game.PrecacheGeneric( "sound/" + SOUND );
		BaseClass.Precache();
	}

	bool AddAmmo( CBaseEntity@ pOther )
	{
		CBasePlayer@ pPlayer = cast<CBasePlayer@>( pOther );

		if( pPlayer !is null && pPlayer.pev.armorvalue < 100 && pPlayer.HasSuit() )
		{
			pPlayer.pev.armorvalue = 100;

			NetworkMessage msg( MSG_ONE, NetworkMessages::ItemPickup, pPlayer.edict() );
				msg.WriteString( "item_battery" );
			msg.End();

			g_SoundSystem.EmitSound( pPlayer.edict(), CHAN_ITEM, SOUND, 1, ATTN_NORM );
			return true;
		}
		return false;
	}
}

string GetName()
{
	return "item_kevlar";
}

void Register()
{
	if( g_CustomEntityFuncs.IsCustomEntity( GetName() ) )
		return;

	g_CustomEntityFuncs.RegisterCustomEntity( "ITEM_KEVLAR::item_kevlar", GetName() );
	g_Game.PrecacheOther( GetName() );
}

}

namespace FUNC_BUYSTATION
{

const string MODEL	= "models/error.mdl";

class func_buystation : ScriptBaseItemEntity
{
	private uint m_uiMode = 0; //2:for func_recharge, 1:for func_healthcharger

	bool KeyValue( const string& in szKey, const string& in szValue )
	{
		if( szKey == "m_uiMode" )
		{
			m_uiMode = atoui( szValue );
			return true;
		}
		else
			return BaseClass.KeyValue( szKey, szValue );
	}

	void Spawn()
	{
		Precache();
		self.pev.solid = SOLID_BBOX;
		self.pev.movetype = MOVETYPE_FLY;
		g_EntityFuncs.SetSize( self.pev, self.pev.mins, self.pev.maxs );
		if( string(self.pev.model).IsEmpty() )
			g_EntityFuncs.SetModel( self, MODEL );
		else
			g_EntityFuncs.SetModel( self, self.pev.model );
		BaseClass.Spawn();
	}

	void Precache()
	{
		if( string(self.pev.model).IsEmpty() )
			g_Game.PrecacheModel( MODEL );
		else
			g_Game.PrecacheModel( self.pev.model );
		BaseClass.Precache();
	}

	void Use( CBaseEntity@ pActivator, CBaseEntity@ pCaller, USE_TYPE useType, float flValue )
	{
		CBasePlayer@ pPlayer = cast<CBasePlayer@>( pActivator );

		if( pPlayer !is null )
		{
			if( pPlayer.HasWeapons() && pPlayer.HasSuit() )
				g_CLMenu.Show( pPlayer, m_uiMode );
			else
				g_PlayerFuncs.ClientPrint( pPlayer, HUD_PRINTTALK, "[CL BUYMENU] Acquire the suit & any weapon first\n" );
		}
	}
}

string GetName()
{
	return "func_buystation";
}

void Register()
{
	if( g_CustomEntityFuncs.IsCustomEntity( GetName() ) )
		return;

	g_CustomEntityFuncs.RegisterCustomEntity( "FUNC_BUYSTATION::func_buystation", GetName() );
	g_Game.PrecacheOther( GetName() );
}

}

namespace ITEM_HEALTHKIT // Just for aesthetics
{

string ITEM_NAME	= "Medical Kit";
uint ITEM_PRICE		= 50;

string GetName()
{
	return "item_healthkit";
}

}

void RegisterCounterLifeEntities()
{
	ITEM_CASH::Register();
	ITEM_KEVLAR::Register();
	FUNC_BUYSTATION::Register();
}
