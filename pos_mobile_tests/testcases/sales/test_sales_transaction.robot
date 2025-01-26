*** Settings ***
Resource    ${CURDIR}/../../resources/import.robot
Suite Setup    Run Keywords    
...    Open Pos Mobile App    
...    AND    Input Pin
# Suite Teardown    Close Application

*** Test Cases ***
Sale Promotion 1
    Open Sale Page
    Add Products From Excel
    Sales Products    True    Cash

# Sale Promotion 2
#     Open Sale Page
#     Add Products From Excel
#     Sales Products


    