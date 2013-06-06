#include "ScriptPCH.h"

class Human_Male_Token : public ItemScript
{
public:
	Human_Male_Token() : ItemScript ("Human_Male_Token") { }

	bool onUse(Player* player, Item* item, SpellCastTargets const& targets)
	{
		ChatHandler(player->GetSession()).PSendSysMessage("Successfully morphed, enjoy!");
		player->SetDisplayId(19723);
		return true;
	}
};

void AddSC_Human_Male_Token()
{
	new Human_Male_Token;
}