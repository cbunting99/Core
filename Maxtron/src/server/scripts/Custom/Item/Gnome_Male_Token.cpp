#include "ScriptPCH.h"

class Gnome_Male_Token : public ItemScript
{
public:
	Gnome_Male_Token() : ItemScript ("Gnome_Male_Token") { }

	bool onUse(Player* player, Item* item, SpellCastTargets const& targets)
	{
		ChatHandler(player->GetSession()).PSendSysMessage("Successfully morphed, enjoy!");
		player->SetDisplayId(20580);
		return true;
	}
};

void AddSC_Gnome_Male_Token()
{
	new Gnome_Male_Token;
}