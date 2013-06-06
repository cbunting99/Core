#include "ScriptPCH.h"

class Night_Elf_Male_Token : public ItemScript
{
public:
	Night_Elf_Male_Token() : ItemScript ("Night_Elf_Male_Token") { }

	bool onUse(Player* player, Item* item, SpellCastTargets const& targets)
	{
		ChatHandler(player->GetSession()).PSendSysMessage("Successfully morphed, enjoy!");
		player->SetDisplayId(20318);
		return true;
	}
};

void AddSC_Night_Elf_Male_Token()
{
	new Night_Elf_Male_Token;
}