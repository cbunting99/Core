#include "ScriptMgr.h"
#include "Player.h"
#include "Chat.h"
#include "ChannelMgr.h"
#include "Language.h"
#include "ObjectMgr.h"
#include <math.h>
 
#define MAX_BOJ 30
#define ITEM_ID 29434
 
typedef UNORDERED_MAP<uint64, uint32> PlayerStreakMap;
PlayerStreakMap m_PlayerStreakMap;
typedef UNORDERED_MAP<uint64, uint32> PlayerBountyMap;
PlayerBountyMap m_PlayerBountyMap;
 
uint32 m_Buffs[] = {23505, 23493}; // FILL THIS WITH BUFF SPELL IDS, ELSE PEOPLE WILL DIE RANDOMLY XD
uint8 s_Buffs = sizeof(m_Buffs) / sizeof(uint32);
 
class System_OnKill : public PlayerScript
{
public:
    System_OnKill() : PlayerScript("OnPVPKill_Killstreak") {}
 
    void OnPVPKill(Player * attacker, Player * victim)
    {
        uint32 astreak = m_PlayerStreakMap[attacker->GetGUID()];
        uint32 vstreak = m_PlayerStreakMap[victim->GetGUID()];
        uint32 vbounty = m_PlayerBountyMap[victim->GetGUID()];
 
        if ((astreak % 10) == 0) // DONE ON EVERY TENTH KILL
            attacker->CastSpell(attacker, m_Buffs[urand(0, s_Buffs)], TRIGGERED_CAST_DIRECTLY); // RANDOM BUFF CASTS HERE, REMOVE IF YOU DIDNT WANT IT
 
        if ((astreak % 5) == 0) // DONE ON EVERY FIFTH KILL
        {
            std::ostringstream ss;
            ss << attacker->GetName() << " killed " << victim->GetName() << " and is on a " << astreak << " killstreak, " << victim->GetName() << " had a " << vstreak << " killstreak!";
            std::string str = ss.str();
            WorldPacket data(SMSG_NOTIFICATION, (str.size()+1));
            data << str;
            sWorld->SendGlobalMessage(&data);
        }
 
        uint32 tokenCount = pow(astreak, 1.3f); // You can change 1.3 however you want to scale differently.
 
        if (tokenCount > MAX_BOJ)
            tokenCount = MAX_BOJ;
        tokenCount += vbounty; // BOUNTY IS ADDED TO CALCULATION AFTER BOJ CAP
 
        attacker->AddItem(ITEM_ID, tokenCount);
        
        // Under here, until the message is sent is retarded code
        std::stringstream ss;
        if(astreak == 100)
        {
            ss << attacker->GetName() << " got 50 bounty on himself, go kill him!";
            m_PlayerBountyMap[attacker->GetGUID()] = 50;
        }
        else if (astreak == 75)
        {
            ss << attacker->GetName() << " got 40 bounty on himself, go kill him!";
            m_PlayerBountyMap[attacker->GetGUID()] = 40;
        }
        else if (astreak == 50)
        {
            attacker->CastSpell(attacker, 71495, TRIGGERED_CAST_DIRECTLY); // THIS IS THE EXPLOSION VISUAL CASTED ON 50 KILLSTREAK ONLY, AS A EXAMPLE ON HOW YOU CAN TO OTHERS
            ss << attacker->GetName() << " got 30 bounty on himself, go kill him!";
            m_PlayerBountyMap[attacker->GetGUID()] = 30;
        }
        else if (astreak == 30)
        {
            ss << attacker->GetName() << " got 15 bounty on himself, go kill him!";
            m_PlayerBountyMap[attacker->GetGUID()] = 15;
        }
        if (ss.str().size() >= 10)
        {
            std::string str = ss.str();
            WorldPacket data(SMSG_NOTIFICATION, (str.size()+1));
            data << str;
            sWorld->SendGlobalMessage(&data);
        }
 
        // Increase attackers killstreak
        ++m_PlayerStreakMap[attacker->GetGUID()];
        // Null victims killstreak
        m_PlayerStreakMap[victim->GetGUID()] = 0;
        m_PlayerBountyMap[victim->GetGUID()] = 0;
    }
};
 
void AddSC_PVP_Killstreak()
{
    new System_OnKill;
}