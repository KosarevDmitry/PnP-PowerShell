param($installPath, $toolsPath, $package, $project)

Import-Module (Join-Path $toolsPath common.psm1) -Force

try {

    # Indicates if current project is a VB project
    $IsVbProject = ($project.CodeModel.Language -eq [EnvDTE.CodeModelLanguageConstants]::vsCMLanguageVB)
    
    if ($IsVbProject) {

        # Remove added Imports for VB project
        $VbImports | ForEach-Object {
            if ($project.Object.Imports -contains $_) {
                $project.Object.Imports.Remove($_)
            }
        }
    }
    
    # Remove references
    Foreach ($spRef in $ReferencesToRemoveWhenUninstall) {
        $project.Object.References | Where-Object { $_.Identity -eq $spRef } | ForEach-Object { $_.Remove() }
    }
    
} catch {

    Write-Host "Error uninstalling package: " + $_.Exception -ForegroundColor Red
    exit
}
# SIG # Begin signature block
# MIIiQQYJKoZIhvcNAQcCoIIiMjCCIi4CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCAN/6dBHJ45hY+Y
# N8R45TKbxt2wbCsKlOEE8Hxkc3JCuqCCC4MwggULMIID86ADAgECAhMzAAAAe6KB
# C4cRq+f8AAAAAAB7MA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTAwHhcNMTQxMDAxMTgwNjM4WhcNMTYwMTAxMTgwNjM4WjCBgzEL
# MAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1v
# bmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjENMAsGA1UECxMETU9Q
# UjEeMBwGA1UEAxMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMIIBIjANBgkqhkiG9w0B
# AQEFAAOCAQ8AMIIBCgKCAQEAvQcxxth2EB1eNeHpmIf/xHv5hBJHStPFJ2Zp22w2
# nNOhA3CXNR09AyJfXIEL50eYNUaSPv035IjaKWFTJMd9iXVt9WcwDtqZ40mvXhVE
# IyRFFgVmHcDac0t+/HxA4SPZKYlGHAvdNz8gd97MD7tIaeAXcx/qOxYqkhsujIJJ
# OKAqkfCh2w/3fWqRLgVrimZlJghs5DJOT5DL6br8nBYxqgjIsp4c8QsCsBZdlXxK
# m+7DAolGOmGJ8GwTtg1m3hcURkrTyXnyx34N2x22kH5gItwtcNicDAMnN6xc8ydI
# WviJIaR0Gj4Da8UiqTd9s2dNxuScWaOIuy/Ev/9DUf1zPQIDAQABo4IBejCCAXYw
# HwYDVR0lBBgwFgYIKwYBBQUHAwMGCisGAQQBgjc9BgEwHQYDVR0OBBYEFE8LE+6Q
# o6azvj+qlES88piRTzIdMFEGA1UdEQRKMEikRjBEMQ0wCwYDVQQLEwRNT1BSMTMw
# MQYDVQQFEyozODA3Nis2OGQyZjhiYi0wYTNiLTQwYjQtOWYyNC1lYjdlOTQxOWQx
# NjAwHwYDVR0jBBgwFoAU5vxfe7siAFjkck619CF0IzLm76wwVgYDVR0fBE8wTTBL
# oEmgR4ZFaHR0cDovL2NybC5taWNyb3NvZnQuY29tL3BraS9jcmwvcHJvZHVjdHMv
# TWljQ29kU2lnUENBXzIwMTAtMDctMDYuY3JsMFoGCCsGAQUFBwEBBE4wTDBKBggr
# BgEFBQcwAoY+aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraS9jZXJ0cy9NaWND
# b2RTaWdQQ0FfMjAxMC0wNy0wNi5jcnQwDAYDVR0TAQH/BAIwADANBgkqhkiG9w0B
# AQsFAAOCAQEAL1QbJw93iIl4XlutFtrDwEs8JT/kMaquI7SOYeIwgVH+SI71MCMZ
# TcveYIhzmIcEQz3gi+6gC28dVa6Y0GeuADG+vu3thnUKkko63nE4tGH3wDvhMRbx
# /L8wYXp13zaEV3R/HaYCiukoMfWMkN+qWdGepYUmp+PAXFTl3dVd/4oxMTdbLf4t
# lx1QqOyGSAyRrbJmPB57RWEJrGfhfYInTwr8Sy7UF/mVMxF7qCYBPJJD5pngvKsK
# TXNRW3YSyiaJ1TXHutME/dy4jipqbcZXUUA9qjRIICpPnoFxyk1VhBpKePeG96WJ
# MV0lBi+tzLVoWe5RSzxIKyI2qxzQho7SiTCCBnAwggRYoAMCAQICCmEMUkwAAAAA
# AAMwDQYJKoZIhvcNAQELBQAwgYgxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNo
# aW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29y
# cG9yYXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBSb290IENlcnRpZmljYXRlIEF1
# dGhvcml0eSAyMDEwMB4XDTEwMDcwNjIwNDAxN1oXDTI1MDcwNjIwNTAxN1owfjEL
# MAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1v
# bmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEoMCYGA1UEAxMfTWlj
# cm9zb2Z0IENvZGUgU2lnbmluZyBQQ0EgMjAxMDCCASIwDQYJKoZIhvcNAQEBBQAD
# ggEPADCCAQoCggEBAOkOZFB5Z7XE4/0JAEyelKz3VmjqRNjPxVhPqaV2fG1FutM5
# krSkHvn5ZYLkF9KP/UScCOhlk84sVYS/fQjjLiuoQSsYt6JLbklMaxUH3tHSwoke
# cZTNtX9LtK8I2MyI1msXlDqTziY/7Ob+NJhX1R1dSfayKi7VhbtZP/iQtCuDdMor
# sztG4/BGScEXZlTJHL0dxFViV3L4Z7klIDTeXaallV6rKIDN1bKe5QO1Y9OyFMjB
# yIomCll/B+z/Du2AEjVMEqa+Ulv1ptrgiwtId9aFR9UQucboqu6Lai0FXGDGtCpb
# nCMcX0XjGhQebzfLGTOAaolNo2pmY3iT1TDPlR8CAwEAAaOCAeMwggHfMBAGCSsG
# AQQBgjcVAQQDAgEAMB0GA1UdDgQWBBTm/F97uyIAWORyTrX0IXQjMubvrDAZBgkr
# BgEEAYI3FAIEDB4KAFMAdQBiAEMAQTALBgNVHQ8EBAMCAYYwDwYDVR0TAQH/BAUw
# AwEB/zAfBgNVHSMEGDAWgBTV9lbLj+iiXGJo0T2UkFvXzpoYxDBWBgNVHR8ETzBN
# MEugSaBHhkVodHRwOi8vY3JsLm1pY3Jvc29mdC5jb20vcGtpL2NybC9wcm9kdWN0
# cy9NaWNSb29DZXJBdXRfMjAxMC0wNi0yMy5jcmwwWgYIKwYBBQUHAQEETjBMMEoG
# CCsGAQUFBzAChj5odHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpL2NlcnRzL01p
# Y1Jvb0NlckF1dF8yMDEwLTA2LTIzLmNydDCBnQYDVR0gBIGVMIGSMIGPBgkrBgEE
# AYI3LgMwgYEwPQYIKwYBBQUHAgEWMWh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9Q
# S0kvZG9jcy9DUFMvZGVmYXVsdC5odG0wQAYIKwYBBQUHAgIwNB4yIB0ATABlAGcA
# YQBsAF8AUABvAGwAaQBjAHkAXwBTAHQAYQB0AGUAbQBlAG4AdAAuIB0wDQYJKoZI
# hvcNAQELBQADggIBABp071dPKXvEFoV4uFDTIvwJnayCl/g0/yosl5US5eS/z7+T
# yOM0qduBuNweAL7SNW+v5X95lXflAtTx69jNTh4bYaLCWiMa8IyoYlFFZwjjPzwe
# k/gwhRfIOUCm1w6zISnlpaFpjCKTzHSY56FHQ/JTrMAPMGl//tIlIG1vYdPfB9XZ
# cgAsaYZ2PVHbpjlIyTdhbQfdUxnLp9Zhwr/ig6sP4GubldZ9KFGwiUpRpJpsyLcf
# ShoOaanX3MF+0Ulwqratu3JHYxf6ptaipobsqBBEm2O2smmJBsdGhnoYP+jFHSHV
# e/kCIy3FQcu/HUzIFu+xnH/8IktJim4V46Z/dlvRU3mRhZ3V0ts9czXzPK5UslJH
# asCqE5XSjhHamWdeMoz7N4XR3HWFnIfGWleFwr/dDY+Mmy3rtO7PJ9O1Xmn6pBYE
# AackZ3PPTU+23gVWl3r36VJN9HcFT4XG2Avxju1CCdENduMjVngiJja+yrGMbqod
# 5IXaRzNij6TJkTNfcR5Ar5hlySLoQiElihwtYNk3iUGJKhYP12E8lGhgUu/WR5mg
# gEDuFYF3PpzgUxgaUB04lZseZjMTJzkXeIc2zk7DX7L1PUdTtuDl2wthPSrXkizO
# N1o+QEIxpB8QCMJWnL8kXVECnWp50hfT2sGUjgd7JXFEqwZq5tTG3yOalnXFMYIW
# FDCCFhACAQEwgZUwfjELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24x
# EDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlv
# bjEoMCYGA1UEAxMfTWljcm9zb2Z0IENvZGUgU2lnbmluZyBQQ0EgMjAxMAITMwAA
# AHuigQuHEavn/AAAAAAAezANBglghkgBZQMEAgEFAKCB/zAZBgkqhkiG9w0BCQMx
# DAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAvBgkq
# hkiG9w0BCQQxIgQgYpOtBb7+0rbI0S3pbSEkF8U8URvtfTZfOz5+KgQnVQ4wgZIG
# CisGAQQBgjcCAQwxgYMwgYCgZoBkAHUAbgBpAG4AcwB0AGEAbABsAF8AYwBjAGYA
# ZABjADQANgA3AC0AMgBlADQAMgAtADQAMwAyADcALQA4ADYAMgBlAC0AMgA4AGIA
# YgA1ADEAZgBlADQANQA0ADUALgBwAHMAMaEWgBRodHRwOi8vbWljcm9zb2Z0LmNv
# bTANBgkqhkiG9w0BAQEFAASCAQB1B7HL9e1QEZ62PKtFI1UQsoC3tcuEhU5xBYyr
# AgrpwhFa+vKdWOh6Iucc2IwEvuIKeQDk83VnZTVEPT7tOHRNbS36ot5hRtbMlWy4
# 1YYdvrodVoqkNDYSy70it1oti3qqPjnQUsnMfETeoHv4E8b+VUB3jeqv+zsPjJuH
# 9xeiMHLa2b0p9XhTR3lO5kPty2spIDfEm0iu5aFt/sxUv6l5MypF9YJ52LzcKLaZ
# tlROR7g9Ks2ZMSgQjx8Bwam1Aiy63F1gDJ6cmsNPwF/+v2OLK0DwcsHwV4BuWFQe
# Zfdo1jnElv99I5SpLhI5RPNVYhq5N3lqRx9bFAci2e5zn6cHoYITTTCCE0kGCisG
# AQQBgjcDAwExghM5MIITNQYJKoZIhvcNAQcCoIITJjCCEyICAQMxDzANBglghkgB
# ZQMEAgEFADCCAT0GCyqGSIb3DQEJEAEEoIIBLASCASgwggEkAgEBBgorBgEEAYRZ
# CgMBMDEwDQYJYIZIAWUDBAIBBQAEIOFsqVBw3I11meIXIXZPqEeF5TwmLxftRUXW
# dhX8MBvuAgZVJC068u0YEzIwMTUwNDEwMTk1NzE5LjkyNVowBwIBAYACAfSggbmk
# gbYwgbMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQH
# EwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xDTALBgNV
# BAsTBE1PUFIxJzAlBgNVBAsTHm5DaXBoZXIgRFNFIEVTTjpGNTI4LTM3NzctOEE3
# NjElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZaCCDtAwggZx
# MIIEWaADAgECAgphCYEqAAAAAAACMA0GCSqGSIb3DQEBCwUAMIGIMQswCQYDVQQG
# EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwG
# A1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQg
# Um9vdCBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkgMjAxMDAeFw0xMDA3MDEyMTM2NTVa
# Fw0yNTA3MDEyMTQ2NTVaMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5n
# dG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9y
# YXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMIIB
# IjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqR0NvHcRijog7PwTl/X6f2mU
# a3RUENWlCgCChfvtfGhLLF/Fw+Vhwna3PmYrW/AVUycEMR9BGxqVHc4JE458YTBZ
# sTBED/FgiIRUQwzXTbg4CLNC3ZOs1nMwVyaCo0UN0Or1R4HNvyRgMlhgRvJYR4Yy
# hB50YWeRX4FUsc+TTJLBxKZd0WETbijGGvmGgLvfYfxGwScdJGcSchohiq9LZIlQ
# YrFd/XcfPfBXday9ikJNQFHRD5wGPmd/9WbAA5ZEfu/QS/1u5ZrKsajyeioKMfDa
# TgaRtogINeh4HLDpmc085y9Euqf03GS9pAHBIAmTeM38vMDJRF1eFpwBBU8iTQID
# AQABo4IB5jCCAeIwEAYJKwYBBAGCNxUBBAMCAQAwHQYDVR0OBBYEFNVjOlyKMZDz
# Q3t8RhvFM2hahW1VMBkGCSsGAQQBgjcUAgQMHgoAUwB1AGIAQwBBMAsGA1UdDwQE
# AwIBhjAPBgNVHRMBAf8EBTADAQH/MB8GA1UdIwQYMBaAFNX2VsuP6KJcYmjRPZSQ
# W9fOmhjEMFYGA1UdHwRPME0wS6BJoEeGRWh0dHA6Ly9jcmwubWljcm9zb2Z0LmNv
# bS9wa2kvY3JsL3Byb2R1Y3RzL01pY1Jvb0NlckF1dF8yMDEwLTA2LTIzLmNybDBa
# BggrBgEFBQcBAQROMEwwSgYIKwYBBQUHMAKGPmh0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2kvY2VydHMvTWljUm9vQ2VyQXV0XzIwMTAtMDYtMjMuY3J0MIGgBgNV
# HSABAf8EgZUwgZIwgY8GCSsGAQQBgjcuAzCBgTA9BggrBgEFBQcCARYxaHR0cDov
# L3d3dy5taWNyb3NvZnQuY29tL1BLSS9kb2NzL0NQUy9kZWZhdWx0Lmh0bTBABggr
# BgEFBQcCAjA0HjIgHQBMAGUAZwBhAGwAXwBQAG8AbABpAGMAeQBfAFMAdABhAHQA
# ZQBtAGUAbgB0AC4gHTANBgkqhkiG9w0BAQsFAAOCAgEAB+aIUQ3ixuCYP4FxAz2d
# o6Ehb7Prpsz1Mb7PBeKp/vpXbRkws8LFZslq3/Xn8Hi9x6ieJeP5vO1rVFcIK1GC
# RBL7uVOMzPRgEop2zEBAQZvcXBf/XPleFzWYJFZLdO9CEMivv3/Gf/I3fVo/HPKZ
# eUqRUgCvOA8X9S95gWXZqbVr5MfO9sp6AG9LMEQkIjzP7QOllo9ZKby2/QThcJ8y
# Sif9Va8v/rbljjO7Yl+a21dA6fHOmWaQjP9qYn/dxUoLkSbiOewZSnFjnXshbcOc
# o6I8+n99lmqQeKZt0uGc+R38ONiU9MalCpaGpL2eGq4EQoO4tYCbIjggtSXlZOz3
# 9L9+Y1klD3ouOVd2onGqBooPiRa6YacRy5rYDkeagMXQzafQ732D8OE7cQnfXXSY
# Ighh2rBQHm+98eEA3+cxB6STOvdlR3jo+KhIq/fecn5ha293qYHLpwmsObvsxsvY
# grRyzR30uIUBHoD7G4kqVDmyW9rIDVWZeodzOwjmmC3qjeAzLhIp9cAvVCch98is
# TtoouLGp25ayp0Kiyc8ZQU3ghvkqmqMRZjDTu3QyS99je/WZii8bxyGvWbWu3EQ8
# l1Bx16HSxVXjad5XwdHeMMD9zOZN+w2/XU/pnR4ZOC+8z1gFLu8NoFA12u8JJxzV
# s341Hgi62jbb01+P3nSISRIwggTaMIIDwqADAgECAhMzAAAAU8oCK/B0cFZsAAAA
# AABTMA0GCSqGSIb3DQEBCwUAMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNo
# aW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29y
# cG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEw
# MB4XDTE1MDMyMDE3MzIyNloXDTE2MDYyMDE3MzIyNlowgbMxCzAJBgNVBAYTAlVT
# MRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQK
# ExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xDTALBgNVBAsTBE1PUFIxJzAlBgNVBAsT
# Hm5DaXBoZXIgRFNFIEVTTjpGNTI4LTM3NzctOEE3NjElMCMGA1UEAxMcTWljcm9z
# b2Z0IFRpbWUtU3RhbXAgU2VydmljZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC
# AQoCggEBAM54iPxu7jL0i6DtCPc+aXff2CrpQBDWGw2doNox0B4YXL7jx4/bMMNK
# BNrGJE4ktuU/FnOoC4rYgVWX4R9YEI1GkxHn32gOwHSsHQI6OViRLZI25y74/uh3
# CTpEmPRV+3kVDBGRuXhkwU4mGCaS+6Ph+FnvY5ax2NnjtqHIOxS7GEtjMvucBA9O
# jR6twB/lwc0s6lIK/qjEGLIo0JRPuAkE25oy55RZbEtcNz0p0+64izbFpe2QPkN4
# ltCtRzRFkN5oRopH3qmCb8n0P8DLxZdSA9NHzi4S6kq/xhwzCuV81N2ACXmpYpEi
# NFQUgwNtl+ej7NP8nkjwl+gIGjoYNT8CAwEAAaOCARswggEXMB0GA1UdDgQWBBQ/
# eyp4u9cjNRGndQ5ohPUqiAKp1TAfBgNVHSMEGDAWgBTVYzpcijGQ80N7fEYbxTNo
# WoVtVTBWBgNVHR8ETzBNMEugSaBHhkVodHRwOi8vY3JsLm1pY3Jvc29mdC5jb20v
# cGtpL2NybC9wcm9kdWN0cy9NaWNUaW1TdGFQQ0FfMjAxMC0wNy0wMS5jcmwwWgYI
# KwYBBQUHAQEETjBMMEoGCCsGAQUFBzAChj5odHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20vcGtpL2NlcnRzL01pY1RpbVN0YVBDQV8yMDEwLTA3LTAxLmNydDAMBgNVHRMB
# Af8EAjAAMBMGA1UdJQQMMAoGCCsGAQUFBwMIMA0GCSqGSIb3DQEBCwUAA4IBAQCE
# AHONgXDnRSyPHAYbnO3615WFo65xQrSizlGqG2WVAwSrpEZvnoYMaXAqLfXVvG57
# F+Rp1d6g90g1Qzsd4f06JNMKMhYJZOch39hAVeZm5x5s2yhrOhej5b1e1sE2D7se
# UA6CgcJlDJEbDePqXEbxiTKDgmTAyn4t9lxQr3LRgUFpZqO42BHDevk8SyZolzAF
# 0k4rtA3h5jDSlbnR85SivAF2Rf16O3vgKShEjDxYfl1/YhxA9UTQO4nJTTxxD1LR
# Cyg02cdcg7aJpBTaeXyJipAiMev8rhaVdbgKpEpO0Ua3LCXwiyqYwdPHJiACJFBV
# r0RU4shhe4ejpmp69LE3oYIDeTCCAmECAQEwgeOhgbmkgbYwgbMxCzAJBgNVBAYT
# AlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYD
# VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xDTALBgNVBAsTBE1PUFIxJzAlBgNV
# BAsTHm5DaXBoZXIgRFNFIEVTTjpGNTI4LTM3NzctOEE3NjElMCMGA1UEAxMcTWlj
# cm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZaIlCgEBMAkGBSsOAwIaBQADFQDVhi+W
# t0SXrds5ZjSm4BKLexiVg6CBwjCBv6SBvDCBuTELMAkGA1UEBhMCVVMxEzARBgNV
# BAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jv
# c29mdCBDb3Jwb3JhdGlvbjENMAsGA1UECxMETU9QUjEnMCUGA1UECxMebkNpcGhl
# ciBOVFMgRVNOOjU3RjYtQzFFMC01NTRDMSswKQYDVQQDEyJNaWNyb3NvZnQgVGlt
# ZSBTb3VyY2UgTWFzdGVyIENsb2NrMA0GCSqGSIb3DQEBBQUAAgUA2NI+yDAiGA8y
# MDE1MDQxMDEyMjEyOFoYDzIwMTUwNDExMTIyMTI4WjB3MD0GCisGAQQBhFkKBAEx
# LzAtMAoCBQDY0j7IAgEAMAoCAQACAhzVAgH/MAcCAQACAhZnMAoCBQDY05BIAgEA
# MDYGCisGAQQBhFkKBAIxKDAmMAwGCisGAQQBhFkKAwGgCjAIAgEAAgMW42ChCjAI
# AgEAAgMHoSAwDQYJKoZIhvcNAQEFBQADggEBAFubSgV2Gsn1hmL9AvKrYPdfOT3N
# yeBTq0PwQKrcbPq4qMqutNoj5XCbq09Mr+bC3k4XgZdrCp8C+D+uIi1xfwCgIqxC
# bLLJah2xgTNlrxdd+togq105GHgyrA4v7p8jHLl8gMvwecVHJFBwwpemnbkTIaty
# ioMTHi082fTyiXODFSK29qnwkzjsdQLMEYjphF4eT7Bn6t5rJDp2aGOM+QX1BIGw
# 7FrfLMKGJWc99RLyyAQwmo5VuDVGGNv8IDsj4c3fHO1njRDM5FlRCE1Vvugvshmp
# g2JaI3bewgABxj6yduAkyXTBLSe75UPsxZD7kSMEgy/yvlUMDQaAR/amLUMxggL1
# MIIC8QIBATCBkzB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQ
# MA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9u
# MSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMAITMwAAAFPK
# AivwdHBWbAAAAAAAUzANBglghkgBZQMEAgEFAKCCATIwGgYJKoZIhvcNAQkDMQ0G
# CyqGSIb3DQEJEAEEMC8GCSqGSIb3DQEJBDEiBCAIcKxECNgrMgKFnUomFFySBTV1
# gZDbZdCZrWibHuVx6jCB4gYLKoZIhvcNAQkQAgwxgdIwgc8wgcwwgbEEFNWGL5a3
# RJet2zlmNKbgEot7GJWDMIGYMIGApH4wfDELMAkGA1UEBhMCVVMxEzARBgNVBAgT
# Cldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29m
# dCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENB
# IDIwMTACEzMAAABTygIr8HRwVmwAAAAAAFMwFgQUtNQ64xaZtkhDftoa5Li26cxU
# TiEwDQYJKoZIhvcNAQELBQAEggEAIp40szjnZ/9VGSUkkGwFWEHenlGjoIZlMe2v
# 1PbEqYUaNxMvSTFAzqsamEKs8DUakovGZeRySEMiVb5mnCeOzHiDM+ARLauoUP6p
# s3721XOMKG9a14UyQ5POob9ZaSPnmjH+liTKZmg+kDOR5VtuBkf9YjXa+OX3DuJU
# 3PYS7Zm3a4gJV76IXkgcBa8AOHfipsn4hDOEIOZ/ku9WnvWxT01sCzC5zzVMX+k7
# rzL5FhHwInJX0VNh8ARtq0vLBgxZfPyGivicXBHwdQOYe1KdINZykw9hj83KuBZD
# jCuiDjGJ6Oo67v+7aSYlRCvTwlJ3ghnfzFOuyZpEgRfKMrNYhw==
# SIG # End signature block
