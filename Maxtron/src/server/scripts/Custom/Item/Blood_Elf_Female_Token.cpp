#include "ScriptPCH.h"

class Blood_Elf_Female_Token : public ItemScript
{
public:
	Blood_Elf_Female_Token() : ItemScript ("Blood_Elf_Female_Token") { }

	bool onUse(Player* player, Item* item, SpellCastTargets const& targets)
	{
		ChatHandler(player->GetSession()).PSendSysMessage("Successfully morphed, enjoy!");
		player->SetDisplayId(20579);
		return true;
	}
};

void AddSC_Blood_Elf_Female_Token()
{
	new Blood_Elf_Female_Token;
}