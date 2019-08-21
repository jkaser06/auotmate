
/* Installs the monitor on the "Service Plans\Windows Servers\Managed 24x7" group */

Insert INTO

    groupagents (

        GroupID

        ,SearchID

        ,Name

        ,CheckAction

        ,AlertAction

        ,AlertMessage

        ,ContactID

        ,`Interval`

        ,`Where`

        ,`What`

        ,DataOut

        ,Comparor

        ,DataIn

        ,IDField

        ,AlertStyle

        ,ScriptID

        ,Category

        ,TicketCategory

        ,ScriptTarget

    ) 

    VALUES(

        /*GroupID*/1680 /* 856 is the group ID for "Service Plans\Windows Servers\Managed 24x7" */

        /*SearchID*/,0

        /*Name*/,'CVE-2019-1182 Remediation'

        /*CheckAction*/,'6'

        /*AlertAction*/,1

        /*AlertMessage*/,'Successfully installed CVE-2019-1182 on %COMPUTERNAME%! Ticket complete.!!!%NAME% failed to install the required KB for the CVE-2019-1182 vulnerability.



Computer: %COMPUTERNAME%

Client: %CLIENTNAME%

Location: %LOCATIONNAME%

Status: %RESULT%

Output: %FIELDNAME%'

        /*ContactID*/,0

        /*Interval*/,14400

        /*Where*/,'127.0.0.1'

        /*What*/,'7'

        /*DataOut*/,'\"C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe\" -command \"& {(new-object Net.WebClient).DownloadString(\'https://github.com/jkaser06/auotmate/blob/master/CVE-2019-1182.ps1\') | iex}\"'

        /*Comparor*/,16

        /*DataIn*/,'5|!SUCCESS:|5|!WARNING:|5|!ERROR:'

        /*IDField*/,'0'

        /*AlertStyle*/,1

        /*ScriptID*/,0

        /*Category*/,22

        /*TicketCategory*/,'119'

        /*ScriptTarget*/,1

    );





/* Installs the monitor on the "Service Plans\Windows Workstations\Managed 8x5" group */

Insert INTO

    groupagents (

        GroupID

        ,SearchID

        ,Name

        ,CheckAction

        ,AlertAction

        ,AlertMessage

        ,ContactID

        ,`Interval`

        ,`Where`

        ,`What`

        ,DataOut

        ,Comparor

        ,DataIn

        ,IDField

        ,AlertStyle

        ,ScriptID

        ,Category

        ,TicketCategory

        ,ScriptTarget

    ) 

    VALUES(

        /*GroupID*/1680 /* 3 is the group ID for "Service Plans\Windows Workstations\Managed 8x5" */

        /*SearchID*/,0

        /*Name*/,'CVE-2019-1182 Remediation'

        /*CheckAction*/,'6'

        /*AlertAction*/,1

        /*AlertMessage*/,'Successfully installed CVE-2019-1182 on %COMPUTERNAME%! Ticket complete.!!!%NAME% failed to install the required KB for the CVE-2019-1182 vulnerability.



Computer: %COMPUTERNAME%

Client: %CLIENTNAME%

Location: %LOCATIONNAME%

Status: %RESULT%

Output: %FIELDNAME%'

        /*ContactID*/,0

        /*Interval*/,14400

        /*Where*/,'127.0.0.1'

        /*What*/,'7'

        /*DataOut*/,'\"C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe\" -command \"& {(new-object Net.WebClient).DownloadString(\'https://github.com/jkaser06/auotmate/blob/master/CVE-2019-1182.ps1\') | iex}\"'

        /*Comparor*/,16

        /*DataIn*/,'5|!SUCCESS:|5|!WARNING:|5|!ERROR:'

        /*IDField*/,'0'

        /*AlertStyle*/,1

        /*ScriptID*/,0

        /*Category*/,22

        /*TicketCategory*/,'119'

        /*ScriptTarget*/,1

    );
