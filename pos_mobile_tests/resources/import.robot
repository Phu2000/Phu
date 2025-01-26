*** Settings ***
Library     AppiumLibrary
Library    OperatingSystem
Library    openpyxl
Library    ${CURDIR}/../libraries/custom_library.py
Library    String

Resource    ${CURDIR}/common.robot
Resource    ${CURDIR}/keywords/openapp_keywords.robot
Resource    ${CURDIR}/keywords/sales_keywords.robot

Variables    ${CURDIR}/configs/app_config.yaml