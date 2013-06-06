#include "ScriptPCH.h"

class Troll_Male_Token : public ItemScript
{
public:
	Troll_Male_Token() : ItemScript ("Troll_Male_Token") { }

	bool OnUse(Player* player, Item* item, SpellCastTargets const& targets)
	{
		ChatHandler(player->GetSession()).PSendSysMessage("Successfully morphed, enjoy!");
		player->SetDisplayId(20321);
		return true;
	}
};

void AddSC_Troll_Male_Token()
{
	new Troll_Male_Token;
}