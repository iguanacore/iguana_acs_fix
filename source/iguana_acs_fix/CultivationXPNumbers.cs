using XiaWorld;
using HarmonyLib;
using XiaWorld.UI.InGame;

namespace iguana_acs_fix
{
    [HarmonyPatch(typeof(Panel_NpcPractice), "OnUpdate_Nei")]
    public class CultivationXPNumbers
    {
        private static void Postfix(UI_NpcPracticePanel ___Panel, NpcPractice practice)
        {
            ___Panel.m_n126.text = $"{practice.StageValue:n0}/{practice.CurStage.Value:n0}";
        }
    }
}
