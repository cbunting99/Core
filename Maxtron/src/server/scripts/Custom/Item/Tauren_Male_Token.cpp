#include "ScriptPCH.h"

class Tauren_Male_Token : public ItemScript
{
public:
	Tauren_Male_Token() : ItemScript ("Tauren_Male_Token") { }

	bool onUse(Player* player, Item* item, SpellCastTargets const& targets)
	{
		ChatHandler(player->GetSession()).PSendSysMessage("Successfully morphed, enjoy!");
		player->SetDisplayId(20585);
		return true;
	}
};

void AddSC_Tauren_Male_Token()
{
	new Tauren_Male_Token;
}