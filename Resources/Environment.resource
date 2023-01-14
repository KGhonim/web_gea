*** Variables ***
# APPlication Under Test 
${ApplicationName}                          GEA-Web 
${Application_Module}                       Configuration   
${host}                                    http://10.0.96.9:44350

# Login 
${login_serviceName}                        /managerlogin
${Content-Type}                              application/json
# Credential
${Username}                                 config
${Password}                                 M@n0PwD

# Active Directory Connection
${AD_serviceName}                        /api/config/ActiveDirectory
${LDAPPath}                                  LDAP://10.0.1.93
${LDAPUSer}                                 administrator
${LDAPPWD}                                  P@ssw0rd

# Reporistory Connection
${FCE}                                      http://10.0.190.192:9080/wsi/FNCEWS40MTOM
${FCE_UserName}                             administrator
${FCE_Password}                             Ebla1234




