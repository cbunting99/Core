#include "ScriptPCH.h"

class Tauren_Female_Token : public ItemScript
{
public:
	Tauren_Female_Token() : ItemScript ("Tauren_Female_Token") { }

	bool onUse(Player* player, Item* item, SpellCastTargets const& targets)
	{
		ChatHandler(player->GetSession()).PSendSysMessage("Successfully morphed, enjoy!");
		player->SetDisplayId(20584);
		return true;
	}
};

void AddSC_Tauren_Female_Token()
{
	new Tauren_Female_Token;
}