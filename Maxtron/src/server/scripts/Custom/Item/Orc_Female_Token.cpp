#include "ScriptPCH.h"

class Orc_Female_Token : public ItemScript
{
public:
	Orc_Female_Token() : ItemScript ("Orc_Female_Token") { }

	bool onUse(Player* player, Item* item, SpellCastTargets const& targets)
	{
		ChatHandler(player->GetSession()).PSendSysMessage("Successfully morphed, enjoy!");
		player->SetDisplayId(20316);
		return true;
	}
};

void AddSC_Orc_Female_Token()
{
	new Orc_Female_Token;
}