$ErrorActionPreference = 'Stop'

$currDir = pwd;
$goLang = "https://en.wikipedia.org/wiki/Go_(programming_language)"
$goImg = "./Assets/Languages/Go.png"
$csLang = "https://en.wikipedia.org/wiki/C_Sharp_(programming_language)"
$csImg = "./Assets/Languages/CSharp.png"
$username = "JustArion"
cd $PSScriptRoot

function Gen-Row
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$true)]
        [string]$Repo,
        [Parameter(Mandatory=$true)]
        [string]$Language,
        [Parameter(Mandatory=$false)]
        [string]$LanguageWidth = 30,
        [Parameter(Mandatory=$true)]
        [string]$LanguageLink,
        [Parameter(Mandatory=$true)]
        [string]$LanguageImageLink,
        [Parameter(Mandatory=$true)]
        [string]$DisplayName
    )

    $RepoImageLink = "./Assets/RepoImages/$Repo.svg"
    $retVal = 
@"
<!-- {NAME} -->
<tr>
    <td>
        <a href="{LANGUAGE_LINK}">
            <img alt="{LANGUAGE}" width="{LANGUAGE_WIDTH}" height="30" src="{LANGUAGE_IMAGE_LINK}"/>
        </a>
    </td>
    <td>
        <a href="https://github.com/{USERNAME}/{REPO_NAME}/">
            <img alt="{FRIENDLY_REPO_NAME}" src="{REPO_IMAGE_LINK}">
        </a>
    </td>
    <td>
        <a href="https://github.com/{USERNAME}/{REPO_NAME}/stargazers">
            <img alt="Stars" src="https://img.shields.io/github/stars/{USERNAME}/{REPO_NAME}?label=&colorB=c9cbff&style=for-the-badge&cacheSeconds=3600">
        </a>
    </td>
    <td>
        <a href="https://github.com/{USERNAME}/{REPO_NAME}/network/members">
            <img alt="Forks" src="https://img.shields.io/github/forks/{USERNAME}/{REPO_NAME}?label=&colorB=c9cbff&style=for-the-badge&cacheSeconds=3600">
        </a>
    </td>
    <td>
        <a href="https://github.com/{USERNAME}/{REPO_NAME}/release">
            <img alt="Downloads" src="https://img.shields.io/github/downloads/{USERNAME}/{REPO_NAME}/total?label=&colorB=c9cbff&style=for-the-badge&cacheSeconds=3600">
        </a>
    </td>
</tr>
"@
    $retVal = $retVal.Replace("{NAME}", $Repo).Replace("{LANGUAGE}", $Language).Replace("{LANGUAGE_LINK}", $LanguageLink).Replace("{LANGUAGE_IMAGE_LINK}", $LanguageImageLink).Replace("{REPO_NAME}", $Repo).Replace("{FRIENDLY_REPO_NAME}", $DisplayName).Replace("{REPO_IMAGE_LINK}", $RepoImageLink).Replace("{USERNAME}", $username).Replace("{LANGUAGE_WIDTH}", $LanguageWidth)

    iwr "https://img.shields.io/badge/$DisplayName-1e1e28?style=for-the-badge" -OutFile ".\RepoImages\$Repo.svg"

    return $retVal
}

Gen-Row -DisplayName "Post Processing+"        -Repo "PostProcessing"           -Language "C#" -LanguageLink $csLang -LanguageImageLink $csImg
Gen-Row -DisplayName "Mic Sensitivity"         -Repo "MicSensitivity"           -Language "C#" -LanguageLink $csLang -LanguageImageLink $csImg
Gen-Row -DisplayName "Toggle Mic Icon"         -Repo "ToggleMicIcon"            -Language "C#" -LanguageLink $csLang -LanguageImageLink $csImg
Gen-Row -DisplayName "Go Zippy"                -Repo "GoZippy"                  -Language "GO" -LanguageLink $goLang -LanguageImageLink $goImg
Gen-Row -DisplayName "MuMu Rich Presence"      -Repo "MuMu_RichPresence"        -Language "C#" -LanguageLink $csLang -LanguageImageLink $csImg
Gen-Row -DisplayName "Death Must Die Mods"     -Repo "DeathMustDieMods"         -Language "C#" -LanguageLink $csLang -LanguageImageLink $csImg
Gen-Row -DisplayName "Console Encoding Fix"    -Repo "ConsoleEncodingFix"       -Language "C#" -LanguageLink $csLang -LanguageImageLink $csImg
Gen-Row -DisplayName "Toggle UI Stickers"      -Repo "ToggleUIStickers"         -Language "C#" -LanguageLink $csLang -LanguageImageLink $csImg
Gen-Row -DisplayName "PlayGames Rich Presence" -Repo "PlayGames_RichPresence"   -Language "C#" -LanguageLink $csLang -LanguageImageLink $csImg
Gen-Row -DisplayName "Resize Pls"              -Repo "ResizePls"                -Language "C#" -LanguageLink $csLang -LanguageImageLink $csImg
Gen-Row -DisplayName "Win11 Tooltip Fix"       -Repo "Win11_Tooltip_Fix"        -Language "C#" -LanguageLink $csLang -LanguageImageLink $csImg

cd $currDir