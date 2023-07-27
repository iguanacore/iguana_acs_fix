using XiaWorld;
using HarmonyLib;
using System.Collections.Generic;
using System;
using System.Reflection;

namespace iguana_acs_fix
{
    internal class QiRecoveryNOLING
    {
        static void setQiRecoveryToZero(Npc npc, g_emNpcSpecailFlag eFlag, int value, int oldvalue)
        {
            npc.DynamicAddLing(0f);
        }
        
        [HarmonyPatch(typeof(ThingFlag<Npc>), "BuildActionDict")]
        internal class addNOLINGFlag
        {
            private static void Postfix(ThingFlag<Npc> __instance)
            {
                Dictionary<int, Action<Npc, g_emNpcSpecailFlag, int, int>> dicAction = (Dictionary<int, Action<Npc, g_emNpcSpecailFlag, int, int>>)Traverse.Create(__instance).Field("dicAction").GetValue();

                dicAction[(int)g_emNpcSpecailFlag.FLAG_NOLING] = setQiRecoveryToZero;
            }
        }
    }
    
}
