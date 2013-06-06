#include "ScriptPCH.h"

class Gnome_Female_Token : public ItemScript
{
public:
	Gnome_Female_Token() : ItemScript ("Gnome_Female_Token") { }

	bool onUse(Player* player, Item* item, SpellCastTargets const& targets)
	{
		ChatHandler(player->GetSession()).PSendSysMessage("Successfully morphed, enjoy!");
		player->SetDisplayId(20581);
		return true;
	}
};

void AddSC_Gnome_Female_Token()
{
	new Gnome_Female_Token;
}