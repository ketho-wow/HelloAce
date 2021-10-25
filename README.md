Ace3 example with options window and slash commands.
- https://www.wowace.com/projects/ace3/pages/getting-started
- https://wowpedia.fandom.com/wiki/WelcomeHome:_Your_first_Ace3_Addon

![](https://github.com/ketho-wow/HelloAce/raw/master/options.png)

### Folder location
Note that the addon files already are in a (sub)folder because I wanted to keep the README.md and similar files strictly separate for this example.
And to avoid common mistakes like unzipping it to a `HelloAce-master` folder.

You need to copypaste the `HelloAce` (sub)folder to your AddOns folder manually or alternatively use a [symlink](https://en.wikipedia.org/wiki/Symbolic_link) if you cloned the repository:
```
New-Item -ItemType SymbolicLink -Path "D:\Game\World of Warcraft\_retail_\Interface\AddOns\HelloAce" -Value "D:\Repo\HelloAce\HelloAce"
```

### About embeds
The Ace3 libs are hard embedded for simplicity. For how to soft embed them, see [BigWigs: Preparing the PackageMeta File](https://github.com/BigWigsMods/packager/wiki/Preparing-the-PackageMeta-File).

They can also be used standalone / without embedding, by:
* Dropping the [Ace3](https://www.wowace.com/projects/ace3) addon in your `AddOns` folder.
* Specifying `## OptionalDeps: Ace3` in your TOC.
