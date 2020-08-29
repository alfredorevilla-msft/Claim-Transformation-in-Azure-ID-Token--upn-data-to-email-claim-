$Definition=@{
    ClaimsMappingPolicy=@{
        Version=1
        ClaimsSchema=@(
            @{Source="User"
            ID="userprincipalname"
            JwtClaimType="mail"}
        )
    }}

    # workaround to presever serialization of single element collections as such
$Serializer=[System.Web.Script.Serialization.JavaScriptSerializer]::new()

$Policy=New-AzureADPolicy -Definition $Serializer.Serialize($Definition) -DisplayName SamplePolicy1 -Type ClaimsMappingPolicy
Add-AzureADServicePrincipalPolicy -Id <SP_ObjectId> -RefObjectId $Policy.Id