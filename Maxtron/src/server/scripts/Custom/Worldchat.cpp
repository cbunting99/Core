#include "ScriptPCH.h"
#include "Chat.h"
#include "Common.h"

class World_Chat : public CommandScript
{
public:
	World_Chat() : CommandScript("World_Chat") { }
	
	static bool HandleWorldChatCommand(ChatHandler * pChat, const char * msg)
	{
		if(!*msg)
			return false;
		
		Player * player = pChat->GetSession()->GetPlayer();
		char message[1024];
		
		switch(player->GetSession()->GetSecurity())
		{
		case SEC_PLAYER:
			switch (player->getFaction())
			{
		case ALLIANCE:
			snprintf(message, 1024, "|FF9900[MG]|cff0000EE[Alliance]|cffffff00[[%s]: %s", player->GetName().c_str(), msg);
			sWorld->SendGlobalText(message, NULL);
			break;
		case HORDE:
			snprintf(message, 1024, "|FF9900[MG]|cffCC1100[Horde]|cffffff00[%s]: %s", player->GetName().c_str(), msg);
			sWorld->SendGlobalText(message, NULL);
			break;
		default:
			snprintf(message, 1024, "|FF9900[MG]|cffffff00[NULL][%s]: %s", player->GetName().c_str(), msg);
			sWorld->SendGlobalText(message, NULL);
			break;
			}

		case SEC_PREMIUM:
			snprintf(message, 1024, "|FF9900[MG]|cff00ccff[Premium][%s]: %s", player->GetName().c_str(), msg);
			sWorld->SendGlobalText(message, NULL);
			break;
	
		case SEC_MODERATOR:
			snprintf(message, 1024, "|FF9900[MG]|cffADFF2F[Moderator][%s]: %s", player->GetName().c_str(), msg);
			sWorld->SendGlobalText(message, NULL);
			break;
		
		case SEC_TICKET_GM:
			snprintf(message, 1024, "|FF9900[MG]|cffADFF2F[GM][%s]: %s", player->GetName().c_str(), msg);
		    sWorld->SendGlobalText(message, NULL);
			break;
		
		case SEC_EVENT_GM:
			snprintf(message, 1024, "|FF9900[MG]|cffADFF2F[EM][%s]: %s", player->GetName().c_str(), msg);
			sWorld->SendGlobalText(message, NULL);
			break;
		
		case SEC_GAMEMASTER:
			snprintf(message, 1024, "|FF9900[MG]|cffADFF2F[Gamemaster][%s]: %s", player->GetName().c_str(), msg);
			sWorld->SendGlobalText(message, NULL);
			break;
		
		case SEC_HEAD_GM:
			snprintf(message, 1024, "|FF9900[MG]|cffADFF2F[Head GM][%s]: %s", player->GetName().c_str(), msg);
			sWorld->SendGlobalText(message, NULL);
			break;
		
		case SEC_DEVELOPER:
			snprintf(message, 1024, "|FF9900[MG]|cff8B8B83[Developer][%s]: %s", player->GetName().c_str(), msg);
			sWorld->SendGlobalText(message, NULL);
			break;
		
		case SEC_HEAD_DEVELOPER:
			snprintf(message, 1024, "|FF9900[MG]|cff8B8B83[Head Dev][%s]: %s", player->GetName().c_str(), msg);
			sWorld->SendGlobalText(message, NULL);
			break;
		
		case SEC_ADMINISTRATOR:
			snprintf(message, 1024, "|FF9900[MG]|cffFF4500[Administrator][%s]: %s", player->GetName().c_str(), msg);
			sWorld->SendGlobalText(message, NULL);
			break;

		case SEC_OWNER:
			snprintf(message, 1024, "|FF9900[MG]|cffFF4500[Owner][%s]: %s", player->GetName().c_str(), msg);
			sWorld->SendGlobalText(message, NULL);
			break;
		
		case SEC_CONSOLE:
			snprintf(message, 1024, "|FF9900[MG]|cffFF4500[Console][%s]: %s", player->GetName().c_str(), msg);
			sWorld->SendGlobalText(message, NULL);
			break;
		}
		return true;
	}
	
	ChatCommand * GetCommands() const
	{
		static ChatCommand HandleWorldChatCommandTable[] =
		{
			{ "world",        SEC_PLAYER,         true,     &HandleWorldChatCommand,               "",  NULL },
			{ NULL,              0,               false,    NULL,                                  "",  NULL }
		};
		return HandleWorldChatCommandTable;
	}
};

void AddSC_World_Chat()
{
	new World_Chat;
}