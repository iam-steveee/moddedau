# Modded AU

<p align="center">
  <img src="assets/steve-logo.png" alt="Steve Logo" width="120">
</p>

<h3 align="center">Custom Among Us Regions & Community Resources</h3>

<p align="center">
  Discover custom regions, follow installation guides, and explore useful Among Us modding resources.
</p>

<p align="center">
  <a href="https://github.com/iam-steveee/moddedau"><img src="https://img.shields.io/badge/GitHub-Repository-24292e?style=flat-square&logo=github&logoColor=white" alt="GitHub Repository"></a>
  <a href="https://iam-steveee.github.io/moddedau/"><img src="https://img.shields.io/badge/Home%20Page-Live-2f855a?style=flat-square&logo=googlechrome&logoColor=white" alt="Home Page"></a>
  <a href="https://iam-steveee.github.io/moddedau/regions/"><img src="https://img.shields.io/badge/Regions-Page-5865F2?style=flat-square&logo=googlechrome&logoColor=white" alt="Regions Page"></a>
  <a href="https://github.com/Innersloth-LLC/AmongUsModdingInformation"><img src="https://img.shields.io/badge/Among%20Us-Modding%20Resources-5865F2?style=flat-square" alt="Among Us Modding Resources"></a>
</p>

---

## Contents

