unit WindowsLoginRT.Constants;

interface

const
DEFAULT_DOMAIN = 'DC=cswdc,DC=local';

USER_NOTFOUND = 'User not Found!';
COMMAND_STRING = '<LDAP://%s>;(%s);sAMAccountName,displayName,mail,userAccountControl,description,distinguishedName,objectSid;subtree';
ADOBD_COMMAND = 'ADODB.Command';
AD_PROVIDER = 'Active Directory Provider';
AD_OBJ = 'ADSDSOObject';
AD_CONNECTION = 'ADODB.Connection';
SAMACCOUNT_FORMAT = '(sAMAccountName=%s)';

NOT_AVAILABLE = 'N/A';

SAMACCOUNT = 'sAMAccountName';
MAIL = 'mail';
DISPLAYNAME = 'displayName';
USER_ACCOUNT_CTRL = 'userAccountControl';
DESCRIPTION = 'description';
DISTINGUISHED_NAME = 'distinguishedName';
OBJECT_SID = 'objectSid';

ALREADY_LOGGED = 'Already logged in!';

implementation

end.
