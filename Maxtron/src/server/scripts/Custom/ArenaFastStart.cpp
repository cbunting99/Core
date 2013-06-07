#include "ScriptPCH.h"
#include "Player.h"
#include "Battleground.h"
#include "BattlegroundMgr.h"

class FastArenaCrystal : public GameObjectScript
{
    public:

        FastArenaCrystal()
            : GameObjectScript("FastArenaCrystal")
        {
        }

        bool OnGossipHello(Player* player, GameObject* go)
        {
            if (Battleground *bg = player->GetBattleground())
                if (bg->isArena())
				{
					bg->ClickFastStart(player, go);
				    return true;
				}
                    

            return false;
        }
};

void AddSC_fast_arena_start()
{
    new FastArenaCrystal();
}