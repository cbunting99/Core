#include "ScriptPCH.h"

class example_gossip_item : public ItemScript
{
	public:
		example_gossip_item() : ItemScript("example_gossip_item") {}

		bool OnUse(Player* player, Item* item, SpellCastTargets const& targets)
		{
			player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Example #1", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
			player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Example #2", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
			player->PlayerTalkClass->SendGossipMenu(534, item->GetGUID());
			return true;
		}

		bool OnGossipSelect(Player* player, Item* item, uint32 sender , uint32 action)
		{
			switch(action)
			{
				case GOSSIP_ACTION_INFO_DEF+1:
					break;
				case GOSSIP_ACTION_INFO_DEF+2:
					break;
			}

			return true;
		}
};

void AddSC_example_gossip_item()
{
	new example_gossip_item();
}