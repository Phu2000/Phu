*** Settings ***
library    ${CURDIR}/../../libraries/custom_library.py
Resource    ${CURDIR}/../import.robot
Variables    ${CURDIR}/../configs/app_config.yaml

*** Keywords ***
Open Sale Page
    Wait Until Element Is Visible    xpath=//android.widget.ImageView[@content-desc="ขายสินค้า\nSale"]
    Click Element    xpath=//android.widget.ImageView[@content-desc="ขายสินค้า\nSale"]

# ดึงบาร์โค้ดจาก Excel
Input Text And Press Enter
    [Arguments]    ${barcode}
    Wait Until Element Is Visible    xpath=//android.view.View[@content-desc="กรอกรหัสบาร์โค้ด"]
    Click Element    xpath=//android.view.View[@content-desc="กรอกรหัสบาร์โค้ด"]
    Wait Until Element Is Visible    xpath=//android.widget.EditText
    Input Text    xpath=//android.widget.EditText    ${barcode} 
    Click Element    xpath=//android.view.View[@content-desc="เพิ่ม"]    

Add Products From Excel
    ${barcodes}=    ReadColumnFromExcel    ${EXCEL['excel_file']}    ${EXCEL['sheet_name']}    ${EXCEL['column_name']}
    FOR    ${barcode}    IN    @{barcodes}
        Wait Until Element Is Visible    xpath=//android.view.View[@content-desc="กรอกรหัสบาร์โค้ด"]
        Click Element    xpath=//android.view.View[@content-desc="กรอกรหัสบาร์โค้ด"]
        Wait Until Element Is Visible    xpath=//android.widget.EditText    ${barcode}
        Input Text    xpath=//android.widget.EditText    ${barcode} 
        Click Element    xpath=//android.view.View[@content-desc="เพิ่ม"]  
    END

Sales Products
    [Arguments]    ${all_member}    ${payment_method}
    Wait Until Element Is Visible    xpath=//android.view.View[contains(@content-desc, "ทั้งหมด")]
    Click Element    xpath=//android.view.View[contains(@content-desc, "ทั้งหมด")]
    Wait Until Element Is Visible    xpath=//android.widget.Button[@content-desc="ยืนยันรายการ"]
    Click Element    xpath=//android.widget.Button[@content-desc="ยืนยันรายการ"]

    # ตรวจสอบ All Member
    IF    '${all_member}' == 'True'
        Wait Until Element Is Visible    xpath=//android.widget.ImageView[@content-desc="เบอร์โทร"]
        Click Element    xpath=//android.widget.ImageView[@content-desc="เบอร์โทร"]
        Wait Until Element Is Visible    xpath=//android.view.View[@content-desc="กรอกเบอร์โทรศัพท์"]
        # input_text    xpath=//android.view.View[@content-desc="กรอกเบอร์โทรศัพท์"]    0838239911
        FOR    ${digit}    IN    @{PHONENUMBER['number']}
            Click Element    xpath=//android.widget.Button[@content-desc="${digit}"]
        END

        Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.ImageView[2][@enabled='true']
        Click Element    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.ImageView[2][@enabled='true']
        Wait Until Element Is Visible    xpath=//android.widget.Button[@content-desc="ยืนยัน"]
        Click Element    xpath=//android.widget.Button[@content-desc="ยืนยัน"]
    ELSE
        Wait Until Element Is Visible    xpath=//android.widget.Button[@content-desc="ไม่เป็นสมาชิก"]
        Click Element    xpath=//android.widget.Button[@content-desc="ไม่เป็นสมาชิก"]
    END

    # ตรวจสอบวิธีการชำระเงิน
    IF    '${payment_method}' == 'Truemoney'
        Wait Until Element Is Visible    xpath=//android.widget.Button[@content-desc=" ชำระโดย ทรูมันนี่"]
        Click Element    xpath=//android.widget.Button[@content-desc=" ชำระโดย ทรูมันนี่"]
        Wait Until Element Is Visible    xpath=//android.view.View[@content-desc="คลิก ที่นี่ เพื่อ\nสแกนบาร์โค้ด ชำระเงิน"]    30s
        Click Element    xpath=//android.view.View[@content-desc="คลิก ที่นี่ เพื่อ\nสแกนบาร์โค้ด ชำระเงิน"]
        Wait Until Element Is Visible    xpath=//android.view.View[@content-desc="กรอกบาร์โค้ดชำระเงิน"]
        Click Element    xpath=//android.view.View[@content-desc="กรอกบาร์โค้ดชำระเงิน"]
        Wait Until Element Is Visible    xpath=//android.widget.EditText
        Input Text    xpath=//android.widget.EditText   12345678900000
        Wait Until Element Is Visible    xpath=//android.widget.Button[@content-desc="เพิ่ม"]
        Click Element    xpath=//android.widget.Button[@content-desc="เพิ่ม"]
    ELSE
        Wait Until Element Is Visible    xpath=//android.widget.Button[@content-desc=" ชำระโดย เงินสด"]
        Click Element    xpath=//android.widget.Button[@content-desc=" ชำระโดย เงินสด"]

        # ดึงยอดชำระสินค้า
        Wait Until Element Is Visible    xpath=(//android.view.View)[6]    30s
        ${value}=    Get Element Attribute    android=new UiSelector().className("android.view.View").index(6)    content-desc
        Wait Until Element Is Visible    xpath=//android.widget.EditText[@class='android.widget.EditText' and @text='จำนวนเงินที่รับ\n0.00\nบาท\nเงินทอน\n0.00\nบาท']
        tap_with_position    760    890   # กลับมาแก้ด้วย 
        Input Text Into Current Element    ${value}
        # tap_with_position    940    1760    # ซ่อนแป้นพิมพ์
        # Hide Keyboard

        # Wait Until Element Is Visible    xpath=//android.widget.Button[@content-desc="ดำเนินการต่อ" and @clickable="true"]
        # Click Element    xpath=//android.widget.Button[@content-desc="ดำเนินการต่อ"]
    END

    # Wait Until Element Is Visible    xpath=//android.widget.Button[@content-desc="รับทราบ"]    30s
    # Click Element    xpath=//android.widget.Button[@content-desc="รับทราบ"]   
    # Wait Until Element Is Visible    xpath=//android.widget.Button[@content-desc="ข้าม"]
    # Click Element    xpath=//android.widget.Button[@content-desc="ข้าม"]

    