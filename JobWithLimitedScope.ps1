Set-ExecutionPolicy Unrestricted -Scope Process

$functions = {
    function b {"Hello B"};
    function C {"Hello C"};
}

$jobDefinition = {
    param ($functions, $other)

    Write-Output $another;
}
$PID;
Start-Job -ScriptBlock { 
$PID;
$ExecutionContext.SessionState.Applications.Clear();
$ExecutionContext.SessionState.Scripts.Clear();
$ExecutionContext.SessionState.LanguageMode = "NoLanguage";
Get-Variable | foreach { $_.Visibility = "private" };
Get-Command | foreach { $_.Visibility = "private" };
. ([scriptblock]::Create($using:functions));

b;
c;
}  | Wait-Job | Receive-Job