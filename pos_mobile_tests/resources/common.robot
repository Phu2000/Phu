*** Settings ***
Resource    import.robot

*** Keywords ***
Open Pos Mobile App
    Open Application    http://localhost:4723/wd/hub    
    ...    platformName=${CAPABILITIES['platformName']}    
    ...    platformVersion=${CAPABILITIES['platformVersion']}    
    ...    deviceName=${CAPABILITIES['deviceName']}    
    ...    appPackage=${CAPABILITIES['appPackage']}    
    ...    appActivity=${CAPABILITIES['appActivity']}    
    ...    noReset=${CAPABILITIES['noReset']}    
    ...    fullContext=${CAPABILITIES['fullContext']}

Close App
    Close Application
