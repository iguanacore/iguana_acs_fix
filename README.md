# Iguana's Overhaul, fixes
A mod, consisting of fixes for Amazing Cultivation Simulator, tries to avoid content/functional changes.

## Currently implemented fixes

* Daemonia Wonder Fix - Changes the System_LearnGreateBuilding MapStory, making the Daemonia Wonder grant the previously unattainable Formation Manual
* Altar of Death Fix - Changes the Building_WanGuXieFaTan Building, making it usable as a Cultivation Seat
* Qi Barrier Attachment Fix - A dirty fix, making Qi Barrier Attachments functional
* Unorthodox Manual Fix - Changes the descriptions for Unorthodox Manuals. Also changes Spell Cooldown Property to a MinValue of -0.5
* Ancient Formations Condition fix - Implements the faulty conditions for Ancient Formation Nodes. Law Elements, and in some cases, Item requirements.
* Yaoguai Fragment Skill Level fix - Fixes Yaoguai Rebirthing related Skill issue, where Skill Levels aren't what they are supposed to be (not to be mixed up with the rerolling of Skills in general, which is a feature)
* Fix Max Qi Story - Correct Story_2 and Story_Cold's reversed comparison, which prevents the extra Base Max Qi % outcomes to be triggered during a playthrough.
* Various translations issues:
    * Level of Stable Mental State -> Mental State Change Speed
    * City adventuring: Purchase Timber -> Purchase Wood
    * City adventuring: Rob Commoners -> Kidnap Commoners
    * Zen Reflection: generating stamina -> consuming stamina
    * Missing category translation for the Bamboo Leftover in the Mini-Universe
    * Spiritwood block -> Spiritwood Timber
    * Beautiful Rooms mistakenly rated Common
* Fix Event A Different Time - The current event "A Different Time" is corrected to have its designed effect in-game.
* Fix Craftsman trait Alchemy bonuses - They weren't working as intended.
* Add Food tag to Ginkgo - allows it to be chosen by your outer disciples as a somewhat last resort food automatically.
* Fix Female Fei Constitution - for some base age range the Female Fei has a weirdly high baser values.
* Fix Treasure Hunt for Red Ginseng using Mining Skill instead of Farming
* Fix Qin Muxue's (Fox pet) Core bonus at the Learning growth stage
* Fix Rabbit Yaoguai's adventure fly speed bonus - wasn't working as intended. A basic change, not a full rework.
* Fix the Max Qi value of Miao (turtle pet), Xianxian and Xiuxiu (panda pets) for people not playing with the "Loose Core" Immortal Tribulation.
* Greedy Personality Heart Unlockable - Changes the gifting related threshold from 70 to 60, meaning attainable before Heart Guard has been unlocked.
* Fix the Artifact Power Bonus for  Xianxian and Xiuxiu (panda pets)
* Fix State 3 Equilibrium : The game may sometimes mistakenly displays your disciples has having food equilibrium despite them still having unsustained food needs

## Install instructions

Download the latest release, extract the iguana_acs_fix into the Mods folder. If the release is behind the Main version and you want to update to the preview version, download the repository directly, and extract the contents of the archive into the iguana_acs_fix folder, located in the Mods folder.
(Due to the inclusion of Harmony Patches, it's best to stick with the Release.)

Activate the Mod in Mod Manager, make sure to load it after any of the prerequisite Mods.

For ensuring that Patches are loaded, restart the game.

## Compatibility with other mods

The full list of changed entities can be seen at the bottom. This mod does not guarantee compatibility with any of the mods that also change those entities.

### Suggested Load Order

* ModLoaderLite
* **iguana_acs_fix**
* **iguana_acs_functions**
* **iguana_acs_features**
* Anything else
* Alternative Translations

## List of changed entities

Below is a list of changed entities. To revert a particular change from the mod, either comment out the relevant lines and entities, or delete the files in question. Changed files in the Language\OfficialEnglish directory are related to translation and can be reverted by removing them.

For example, removing the Ancient Formation Condition fix requires the removal of iguana_acs_fix\Settings\Zhen\Node\ZhenNode_Suit.xml, as well as the corresponding file under Language\OfficialEnglish.

### Items

* Item_Ginkgo - Add Food tag to Ginkgo

### MapStories

* (MapStory_System) SystemLearnGreateBuilding - For Daemonia Wonder Fix
* (MapStory_FillingLv1) Story_2 and Story_Cold - "Fix Max Qi Story" related

### Buildings

* Building_WanGuXieFaTan - For Altar of Death Fix

### Properties

* NpcFight_SpellCoolDownAddP - For Unorthodox Manual Fix (Spell Cooldown)
* LsPandaLingMaxValue (LsProperty_LsPanda) - DLC Pets Max Qi fix
* LsPandaFabaoPowerAddP (LsProperty_LsPanda) - DLC Panda pets Artifact Power Bonus fix
* LsXuanWuLingMaxValue (LsProperty_DLC_WuDang) - DLC Pets Max Qi fix

### LingShou (Pets)

* property GrowPercent - Fix Qin Muxue's Core stat

### Features

* Craftsman - Fix Craftsman trait Alchemy bonuses
* Rabbit_Fast - Fix Rabbit's Adventure Fly Speed bonus

### Npc

* Fei - Fix Female Fei Constitution

### Other files

* Settings\Practice\FabaoHelian\FabaoHelian.txt - For Qi Barrier Attachment Fix, utilizes ID's 72,73,74
* Settings\Esoterica\EsotericaLables.txt - For Unorthodox Manual Fix, uses the entire OfficialEnglish file
* Settings\Zhen\Node\ZhenNode_Suit.xml - For Ancient Formations Condition fix, nearly all entities changed
* Scripts\main.lua - main LUA mod loading utility
* Scripts\fix-event-a-different-time.lua - Related to "Fix Event A Different Time" change
* Scripts\MapStory\MapStory.lua - Fix Treasure Hunt for Red Ginseng using Mining Skill instead of Farming
* Scripts\fix-state-3-equilibrium.lua - Fix State 3 Equilibrium

### Game Constants

* GameDefine.BeautyValueDesc - Beautiful Rooms mistakenly rated Common
* Panel_ThingInfo.FoodF2 - Fix State 3 Equilibrium

### Functions

* XiaWorld.HumanoidEvolutionMgr.ModifyNpcByFrag - For Yaoguai Fragment Skill Level fix, a Postfix, compatible with other Postfixes to the same function
* Wnd_JianghuTalk.GiveGift2Target - For Greedy Personality Heart Unlockable, a Transpiler changing the ldc.r4:70 to ldc.r4:60

## How to Contribute

Any Issues/Pull Requests are welcome. To ensure a similar level of quality between all parts of the mod, here's a few guidelines.

When changing vanilla aspects, keep in line with the original naming logic.
* If the original was MapStory_Item.xml, the PR should use the same filename with MapStory_Item.xml.

If the fixes exist as a standalone mod, include a link to it.

## Credits/Contributions

* ucddj - Fix Max Qi Story, some translation issues, Fix Event A Different Time
