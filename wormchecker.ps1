<#



.SYNOPSIS

Checks all OS' provided by MS here: https://portal.msrc.microsoft.com/en-US/security-guidance/advisory/CVE-2019-1182

that support this vulnerability fix and installs the applicable KB.



.DESCRIPTION

This script is outputting either !ERROR:, !WARNING:, or !SUCCESS:. These are to use in a state based remote monitor

in Automate.

-!FAILED: will only output if the machine is eligible to receive the CVE-2019-1182 patch and something in the script 

actually failed and needs attention

-!WARNING: will only output if the machine is not eligible for the CVE-2019-1182 patch

-!SUCCESS: will only output if the pathc has been verified to be installed



#>



Try {

    ## Determine if this is a 32 or 64 bit OS

    $osBit = (Get-WmiObject win32_operatingsystem).OSArchitecture

    ## Get the OS name, then set the proper link depending on OS and architecture

    $osVers = (Get-WmiObject win32_operatingsystem).Caption

    If ($osVers -like '*Windows 7*') {

        If ($osBit -eq '64-Bit') {

            $kbLink = 'http://download.windowsupdate.com/d/msdownload/update/software/secu/2019/08/windows6.1-kb4512486-x64_547fe7e4099c11d494c95d1f72e62a693cd70441.msu'

        } Else {

            $kbLink = 'http://download.windowsupdate.com/d/msdownload/update/software/secu/2019/08/windows6.1-kb4512486-x86_4c88f71af8e9d07e5fb141d7aed0bcc7f532781e.msu'

        }

    } ElseIf ($osVers -like '*Windows 8.1*') {

        If ($osBit -eq '64-Bit') {

            $kbLink = 'http://download.windowsupdate.com/d/msdownload/update/software/secu/2019/08/windows8.1-kb4512489-x64_be2ed8f4ee800d8c39e5025c5d95808858077c05.msu'

        } Else {

            $kbLink = 'http://download.windowsupdate.com/d/msdownload/update/software/secu/2019/08/windows8.1-kb4512489-x86_5d1c3cc3d4947aadba26345eda1fee8fdf7836f0.msu'

        }

    } ElseIf ($osVers -like '*Windows 10*') {

        $osBuild = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion").ReleaseId

        If ($osBuild -eq '1607') {

            If ($osBit -eq '64-Bit') {

                $kbLink = 'http://download.windowsupdate.com/d/msdownload/update/software/secu/2019/08/windows10.0-kb4512517-x64_81ba5a17cf768a54489faf28ba3a3eca3c0c36d5.msu'

            } Else {

                $kbLink = 'http://download.windowsupdate.com/d/msdownload/update/software/secu/2019/08/windows10.0-kb4512517-x86_87c8db3f50185f2330af12641f5d7c6256f91b05.msu'

            }

        } ElseIf ($osBuild -eq '1703') {

            If ($osBit -eq '64-Bit') {

                $kbLink = 'http://download.windowsupdate.com/c/msdownload/update/software/secu/2019/08/windows10.0-kb4512507-x64_81b6781ca7747a1ad6e6994a5c5a798eda6c0197.msu'

            } Else {

                $kbLink = 'http://download.windowsupdate.com/c/msdownload/update/software/secu/2019/08/windows10.0-kb4512507-x86_c9b83a4a0df02a575433b328d5dee50c5e0301d2.msu'

            }

        } ElseIf ($osBuild -eq '1709') {

            If ($osBit -eq '64-Bit') {

                $kbLink = 'http://download.windowsupdate.com/c/msdownload/update/software/secu/2019/08/windows10.0-kb4512516-x64_ff073f3c79f9bffd9e9ac4575fd4be1d336f8b74.msu'

            } Else {

                $kbLink = 'http://download.windowsupdate.com/c/msdownload/update/software/secu/2019/08/windows10.0-kb4512516-x86_0450fe3d01203284e2a0b1b9530af9bd1775ece9.msu'

            }

        } ElseIf ($osBuild -eq '1803') {

            If ($osBit -eq '64-Bit') {

                $kbLink = 'http://download.windowsupdate.com/d/msdownload/update/software/secu/2019/08/windows10.0-kb4512501-x64_09acaf2e24b265fdb2f29c4c62e9d079029659bd.msu'

            } Else {

                $kbLink = 'http://download.windowsupdate.com/d/msdownload/update/software/secu/2019/08/windows10.0-kb4512501-x86_d9d96c89768ab90534e11699976f9d3b83acc528.msu'

            }

        } ElseIf ($osBuild -eq '1809') {

            If ($osBit -eq '64-Bit') {

                $kbLink = 'http://download.windowsupdate.com/d/msdownload/update/software/secu/2019/08/windows10.0-kb4511553-x64_a67329ef92df959050847b10d583e6c54aa3b3d4.msu'

            } Else {

                $kbLink = 'http://download.windowsupdate.com/c/msdownload/update/software/secu/2019/08/windows10.0-kb4511553-x86_e8949138a79954d3fd2b643f2420bb49b5a0714b.msu'

            }

        } ElseIf ($osBuild -eq '1903') {

            If ($osBit -eq '64-Bit') {

                $kbLink = 'http://download.windowsupdate.com/d/msdownload/update/software/secu/2019/08/windows10.0-kb4512508-x64_1893edc9a11d760be11e49d2500170ceee8026d7.msu'

            } Else {

                $kbLink = 'http://download.windowsupdate.com/d/msdownload/update/software/secu/2019/08/windows10.0-kb4512508-x86_4fa588cd4d1f66421a21c5186e8b7fcdf32555d1.msu'

            }

        } Else {

            ## If we got here it means the OS on the machine this ran on wasn't on the supported list from MS. See the link in the output below.

            Write-Warning '!WARNING: This build Windows 10 does not have an applicable CVE-2019-1182 patch. See https://portal.msrc.microsoft.com/en-US/security-guidance/advisory/CVE-2019-1182 for a list of supported OSs.'

            Break

        }

    } ElseIf ($osVers -like '*Server 2008 R2*') {

        $kbLink = 'http://download.windowsupdate.com/d/msdownload/update/software/secu/2019/08/windows6.1-kb4512486-x64_547fe7e4099c11d494c95d1f72e62a693cd70441.msu'

    } ElseIf ($osVers -like '*Server 2012*' -and $osVers -notlike '*R2*') {

        $kbLink = 'http://download.windowsupdate.com/c/msdownload/update/software/secu/2019/08/windows8-rt-kb4512482-x64_d70a5c16078078eabc121282b160536e6f61d242.msu'

    } ElseIf ($osVers -like '*Server 2012 R2*') {

        $kbLink = 'http://download.windowsupdate.com/d/msdownload/update/software/secu/2019/08/windows8.1-kb4512489-x64_be2ed8f4ee800d8c39e5025c5d95808858077c05.msu'

    } ElseIf ($osVers -like '*Server 2016*'){

        $kbLink = 'http://download.windowsupdate.com/d/msdownload/update/software/secu/2019/08/windows10.0-kb4512517-x64_81ba5a17cf768a54489faf28ba3a3eca3c0c36d5.msu'

    } ElseIf ($osVers -like '*Server 2019*') {

        $kbLink = 'http://download.windowsupdate.com/d/msdownload/update/software/secu/2019/08/windows10.0-kb4511553-x64_a67329ef92df959050847b10d583e6c54aa3b3d4.msu'

    } Else {

        ## If we got here it means the OS on the machine this ran on wasn't on the supported list from MS. See the link in the output below.

        Write-Warning "!WARNING: $osVers does not support CVE-2019-1182 remedation"

        Break

    }

} Catch {

    ## Bounce here if there was an issue getting the OS / architecture / KB link

    Write-Warning '!ERROR: There was a problem detecting the OS version'

    Break

}



## Grab the KB number out of the link determined for this OS so we can see if it's already installed or not

$kb = [regex]::match($kbLink, '-(kb.{7})').Groups[1].Value

## If the KB is not installed, try to install it w/ no reboot

If (!(Get-HotFix -Id $kb)) {

    Try {

        $patchDir = "$env:windir\LTSvc\Packages\Patching\CVE-2019-1182"

        $patchInstall = "$patchDir\CVE-2019-1182.msu"

        If (!(Test-Path $patchDir)) {

            New-Item $patchDir -ItemType Directory | Out-Null

        If (!(Get-HotFix -Id $kb)) {

            Write-Warning "!ERROR: $kb install was attempted but did not show installed after it was executed, may need to be investiagted."

            Break

        } Else {

            Write-Output "!SUCCESS: Verified $kb has been successfully installed"

            Break

        }

    } Catch {

        Write-Warning "!ERROR: There was a problem while attempting to install $kb to $env:computername"

        Break

    }

} Else {

    ## If the patch is installed, output success!

    Write-Output "!SUCCESS: Verified $kb has been successfully installed"

    Break

}
