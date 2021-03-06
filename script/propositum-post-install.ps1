Try
{
    $otherVars = Import-CSV "vars-other.csv"
}
Catch
{
    Throw "Check the CSV file actually exists and is formatted correctly before proceeding."
    $error[0]|format-list -force
}
$otherVars | Select "exec", "var", "value" | ForEach-Object { if ($_.exec -eq "execute") {New-Variable $_.var (iex $_.value) -Force} else {New-Variable $_.var $_.value -Force}}
[environment]::setEnvironmentVariable('SCOOP',($propositum.root),'User')
