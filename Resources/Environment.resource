*** Variables ***
# APPlication Under Test 
${ApplicationName}                          GEA-Web 
${Application_Module}                       Configuration   
${Config_host}                               http://10.0.96.9:44350

################################## Configuration ##################################33#
#  Login 
${Configlogin_serviceName}                        /managerlogin
${Content-Type}                              application/json
# Credential
${Config_Username}                                 config
${Config_Password}                                 M@n0PwD

# Active Directory Connection
${AD_Connection}                          /api/config/ActiveDirectory
${AD_AddConnection}                       /api/config/SaveActiveDirectory
${AD_GetList}                             /api/config/GetAD_List
${AD_Update}                              /api/config/UpdateActiveDirectory?AD_ID=
${AD_Delete}                              /api/config/DeleteActiveDirectory?AD_ID=
${LDAPPath}                               LDAP://10.0.1.93
${LDAPUSer}                                administrator
${LDAPPWD}                                 P@ssw0rd

# Repo Connection
${Repo_Connection}                          /api/config/RepositoryConnection
${Repo_AddConnection}                       /api/config/SaveRepository
${Repo_GetList}                             /api/config/GetRepositories
${Repo_Update}                              /api/config/UpdateRepository_FN
${Repo_Delete}                              /api/config/DeleteRepository?Repo_ID={{RepoID}}


${FCE}                                      http://10.0.190.192:9080/wsi/FNCEWS40MTOM
${FCE_UserName}                             administrator
${FCE_Password}                             Ebla1234


################################## User ##################################33#
# APPlication Under Test 
${ApplicationName}                          GEA-Web 
${Application_Module}                       User   
${Normal_host}                              http://10.0.96.9:44354

#  Login 
${Normallogin_serviceName}                        /UserLogin
${Content-Type}                                  application/json
# Credential
${Normal_Username}                                299000299000
${Normal_Password}                                Test.123


################################## Admin ##################################33#
# APPlication Under Test 
${ApplicationName}                          GEA-Web 
${Application_Module}                       Admin   
${Config_host}                              http://10.0.96.9:44350

#  Login 
${Adminlogin_serviceName}                        /UserLogin
${Content-Type}                              application/json
# Credential
${Admin.Username}                                 299000299000
${Admin.Password}                                 Test.123

