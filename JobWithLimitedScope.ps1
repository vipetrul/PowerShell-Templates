Set-ExecutionPolicy Unrestricted -Scope Process

$functions = {
    function func1 {"Hello from Func 1"};
    function func2 {"Hello from Func 2"};
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

func1;
func2;
}  | Wait-Job | Receive-Job