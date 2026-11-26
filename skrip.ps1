$FirstName = "Raznul Asri"
$LastName  = "Abdul Razak"
$Username  = "raznul.razak"
$StaffID = "A123457"
$Title       = "Senior HR Executive"
$Department  = "HR"
$Company     = "Kukuh Global Sdn Bhd"
$City        = "Petaling Jaya"
$Manager   = "ahmad.muzaffar"
$Domain    = "gagah.net"
$Password  = Read-Host "Masukkan password sementara" -AsSecureString

$UserParams = @{
    Name                  = "$FirstName $LastName"
    GivenName             = $FirstName
    Surname               = $LastName
    DisplayName           = "$FirstName $LastName"
    Description           = $StaffID
    EmailAddress          = "$Username@kukuhglobal.com"
    Title                 = $Title
    Department            = $Department
    Company               = $Company
    City                  = $City
    Manager               = $Manager
    SamAccountName        = $Username
    UserPrincipalName     = "$Username@$Domain"
    Path                  = "OU=HR,OU=EndUser,DC=gagah,DC=net"
    AccountPassword       = $Password
    ChangePasswordAtLogon = $true
    Enabled               = $true
}

New-ADUser @UserParams


Write-Host "`nAkaun AD '$FirstName $LastName' berjaya dicipta!" -ForegroundColor Cyan

# Tukar SecureString kepada teks biasa untuk paparan output sahaja
$BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($Password)
$PlainPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)
[System.Runtime.InteropServices.Marshal]::ZeroFreeBSTR($BSTR)

Get-ADUser $Username -Properties DisplayName, Description, EmailAddress, Title, Department, Company, City, Manager |
    Select-Object @{Name="Login Name"; Expression={$_.SamAccountName}},
                  @{Name="TempPassword"; Expression={$PlainPassword}},
                  DisplayName,
                  @{Name="Staff ID"; Expression={$_.Description}},
                  EmailAddress,
                  Title,
                  Department,
                  Company,
                  City,
                  @{Name="Manager"; Expression={
                      if ($_.Manager) {
                          (Get-ADUser $_.Manager -Properties DisplayName).DisplayName
                      } else {
                          "Tiada"
                      }
                  }},
                  Enabled |
    Format-List