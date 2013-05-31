#include "ScriptPCH.h"
     
    class Vendor_NPC : public CreatureScript
    {
            public:
            Vendor_NPC() : CreatureScript("Vendor_NPC") { }
     
            bool OnGossipHello(Player * pPlayer, Creature * pCreature)
            {
                                       if (pPlayer->GetSession()->GetSecurity() >= SEC_PREMIUM)
                    {
                                        pPlayer->ADD_GOSSIP_ITEM(6, "VIP VENDOR", GOSSIP_SENDER_MAIN, GOSSIP_OPTION_VENDOR);
                                        }
                                        else
                                        { 
                                         pPlayer->ADD_GOSSIP_ITEM(6, "Bye", GOSSIP_SENDER_MAIN,1);
                                        }
                    pPlayer->PlayerTalkClass->SendGossipMenu(9452, pCreature->GetGUID());
                    return true;
                                    }
           
            bool OnGossipSelect(Player *player, Creature * m_creature, uint32 sender, uint32 action)
    {
                player->PlayerTalkClass->ClearMenus();
                                switch (action)
                                {
                                case GOSSIP_OPTION_VENDOR:
                player->GetSession()->SendListInventory(m_creature->GetGUID());
                                break;
                                case 1:
                                m_creature->MonsterWhisper("Why are you here?  You are not a Premium member!", player -> GetGUID());
                                player->TeleportTo(530,-2044.427246f, 6654.854492f, 50.339191f, 0.520328f);//Change me!
                                player->CLOSE_GOSSIP_MENU();
                                break;
                        }
        return true;
    }
};
 
        void AddSC_Vendor_NPC()
{
    new Vendor_NPC();
}