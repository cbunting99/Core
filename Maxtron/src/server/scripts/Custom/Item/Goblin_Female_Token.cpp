#include "ScriptPCH.h"

class Goblin_Female_Token : public ItemScript
{
public:
	Goblin_Female_Token() : ItemScript ("Goblin_Female_Token") { }

	bool onUse(Player* player, Item* item, SpellCastTargets const& targets)
	{
		ChatHandler(player->GetSession()).PSendSysMessage("Successfully morphed, enjoy!");
		player->SetDisplayId(20583);
		return true;
	}
};

void AddSC_Goblin_Female_Token()
{
	new Goblin_Female_Token;
}