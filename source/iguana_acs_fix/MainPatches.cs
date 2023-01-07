using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using XiaWorld;
using HarmonyLib;

namespace iguana_acs_fix
{
    public class MainPatches
    {
        [HarmonyPatch(typeof(HumanoidEvolutionMgr), "ModifyNpcByFrag")]
        private class YaoguaiFragmentSkillLevelPatch
        {
            private static void Postfix(ref HumanoidEvolutionMgr __instance, Npc npc, string frag, bool toremove)
            {
                HEFragmentDef def = __instance.Fragments.GetDef(frag);
                bool flag = def == null;
                if (!flag)
                {
                    bool flag2 = npc == null;
                    if (!flag2)
                    {
                        NpcPropertyMgr propertyMgr = npc.PropertyMgr;
                        bool flag3 = def.Skills != null;
                        if (flag3)
                        {
                            NpcSkillData skillData = propertyMgr.SkillData;
                            foreach (ModifierSkillData modifierSkillData in def.Skills)
                            {
                                if (modifierSkillData.Level != 0f)
                                {
                                    int v = GameUlt.Float2Int(modifierSkillData.Level);
                                    if (toremove)
                                    {
                                        skillData.AddSkillLevelAddion(modifierSkillData.Name, -2 * v);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
