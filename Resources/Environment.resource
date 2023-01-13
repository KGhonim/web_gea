*** Variables ***
# APPlication Under Test 
${ApplicationName}                          GEA-Web 
${Application_Module}                       Configuration   
${Config_BaseURL}                           http://10.0.96.9:44350
${login_serviceName}                        /ManagerLogin
${Content-Type}                              application/json
# Login Credential
${Username}                                 GEAweb_ManQA
${Password}                                 M@n0PwD

# Active Directory Connection
${LDAP}                                     LDAP://10.0.1.93
${LDAPUSer}                                 administrator
${LDAPPWD}                                  P@ssw0rd

# Reporistory Connection
${FCE}                                      http://10.0.190.192:9080/wsi/FNCEWS40MTOM
${FCE_UserName}                             administrator
${FCE_Password}                             Ebla1234




