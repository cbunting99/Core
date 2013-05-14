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
			snprintf(message, 1024, "|cffffff00[World][Player][%s]: %s|r", player->GetName().c_str(), msg);
			sWorld->SendGlobalText(message, NULL);
			break;
		
		case SEC_PREMIUM:
			snprintf(message, 1024, "|cffffff00[World][Premium][%s]: %s|r", player->GetName().c_str(), msg);
			sWorld->SendGlobalText(message, NULL);
			break;
		
		case SEC_MODERATOR:
			snprintf(message, 1024, "|cffffff00[World][|Tinterface\\ChatFrame\\UI-ChatIcon-Blizz.blp:18:22:0:-1\124|tModerator][%s]: %s|r", player->GetName().c_str(), msg);
			sWorld->SendGlobalText(message, NULL);
			break;
		
		case SEC_TICKET_GM:
			snprintf(message, 1024, "|cffffff00[World][|Tinterface\\ChatFrame\\UI-ChatIcon-Blizz.blp:18:22:0:-1\124|tGM][%s]: %s|r", player->GetName().c_str(), msg);
			sWorld->SendGlobalText(message, NULL);
			break;
		
		case SEC_EVENT_GM:
			snprintf(message, 1024, "|cffffff00[World][|Tinterface\\ChatFrame\\UI-ChatIcon-Blizz.blp:18:22:0:-1\124|tEM][%s]: %s|r", player->GetName().c_str(), msg);
			sWorld->SendGlobalText(message, NULL);
			break;
		
		case SEC_GAMEMASTER:
			snprintf(message, 1024, "|cffffff00[World][|Tinterface\\ChatFrame\\UI-ChatIcon-Blizz.blp:18:22:0:-1\124|tGamemaster][%s]: %s|r", player->GetName().c_str(), msg);
			sWorld->SendGlobalText(message, NULL);
			break;
		
		case SEC_HEAD_GM:
			snprintf(message, 1024, "|cffffff00[World][|Tinterface\\ChatFrame\\UI-ChatIcon-Blizz.blp:18:22:0:-1\124|tHead GM][%s]: %s|r", player->GetName().c_str(), msg);
			sWorld->SendGlobalText(message, NULL);
			break;
		
		case SEC_DEVELOPER:
			snprintf(message, 1024, "|cffffff00[World][|Tinterface\\ChatFrame\\UI-ChatIcon-Blizz.blp:18:22:0:-1\124|tDeveloper][%s]: %s|r", player->GetName().c_str(), msg);
			sWorld->SendGlobalText(message, NULL);
			break;
		
		case SEC_HEAD_DEVELOPER:
			snprintf(message, 1024, "|cffffff00[World][|Tinterface\\ChatFrame\\UI-ChatIcon-Blizz.blp:18:22:0:-1\124|tHead Dev][%s]: %s|r", player->GetName().c_str(), msg);
			sWorld->SendGlobalText(message, NULL);
			break;
		
		case SEC_ADMINISTRATOR:
			snprintf(message, 1024, "|cffffff00[World][|Tinterface\\ChatFrame\\UI-ChatIcon-Blizz.blp:18:22:0:-1\124|tAdministrator][%s]: %s|r", player->GetName().c_str(), msg);
			sWorld->SendGlobalText(message, NULL);
			break;

		case SEC_OWNER:
			snprintf(message, 1024, "|cffffff00[World][|Tinterface\\ChatFrame\\UI-ChatIcon-Blizz.blp:18:22:0:-1\124|tOwner][%s]: %s|r", player->GetName().c_str(), msg);
			sWorld->SendGlobalText(message, NULL);
			break;
		
		case SEC_CONSOLE:
			snprintf(message, 1024, "|cffffff00[World][|Tinterface\\ChatFrame\\UI-ChatIcon-Blizz.blp:18:22:0:-1\124|tConsole][%s]: %s|r", player->GetName().c_str(), msg);
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