- [About](#about)
- [Features](#features)
- [Custom Regions](#custom-regions)
- [Region Ownership](#region-ownership)
- [Mobile Installation](#mobile-installation)
- [Windows Installation](#windows-installation)
- [How the Installer Works](#how-the-installer-works)
- [Troubleshooting](#troubleshooting)
- [FAQ](#faq)
- [Official Resources](#official-resources)
- [Others](#others)

---

## About

**Modded AU** is an independent website project that brings together custom Among Us regions, installation instructions, and useful modding resources.

The project has two main sections:

- **Modded AU:** The main website, featuring project information and useful resources.
- **Modded AU Regions:** A directory of custom regions with installation guides for mobile devices and Windows.

The goal is to make discovering and configuring custom regions easier through a simple, accessible website.

## Features

| Feature | Description |
|---|---|
| Custom Regions | Browse the listed custom Among Us regions. |
| Mobile Guide | Follow the mobile region-selection instructions. |
| Steve'sCustomServersForAU.bat Installer | Use the provided batch script for automated setup. |
| Manual Installation (Windows) | Install the region configuration manually. |
| Modding Resources | Access official documentation and policy information. |
| Responsive Website | Access the website from desktop and mobile browsers. |

## Custom Regions

Visit the [Modded AU Regions website](https://iam-steveee.github.io/moddedau/regions/) for the current directory and installation options.

| Region | Group |
|---|---|
| GG US | Gurge (EHR) |
| GG HU | Gurge (EHR) |
| Modded AS | Miniduikboot and GD |
| Modded EU | Miniduikboot and GD |
| Modded NA | Miniduikboot and GD |
| MAUL EU | MAUL |
| MAUL NA | MAUL |
| Niko AS | Niko233 |
| Niko NA | Niko233 |
| AOU EU | AOU (All of Us) |
| Jarne's MEU | Jarne (Mod Manager) |

**Availability:** The website marks MAUL AS as coming soon and Niko EU as shut down. Check the live directory for current status.


## Region Ownership

The regions below are operated or supported by independent community members. Modded AU lists these regions but does not claim ownership of their servers.

### NikoCat233

- **Regions:** Niko NA, Niko Asia
- **GitHub:** [NikoCat233](https://github.com/NikoCat233)

### MAUL Regions

- **Regions:** MAUL - NA, MAUL - EU
- **Support:** [Ko-fi](https://ko-fi.com/moddeau)

### All Of Us: Among Us Mods

- **Region:** AOU Europe
- **GitHub:** [All-Of-Us-Mods](https://github.com/All-Of-Us-Mods)
- **Support:** [Ko-fi](https://ko-fi.com/allofusmods)

### Modded Regions

- **Regions:** Modded NA, Modded EU, Modded Asia
- **Operators:** miniduikboot and GD
- **GitHub:** [Mini.RegionInstall](https://github.com/miniduikboot/Mini.RegionInstall)
- **Sponsor:** [GitHub Sponsors](https://github.com/sponsors/miniduikboot)
- **Website:** [duikbo.at](https://duikbo.at/)

### Jarne's Custom Regions

- **Region:** Jarne's MEU
- **GitHub:** [JarneDEVsys](https://github.com/JarneDEVsys)
- **Support:** [Ko-fi](https://ko-fi.com/jarnemm)

### Gurge (EHR)

- **Regions:** GG US, GG HU
- **GitHub:** [EndlessHostRoles](https://github.com/Gurge44/EndlessHostRoles)
- **Support:** [Patreon](https://patreon.com/EndlessHostRoles)

---

## Mobile Installation

1. Open **Among Us**.
2. Go to **Create Lobby**.
3. Minimize the game without closing it.
4. Open the [Regions website](https://iam-steveee.github.io/moddedau/regions/) in your browser.
5. Expand **Mobile Installation**.
6. Tap the region you want to use.
7. Return to Among Us when the game reopens.
8. Open the region dropdown using the arrow beside the current region name.
9. Check whether your selected region appears.

**If the region does not appear:** Repeat the steps and ensure Among Us remains open in the background while selecting the region.

## Windows Installation

Windows users can install the region configuration using either the automatic installer or the manual method.

### Method 1: Steve'sCustomServersForAU.bat Installer

**Installer:** [`Steve'sCustomServersForAU.bat`](https://github.com/iam-steveee/moddedau/blob/main/regions/Steve%27sCustomServersForAU.bat)

1. Open the [installer file on GitHub](https://github.com/iam-steveee/moddedau/blob/main/regions/Steve%27sCustomServersForAU.bat).
2. Download the batch file to your computer.
3. Run the `.bat` file and follow its prompts. Verify that you trust the script before approving any request for elevated permissions.
4. Select the option matching your Among Us installation:
   - `1` — Steam, Epic Games, or itch.io
   - `2` — Microsoft Store
5. Follow the messages displayed in Command Prompt.
6. Once the process finishes, restart Among Us.
7. Open **Create Game → Region Dropdown** and check whether the custom regions appear.

The installer uses `curl` to download the region configuration and attempts to locate the appropriate destination for the selected platform.

If the script cannot locate the game or the download fails, try the manual method below.

### Method 2: Manual Installation (Windows)

**Configuration file:** [`regioninfo.json`](https://iam-steveee.github.io/moddedau/regions/regioninfo.json)

#### Step 1: Download the configuration

Download `regioninfo.json` from the link above and save it somewhere easy to find.

#### Step 2: Open the Among Us folder

**Quick Access**

1. Copy this path:

   ```text
   %userprofile%\AppData\LocalLow\Innersloth\Among Us
   ```

2. Press `Win + R` to open Run.
3. Paste the path using `Ctrl + V`.
4. Press `Enter`.

**Manual Navigation**

1. Open File Explorer.
2. Enter `%APPDATA%` in the address bar and press `Enter`.
3. Navigate to `LocalLow → Innersloth → Among Us`.

#### Step 3: Install the configuration

1. Copy the downloaded `regioninfo.json` into the Among Us folder.
2. If Windows asks to replace an existing file, confirm only if you intend to replace the current configuration.
3. Restart Among Us.
4. Open **Create Game → Region Dropdown** and check whether the custom regions appear.

**Note:** The Microsoft Store version may use a different configuration location. If the usual folder does not work, consult the platform-specific instructions on the [Regions website](https://iam-steveee.github.io/moddedau/regions/).

---

## How the Installer Works

The Windows batch script automates several steps:

1. Displays the region configuration options.
2. Checks whether `curl` is available.
3. Asks which version of Among Us is installed.
4. Attempts to locate the appropriate configuration destination.
5. Downloads `regioninfo.json`.
6. Reports the outcome and provides guidance if a step fails.

The hosted JSON file supplies the region configuration used by the installation process. After installation, restart the game and verify that the regions appear.

## Troubleshooting

| Problem | Suggested solution |
|---|---|
| Region does not appear on mobile | Repeat the mobile steps and ensure the game was minimized, not closed. |
| `curl` is unavailable | Use the manual installation method. |
| Installer cannot find Among Us | Check the selected platform and follow the website's platform-specific instructions. |
| Configuration download fails | Check your internet connection and retry. |
| Regions still do not appear | Confirm the file is in the correct folder, then restart the game. |
| A listed region is unavailable | Check the Regions website for its current status. |

---

## FAQ

<details>
  <summary><strong>What is Modded AU?</strong></summary>

  Modded AU is a website project for discovering custom Among Us regions and accessing installation guides and modding resources.
</details>

<details>
  <summary><strong>Does this project own every listed region?</strong></summary>

  No. The website lists regions and provides configuration and installation resources. Listing a region does not mean this project owns or operates its servers.
</details>

<details>
  <summary><strong>Can I use the Regions website on mobile?</strong></summary>

  Yes. Follow the Mobile Installation guide above or the instructions on the [Regions website](https://iam-steveee.github.io/moddedau/regions/).
</details>

<details>
  <summary><strong>Where can I find the region configuration?</strong></summary>

  The hosted configuration is available at [`regioninfo.json`](https://iam-steveee.github.io/moddedau/regions/regioninfo.json).
</details>

<details>
  <summary><strong>What if the automatic installer fails?</strong></summary>

  Try the manual installation method and check the Troubleshooting section. Verify that you selected the correct platform and configuration location.
</details>

<details>
  <summary><strong>Are all listed regions available?</strong></summary>

  Not necessarily. Availability can change. Check the live [Regions directory](https://iam-steveee.github.io/moddedau/regions/) for the latest status.
</details>

<details>
  <summary><strong>Is Modded AU officially affiliated with Innersloth?</strong></summary>

  No. Modded AU is an independent community project and is not affiliated with, endorsed by, or sponsored by Innersloth LLC or Among Us.
</details>

## Official Resources

- [Among Us Modding Information](https://github.com/Innersloth-LLC/AmongUsModdingInformation)
- [Among Us Mod Policy](https://www.innersloth.com/among-us-mod-policy/)

Consult these resources for official modding documentation and policy information.

> This mod is not affiliated with Among Us or Innersloth LLC, and the content contained therein is not endorsed or otherwise sponsored by Innersloth LLC. Portions of the materials contained herein are property of Innersloth LLC. © Innersloth LLC.

## Others

- **Discord profile:** [@iam._.steve](https://discord.com/users/949872550274547734)
- **GitHub profile:** [iam-steveee](https://github.com/iam-steveee)
- **Among Us Indians Discord:** [Discord Community](https://discord.gg/amongusindians)
- **EHR Discord:** [Endless Host Roles](https://discord.gg/ehr)

---

<p align="center">
  <img src="assets/steve-logo.png" alt="Steve Logo" width="55">
</p>

<p align="center">
  <strong>Made by Steve</strong><br>
  <sub>Modded AU is an independent community project and is not affiliated with, endorsed by, or sponsored by Innersloth LLC or Among Us.</sub>
</p>
