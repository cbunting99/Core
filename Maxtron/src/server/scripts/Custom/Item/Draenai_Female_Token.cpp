#include "ScriptPCH.h"

class Draenai_Female_Token : public ItemScript
{
public:
	Draenai_Female_Token() : ItemScript ("Draenai_Female_Token") { }

	bool onUse(Player* player, Item* item, SpellCastTargets const& targets)
	{
		ChatHandler(player->GetSession()).PSendSysMessage("Successfully morphed, enjoy!");
		player->SetDisplayId(20323);
		return true;
	}
};

void AddSC_Draenai_Female_Token()
{
	new Draenai_Female_Token;
}