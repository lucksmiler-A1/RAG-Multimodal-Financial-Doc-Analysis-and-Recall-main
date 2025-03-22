$dates = @()
$date = [datetime]"2025-03-22"

while ($date -le [datetime]"2025-12-29") {

    $dates += $date.ToString("yyyy-MM-dd")

    # Random gap: 0 to 10 days
    $step = Get-Random -Minimum 1 -Maximum 10

    $date = $date.AddDays($step)

    # Avoid infinite loop when step = 0 too often
    if ($step -eq 0) {
        $date = $date.AddDays(1)
    }
}

$dates | Set-Content date.txt