<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="YardSalez.Azure" generation="1" functional="0" release="0" Id="55157186-6935-4eb8-b7a3-2e21d28b3f4a" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="YardSalez.AzureGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="YardSalez:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/YardSalez.Azure/YardSalez.AzureGroup/LB:YardSalez:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="YardSalez:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/YardSalez.Azure/YardSalez.AzureGroup/MapYardSalez:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="YardSalezInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/YardSalez.Azure/YardSalez.AzureGroup/MapYardSalezInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:YardSalez:Endpoint1">
          <toPorts>
            <inPortMoniker name="/YardSalez.Azure/YardSalez.AzureGroup/YardSalez/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapYardSalez:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/YardSalez.Azure/YardSalez.AzureGroup/YardSalez/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapYardSalezInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/YardSalez.Azure/YardSalez.AzureGroup/YardSalezInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="YardSalez" generation="1" functional="0" release="0" software="C:\Projects\YardSalez-server\YardSalez-server\YardSalez.Azure\csx\Debug\roles\YardSalez" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="-1" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;YardSalez&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;YardSalez&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/YardSalez.Azure/YardSalez.AzureGroup/YardSalezInstances" />
            <sCSPolicyUpdateDomainMoniker name="/YardSalez.Azure/YardSalez.AzureGroup/YardSalezUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/YardSalez.Azure/YardSalez.AzureGroup/YardSalezFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="YardSalezUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="YardSalezFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="YardSalezInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="709fd0d6-58a7-4466-88e6-7cba10bcf541" ref="Microsoft.RedDog.Contract\ServiceContract\YardSalez.AzureContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="65e87d0a-6bb5-47d7-902d-7ce402ff7c05" ref="Microsoft.RedDog.Contract\Interface\YardSalez:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/YardSalez.Azure/YardSalez.AzureGroup/YardSalez:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>