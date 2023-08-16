
#ssh-keygen # If you haven't already...

$sshHost = Read-Host "Enter the ssh host to authorize your public key on"

Get-Content $env:USERPROFILE\.ssh\id_rsa.pub | ssh $sshHost "cat >> .ssh/authorized_keys"