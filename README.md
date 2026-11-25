$Password = ConvertTo-SecureString "password123" -AsPlainText -Force

$UserParams = @{
    Name                  = "Kyo Kusanagi"
    GivenName             = "Kyo"
    Surname               = "Kusanagi"
    DisplayName           = "Kyo Kusanagi"
    Description           = "A123456"
    EmailAddress          = "kyo.kusanagi@gagah.net"
    Title                 = "HR Executive"
    Department            = "Human Resources"
    Company               = "Gagah Sdn Bhd"
    City                  = "Petaling Jaya"
    Manager               = "ahmad"
    SamAccountName        = "kyo.kusanagi"
    UserPrincipalName     = "kyo.kusanagi@gagah.net"
    Path                  = "OU=HR,DC=gagah,DC=net"
    AccountPassword       = $Password
    ChangePasswordAtLogon = $true
    Enabled               = $true
}

New-ADUser @UserParams