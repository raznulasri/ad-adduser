$Password  = Read-Host "Masukkan password sementara" -AsSecureString
$Username  = "raznul.razak"
$FirstName = "Raznul Asri"
$LastName  = "Abdul Razak"
$Description = "A123457"
$Title       = "Senior HR Executive"
$Department  = "HR"
$Company     = "Kukuh Global Bhd"
$City        = "Petaling Jaya"
$Manager   = "ahmad"
$Domain    = "gagah.net"

$UserParams = @{
    Name                  = "$FirstName $LastName"
    GivenName             = $FirstName
    Surname               = $LastName
    DisplayName           = "$FirstName $LastName"
    Description           = $Description
    EmailAddress          = "$Username@kukuhglobal.com"
    Title                 = $Title
    Department            = $Department
    Company               = $Company
    City                  = $City
    Manager               = $Manager
    SamAccountName        = $Username
    UserPrincipalName     = "$Username@$Domain"
    Path                  = "OU=HR,DC=gagah,DC=net"
    AccountPassword       = $Password
    ChangePasswordAtLogon = $true
    Enabled               = $true
}

New-ADUser @UserParams