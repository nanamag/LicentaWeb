﻿<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="eNotary" generation="1" functional="0" release="0" Id="6e0e680c-5a4a-4255-8d19-1cdbd103c4f8" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="eNotaryGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="eNotaryWebRole:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/eNotary/eNotaryGroup/LB:eNotaryWebRole:Endpoint1" />
          </inToChannel>
        </inPort>
        <inPort name="eNotaryWebRole:Endpoint2" protocol="https">
          <inToChannel>
            <lBChannelMoniker name="/eNotary/eNotaryGroup/LB:eNotaryWebRole:Endpoint2" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="Certificate|eNotaryWebRole:ServerCertificate" defaultValue="">
          <maps>
            <mapMoniker name="/eNotary/eNotaryGroup/MapCertificate|eNotaryWebRole:ServerCertificate" />
          </maps>
        </aCS>
        <aCS name="eNotaryWebRole:EmailAdmin" defaultValue="">
          <maps>
            <mapMoniker name="/eNotary/eNotaryGroup/MapeNotaryWebRole:EmailAdmin" />
          </maps>
        </aCS>
        <aCS name="eNotaryWebRole:eNotarySpace" defaultValue="">
          <maps>
            <mapMoniker name="/eNotary/eNotaryGroup/MapeNotaryWebRole:eNotarySpace" />
          </maps>
        </aCS>
        <aCS name="eNotaryWebRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/eNotary/eNotaryGroup/MapeNotaryWebRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="eNotaryWebRoleInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/eNotary/eNotaryGroup/MapeNotaryWebRoleInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:eNotaryWebRole:Endpoint1">
          <toPorts>
            <inPortMoniker name="/eNotary/eNotaryGroup/eNotaryWebRole/Endpoint1" />
          </toPorts>
        </lBChannel>
        <lBChannel name="LB:eNotaryWebRole:Endpoint2">
          <toPorts>
            <inPortMoniker name="/eNotary/eNotaryGroup/eNotaryWebRole/Endpoint2" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapCertificate|eNotaryWebRole:ServerCertificate" kind="Identity">
          <certificate>
            <certificateMoniker name="/eNotary/eNotaryGroup/eNotaryWebRole/ServerCertificate" />
          </certificate>
        </map>
        <map name="MapeNotaryWebRole:EmailAdmin" kind="Identity">
          <setting>
            <aCSMoniker name="/eNotary/eNotaryGroup/eNotaryWebRole/EmailAdmin" />
          </setting>
        </map>
        <map name="MapeNotaryWebRole:eNotarySpace" kind="Identity">
          <setting>
            <aCSMoniker name="/eNotary/eNotaryGroup/eNotaryWebRole/eNotarySpace" />
          </setting>
        </map>
        <map name="MapeNotaryWebRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/eNotary/eNotaryGroup/eNotaryWebRole/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapeNotaryWebRoleInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/eNotary/eNotaryGroup/eNotaryWebRoleInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="eNotaryWebRole" generation="1" functional="0" release="0" software="C:\Users\Ana\SkyDrive\Documente\LicentaWeb\eNotary\csx\Debug\roles\eNotaryWebRole" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="1792" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
              <inPort name="Endpoint2" protocol="https" portRanges="8080">
                <certificate>
                  <certificateMoniker name="/eNotary/eNotaryGroup/eNotaryWebRole/ServerCertificate" />
                </certificate>
              </inPort>
            </componentports>
            <settings>
              <aCS name="EmailAdmin" defaultValue="" />
              <aCS name="eNotarySpace" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;eNotaryWebRole&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;eNotaryWebRole&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;e name=&quot;Endpoint2&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="eNotarySpace" defaultAmount="[30000,30000,30000]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
            <storedcertificates>
              <storedCertificate name="Stored0ServerCertificate" certificateStore="My" certificateLocation="System">
                <certificate>
                  <certificateMoniker name="/eNotary/eNotaryGroup/eNotaryWebRole/ServerCertificate" />
                </certificate>
              </storedCertificate>
            </storedcertificates>
            <certificates>
              <certificate name="ServerCertificate" />
            </certificates>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/eNotary/eNotaryGroup/eNotaryWebRoleInstances" />
            <sCSPolicyUpdateDomainMoniker name="/eNotary/eNotaryGroup/eNotaryWebRoleUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/eNotary/eNotaryGroup/eNotaryWebRoleFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="eNotaryWebRoleUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="eNotaryWebRoleFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="eNotaryWebRoleInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="822aa008-17cf-428f-8bd5-bbd4b0800643" ref="Microsoft.RedDog.Contract\ServiceContract\eNotaryContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="6bdd5634-58ff-4319-931d-5d5ae4723da8" ref="Microsoft.RedDog.Contract\Interface\eNotaryWebRole:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/eNotary/eNotaryGroup/eNotaryWebRole:Endpoint1" />
          </inPort>
        </interfaceReference>
        <interfaceReference Id="3c1a68bd-1e3d-45be-83c4-c0acad0f7e39" ref="Microsoft.RedDog.Contract\Interface\eNotaryWebRole:Endpoint2@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/eNotary/eNotaryGroup/eNotaryWebRole:Endpoint2" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>