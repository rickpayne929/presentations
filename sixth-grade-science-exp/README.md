# Table of Contents

- [Table of Contents](#table-of-contents)
- [Sixth Grade Science Experiment - Overview](#sixth-grade-science-experiment---overview)
- [Week 1 - Virtual machine install](#week-1---virtual-machine-install)
  - [Week 1 Q&A](#week-1-qa)
  - [Confirm Virtualization Technology is Enabled](#confirm-virtualization-technology-is-enabled)
  - [Download Ubuntu 20.04.3 LTS .iso](#download-ubuntu-20043-lts-iso)
  - [Install VMware Player](#install-vmware-player)
  - [Install Ubuntu 20.04.3 in VMware Workstation Player](#install-ubuntu-20043-in-vmware-workstation-player)
  - [Configure Resolution](#configure-resolution)
  - [Power Off the machine](#power-off-the-machine)
  - [Week 1 Comments](#week-1-comments)
- [Week 2 - Create User Accounts, Install John the Ripper, Crack Passwords](#week-2---create-user-accounts-install-john-the-ripper-crack-passwords)
  - [Create User Accounts](#create-user-accounts)
  - [Install John the Ripper](#install-john-the-ripper)
  - [Crack Passwords](#crack-passwords)
    - [Labor Estimates to Date (Blocks includes family activities e.g. bike rides, meal routines, wrestling, chore debates, brother fight mediation sessions... :)](#labor-estimates-to-date-blocks-includes-family-activities-eg-bike-rides-meal-routines-wrestling-chore-debates-brother-fight-mediation-sessions-)


<a name="Overview"></a>
# Sixth Grade Science Experiment - Overview
My mission is to help prepare our youth for a successful career in technology. Most perceive what we're going to accomplish here as wizardry or approach tech with a fixed mindset "I can't do that". The intent here is to break the barrier by demonstrating a 6th grader can complete this experiment.

The experiment will test weak, medium and strong password strength with a password cracking tool(app). The objective is to measure Time to Crack (TtC) for all 3. 

Here's my kitchen table draft explaining to my son for the first time:
![The Kitchen Pencil Plan](images/pencil_plan.jpg)

# Week 1 - Virtual machine install
 - [x] GitHub Issue [#7](https://github.com/rickpayne929/presentations/issues/7)

## Week 1 Q&A
Q: What are the minimum hardware requirements for this course?
A: Dual core processor, 4 GB RAM, 25 GB HDD

Q: What are the software requirements for this course?
A: This guide will be written for Windows 10 and VMware Player; however, Linux and Mac can also run virtual machines using VMware and other desktop hypervisor applications. 


## Confirm Virtualization Technology is Enabled
1. Open Task Manager 
    - Keyboard shortcut: (ctrl + shift + esc)
    - Window Key > Type task > Task Manager
    - Right Click the Taskbar > Task Manager
    - (ctrl + alt + del) > Task Manager
2. Check Task Manager Performance tab for Virtualization Status
    - Select: Performance Tab
    - Review the CPU data in the bottom right. Specifically, Virtualization should be Enabled ![Task Manager - Virtualization Status](images/taskmgr.png)
    - If Enabled, proceed to the next section to start the Ubuntu download
    - If Disabled, research “how to enable virtualization technology for your machine” e.g. Google: “how to enable virtualization technology for Lenovo or Dell or …”
3. If Disabled, Go to BIOS to Enable Virtualization
    - The steps should resemble:
      - Reboot
      - Press Del or F2 or ? to enter BIOS
      - Navigate to the Security  or Advanced Tab
      - Set Virtualization Technology and VT-d to Enabled
      - Save (F10) and Exit
      - Example for Lenovo: https://support.lenovo.com/in/en/solutions/ht500006-how-to-enable-virtualization-technology-on-lenovo-computers 
      - Example for MSI: https://www.msi.com/faq/nb-1627 


## Download Ubuntu 20.04.3 LTS .iso
1. https://ubuntu.com/download/desktop
2. Click: Download ![Ubuntu Download Button](images/download_ubuntu.png)
    - The file is 2.9GB. It’ll take around 50 minutes to download at 9Mbps using the default link. I was impatient and went to Princeton’s 20Gbps download here: https://mirror.math.princeton.edu/pub/ubuntu-iso/focal/ This took about 7 minutes hopping between 30 - 60Mbps


## Install VMware Player
Note: This will require a restart
1. Download VMware Workstation Player
    - https://www.vmware.com/products/workstation-player.html
    - Click: DOWNLOAD FOR FREE ![VMware Download Button](images/download_vmware.png)
    - Click: GO TO DOWNLOADS
    - For “VMware Workstation 16.1.2 Player for Windows 64-bit Operating Systems”, Click DOWNLOAD NOW
2. Install VMware Workstation Player
    - Start the installer by double clicking the downloaded file. It’s currently version VMware-player-16.1.2-17966106.exe on 10/9/2021
      - Select Yes if you receive a User Account Control (UAC) popup
      - Select Yes if you receive a popup to restart ![VMware Restart](images/vmware_install.png)
      - Log back in and continue the installation by double clicking the installer again
      - Select the Default options. They should be:
        - Next
        - Accept the terms > Next
        - If you receive a “Compatible Setup” screen, Check “Install Windows Hypervisor Platform (WHP)” > Next ![VMware Compatible Setup](images/vmware_install2.png)
        - At Custom Setup, Check “Enhanced Keyboard…” > Next ![VMware Enhanced Keyboard](images/vmware_install3.png)
        - At User Experience Settings, Uncheck “Join the VMware…” > Next
        - At Shortcuts, Next
        - Install
        - Finish > Yes to restart


## Install Ubuntu 20.04.3 in VMware Workstation Player
1. Open VMware Workstation Player
   - Windows Key > VMware > Press Enter when VMware Workstation is highlighted ![Window Key - VMware](images/start_vmware.png)
   - Select “Use VMware…” > Continue
   - Finish
     - You should be here ![VMware Opened](images/vmware_opened.png)
2. Create the Ubuntu Virtual Machine
   - Click: Create a New Virtual Machine ![Create New](images/vmware_create.png)
   - Click Browse… and navigate to the ubuntu-20.04.3-desktop-amd64.iso file. The default download location will be in This PC > Downloads ![Select .iso](images/vmware_iso.png)
   - Next
   - At Easy Install Information \ Personalize Linux, Try something like:
     - Full name: Your first and last name
     - User name: First initial+last name e.g. rpayne
     - Password: something secure and memorable e.g. “Ubuntu 20.04.3 password cracking setup.” or rpayne :)
     - Next
   - At Name the Virtual Machine, “Ubuntu 64-bit for Password Testing”
   - Next
   - At Specify Disk Capacity, 25.0GB per Ubuntu’s recommendation. This is fine since it’s temporary. Increase as you’d like if you’re going to keep the machine around.
   - Next
   - At Ready to Create Virtual machine, Click: Customize Hardware…
     - Memory: 2GB Minimum or increase to 8GB if available (check Task Manager > Performance Tab > Memory)
     - Processors: 2 or all (check Task Manager > Performance Tab > CPU > Logical processors)
     - Close
   - Finish
     - The Virtual Machine should be powering on similar to this ![VMware Powering On](images/vmware_powering.png)
   - Check: Do not show > OK
   - Download and Install > Yes ![Download and Install](images/vmware_download_install.png)
   - The installation will begin automatically ![VMware Ubuntu Installing](images/vmware_ubuntu_installing.png)
     - It should take 20-30minutes to complete depending on computer performance ![VMware Ubuntu Complete](images/vmware_ubuntu_complete.png)


## Configure Resolution
1. Clear the "Online Accounts" screen
   - Log in
   - At the Online Accounts screen
     - Click Skip
     - Next
     - Next
     - Next
     - Done
2. Use "Displays" to Configure Resolution
   - In the bottom left, Click: Show Applications ![Ubuntu Show Apps](images/ubuntu_show_apps.png)
   - Type and then select Displays
   - Set the Resolution to the an optimal size > Apply 
   - Click the X to close


## Power Off the machine
1. At the top right of the screen, Click the Power drop down > Power Off / Log Out > Power Off… > Power Off ![Ubuntu Power Off](images/ubuntu_poweroff.png)

## Week 1 Comments

Like opening the Task Manager, there are many routes to create the opportunity to safely test in a Linux environment. We could have:

1.	Launched an Ubuntu EC2 instance in Amazon Web Services (AWS)
2.	Started a Docker container
3.	Used Windows Subsystem for Linux (WSL)

I see the local virtualization path as foundational. It offers the beginning learner an easier user experience with a GUI. 


# Week 2 - Create User Accounts, Install John the Ripper, Crack Passwords

## Create User Accounts

## Install John the Ripper

## Crack Passwords


### Labor Estimates to Date (Blocks includes family activities e.g. bike rides, meal routines, wrestling, chore debates, brother fight mediation sessions... :)
- 10/9: ~3h to draft VM Install Steps
- 10/16: 11am - 2pm to Prepare Installation for Peer Review in this README.md