#include "ScriptPCH.h"

class Goblin_Male_Token : public ItemScript
{
public:
	Goblin_Male_Token() : ItemScript ("Goblin_Male_Token") { }

	bool onUse(Player* player, Item* item, SpellCastTargets const& targets)
	{
		ChatHandler(player->GetSession()).PSendSysMessage("Successfully morphed, enjoy!");
		player->SetDisplayId(20582);
		return true;
	}
};

void AddSC_Goblin_Male_Token()
{
	new Goblin_Male_Token;
}