Ace3 example with options panel and slash commands.
- https://www.wowace.com/projects/ace3/pages/getting-started
- https://warcraft.wiki.gg/wiki/Ace3_for_Dummies

![](https://github.com/ketho-wow/HelloAce/raw/master/preview.png)

### Folder name
⚠️ If you downloaded it as a zip, rename the `HelloAce-master` folder to `HelloAce`

### About embeds
The Ace3 libs are hard-embedded (hardcoded) for simplicity.

When updating your addons it's recommended to have the packager pull the latest Ace3 libs when packaging, i.e. soft-embedding. This requires a [PackageMeta File](https://github.com/BigWigsMods/packager/wiki/Preparing-the-PackageMeta-File).

To still have your own local Ace3 libs without checking them out to the repository:
* Use the Ace3 libs standalone by dropping the [Ace3](https://www.wowace.com/projects/ace3) addon in the `AddOns` folder and specifying `## OptionalDeps: Ace3` in your TOC.
* Or put the Ace3 libs in the `Libs` folder and exclude it from the repository with [.gitignore](https://git-scm.com/docs/gitignore).
