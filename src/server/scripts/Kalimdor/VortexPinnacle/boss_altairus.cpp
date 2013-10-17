/*
 * Copyright (C) 2011-2013 Project SkyFire <http://www.projectskyfire.org/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 3 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "vortex_pinnacle.h"
#include "ScriptPCH.h"

enum eSpells
{
    SPELL_CIILLING_BREATH_N       = 88308,
    SPELL_CIILLING_BREATH_H       = 93989,
};

class boss_altairus : public CreatureScript
{
public:
    boss_altairus() : CreatureScript("boss_altairus") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new boss_altairusAI (creature);
    }

    struct boss_altairusAI : public ScriptedAI
    {
        boss_altairusAI(Creature* creature) : ScriptedAI(creature)
        {
            instance = creature->GetInstanceScript();
        }

        InstanceScript* instance;

        uint32 ChillingBreathTimer;

        void Reset()
        {
            ChillingBreathTimer = 15000;
        }

        void EnterCombat(Unit* /*who*/)
        {
        }

        void JustDied(Unit* killer/*Killer*/)
        {
          //  instance->SetData(DATA_ALTAIRUS, DONE);

                if (Player* player = killer->ToPlayer())
                     player->ModifyCurrency(395, DUNGEON_MODE(3000, 7000));

        }

        void UpdateAI(uint32 diff)
        {
            if (!UpdateVictim())
                return;

            if (ChillingBreathTimer <= diff)
            {
                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
                    me->CastSpell(target, DUNGEON_MODE(SPELL_CIILLING_BREATH_N, SPELL_CIILLING_BREATH_H), true);

                ChillingBreathTimer = urand(12*IN_MILLISECONDS, 17*IN_MILLISECONDS);
            } else ChillingBreathTimer -= diff;

            DoMeleeAttackIfReady();
        }
    };
};

void AddSC_boss_altairus()
{
    new boss_altairus();
}
