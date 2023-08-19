<#
    Connect to Entra ID and export
#>
[CmdletBinding(SupportsShouldProcess = $false)]
param(
    [Parameter(Mandatory = $false)]
    [ValidateNotNullOrEmpty()]
    [ValidateScript({ if (Test-Path -Path $_ -PathType "Container") { $true } else { throw "Path not found: '$_'" } })]
    [System.String] $Path = $PSScriptRoot
)

$Auth = Get-Content -Path "$Path/auth.json" | ConvertFrom-Json
$params = @{
    Uri    = "https://login.microsoftonline.com/$($Auth.Tenant_Id)/oauth2/v2.0/token"
    Method = "POST"
    Body   = @{
        Grant_Type    = "client_credentials"
        Scope         = "https://graph.microsoft.com/.default"
        Client_Id     = $Auth.Client_Id
        Client_Secret = $Auth.Secret
    }
}
$connection = Invoke-RestMethod @params
Connect-MgGraph -AccessToken $connection.access_token
Export-Entra -Path "$Path/export" -ErrorAction "SilentlyContinue"
