$ErrorActionPreference = 'Stop'
$root = 'C:\Users\Utilisateur\Operator-library\books\book-04-the-age-of-operational-ai'
New-Item -ItemType Directory -Force -Path "$root\manuscript\chapters" | Out-Null

$files = @(
    @{ Url = 'https://files.manuscdn.com/user_upload_by_module/session_file/310519663085699459/QhWEHDhYVlnWeDNG.md'; Destination = "$root\manuscript\chapters\chapter-09-body-v4.md" },
    @{ Url = 'https://files.manuscdn.com/user_upload_by_module/session_file/310519663085699459/UKAanXBLpeLDRHny.tex'; Destination = "$root\config\chapter-09-proof.tex" },
    @{ Url = 'https://files.manuscdn.com/user_upload_by_module/session_file/310519663085699459/hQcfJzTDQeChoyES.tex'; Destination = "$root\config\book4-complete-through-chapter-09.tex" },
    @{ Url = 'https://files.manuscdn.com/user_upload_by_module/session_file/310519663085699459/awUaflqOcbNWItGn.md'; Destination = "$root\config\standard-sources-bibliographie-transitions-v4.md" }
)

foreach ($file in $files) {
    Invoke-WebRequest -UseBasicParsing -Uri $file.Url -OutFile $file.Destination
}

Get-Item "$root\config\chapter-09-proof.tex", "$root\config\book4-complete-through-chapter-09.tex", "$root\manuscript\chapters\chapter-09-body-v4.md" | Select-Object Name, Length
