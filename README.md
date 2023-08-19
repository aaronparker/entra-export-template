# Entra Export Template

A template repo using the [EntraExporter](https://github.com/microsoft/EntraExporter) module to export Entra ID settings and generate a report.

* [.github/workflows/entra-export.yml](.github/workflows/entra-export.yml) - a GitHub workflow to connect to Entra ID, export settings and commit to the repository
* [.devops/entra-export.yml](.devops/entra-export.yml) - an Azure Pipeline to connect to Entra ID, export settings and commit to the repository
* [Export-EntraID.ps1](Export-EntraID.ps1) - a PowerShell script to run the export locally. Expects a `auth.json` file that contains the authentication values

## Workflow / Pipeline Secrets

Workflows expect the following secrets to be available in the repository:

* `TENANT_ID`
* `CLIENT_ID`
* `CLIENT_SECRET`
* `GPGKEY`
* `GPGPASSPHRASE`
* `COMMIT_NAME`
* `COMMIT_EMAIL`

## Auth.json

When running the `Export-EntraID.ps1` script, ensure `auth.json` exists locally with credentials for connecting to an Entra ID app registration in the target tenant.

```json
{
    "Tenant_Id": "9a3ceddc-3faa-42e1-841b-4fc7d3c57c19",
    "Client_Id": "19ab2050-1bf2-4e97-8b69-0e1a4543bc4e",
    "Secret": "<secret>",
}
```

## Permissions

The following permissions are required to enable an unattended export via a pipeline:

|API / Permissions name|Type|Description|
|:----|:----|:----|
|AccessReview.Read.All|Application|Read all access reviews|
|AdministrativeUnit.Read.All|Application|Read all administrative units|
|Agreement.Read.All|Application|Read all terms of use agreements|
|APIConnectors.Read.All|Application|Read API connectors for authentication flows|
|Directory.Read.All|Application|Read directory data|
|EntitlementManagement.Read.All|Application|Read all entitlement management resources|
|Group.Read.All|Application|Read all groups|
|GroupMember.Read.All|Application|Read all group memberships|
|IdentityProvider.Read.All|Application|Read identity providers|
|IdentityUserFlow.Read.All|Application|Read all identity user flows|
|Organization.Read.All|Application|Read organization information|
|Policy.Read.All|Application|Read your organization's policies|
|Policy.Read.PermissionGrant|Application|Read consent and permission grant policies|
|PrivilegedAccess.Read.AzureAD|Application|Read privileged access to Entra ID roles|
|PrivilegedAccess.Read.AzureResources|Application|Read privileged access to Azure resources|
|RoleManagement.Read.Directory|Application|Read all directory RBAC settings|
|User.Read|Delegated|Sign in and read user profile|
|User.Read.All|Application|Read all users' full profiles|
|UserAuthenticationMethod.Read.All|Application|Read all users' authentication methods|
