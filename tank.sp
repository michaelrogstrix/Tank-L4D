/********************************************************/
/********************************************************/
/********************************************************/
#include <sourcemod>
#include <sdktools>
#include <sdkhooks>
#include <colors>
#pragma semicolon 1
#define PLUGIN_VERSION "1.0"

/********************************************************/
/********************************************************/
public OnPluginStart()
{
	HookEvent("tank_spawn", Event_TankSpawn);
}

/********************************************************/
/********************************************************/
public Event_TankSpawn(Handle:event, String:name[], bool:dontBroadcast)
{
new client = GetClientOfUserId(GetEventInt(event, "userid"));
if (!IsClientInGame(client)) return;
//decl String:model[] = "models/infected/hulk_ultralisk.mdl";
//decl String:model[] = "models/infected/hulk_dlc3.mdl";
decl String:model[] = "models/infected/hulk_ultralisk.mdl";

SetEntityModel(client, model);
}

public OnMapStart()
{
//PrecacheModel("models/infected/hulk_molten.mdl", true);
//PrecacheModel("models/infected/hulk_2.mdl", true);
PrecacheModel("models/infected/hulk_ultralisk.mdl", true);
}

public OnEntityCreated(entity, const String:classname[])
{
	if(entity == -1) return;
	if(entity > MaxClients && IsValidEdict(entity) && StrEqual(classname, "infected", true))
	{		
		CreateTimer(0.1, This, EntIndexToEntRef(entity));
	}
}

public Action:This(Handle:timer, any:entity)
{
	if ((entity = EntRefToEntIndex(entity)) == INVALID_ENT_REFERENCE || !IsValidEntity(entity))
	return;
	SetEntityModel(entity, " "); 
}
