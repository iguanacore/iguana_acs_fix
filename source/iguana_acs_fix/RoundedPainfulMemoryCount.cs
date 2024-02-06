using System.Collections.Generic;
using HarmonyLib;
using XiaWorld;
using UnityEngine;

namespace iguana_acs_fix
{
    [HarmonyPatch(typeof(BodyPractice), "ApplyAngerFire")]
    class RoundedPainfulMemoryCount
    {
        public static bool enabled = true;
        static void PostFix(BodyPractice __instance)
            {
                if (!enabled)
                    return;
                __instance.me.RemoveModifier("Modifier_BodyPractice_AngerFire");
                if (__instance.BadMoods == null)
                    return;
                float f = 0.0f;
                float property = __instance.me.GetProperty("BodyPractice_AngerFireNum");
                foreach (KeyValuePair<string, string> badMood in __instance.BadMoods)
                {
                    NpcMoodDef moodDef = NpcMgr.Instance.GetMoodDef(badMood.Key);
                    f += (float)Mathf.Abs(moodDef.Value);
                    --property;
                    if ((double)property <= 0.0)
                        break;
                }
                int stack = Mathf.CeilToInt(f);
                if (stack <= 0)
                    return;
                __instance.me.AddModifier("Modifier_BodyPractice_AngerFire", 1f + __instance.me.GetProperty("BodyPractice_AngerFireEffectAddp"), stack: stack, duration: __instance.me.GetProperty("BodyPractice_AngerFireDuration"));
            }
    }
}
