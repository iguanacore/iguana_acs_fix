using System;
using XiaWorld;
using HarmonyLib;
using UnityEngine;

namespace iguana_acs_fix
{
    public class RefinementSuccessChance
	{
        [HarmonyPatch(typeof(UILogicMode_IndividualCommand), "CheckThing")]
        private class ChangeHeadMessage
        {
            private static void Postfix(ref UILogicMode_IndividualCommand __instance, Thing t, Thing ___BindThing)
            {
                g_emIndividualCommandType Type = __instance.Type;
                if (Type != g_emIndividualCommandType.SoulCrystalLingPowerUp && Type != g_emIndividualCommandType.DaoCuiPowerUp && Type != g_emIndividualCommandType.SoulCrystalYouPowerUp) { return; }
                ItemThing targetItem = t as ItemThing;
                Npc casterNpc = ___BindThing as Npc;
                float BAddP = 0f;
                // While the game considers the casterNpc's room for the cast, using the item's room is better in case the chance is checked with the NPC in another room
                // This could maybe create some edge errors but infrequent enough to be ignored.
                if (targetItem.AtRoom != null && targetItem.AtRoom.FengShui >= g_emFengshuiRank.Bad) 
                {
                    BAddP = ((float)targetItem.AtRoom.FengShui - 3f) * 0.01f;
                }
                float sentientSoulGemMultiplier = 0;
                if (casterNpc.CheckSpecialFlag(g_emNpcSpecailFlag.UpgradeCuiLian) != 0)
                {
                    sentientSoulGemMultiplier = 1;
                }
                float successChance = (1 + sentientSoulGemMultiplier) * Mathf.Pow(GameDefine.SOULCRYSTALYOU_BASE + BAddP, targetItem.Rate + targetItem.YouAddDaoPower);
                switch (Type)
                {
                    case g_emIndividualCommandType.DaoCuiPowerUp:
                        Wnd_GameMain.Instance.ChangeHeadMsg(string.Format(TFMgr.Get("当前品阶：{1} 道淬成功率：{0} {2}"), GameUlt.GetRateString(successChance), targetItem.Rate, (targetItem.Rate < 12) ? string.Empty : TFMgr.Get("[color=#FF0000](无提升)[/color]")));
                        break;
                    case g_emIndividualCommandType.SoulCrystalLingPowerUp:
                        Wnd_GameMain.Instance.ChangeHeadMsg(string.Format(TFMgr.Get("灵淬成功率：{0}"), GameUlt.GetRateString(successChance)));
                        break;
                    case g_emIndividualCommandType.SoulCrystalYouPowerUp:
                        Wnd_GameMain.Instance.ChangeHeadMsg(string.Format(TFMgr.Get("当前品阶：{1} 幽淬成功率：{0} {2}"), GameUlt.GetRateString(successChance), targetItem.Rate, (targetItem.Rate < 12) ? string.Empty : TFMgr.Get("[color=#FF0000](无提升)[/color]")));
                        break;
                    default:
                        break;

                }
            }
        }
    }
}
