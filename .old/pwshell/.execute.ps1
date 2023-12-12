$NTESTS = 5
$MAXTIME = 1

$score = 0
$total_time = 0



function time($block) {

    $sw = [Diagnostics.Stopwatch]::StartNew()
    &$block
    $sw.Stop()

    return ($sw.ElapsedTicks / 10000000)
}


# Clear Result File
Clear-Content .\data\result

# Compile Program
g++ -O2 -o user .\user.cpp

# Assess Every Test Case
for ($i = 0; $i -lt $NTESTS; ++$i) {

    # Define Input & Answer Files
    $INFILE = ".\data\in\in" + $i
    $ANSFILE = ".\data\ans\ans" + $i
    
    # Run Program & Check Time
    $time = time { Get-Content $INFILE | .\user.exe | Out-File .\data\out }
    if ($time -gt $MAXTIME) {
        "`nTime Limit Exceeded" | Out-File .\data\result -Append
        "`n$i / $NTESTS" | Out-File .\data\result -Append
        Break
    }

    # Compare Content
    $ans = Get-Content $ANSFILE -Raw
    $ans = $ans -replace '\s', ''

    $out = Get-Content .\data\out -Raw
    $out = $out -replace '\s', ''

    if (($ans.Length -eq $out.Length) -and ($ans -ceq $out)) {
        "[$i] Accepted   [$time]" | Out-File .\data\result -Append
        $total_time += $time
        $score += 1 
    } 
    else { "[$i] Wrong Answer" | Out-File .\data\result -Append }
}

if ($score -gt 0) {
    $score += (1 - ($total_time / $score) / $MAXTIME)
}
"`nSCORE: $score" | Out-File .\data\result -Append