*** Variables ***
# APPlication Under Test 
${ApplicationName}                          GEA-Web 
${Application_Module}                       Configuration   
${Config_host}                              http://10.0.96.9:44350


################################## Configuration ##################################33#
#  Login 
${Configlogin_serviceName}                        /AdminLogin
${Content-Type}                                   application/json
# Credential
${Config_Username}                                 GEAweb_Manager
${Config_Password}                                 M@n0PwD

# Active Directory Connection
${AD_Connection}                          /api/config/AD/check
${AD_AddConnection}                       /api/config/AD
${AD_GetList}                             /api/config/AD
${AD_Update}                              /api/config/AD?AD_ID=
${AD_Delete}                              /api/config/AD?AD_ID=


${LDAPPath}                               LDAP://10.0.190.191
${LDAPPath1}                              LDAP://10.0.88.1

${LDAPUSer}                                administrator
${LDAPPWD}                                 Ebla1234

# Repo Connection
${Repo_Connection}                          /api/config/RepositoryConnection
${Repo_AddConnection}                       /api/config/SaveRepository
${Repo_GetList}                             /api/config/GetRepositories
${Repo_Update}                              /api/config/UpdateRepository_FN
${Repo_Delete}                              /api/config/DeleteRepository?Repo_ID={{RepoID}}


${FCE}                                      http://10.0.190.192:9080/wsi/FNCEWS40MTOM
${FCE_UserName}                             p8admin
${FCE_Password}                             Ebla1234


# Super users
${Search_user}                             /api/Admin/SearchForUsers
${ADD_user}                                /api/user/super
${ADD_user}                                /api/user/super?userID=


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

### Quick Scan 

${Saveattachment}                              /SaveDirectScanAttachment
${CommitQuickScan}                              /CommitQuickScanDocument 

### Quick Upload 
${UploadFastDocument}                           /UploadFastDocument
${CommitFastDocument}                            /CommitFastDocument?input=f1bc234f-dcc6-4252-b84a-1eec0e617901


################################## Admin ##################################33#
# APPlication Under Test 
${ApplicationName}                         GEA-Web 
${Application_Module}                      Admin   
${Admin_host}                              http://10.0.96.9:44350

#  Login 
${Adminlogin_serviceName}                  /managerlogin
${Content-Type}                            application/json
# Credential
${Admin_Username}                                 config
${Admin_Password}                                 M@n0PwD

# Users
${get_Users}                              /api/Admin/GetAllUsersList
${ADD_User}                               /api/Admin/SaveUser
${Search_Users}                           /api/Admin/SearchForUsers
${Update_User}                            /api/Admin/UpdateUser
${Inactive}                               /api/Admin/GetAllInactiveUsers
${UserPermissions}                        /api/GetUserPermissions
${UserPermissions}                        /api/User/LoadUserData
