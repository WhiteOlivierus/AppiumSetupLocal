*** Settings ***
Library             AppiumLibrary

*** Variables ***
${REMOTE_URL}           http://localhost:4723/wd/hub
${PLATFORM_NAME}        Android
${PLATFORM_VERSION}     12.0
${DEVICE_NAME}          Pixel 4a API 31
${Activity_NAME}        com.example.appiumtestapp.MainActivity
${PACKAGE_NAME}         com.example.appiumtestapp


*** Test Cases ***
Should send keys to search box and then check the value
    Open calculator
    Sleep               5
    Click Element       com.example.appiumtestapp:id/fab
    Sleep               5     
    switch to context   WEBVIEW_com.example.appiumtestapp
    Click Element       //div[@id="SBmmZd"]/a[2]

*** Keywords ***
Open calculator
    Open Application    ${REMOTE_URL}
    ...                 platformName=${PLATFORM_NAME}
    ...                 platformVersion=${PLATFORM_VERSION}
    ...                 deviceName=${DEVICE_NAME}
    ...                 automationName=UiAutomator2
    ...                 newCommandTimeout=2500
    ...                 appActivity=${Activity_NAME}
    ...                 appPackage=${PACKAGE_NAME}
