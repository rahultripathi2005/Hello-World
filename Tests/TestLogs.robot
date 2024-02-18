
*** Settings ***

library    SeleniumLibrary    

Default Tags     Sanity

*** Test Cases ***


MyFirstTest
    Log  Hello World 
    
MySecondTest
    [Tags]    Smoke
    Set Tags    rahul   
    Log  Hello World 
    
MyThirdTest
    Log  Hello World 
    Set Tags    Regression
    Remove Tags    Regression