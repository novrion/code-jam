$dir = Read-Host "Directory Name"
New-Item -ItemType Directory -Path .\$dir

Clear-Host


$question = Read-Host "Question Name"
New-Item -ItemType Directory -Path .\$dir\q
New-Item -Path .\$dir\q\$question.txt
New-Item -Path .\$dir\q\answer.cpp

Clear-Host


New-Item -ItemType Directory -Path .\$dir\data
New-Item -ItemType Directory -Path .\$dir\data\ans
New-Item -ItemType Directory -Path .\$dir\data\in


New-Item -Path .\$dir\data\out
New-Item -Path .\$dir\data\result

$Nquestions = Read-Host "Number Of Test Cases"
for ($i = 0; $i -lt $Nquestions; ++$i) {
  $in_name = "in" + $i
  $ans_name = "ans" + $i

  New-Item -Path .\$dir\data\in\$in_name
  New-Item -Path .\$dir\data\ans\$ans_name
}

Clear-Host


New-Item -Path .\$dir\.execute.ps1
$content = Get-Content .\.util\.execute.ps1
$content | Out-File .\$dir\.execute.ps1