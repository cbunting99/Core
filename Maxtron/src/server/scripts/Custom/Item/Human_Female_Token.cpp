#include "ScriptPCH.h"

class Human_Female_Token : public ItemScript
{
public:
	Human_Female_Token() : ItemScript ("Human_Female_Token") { }

	bool onUse(Player* player, Item* item, SpellCastTargets const& targets)
	{
		ChatHandler(player->GetSession()).PSendSysMessage("Successfully morphed, enjoy!");
		player->SetDisplayId(19724);
		return true;
	}
};

void AddSC_Human_Female_Token()
{
	new Human_Female_Token;
}