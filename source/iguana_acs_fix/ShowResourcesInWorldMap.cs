using FairyGUI;
using HarmonyLib;
using XiaWorld.UI.InGame;
using XiaWorld;

namespace iguana_acs_fix
{
    public class ShowResourcesInWorldMap
    {
        static UI_CTResTreeNode UISpiritStones = null;
        static UI_CTResTreeNode UIInfluence = null;
        static bool UIResourcesCreated = false;
        public static bool enabled = true;

        public static void OnLoad()
        {
            UIResourcesCreated = false;
        }
        static void addOrUpdateIcons()
        {
            if (!enabled)
            {
                if (UIResourcesCreated)
                {
                    UIResourcesCreated = false;
                    Wnd_World.Instance.RemoveChild(UISpiritStones);
                    Wnd_World.Instance.RemoveChild(UIInfluence);
                    UISpiritStones.Dispose();
                    UIInfluence.Dispose();
                }
                return;
            }
            if (!UIResourcesCreated)
            {
                UIResourcesCreated = true;
                UISpiritStones = (UI_CTResTreeNode)UIPackage.CreateObjectFromURL("ui://0xrxw6g7pout2ovw9");
                UIInfluence = (UI_CTResTreeNode)UIPackage.CreateObjectFromURL("ui://0xrxw6g7pout2ovw9");
                Wnd_World.Instance.AddChildAt(UIInfluence, Wnd_World.Instance.numChildren);
                UIInfluence.icon = GameDefine.GetInfluenceIcon();
                UIInfluence.tooltips = TFMgr.Get("影响值") + "\n" + GameDefine.GetInfluenceDes();
                UnityEngine.Color placeholder = UISpiritStones.color;
                UIInfluence.color = UnityEngine.Color.black;
                UIInfluence.m_title.stroke = 1;
                UIInfluence.m_title.strokeColor = placeholder;
                UIInfluence.SetScale(0.9f, 0.9f);
                UIInfluence.x = Wnd_World.Instance.UIInfo.m_close.x - UISpiritStones.width;
                UIInfluence.y = Wnd_World.Instance.UIInfo.m_close.y;
                Wnd_World.Instance.AddChildAt(UISpiritStones, Wnd_World.Instance.numChildren);
                UISpiritStones.text = "0";
                UISpiritStones.tooltips = TFMgr.Get("货币\n灵石是各大门派和行商之间流通的唯一货币。");
                UISpiritStones.icon = "res/Sprs/object/object_lingshi01";
                UISpiritStones.color = UnityEngine.Color.black;
                UISpiritStones.m_title.stroke = 1;
                UISpiritStones.m_title.strokeColor = placeholder;
                UISpiritStones.SetScale(0.9f, 0.9f);
                UISpiritStones.x = UIInfluence.x - UISpiritStones.width;
                UISpiritStones.y = Wnd_World.Instance.UIInfo.m_close.y;

            }
            UIInfluence.text = IManagerModule_LoopInterval<OutspreadMgr>.Instance.Influence.ToString();
            UISpiritStones.text = World.Instance.Warehouse.GetItemCount("Item_LingStone").ToString();
        }

        [HarmonyPatch(typeof(Wnd_World), "OnShowUpdate")]
        public class ShowWorldMap
        {
            public static void Postfix()
            {
                addOrUpdateIcons();
            }
        }

        [HarmonyPatch(typeof(Wnd_SchoolTrade), "__selectyes")]
        public class MakeSectTrade
        {
            public static void Postfix()
            {
                addOrUpdateIcons();
            }
        }

        [HarmonyPatch(typeof(Wnd_ZhaoLanWindow), "OnInit")]
        public class RecruitDisciples
        {
            public static void Postfix()
            {
                addOrUpdateIcons();
            }
        }

        [HarmonyPatch(typeof(Wnd_OpenOutsWindow), "UpLevelSideBuild")]
        public class UpgradeAgencyMainHall
        {
            public static void Postfix()
            {
                addOrUpdateIcons();
            }
        }

        [HarmonyPatch(typeof(Wnd_World), "OpenRegion")]
        public class CancelOpeningNewAgency
        {
            public static void Postfix()
            {
                addOrUpdateIcons();
            }
        }
    }
}
