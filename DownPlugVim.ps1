#this script download the newest plug.vim file in autoload directory for you.
#note: if you can't run script in powershell ,please use "Get-ExecutionPolicy" in PowerShell 
#to check the state witch would result in "Restrict": you can't run any script,
#"AllSigned": you can only run script which is signed,
#"RemoteSigned": you can run remote script which is signed and local script,
#"Unrestricted": you can run any script
# use "Set-ExecutionPolicy RemoteSigned" in PowerShell with Administration to change it.   
Invoke-WebRequest  "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" -OutFile ".\autoload\plug.vim"