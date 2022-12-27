# Iguana's Overhaul, fixes
A mod, consisting of fixes for Amazing Cultivation Simulator, tries to avoid content/functional changes.

## Currently implemented fixes

* Daemonia Wonder Fix - Changes the System_LearnGreateBuilding MapStory, making the Daemonia Wonder grant the previously unattainable Formation Manual
* Altar of Death Fix - Changes the Building_WanGuXieFaTan Building, making it usable as a Cultivation Seat
* Qi Barrier Attachment Fix - A dirty fix, making Qi Barrier Attachments functional
* Unorthodox Manual Fix - Changes the descriptions for Unorthodox Manuals. Also changes Spell Cooldown Property to a MinValue of -0.5


## Install instructions

Download the latest release, extract the iguana_acs_fix into the Mods folder. If the release is behind the Main version and you want to update to the preview version, download the repository directly, and extract the contents of the archive into the iguana_acs_fix folder, located in the Mods folder.

Activate the Mod in Mod Manager, make sure to load it after any of the prerequisite Mods.

For ensuring that Patches are loaded, restart the game.

## Compatibility with other mods

The full list of changed entities can be seen at the bottom. This mod does not guarantee compatibility with any of the mods that also change those entities.

### Suggested Load Order

* ModLoaderLite
* **iguana_acs_fix**
* Anything else

## List of changed entities

### MapStories

* SystemLearnGreateBuilding - For Daemonia Wonder Fix

### Buildings

* Building_WanGuXieFaTan - For Altar of Death Fix

### Properties

* NpcFight_SpellCoolDownAddP - For Unorthodox Manual Fix (Spell Cooldown)

### Other files

* Settings\Practice\FabaoHelian\FabaoHelian.txt - For Qi Barrier Attachment Fix, utilizes ID's 72,73,74
* Settings\Esoterica\EsotericaLables.txt - For Unorthodox Manual Fix, utilizes ID's 2000-2005