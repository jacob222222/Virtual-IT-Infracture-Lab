Import-Module ActiveDirectory

$users = Import-Csv ".\user_list.csv"

foreach ($user in $users) {
    New-ADUser -Name $user.Name `
               -GivenName $user.FirstName `
               -Surname $user.LastName `
               -SamAccountName $user.Username `
               -UserPrincipalName "$($user.Username)@domain.local" `
               -AccountPassword (ConvertTo-SecureString "P@ssw0rd123" -AsPlainText -Force) `
               -Enabled $true `
               -Path "OU=Interns,DC=domain,DC=local"
}
