#include "ScriptPCH.h"

class Dwarf_Male_Token : public ItemScript
{
public:
	Dwarf_Male_Token() : ItemScript ("Dwarf_Male_Token") { }

	bool onUse(Player* player, Item* item, SpellCastTargets const& targets)
	{
		ChatHandler(player->GetSession()).PSendSysMessage("Successfully morphed, enjoy!");
		player->SetDisplayId(20317);
		return true;
	}
};

void AddSC_Dwarf_Male_Token()
{
	new Dwarf_Male_Token;
}