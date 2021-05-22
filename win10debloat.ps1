#############################################
#           _    _____ _________            #
#          | |  |  _  \  _   _  |           #
#          | |  | | | | | | | | |           #
#          | |  | | | | | | | | |           #
#          | |__| |_| | | | | | |           #
#          |____|____/|_| |_| |_|           #
#                                           #
#   site: https://link-does-mods.github.io/ #
# github: https://github.com/link-does-mods #
#############################################

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$ErrorActionPreference = 'SilentlyContinue'
$wshell = New-Object -ComObject Wscript.Shell
$Button = [System.Windows.MessageBoxButton]::YesNoCancel
$ErrorIco = [System.Windows.MessageBoxImage]::Error
$Ask = 'Do you want to run this as an Administrator?
        Select "Yes" to Run as an Administrator
        Select "No" to not run this as an Administrator

        Select "Cancel" to stop the script.'

If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) {
    $Prompt = [System.Windows.MessageBox]::Show($Ask, "Run as an Administrator or not?", $Button, $ErrorIco)
    Switch ($Prompt) {
        #This will debloat Windows 10
        Yes {
            Write-Host "You didn't run this script as an Administrator. This script will self elevate to run as an Administrator and continue."
            Start-Process PowerShell.exe -ArgumentList ("-NoProfile -ExecutionPolicy Bypass -File `"{0}`"" -f $PSCommandPath) -Verb RunAs
            Exit
        }
        No {
            Break
        }
    }
}

################################################################################
# Main Form
################################################################################

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = New-Object System.Drawing.Point(1050,700)
$Form.text                       = "Ultimate Win 10 Script"
$Form.TopMost                    = $false

###############################################################################

$Panel1                          = New-Object system.Windows.Forms.Panel
$Panel1.height                   = 156
$Panel1.width                    = 1032
$Panel1.location                 = New-Object System.Drawing.Point(9,90)

$Panel2                          = New-Object system.Windows.Forms.Panel
$Panel2.height                   = 159
$Panel2.width                    = 588
$Panel2.location                 = New-Object System.Drawing.Point(9,293)

$Panel3                          = New-Object system.Windows.Forms.Panel
$Panel3.height                   = 158
$Panel3.width                    = 440
$Panel3.location                 = New-Object System.Drawing.Point(601,293)

$Panel4                          = New-Object system.Windows.Forms.Panel
$Panel4.height                   = 168
$Panel4.width                    = 340
$Panel4.location                 = New-Object System.Drawing.Point(9,491)

###############################################################################

$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "Program Installation"
$Label1.AutoSize                 = $true
$Label1.width                    = 25
$Label1.height                   = 10
$Label1.location                 = New-Object System.Drawing.Point(10,30)
$Label1.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',30)

$Label2                          = New-Object system.Windows.Forms.Label
$Label2.text                     = "(Chocolatey Required for installs)"
$Label2.AutoSize                 = $true
$Label2.width                    = 25
$Label2.height                   = 10
$Label2.location                 = New-Object System.Drawing.Point(478,3)
$Label2.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label3                          = New-Object system.Windows.Forms.Label
$Label3.text                     = "System Tweaks"
$Label3.AutoSize                 = $true
$Label3.width                    = 230
$Label3.height                   = 25
$Label3.location                 = New-Object System.Drawing.Point(195,251)
$Label3.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',24)

$Label4                          = New-Object system.Windows.Forms.Label
$Label4.text                     = "Security"
$Label4.AutoSize                 = $true
$Label4.width                    = 117
$Label4.height                   = 25
$Label4.location                 = New-Object System.Drawing.Point(761,252)
$Label4.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',24)

$Label5                          = New-Object system.Windows.Forms.Label
$Label5.text                     = ""
$Label5.AutoSize                 = $true
$Label5.width                    = 150
$Label5.height                   = 10
$Label5.location                 = New-Object System.Drawing.Point(24,40)
$Label5.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label6                          = New-Object system.Windows.Forms.Label
$Label6.text                     = "- Disable Meltdown Flag"
$Label6.AutoSize                 = $true
$Label6.width                    = 150
$Label6.height                   = 10
$Label6.location                 = New-Object System.Drawing.Point(24,6)
$Label6.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label7                          = New-Object system.Windows.Forms.Label
$Label7.text                     = "- Set UAC to Never Prompt"
$Label7.AutoSize                 = $true
$Label7.width                    = 150
$Label7.height                   = 10
$Label7.location                 = New-Object System.Drawing.Point(24,23)
$Label7.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label8                          = New-Object system.Windows.Forms.Label
$Label8.text                     = ""
$Label8.AutoSize                 = $true
$Label8.width                    = 150
$Label8.height                   = 10
$Label8.location                 = New-Object System.Drawing.Point(24,75)
$Label8.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label9                          = New-Object system.Windows.Forms.Label
$Label9.text                     = ""
$Label9.AutoSize                 = $true
$Label9.width                    = 150
$Label9.height                   = 10
$Label9.location                 = New-Object System.Drawing.Point(24,58)
$Label9.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label10                         = New-Object system.Windows.Forms.Label
$Label10.text                    = "- Set UAC to Always Prompt"
$Label10.AutoSize                = $true
$Label10.width                   = 25
$Label10.height                  = 10
$Label10.location                = New-Object System.Drawing.Point(233,40)
$Label10.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label11                         = New-Object system.Windows.Forms.Label
$Label11.text                    = "- Enable Windows Defender"
$Label11.AutoSize                = $true
$Label11.width                   = 25
$Label11.height                  = 10
$Label11.location                = New-Object System.Drawing.Point(233,57)
$Label11.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label12                         = New-Object system.Windows.Forms.Label
$Label12.text                    = "- Enable Windows Malware Scan"
$Label12.AutoSize                = $true
$Label12.width                   = 25
$Label12.height                  = 10
$Label12.location                = New-Object System.Drawing.Point(233,6)
$Label12.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label13                         = New-Object system.Windows.Forms.Label
$Label13.text                    = "- Enable Meltdown Flag"
$Label13.AutoSize                = $true
$Label13.width                   = 25
$Label13.height                  = 10
$Label13.location                = New-Object System.Drawing.Point(233,23)
$Label13.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label15                         = New-Object system.Windows.Forms.Label
$Label15.text                    = "Windows Update"
$Label15.AutoSize                = $true
$Label15.width                   = 25
$Label15.height                  = 10
$Label15.location                = New-Object System.Drawing.Point(58,459)
$Label15.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',24)

$Label16                         = New-Object system.Windows.Forms.Label
$Label16.text                    = "I recommend doing security updates only."
$Label16.AutoSize                = $true
$Label16.width                   = 25
$Label16.height                  = 10
$Label16.location                = New-Object System.Drawing.Point(47,49)
$Label16.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label17                         = New-Object system.Windows.Forms.Label
$Label17.text                    = "- Delays Features updates up to 3 years"
$Label17.AutoSize                = $true
$Label17.width                   = 25
$Label17.height                  = 10
$Label17.location                = New-Object System.Drawing.Point(71,66)
$Label17.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label18                         = New-Object system.Windows.Forms.Label
$Label18.text                    = "- Delays Security updates 4 days"
$Label18.AutoSize                = $true
$Label18.width                   = 25
$Label18.height                  = 10
$Label18.location                = New-Object System.Drawing.Point(71,84)
$Label18.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label19                         = New-Object system.Windows.Forms.Label
$Label19.text                    = "- Sets Maximum Active Time"
$Label19.AutoSize                = $true
$Label19.width                   = 25
$Label19.height                  = 10
$Label19.location                = New-Object System.Drawing.Point(71,103)
$Label19.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label20                         = New-Object system.Windows.Forms.Label
$Label20.text                    = "Instructions"
$Label20.AutoSize                = $true
$Label20.width                   = 169
$Label20.height                  = 23
$Label20.location                = New-Object System.Drawing.Point(581,463)
$Label20.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',24)

$Label21                         = New-Object system.Windows.Forms.Label
$Label21.text                    = "- This will modify your system and I highly recommend backing up any data you have prior to running!"
$Label21.AutoSize                = $true
$Label21.width                   = 150
$Label21.height                  = 10
$Label21.location                = New-Object System.Drawing.Point(390,507)
$Label21.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label22                         = New-Object system.Windows.Forms.Label
$Label22.text                    = "(Unsure!?... Just apply Essential Tweaks)"
$Label22.AutoSize                = $true
$Label22.width                   = 150
$Label22.height                  = 10
$Label22.location                = New-Object System.Drawing.Point(4,14)
$Label22.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label23                         = New-Object system.Windows.Forms.Label
$Label23.text                    = "- Need to Restore action center, cortana, etc.? Run the Restore Script: https://youtu.be/H2ydDcqRZyM"
$Label23.AutoSize                = $true
$Label23.width                   = 150
$Label23.height                  = 10
$Label23.location                = New-Object System.Drawing.Point(390,529)
$Label23.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

###############################################################################

$installchoco                    = New-Object system.Windows.Forms.Button
$installchoco.text               = "Install Chocolatey"
$installchoco.width              = 200
$installchoco.height             = 115
$installchoco.location           = New-Object System.Drawing.Point(16,19)
$installchoco.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',16)

$scripting                       = New-Object system.Windows.Forms.Button
$scripting.text                  = "Scripting Tools"
$scripting.width                 = 150
$scripting.height                = 30
$scripting.location              = New-Object System.Drawing.Point(250,19)
$scripting.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$media                            = New-Object system.Windows.Forms.Button
$media.text                       = "Media/Gfx"
$media.width                      = 150
$media.height                     = 30
$media.location                   = New-Object System.Drawing.Point(584,19)
$media.Font                       = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$emulators                       = New-Object system.Windows.Forms.Button
$emulators.text                  = "Emulators"
$emulators.width                 = 150
$emulators.height                = 30
$emulators.location              = New-Object System.Drawing.Point(751,19)
$emulators.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$winscp                          = New-Object system.Windows.Forms.Button
$winscp.text                     = "WinSCP"
$winscp.width                    = 150
$winscp.height                   = 30
$winscp.location                 = New-Object System.Drawing.Point(250,61)
$winscp.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$7zip                            = New-Object system.Windows.Forms.Button
$7zip.text                       = "7-Zip"
$7zip.width                      = 150
$7zip.height                     = 30
$7zip.location                   = New-Object System.Drawing.Point(417,61)
$7zip.Font                       = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$adobereader                     = New-Object system.Windows.Forms.Button
$adobereader.text                = "Adobe Reader DC"
$adobereader.width               = 150
$adobereader.height              = 30
$adobereader.location            = New-Object System.Drawing.Point(584,61)
$adobereader.Font                = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$vms                             = New-Object system.Windows.Forms.Button
$vms.text                        = "VM Software"
$vms.width                       = 150
$vms.height                      = 30
$vms.location                    = New-Object System.Drawing.Point(417,19)
$vms.Font                        = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$essentialtweaks                 = New-Object system.Windows.Forms.Button
$essentialtweaks.text            = "Essential Tweaks"
$essentialtweaks.width           = 200
$essentialtweaks.height          = 115
$essentialtweaks.location        = New-Object System.Drawing.Point(24,34)
$essentialtweaks.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',14)

$backgroundapps                  = New-Object system.Windows.Forms.Button
$backgroundapps.text             = "Background Apps"
$backgroundapps.width            = 150
$backgroundapps.height           = 30
$backgroundapps.location         = New-Object System.Drawing.Point(251,45)
$backgroundapps.Font             = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$cortana                         = New-Object system.Windows.Forms.Button
$cortana.text                    = "Cortana"
$cortana.width                   = 150
$cortana.height                  = 30
$cortana.location                = New-Object System.Drawing.Point(251,82)
$cortana.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$windowssearch                   = New-Object system.Windows.Forms.Button
$windowssearch.text              = "Windows Search"
$windowssearch.width             = 150
$windowssearch.height            = 30
$windowssearch.location          = New-Object System.Drawing.Point(417,119)
$windowssearch.Font              = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$actioncenter                    = New-Object system.Windows.Forms.Button
$actioncenter.text               = "Action Center"
$actioncenter.width              = 150
$actioncenter.height             = 30
$actioncenter.location           = New-Object System.Drawing.Point(251,9)
$actioncenter.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$darkmode                        = New-Object system.Windows.Forms.Button
$darkmode.text                   = "Dark Mode"
$darkmode.width                  = 150
$darkmode.height                 = 30
$darkmode.location               = New-Object System.Drawing.Point(417,7)
$darkmode.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$lightmode                       = New-Object system.Windows.Forms.Button
$lightmode.text                  = "Light Mode"
$lightmode.width                 = 150
$lightmode.height                = 30
$lightmode.location              = New-Object System.Drawing.Point(417,45)
$lightmode.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$visualfx                        = New-Object system.Windows.Forms.Button
$visualfx.text                   = "Visual FX"
$visualfx.width                  = 150
$visualfx.height                 = 30
$visualfx.location               = New-Object System.Drawing.Point(417,82)
$visualfx.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$onedrive                        = New-Object system.Windows.Forms.Button
$onedrive.text                   = "OneDrive"
$onedrive.width                  = 150
$onedrive.height                 = 30
$onedrive.location               = New-Object System.Drawing.Point(251,119)
$onedrive.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$securitylow                     = New-Object system.Windows.Forms.Button
$securitylow.text                = "Low"
$securitylow.width               = 150
$securitylow.height              = 30
$securitylow.location            = New-Object System.Drawing.Point(36,119)
$securitylow.Font                = New-Object System.Drawing.Font('Microsoft Sans Serif',15,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))

$securityhigh                    = New-Object system.Windows.Forms.Button
$securityhigh.text               = "High"
$securityhigh.width              = 150
$securityhigh.height             = 30
$securityhigh.location           = New-Object System.Drawing.Point(244,119)
$securityhigh.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',15,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))

$defaultwindowsupdate            = New-Object system.Windows.Forms.Button
$defaultwindowsupdate.text       = "Default Settings"
$defaultwindowsupdate.width      = 300
$defaultwindowsupdate.height     = 30
$defaultwindowsupdate.location   = New-Object System.Drawing.Point(20,13)
$defaultwindowsupdate.Font       = New-Object System.Drawing.Font('Microsoft Sans Serif',14)

$securitywindowsupdate           = New-Object system.Windows.Forms.Button
$securitywindowsupdate.text      = "Security Updates Only"
$securitywindowsupdate.width     = 300
$securitywindowsupdate.height    = 30
$securitywindowsupdate.location  = New-Object System.Drawing.Point(20,119)
$securitywindowsupdate.Font      = New-Object System.Drawing.Font('Microsoft Sans Serif',14)

###############################################################################

$PictureBox1                     = New-Object system.Windows.Forms.PictureBox
$PictureBox1.width               = 412
$PictureBox1.height              = 125
$PictureBox1.location            = New-Object System.Drawing.Point(449,541)
$PictureBox1.imageLocation       = "https://github.com/link-does-mods/win10-debloat/blob/main/Images/Triforce.png?raw=true"
$PictureBox1.SizeMode            = [System.Windows.Forms.PictureBoxSizeMode]::zoom

################################################################################
# Scripting Form
################################################################################

$Form1                            = New-Object system.Windows.Forms.Form
$Form1.ClientSize                 = New-Object System.Drawing.Point(365,400)
$Form1.text                       = "Install Scripting Tools"
$Form1.TopMost                    = $false

###############################################################################

$Panel1a                          = New-Object system.Windows.Forms.Panel
$Panel1a.height                   = 550
$Panel1a.width                    = 1032
$Panel1a.location                 = New-Object System.Drawing.Point(9,90)

###############################################################################

$Label1a                          = New-Object system.Windows.Forms.Label
$Label1a.text                     = "Scripting Tools"
$Label1a.AutoSize                 = $true
$Label1a.width                    = 25
$Label1a.height                   = 10
$Label1a.location                 = New-Object System.Drawing.Point(10,30)
$Label1a.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',30)

###############################################################################

$alacritty                       = New-Object system.Windows.Forms.Button
$alacritty.text                  = "Alacritty"
$alacritty.width                 = 150
$alacritty.height                = 30
$alacritty.location              = New-Object System.Drawing.Point(16,19)
$alacritty.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$neovim                          = New-Object system.Windows.Forms.Button
$neovim.text                     = "Neovim"
$neovim.width                    = 150
$neovim.height                   = 30
$neovim.location                 = New-Object System.Drawing.Point(16,61)
$neovim.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$atom                            = New-Object system.Windows.Forms.Button
$atom.text                       = "Atom"
$atom.width                      = 150
$atom.height                     = 30
$atom.location                   = New-Object System.Drawing.Point(16,104)
$atom.Font                       = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$emacs                           = New-Object system.Windows.Forms.Button
$emacs.text                      = "Emacs"
$emacs.width                     = 150
$emacs.height                    = 30
$emacs.location                  = New-Object System.Drawing.Point(183,19)
$emacs.Font                      = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$github                          = New-Object system.Windows.Forms.Button
$github.text                     = "Github Desktop"
$github.width                    = 150
$github.height                   = 30
$github.location                 = New-Object System.Drawing.Point(183,61)
$github.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$back                            = New-Object system.Windows.Forms.Button
$back.text                       = "Back"
$back.width                      = 150
$back.height                     = 30
$back.location                   = New-Object System.Drawing.Point(95,147)
$back.Font                       = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

###############################################################################

$PictureBox1a                     = New-Object system.Windows.Forms.PictureBox
$PictureBox1a.width               = 300
$PictureBox1a.height              = 125
$PictureBox1a.location            = New-Object System.Drawing.Point(19,170)
$PictureBox1a.imageLocation       = "https://github.com/link-does-mods/win10-debloat/blob/main/Images/Guardian.png?raw=true"
$PictureBox1a.SizeMode            = [System.Windows.Forms.PictureBoxSizeMode]::zoom

################################################################################
# Virtual Machine Form
################################################################################

$Form2                            = New-Object system.Windows.Forms.Form
$Form2.ClientSize                 = New-Object System.Drawing.Point(365,300)
$Form2.text                       = "Install VM Software"
$Form2.TopMost                    = $false

###############################################################################

$Panel2a                          = New-Object system.Windows.Forms.Panel
$Panel2a.height                   = 550
$Panel2a.width                    = 1032
$Panel2a.location                 = New-Object System.Drawing.Point(9,90)

###############################################################################

$Label2a                          = New-Object system.Windows.Forms.Label
$Label2a.text                     = "VM Software"
$Label2a.AutoSize                 = $true
$Label2a.width                    = 25
$Label2a.height                   = 10
$Label2a.location                 = New-Object System.Drawing.Point(10,30)
$Label2a.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',30)

###############################################################################

$vbox                            = New-Object system.Windows.Forms.Button
$vbox.text                       = "Virtualbox"
$vbox.width                      = 150
$vbox.height                     = 30
$vbox.location                   = New-Object System.Drawing.Point(16,19)
$vbox.Font                       = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$vmware                          = New-Object system.Windows.Forms.Button
$vmware.text                     = "VMWare Player"
$vmware.width                    = 150
$vmware.height                   = 30
$vmware.location                 = New-Object System.Drawing.Point(183,19)
$vmware.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$back1                           = New-Object system.Windows.Forms.Button
$back1.text                      = "Back"
$back1.width                     = 150
$back1.height                    = 30
$back1.location                  = New-Object System.Drawing.Point(95,62)
$back1.Font                      = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

################################################################################

$PictureBox1b                     = New-Object system.Windows.Forms.PictureBox
$PictureBox1b.width               = 300
$PictureBox1b.height              = 125
$PictureBox1b.location            = New-Object System.Drawing.Point(19,80)
$PictureBox1b.imageLocation       = "https://github.com/link-does-mods/win10-debloat/blob/main/Images/Purah.png?raw=true"
$PictureBox1b.SizeMode            = [System.Windows.Forms.PictureBoxSizeMode]::zoom

################################################################################
# Media/gfx Form
################################################################################

$Form3                            = New-Object system.Windows.Forms.Form
$Form3.ClientSize                 = New-Object System.Drawing.Point(383,350)
$Form3.text                       = "Install Media/Gfx Software"
$Form3.TopMost                    = $false

###############################################################################

$Panel3a                          = New-Object system.Windows.Forms.Panel
$Panel3a.height                   = 550
$Panel3a.width                    = 1032
$Panel3a.location                 = New-Object System.Drawing.Point(9,90)

###############################################################################

$Label3a                          = New-Object system.Windows.Forms.Label
$Label3a.text                     = "Media/Gfx Software"
$Label3a.AutoSize                 = $true
$Label3a.width                    = 25
$Label3a.height                   = 10
$Label3a.location                 = New-Object System.Drawing.Point(10,30)
$Label3a.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',30)

###############################################################################

$gimp                            = New-Object system.Windows.Forms.Button
$gimp.text                       = "Gimp"
$gimp.width                      = 150
$gimp.height                     = 30
$gimp.location                   = New-Object System.Drawing.Point(16,19)
$gimp.Font                       = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$inkscape                        = New-Object system.Windows.Forms.Button
$inkscape.text                   = "Inkscape"
$inkscape.width                  = 150
$inkscape.height                 = 30
$inkscape.location               = New-Object System.Drawing.Point(183,19)
$inkscape.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$vlc                             = New-Object system.Windows.Forms.Button
$vlc.text                        = "VLC"
$vlc.width                       = 150
$vlc.height                      = 30
$vlc.location                    = New-Object System.Drawing.Point(16,61)
$vlc.Font                        = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$spotify                         = New-Object system.Windows.Forms.Button
$spotify.text                    = "Spotify"
$spotify.width                   = 150
$spotify.height                  = 30
$spotify.location                = New-Object System.Drawing.Point(183,61)
$spotify.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$back2                           = New-Object system.Windows.Forms.Button
$back2.text                      = "Back"
$back2.width                     = 150
$back2.height                    = 30
$back2.location                  = New-Object System.Drawing.Point(95,103)
$back2.Font                      = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

###############################################################################

$PictureBox1c                     = New-Object system.Windows.Forms.PictureBox
$PictureBox1c.width               = 300
$PictureBox1c.height              = 125
$PictureBox1c.location            = New-Object System.Drawing.Point(19,120)
$PictureBox1c.imageLocation       = "https://github.com/link-does-mods/win10-debloat/blob/main/Images/Korok.png?raw=true"
$PictureBox1c.SizeMode            = [System.Windows.Forms.PictureBoxSizeMode]::zoom

################################################################################
# Emulator Form
################################################################################

$Form4                            = New-Object system.Windows.Forms.Form
$Form4.ClientSize                 = New-Object System.Drawing.Point(365,350)
$Form4.text                       = "Install Emulators"
$Form4.TopMost                    = $false

###############################################################################

$Panel4a                          = New-Object system.Windows.Forms.Panel
$Panel4a.height                   = 550
$Panel4a.width                    = 1032
$Panel4a.location                 = New-Object System.Drawing.Point(9,90)

###############################################################################

$Label4a                          = New-Object system.Windows.Forms.Label
$Label4a.text                     = "Emulators"
$Label4a.AutoSize                 = $true
$Label4a.width                    = 25
$Label4a.height                   = 10
$Label4a.location                 = New-Object System.Drawing.Point(10,30)
$Label4a.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',30)

###############################################################################

$dolphin                          = New-Object system.Windows.Forms.Button
$dolphin.text                     = "Dolphin"
$dolphin.width                    = 150
$dolphin.height                   = 30
$dolphin.location                 = New-Object System.Drawing.Point(16,19)
$dolphin.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$pcsx2                            = New-Object system.Windows.Forms.Button
$pcsx2.text                       = "PCSX2"
$pcsx2.width                      = 150
$pcsx2.height                     = 30
$pcsx2.location                   = New-Object System.Drawing.Point(183,19)
$pcsx2.Font                       = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$retroarch                        = New-Object system.Windows.Forms.Button
$retroarch.text                   = "Retroarch"
$retroarch.width                  = 150
$retroarch.height                 = 30
$retroarch.location               = New-Object System.Drawing.Point(16,61)
$retroarch.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$back3                            = New-Object system.Windows.Forms.Button
$back3.text                       = "Back"
$back3.width                      = 150
$back3.height                     = 30
$back3.location                   = New-Object System.Drawing.Point(95,103)
$back3.Font                       = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

###############################################################################

$PictureBox1d                     = New-Object system.Windows.Forms.PictureBox
$PictureBox1d.width               = 300
$PictureBox1d.height              = 125
$PictureBox1d.location            = New-Object System.Drawing.Point(19,120)
$PictureBox1d.imageLocation       = "https://github.com/link-does-mods/win10-debloat/blob/main/Images/Urbosa.png?raw=true"
$PictureBox1d.SizeMode            = [System.Windows.Forms.PictureBoxSizeMode]::zoom

###############################################################################
# Draw everything in their specific windows
###############################################################################

$Form.controls.AddRange(@($Panel1,$Label1,$Panel2,$Label3,$Panel3,$Label4,$Label15,$Panel4,$Label20,$Label21,$Label23,$PictureBox1))
$Panel1.controls.AddRange(@($installchoco,$scripting,$vms,$7zip,$neovim1,$adobereader,$atom1,$media,$gimp1,$vlc1,$winscp,$github1,$Label2,$emulators))
$Panel2.controls.AddRange(@($essentialtweaks,$backgroundapps,$cortana,$windowssearch,$actioncenter,$darkmode,$visualfx,$onedrive,$Label22,$lightmode))
$Panel3.controls.AddRange(@($securitylow,$securityhigh,$Label5,$Label6,$Label7,$Label8,$Label9,$Label10,$Label11,$Label12,$Label13))
$Panel4.controls.AddRange(@($defaultwindowsupdate,$securitywindowsupdate,$Label16,$Label17,$Label18,$Label19))

###############################################################################

$Form1.controls.AddRange(@($Panel1a,$Label1a))
$Panel1a.controls.AddRange(@($alacritty,$neovim,$atom,$emacs,$github,$back,$PictureBox1a))

###############################################################################

$Form2.controls.AddRange(@($Panel2a,$Label2a))
$Panel2a.controls.AddRange(@($vbox,$vmware,$back1,$PictureBox1b))

###############################################################################

$Form3.controls.AddRange(@($Panel3a,$Label3a))
$Panel3a.controls.AddRange(@($gimp,$inkscape,$vlc,$spotify,$back2,$PictureBox1c))

###############################################################################

$Form4.controls.AddRange(@($Panel4a,$Label4a))
$Panel4a.controls.AddRange(@($dolphin,$pcsx2,$retroarch,$back3,$PictureBox1d))

###############################################################################
# Button actions
###############################################################################

$installchoco.Add_Click({
    Write-Host "Installing Chocolatey"
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    choco install chocolatey-core.extension -y
    Write-Host "Installed Chocolatey"
})

$scripting.Add_Click({
    [void]$Form1.ShowDialog()
})

$vms.Add_Click({
    [void]$Form2.ShowDialog()
})

$media.Add_Click({
    [void]$Form3.ShowDialog()
})

$emulators.Add_Click({
    [void]$Form4.ShowDialog()
})

$winscp.Add_Click({
    Write-Host "Installing WinSCP"
    choco install winscp -y
    Write-Host "Installed WinSCP"
})

$7zip.Add_Click({
    Write-Host "Installing 7-Zip Compression Tool"
    choco install 7zip -y
    Write-Host "Installed 7-Zip Compression Tool"
})

$adobereader.Add_Click({
    Write-Host "Installing Adobe Reader DC"
    choco install adobereader -y
    Write-Host "Installed Adobe Reader DC"
})

$essentialtweaks.Add_Click({
    Write-Host "Creating Restore Point incase something bad happens"
    Enable-ComputerRestore -Drive "C:\"
    Checkpoint-Computer -Description "RestorePoint1" -RestorePointType "MODIFY_SETTINGS"

    Write-Host "Running O&O Shutup with Recommended Settings"
    Import-Module BitsTransfer		choco install shutup10 -y
    Start-BitsTransfer -Source "https://raw.githubusercontent.com/ChrisTitusTech/win10script/master/ooshutup10.cfg" -Destination ooshutup10.cfg        OOSU10 ooshutup10.cfg /quiet
    Start-BitsTransfer -Source "https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe" -Destination OOSU10.exe
    ./OOSU10.exe ooshutup10.cfg /quiet

    Write-Host "Disabling Telemetry..."
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name "AllowTelemetry" -Type DWord -Value 0
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name "AllowTelemetry" -Type DWord -Value 0
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Type DWord -Value 0
    Disable-ScheduledTask -TaskName "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" | Out-Null
    Disable-ScheduledTask -TaskName "Microsoft\Windows\Application Experience\ProgramDataUpdater" | Out-Null
    Disable-ScheduledTask -TaskName "Microsoft\Windows\Autochk\Proxy" | Out-Null
    Disable-ScheduledTask -TaskName "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" | Out-Null
    Disable-ScheduledTask -TaskName "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" | Out-Null
    Disable-ScheduledTask -TaskName "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" | Out-Null
    Write-Host "Disabling Application suggestions..."
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "ContentDeliveryAllowed" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "OemPreInstalledAppsEnabled" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "PreInstalledAppsEnabled" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "PreInstalledAppsEverEnabled" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SilentInstalledAppsEnabled" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338387Enabled" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338388Enabled" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338389Enabled" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-353698Enabled" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SystemPaneSuggestionsEnabled" -Type DWord -Value 0
    If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent")) {
        New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Force | Out-Null
    }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Name "DisableWindowsConsumerFeatures" -Type DWord -Value 1
    Write-Host "Disabling Activity History..."
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableActivityFeed" -Type DWord -Value 0
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "PublishUserActivities" -Type DWord -Value 0
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "UploadUserActivities" -Type DWord -Value 0
    Write-Host "Disabling Location Tracking..."
    If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location")) {
        New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Force | Out-Null
    }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Name "Value" -Type String -Value "Deny"
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" -Name "SensorPermissionState" -Type DWord -Value 0
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" -Name "Status" -Type DWord -Value 0
    Write-Host "Disabling automatic Maps updates..."
    Set-ItemProperty -Path "HKLM:\SYSTEM\Maps" -Name "AutoUpdateEnabled" -Type DWord -Value 0
    Write-Host "Disabling Feedback..."
    If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules")) {
        New-Item -Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" -Force | Out-Null
    }
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" -Name "NumberOfSIUFInPeriod" -Type DWord -Value 0
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "DoNotShowFeedbackNotifications" -Type DWord -Value 1
    Disable-ScheduledTask -TaskName "Microsoft\Windows\Feedback\Siuf\DmClient" -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" -ErrorAction SilentlyContinue | Out-Null
    Write-Host "Disabling Tailored Experiences..."
    If (!(Test-Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CloudContent")) {
        New-Item -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Force | Out-Null
    }
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Name "DisableTailoredExperiencesWithDiagnosticData" -Type DWord -Value 1
    Write-Host "Disabling Advertising ID..."
    If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo")) {
        New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" | Out-Null
    }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" -Name "DisabledByGroupPolicy" -Type DWord -Value 1
    Write-Host "Disabling Error reporting..."
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting" -Name "Disabled" -Type DWord -Value 1
    Disable-ScheduledTask -TaskName "Microsoft\Windows\Windows Error Reporting\QueueReporting" | Out-Null
    Write-Host "Restricting Windows Update P2P only to local network..."
    If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config")) {
        New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" | Out-Null
    }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" -Name "DODownloadMode" -Type DWord -Value 1
    Write-Host "Stopping and disabling Diagnostics Tracking Service..."
    Stop-Service "DiagTrack" -WarningAction SilentlyContinue
    Set-Service "DiagTrack" -StartupType Disabled
    Write-Host "Stopping and disabling WAP Push Service..."
    Stop-Service "dmwappushservice" -WarningAction SilentlyContinue
    Set-Service "dmwappushservice" -StartupType Disabled
    Write-Host "Enabling F8 boot menu options..."
    bcdedit /set `{current`} bootmenupolicy Legacy | Out-Null
    Write-Host "Stopping and disabling Home Groups services..."
    Stop-Service "HomeGroupListener" -WarningAction SilentlyContinue
    Set-Service "HomeGroupListener" -StartupType Disabled
    Stop-Service "HomeGroupProvider" -WarningAction SilentlyContinue
    Set-Service "HomeGroupProvider" -StartupType Disabled
    Write-Host "Disabling Remote Assistance..."
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Remote Assistance" -Name "fAllowToGetHelp" -Type DWord -Value 0
    Write-Host "Disabling Storage Sense..."
    Remove-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" -Recurse -ErrorAction SilentlyContinue
    Write-Host "Stopping and disabling Superfetch service..."
    Stop-Service "SysMain" -WarningAction SilentlyContinue
    Set-Service "SysMain" -StartupType Disabled
    Write-Host "Setting BIOS time to UTC..."
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\TimeZoneInformation" -Name "RealTimeIsUniversal" -Type DWord -Value 1
    Write-Host "Disabling Hibernation..."
    Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Session Manager\Power" -Name "HibernteEnabled" -Type Dword -Value 0
    If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings")) {
        New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" | Out-Null
    }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" -Name "ShowHibernateOption" -Type Dword -Value 0
    Write-Host "Showing task manager details..."
    $taskmgr = Start-Process -WindowStyle Hidden -FilePath taskmgr.exe -PassThru
    Do {
        Start-Sleep -Milliseconds 100
        $preferences = Get-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\TaskManager" -Name "Preferences" -ErrorAction SilentlyContinue
    } Until ($preferences)
    Stop-Process $taskmgr
    $preferences.Preferences[28] = 0
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\TaskManager" -Name "Preferences" -Type Binary -Value $preferences.Preferences
    Write-Host "Showing file operations details..."
    If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager")) {
        New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" | Out-Null
    }
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" -Name "EnthusiastMode" -Type DWord -Value 1
    Write-Host "Hiding Task View button..."
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskViewButton" -Type DWord -Value 0
    Write-Host "Hiding People icon..."
    If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People")) {
        New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" | Out-Null
    }
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" -Name "PeopleBand" -Type DWord -Value 0
    Write-Host "Showing all tray icons..."
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name "EnableAutoTray" -Type DWord -Value 0
    Write-Host "Enabling NumLock after startup..."
    If (!(Test-Path "HKU:")) {
        New-PSDrive -Name HKU -PSProvider Registry -Root HKEY_USERS | Out-Null
    }
    Set-ItemProperty -Path "HKU:\.DEFAULT\Control Panel\Keyboard" -Name "InitialKeyboardIndicators" -Type DWord -Value 2147483650
    Add-Type -AssemblyName System.Windows.Forms
    If (!([System.Windows.Forms.Control]::IsKeyLocked('NumLock'))) {
        $wsh = New-Object -ComObject WScript.Shell
        $wsh.SendKeys('{NUMLOCK}')
    }

    Write-Host "Changing default Explorer view to This PC..."
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "LaunchTo" -Type DWord -Value 1
    Write-Host "Hiding 3D Objects icon from This PC..."
    Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" -Recurse -ErrorAction SilentlyContinue

	# Network Tweaks
	Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -Name "IRPStackSize" -Type DWord -Value 20

	# SVCHost Tweak
	Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "SvcHostSplitThresholdInKB" -Type DWord -Value 4194304



$Bloatware = @(

        #Unnecessary Windows 10 AppX Apps
        "Microsoft.3DBuilder"
        "Microsoft.AppConnector"
        "Microsoft.BingFinance"
        "Microsoft.BingNews"
        "Microsoft.BingSports"
        "Microsoft.BingTranslator"
        "Microsoft.BingWeather"
        "Microsoft.GetHelp"
        "Microsoft.Getstarted"
        "Microsoft.Messaging"
        "Microsoft.Microsoft3DViewer"
        "Microsoft.MicrosoftSolitaireCollection"
        "Microsoft.NetworkSpeedTest"
        "Microsoft.News"
        "Microsoft.Office.Lens"
        "Microsoft.Office.Sway"
        "Microsoft.OneConnect"
        "Microsoft.People"
        "Microsoft.Print3D"
        "Microsoft.SkypeApp"
        "Microsoft.StorePurchaseApp"
        "Microsoft.Wallet"
        "Microsoft.Whiteboard"
        "Microsoft.WindowsAlarms"
        "microsoft.windowscommunicationsapps"
        "Microsoft.WindowsFeedbackHub"
        "Microsoft.WindowsMaps"
        "Microsoft.WindowsSoundRecorder"
        "Microsoft.ZuneMusic"
        "Microsoft.ZuneVideo"

        #Sponsored Windows 10 AppX Apps
        #Add sponsored/featured apps to remove in the "*AppName*" format
        "*EclipseManager*"
        "*ActiproSoftwareLLC*"
        "*AdobeSystemsIncorporated.AdobePhotoshopExpress*"
        "*Duolingo-LearnLanguagesforFree*"
        "*PandoraMediaInc*"
        "*CandyCrush*"
        "*BubbleWitch3Saga*"
        "*Wunderlist*"
        "*Flipboard*"
        "*Twitter*"
        "*Facebook*"
        "*Royal Revolt*"
        "*Sway*"
        "*Speed Test*"
        "*Dolby*"
        "*Viber*"
        "*ACGMediaPlayer*"
        "*Netflix*"
        "*OneCalendar*"
        "*LinkedInforWindows*"
        "*HiddenCityMysteryofShadows*"
        "*Hulu*"
        "*HiddenCity*"
        "*AdobePhotoshopExpress*"

        #Optional: Typically not removed but you can if you need to for some reason
        #"*Microsoft.Advertising.Xaml_10.1712.5.0_x64__8wekyb3d8bbwe*"
        #"*Microsoft.Advertising.Xaml_10.1712.5.0_x86__8wekyb3d8bbwe*"
        #"*Microsoft.BingWeather*"
        #"*Microsoft.MSPaint*"
        #"*Microsoft.MicrosoftStickyNotes*"
        #"*Microsoft.Windows.Photos*"
        #"*Microsoft.WindowsCalculator*"
        #"*Microsoft.WindowsStore*"
    )
    foreach ($Bloat in $Bloatware) {
        Get-AppxPackage -Name $Bloat| Remove-AppxPackage
        Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like $Bloat | Remove-AppxProvisionedPackage -Online
        Write-Host "Trying to remove $Bloat."
    }

    #Write-Host "Installing Windows Media Player..."
	#Enable-WindowsOptionalFeature -Online -FeatureName "WindowsMediaPlayer" -NoRestart -WarningAction SilentlyContinue | Out-Null

    #Stops edge from taking over as the default .PDF viewer
    Write-Host "Stopping Edge from taking over as the default .PDF viewer"
    # Identify the edge application class
    $Packages = "HKCU:SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\Repository\Packages"
    $edge = Get-ChildItem $Packages -Recurse -include "MicrosoftEdge"

    # Specify the paths to the file and URL associations
    $FileAssocKey = Join-Path $edge.PSPath Capabilities\FileAssociations
    $URLAssocKey = Join-Path $edge.PSPath Capabilities\URLAssociations

    # get the software classes for the file and URL types that Edge will associate
    $FileTypes = Get-Item $FileAssocKey
    $URLTypes = Get-Item $URLAssocKey

    $FileAssoc = Get-ItemProperty $FileAssocKey
    $URLAssoc = Get-ItemProperty $URLAssocKey

    $Associations = @()
    $Filetypes.Property | foreach {$Associations += $FileAssoc.$_}
    $URLTypes.Property | foreach {$Associations += $URLAssoc.$_}

    # add registry values in each software class to stop edge from associating as the default
    foreach ($Association in $Associations)
            {
            $Class = Join-Path HKCU:SOFTWARE\Classes $Association
            #if (Test-Path $class)
            #   {write-host $Association}
            # Get-Item $Class
            Set-ItemProperty $Class -Name NoOpenWith -Value ""
            Set-ItemProperty $Class -Name NoStaticDefaultVerb -Value ""
            }


    #Removes Paint3D stuff from context menu
$Paint3Dstuff = @(
    "HKCR:\SystemFileAssociations\.3mf\Shell\3D Edit"
    "HKCR:\SystemFileAssociations\.bmp\Shell\3D Edit"
    "HKCR:\SystemFileAssociations\.fbx\Shell\3D Edit"
    "HKCR:\SystemFileAssociations\.gif\Shell\3D Edit"
    "HKCR:\SystemFileAssociations\.jfif\Shell\3D Edit"
    "HKCR:\SystemFileAssociations\.jpe\Shell\3D Edit"
    "HKCR:\SystemFileAssociations\.jpeg\Shell\3D Edit"
    "HKCR:\SystemFileAssociations\.jpg\Shell\3D Edit"
    "HKCR:\SystemFileAssociations\.png\Shell\3D Edit"
    "HKCR:\SystemFileAssociations\.tif\Shell\3D Edit"
    "HKCR:\SystemFileAssociations\.tiff\Shell\3D Edit"
    )
    #Rename reg key to remove it, so it's revertible
    foreach ($Paint3D in $Paint3Dstuff) {
        If (Test-Path $Paint3D) {
        $rmPaint3D = $Paint3D + "_"
        Set-Item $Paint3D $rmPaint3D
    }
    }

    Write-Host "Essential Tweaks Completed"
})

$windowssearch.Add_Click({
    Write-Host "Disabling Bing Search in Start Menu..."
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name "BingSearchEnabled" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name "CortanaConsent" -Type DWord -Value 0
    If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search")) {
        New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Force | Out-Null
    }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "DisableWebSearch" -Type DWord -Value 1
    Write-Host "Stopping and disabling Windows Search indexing service..."
    Stop-Service "WSearch" -WarningAction SilentlyContinue
    Set-Service "WSearch" -StartupType Disabled
    Write-Host "Hiding Taskbar Search icon / box..."
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Type DWord -Value 0
    Write-Host "Search tweaks completed"
})

$backgroundapps.Add_Click({
    Write-Host "Disabling Background application access..."
    Get-ChildItem -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" -Exclude "Microsoft.Windows.Cortana*" | ForEach {
        Set-ItemProperty -Path $_.PsPath -Name "Disabled" -Type DWord -Value 1
        Set-ItemProperty -Path $_.PsPath -Name "DisabledByUser" -Type DWord -Value 1
    }
    Write-Host "Disabled Background application access"
})

$cortana.Add_Click({
    Write-Host "Disabling Cortana..."
    If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Personalization\Settings")) {
        New-Item -Path "HKCU:\SOFTWARE\Microsoft\Personalization\Settings" -Force | Out-Null
    }
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Personalization\Settings" -Name "AcceptedPrivacyPolicy" -Type DWord -Value 0
    If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization")) {
        New-Item -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization" -Force | Out-Null
    }
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization" -Name "RestrictImplicitTextCollection" -Type DWord -Value 1
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization" -Name "RestrictImplicitInkCollection" -Type DWord -Value 1
    If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore")) {
        New-Item -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" -Force | Out-Null
    }
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" -Name "HarvestContacts" -Type DWord -Value 0
    If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search")) {
        New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Force | Out-Null
    }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "AllowCortana" -Type DWord -Value 0
    Write-Host "Disabled Cortana"
})

$securitylow.Add_Click({
    Write-Host "Lowering UAC level..."
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Type DWord -Value 0
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "PromptOnSecureDesktop" -Type DWord -Value 0
    Write-Host "Disabling Windows Defender Cloud..."
    If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet")) {
        New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" -Force | Out-Null
    }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" -Name "SpynetReporting" -Type DWord -Value 0
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" -Name "SubmitSamplesConsent" -Type DWord -Value 2
    Write-Host "Disabling Meltdown (CVE-2017-5754) compatibility flag..."
    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\QualityCompat" -Name "cadca5fe-87d3-4b96-b7fb-a231484277cc" -ErrorAction SilentlyContinue
    Write-Host "Lowered UAC level"
})

$securityhigh.Add_Click({
    Write-Host "Raising UAC level..."
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Type DWord -Value 5
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "PromptOnSecureDesktop" -Type DWord -Value 1
    Write-Host "Disabling SMB 1.0 protocol..."
    Set-SmbServerConfiguration -EnableSMB1Protocol $false -Force
    Write-Host "Enabling Windows Defender..."
    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "DisableAntiSpyware" -ErrorAction SilentlyContinue
    If ([System.Environment]::OSVersion.Version.Build -eq 14393) {
        Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -Name "WindowsDefender" -Type ExpandString -Value "`"%ProgramFiles%\Windows Defender\MSASCuiL.exe`""
    } ElseIf ([System.Environment]::OSVersion.Version.Build -ge 15063) {
        Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -Name "SecurityHealth" -Type ExpandString -Value "`"%ProgramFiles%\Windows Defender\MSASCuiL.exe`""
    }
    Write-Host "Enabling Windows Defender Cloud..."
    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" -Name "SpynetReporting" -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" -Name "SubmitSamplesConsent" -ErrorAction SilentlyContinue
    Write-Host "Disabling Windows Script Host..."
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows Script Host\Settings" -Name "Enabled" -Type DWord -Value 0
    Write-Host "Enabling Meltdown (CVE-2017-5754) compatibility flag..."
    If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\QualityCompat")) {
        New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\QualityCompat" | Out-Null
    }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\QualityCompat" -Name "cadca5fe-87d3-4b96-b7fb-a231484277cc" -Type DWord -Value 0
    Write-Host "Enabling Malicious Software Removal Tool offering..."
    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\MRT" -Name "DontOfferThroughWUAU" -ErrorAction SilentlyContinue
    Write-Host "Raised UAC level"
})

$defaultwindowsupdate.Add_Click({
    Write-Host "Enabling driver offering through Windows Update..."
    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Device Metadata" -Name "PreventDeviceMetadataFromNetwork" -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" -Name "DontPromptForWindowsUpdate" -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" -Name "DontSearchWindowsUpdate" -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" -Name "DriverUpdateWizardWuSearchEnabled" -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "ExcludeWUDriversInQualityUpdate" -ErrorAction SilentlyContinue
    Write-Host "Enabling Windows Update automatic restart..."
    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "NoAutoRebootWithLoggedOnUsers" -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "AUPowerManagement" -ErrorAction SilentlyContinue
    Write-Host "Enabled driver offering through Windows Update"
})

$securitywindowsupdate.Add_Click({
    Write-Host "Disabling driver offering through Windows Update..."
    If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Device Metadata")) {
        New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Device Metadata" -Force | Out-Null
    }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Device Metadata" -Name "PreventDeviceMetadataFromNetwork" -Type DWord -Value 1
    If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DriverSearching")) {
        New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" -Force | Out-Null
    }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" -Name "DontPromptForWindowsUpdate" -Type DWord -Value 1
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" -Name "DontSearchWindowsUpdate" -Type DWord -Value 1
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" -Name "DriverUpdateWizardWuSearchEnabled" -Type DWord -Value 0
    If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate")) {
        New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" | Out-Null
    }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "ExcludeWUDriversInQualityUpdate" -Type DWord -Value 1
    Write-Host "Disabling Windows Update automatic restart..."
    If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU")) {
        New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Force | Out-Null
    }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "NoAutoRebootWithLoggedOnUsers" -Type DWord -Value 1
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "AUPowerManagement" -Type DWord -Value 0
    Write-Host "Disabled driver offering through Windows Update"
})

$actioncenter.Add_Click({
    Write-Host "Disabling Action Center..."
    If (!(Test-Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer")) {
        New-Item -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer" | Out-Null
    }
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name "DisableNotificationCenter" -Type DWord -Value 1
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" -Name "ToastEnabled" -Type DWord -Value 0
    Write-Host "Disabled Action Center"
})

$visualfx.Add_Click({
    Write-Host "Adjusting visual effects for performance..."
    Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "DragFullWindows" -Type String -Value 0
    Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "MenuShowDelay" -Type String -Value 200
    Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "UserPreferencesMask" -Type Binary -Value ([byte[]](144,18,3,128,16,0,0,0))
    Set-ItemProperty -Path "HKCU:\Control Panel\Desktop\WindowMetrics" -Name "MinAnimate" -Type String -Value 0
    Set-ItemProperty -Path "HKCU:\Control Panel\Keyboard" -Name "KeyboardDelay" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ListviewAlphaSelect" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ListviewShadow" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAnimations" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Type DWord -Value 3
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\DWM" -Name "EnableAeroPeek" -Type DWord -Value 0
    Write-Host "Adjusted visual effects for performance"
})

$onedrive.Add_Click({
    Write-Host "Disabling OneDrive..."
    If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive")) {
        New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive" | Out-Null
    }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive" -Name "DisableFileSyncNGSC" -Type DWord -Value 1
    Write-Host "Uninstalling OneDrive..."
    Stop-Process -Name "OneDrive" -ErrorAction SilentlyContinue
    Start-Sleep -s 2
    $onedrive = "$env:SYSTEMROOT\SysWOW64\OneDriveSetup.exe"
    If (!(Test-Path $onedrive)) {
        $onedrive = "$env:SYSTEMROOT\System32\OneDriveSetup.exe"
    }
    Start-Process $onedrive "/uninstall" -NoNewWindow -Wait
    Start-Sleep -s 2
    Stop-Process -Name "explorer" -ErrorAction SilentlyContinue
    Start-Sleep -s 2
    Remove-Item -Path "$env:USERPROFILE\OneDrive" -Force -Recurse -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\OneDrive" -Force -Recurse -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:PROGRAMDATA\Microsoft OneDrive" -Force -Recurse -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:SYSTEMDRIVE\OneDriveTemp" -Force -Recurse -ErrorAction SilentlyContinue
    If (!(Test-Path "HKCR:")) {
        New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT | Out-Null
    }
    Remove-Item -Path "HKCR:\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" -Recurse -ErrorAction SilentlyContinue
    Remove-Item -Path "HKCR:\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" -Recurse -ErrorAction SilentlyContinue
    Write-Host "Disabled OneDrive"
})

$darkmode.Add_Click({
    Write-Host "Enabling Dark Mode"
    Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0
    Write-Host "Enabled Dark Mode"
})

$lightmode.Add_Click({
    Write-Host "Switching Back to Light Mode"
    Remove-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme
    Write-Host "Switched Back to Light Mode"
})

###############################################################################

$alacritty.Add_Click({
    Write-Host "Installing Alacritty"
    choco install alacritty -y
    Write-Host "Installed Alacritty"
})

$neovim.Add_Click({
    Write-Host "Installing neovim"
    choco install neovim -y
    Write-Host "Installed neovim"
})

$atom.Add_Click({
    Write-Host "Installing Atom"
    choco install atom -y
    Write-Host "Installed Atom"
})

$emacs.Add_Click({
    Write-Host "Installing Emacs"
    choco install emacs -y
    Write-Host "Installed Emacs"
})

$github.Add_Click({
    Write-Host "Installing Github Desktop"
    choco install github-desktop -y
    Write-Host "Installed Github Desktop"
})

$back.Add_Click({
    [void]$Form1.Close()
})

###############################################################################

$vbox.Add_Click({
    Write-Host "Installing Virtualbox"
    choco install virtualbox -y
    Write-Host "Installed Virtualbox"
})

$vmware.Add_Click({
    Write-Host "Installing VMWare Player"
    choco install vmware-workstation-player -y
    Write-Host "Installed VMWare Player"
})

$back1.Add_Click({
    [void]$Form2.Close()
})

###############################################################################

$gimp.Add_Click({
    Write-Host "Installing Gimp"
    choco install gimp -y
    Write-Host "Installed Gimp"
})

$inkscape.Add_Click({
    Write-Host "Installing Inkscape"
    choco install inkscape -y
    Write-Host "Installed Inkscape"
})

$vlc.Add_Click({
    Write-Host "Installing VLC Media Player"
    choco install vlc -y
    Write-Host "Installed VLC Media Player"
})

$spotify.Add_Click({
    Write-Host "Installing Spotify"
    choco install spotify -y
    Write-Host "Installed Spotify"
})

$back2.Add_Click({
    [void]$Form3.Close()
})

###############################################################################

$dolphin.Add_Click({
    Write-Host "Installing Dolphin Emulator"
    choco install dolphin -y
    Write-Host "Installed Dolphin Emulator"
})

$pcsx2.Add_Click({
    Write-Host "Installing PCSX2 PS2 Emulator"
    choco install pcsx2 -y
    Write-Host "Installed PCSX2 PS2 Emulator"
})

$retroarch.Add_Click({
    Write-Host "Installing Retroarch"
    choco install retroarch -y
    Write-Host "Installed Retroarch"
})

$back3.Add_Click({
    [void]$Form4.Close()
})

###############################################################################
# Start program in main window
###############################################################################

[void]$Form.ShowDialog()
