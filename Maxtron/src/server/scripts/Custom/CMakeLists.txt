# Copyright (C) 2008-2013 TrinityCore <http://www.trinitycore.org/>
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

set(scripts_STAT_SRCS
  ${scripts_STAT_SRCS}
  Custom/NPC/Item_Requester_NPC.cpp
  Custom/NPC/Beastmaster_NPC.cpp
  Custom/NPC/Exchanger_NPC.cpp
  Custom/NPC/Professions_NPC.cpp
  Custom/NPC/Mall_Guide_NPC.cpp
  Custom/NPC/Teleporter_NPC.cpp
  Custom/NPC/Top_Arena_NPC.cpp
  Custom/Custom/New_Dawning_Mage.cpp
  Custom/Custom/New_Dawning_Recruiter.cpp
  Custom/anti_hk_farm.cpp
  Custom/commands.cpp
  Custom/UtilityCmd.cpp
  Custom/Vendor_NPC.cpp
  Custom/VipNpc.cpp
  Custom/VipToken.cpp
  Custom/Worldchat.cpp
  Custom/Transmogrification.cpp
  Custom/Transmogrification.h
  Custom/PlayerScripts/Zone_Scripts.cpp
  Custom/PlayerScripts/Arena_Scripts.cpp
  Custom/ArenaFastStart.cpp
  Custom/Killstreak.cpp
)

message("  -> Prepared: Custom")
