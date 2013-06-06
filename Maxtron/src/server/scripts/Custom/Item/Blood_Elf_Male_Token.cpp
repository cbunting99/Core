#include "ScriptPCH.h"

class Blood_Elf_Male_Token : public ItemScript
{
public:
	Blood_Elf_Male_Token() : ItemScript ("Blood_Elf_Male_Token") { }

	bool OnUse(Player* player, Item* item, SpellCastTargets const& targets)
	{
		ChatHandler(player->GetSession()).PSendSysMessage("Successfully morphed, enjoy!");
		player->SetDisplayId(20578);
		return true;
	}
};

void AddSC_Blood_Elf_Male_Token()
{
	new Blood_Elf_Male_Token;
}