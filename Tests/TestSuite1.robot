*** settings ***

Library     SeleniumLibrary
Library     OperatingSystem
Suite Setup        Log     I am inside the setup
Suite Teardown     Log     I am inside the teardown setup 
Test Setup         Log    I am in test set up  
Test Teardown      Log     I am inside test tear down 

*** variables ***
${EXECDIR}      D:\Softwares\python 3.12\Scripts
${url}   https://opensource-demo.orangehrmlive.com/  # Scalar variable
${browser}      chrome
${CREDENTIALS}   admin   admin123     #List variable
&{LOGINDATA}  username=admin    password=admin123   #dictionary variable

*** keywords ***
Setup chromedriver
  Set Environment Variable  webdriver.chrome.driver  ${EXECDIR}/chromedriver.exe 
   

*** Test Cases ***

MyFirstTest
    Log  Hello World 


    
    Open Browser    https://google.co.in/      ${browser}
    Set Browser Implicit Wait    5
    Maximize Browser Window
    Input Text    name=q    automation
    Press Keys    name=q    Enter
    Sleep  2
    Log     Test completed
    
SampleLoginTest
    [Documentation]  This is a login test 
     InsideOpenOrange
    
     log              Test SampleLoginTest Completed  
     log              This test executed by %{USERNAME} on %{os}         # Environmental variable 
    
*** Keywords ***

InsideOpenOrange
   # user created keyword
     Open Browser    ${url}     Chrome
     Maximize Browser Window
     sleep     2
     Input text        xpath://input[@name='username']    &{LOGINDATA}[username]
     Input Password    xpath=//input[@name='password']    &{LOGINDATA}[password]
     Click Button      xpath: //button[@type='submit']  
     sleep    3
     log               test successfully passed
     sleep    3
     Click Element     xpath://li[@class='--active oxd-userdropdown']
     click link       Logout
     #Close Browser