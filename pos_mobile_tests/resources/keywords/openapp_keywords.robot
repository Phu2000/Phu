*** Settings ***
Resource    ${CURDIR}/../import.robot

*** Keywords ***
# Input Username
#     [Arguments]    ${username}
#     Input Text    ${username_field}    ${username}

# Input Password
#     [Arguments]    ${password}
#     Input Text    ${password_field}    ${password}

# Click Login
#     Click Element    ${login_button}

# Verify Login Successful
#     Wait Until Element Is Visible    ${dashboard_screen}    10s

Input Pin
    # คลิกที่ปุ่มตามตัวเลขใน PIN
    Wait Until Element Is Visible    xpath=//android.widget.Button[@content-desc="1"]
    FOR    ${digit}    IN    @{PIN['pin']}
        Click Element    xpath=//android.widget.Button[@content-desc="${digit}"]
    END

    Wait Until Element Is Visible    xpath=//android.widget.Button[@content-desc="ยืนยัน"]    
    Click Element    xpath=//android.widget.Button[@content-desc="ยืนยัน"]
    Wait Until Element Is Visible    xpath=//android.widget.Button[@content-desc="ยืนยัน"]    
    Click Element    xpath=//android.widget.Button[@content-desc="ยืนยัน"]

