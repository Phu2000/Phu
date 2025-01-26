*** Settings ***
# Resource    ../../resources/keywords/login_keywords.robot
# Resource    ../../resources/locators/login_locators.robot
Library     AppiumLibrary
Resource    ../../resources/common.robot
Resource    ../../resources/keywords/openapp_keywords.robot

*** Test Cases ***
Open POS Mobile App
    [Tags]    Open POS Mobile App
    Open Pos Mobile App
    Close App
    # Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=11    deviceName=R58T21APQLW    appPackage=th.co.gosoft.posonline    appActivity=th.co.gosoft.posonline.MainActivity    noReset=true    fullContext=true
    # Open App
    # Input Username    ${username}
    # Input Password    ${password}
    # Click Login
    # Verify Login Successful
