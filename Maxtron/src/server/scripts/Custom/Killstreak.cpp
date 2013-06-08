#include "ScriptPCH.h"
 
class Killstreak : public PlayerScript
{
public:
    Killstreak() : PlayerScript("Killstreak"){}
};
 
void AddSC_Killstreak()
{
    new Killstreak();
}