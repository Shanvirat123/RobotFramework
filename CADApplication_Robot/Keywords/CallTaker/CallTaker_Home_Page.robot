*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library  ../../VaultConfig/VaultUtils.py
Variables           ../../Resources/WebElements.py
Variables        ../../Resources/Testdata.py

*** Variables ***
${browser}  chrome
${Timeout}       15s
${Calltaker_Screenshot_Path}   C://CADApplication_Robot/CADApplication/Screenshots
${cfs_id}
${currentDir}       Screenshots
${file_name}    Filename.csv
${data}     Evaluate    os.path.join(os.getcwd(), 'Screenshots')
*** Keywords ***
Login To Call taker Operartor

     #${data}    Evaluate    os.path.join(os.getcwd(), 'File_Upload')
     # ${file_path} Join Path ${EXECDIR} ${file_name}
     # Choose File     ${UploadFile}    ${data}

    ${ngcad_url}    ${ngcad_username}    ${ngcad_password}=    get_ngcad_calltaker_details
    Open Browser    ${ngcad_url}    chrome      options=add_argument("--ignore-certificate-errors")
    Maximize Browser Window
    Wait Until Page Contains Element    ${CAD_Dispatcher_Selection}         ${CAD_Dispatcher_Selection_Timeout}
    Select From List By Label   ${CAD_Dispatcher_Selection}      ${CallTakerRoletype}
    sleep   3
    Select From List By Value   ${CAD_Dispatcher_Workstation}      ${Cad_Workstation}
    Wait Until Page Contains Element    ${DisPUserNameField}         ${Timeout}
    Click Element   ${DisPUserNameField}
    Input Text      ${UserNameField}        ${Cad_username}
    Wait Until Page Contains Element    ${UserPasswordField}         ${Timeout}
    Input Text      ${UserPasswordField}         ${Cad_Password}
    capture page screenshot     ${Calltaker_Screenshot_Path}/CAD.png
    # Take a screenshot and save it in the specified destination path
    Capture Page Screenshot    ${currentDir}/ui.png
    Wait Until Page Contains Element    ${CAD_Login}         ${Timeout}
    Click Button    ${CAD_Login}
    Wait Until Element Is Visible       ${CTCreateManualEvent}    ${Timeout}
    Title Should Be     ngcadapp
    capture page screenshot     ${currentDir}/Login_to_Dispatcher.png

CT Create Manual Event With Number
   #[Arguments]     ${CTManualEvent_Creation_Number}
   Mouse Over    ${CT_CreateManualEvent}
   Wait Until Element Is Visible    ${CT_CreateManualEvent}         ${Timeout}
   Click Element     ${CT_CreateManualEvent}
   ${CTManualEvent_PrimaryNarrative_Field}=     Execute Javascript    ${CTManualEvent_PrimaryNarrative}
   Wait Until Element Is Visible    ${CTManualEvent_PrimaryNarrative_Field}
   Input Text    ${CTManualEvent_PrimaryNarrative_Field}    ${CTPrimaryNarrative}
   ${CTManualEvent_Creation_EventType}=  Execute Javascript    ${CTManualEvent_Creation_EventType_JS}
   Click Element    ${CTManualEvent_Creation_EventType}
   ${CTManualEvent_Creation_EventType_SearchField}=  Execute Javascript    ${CTManualEvent_Creation_EventType_SearchField_JS}
   Wait Until Element Is Visible    ${CTManualEvent_Creation_EventType_SearchField}     ${Timeout}
#   Input Text   ${CTManualEvent_Creation_EventType_SearchField}     ${CTSelectManualEventType}
   ${CTManualEvent_Creation_EventType_WithNo_Select}=   Execute Javascript    ${CTManualEvent_Creation_EventType_WithNo_Select_JS}
   Click Element    ${CTManualEvent_Creation_EventType_WithNo_Select}
   Sleep    5s
   ${CTManualEvent_Creation_Number_SearchField}=    Execute Javascript    ${CTManualEvent_Creation_Number_SearchField_JS}
   Wait Until Element Is Visible   ${CTManualEvent_Creation_Number_SearchField}
   Input Text    ${CTManualEvent_Creation_Number_SearchField}       ${CTManualEvent_Creation_Number}
   ${CTManualEvent_Create}=  Execute Javascript    ${CTManualEvent_Create_JS}
   Click Element    ${CTManualEvent_Create}
   Wait Until Element Is Visible    ${CT_GetIncidentid}     ${Timeout}
   ${getcfs}    Get Text    ${CT_GetIncidentid}
   ${cfs_id}    Set Variable    ${getcfs.replace("# ", "")}
   Set Suite Variable      ${cfs_id}
   capture page screenshot     ${currentDir}/Manual Event With Number.png

CT Verify CallTaker Home Page And Title
    Wait Until Element Is Visible       ${CT_Validate_HomePage}     ${Timeout}
    Title Should Be     ngcadapp
    capture page screenshot     ${currentDir}/Verify CallTaker Home Page And Title.png

CT Create Manual Event Without Number
   Mouse Over   ${CT_CreateManualEvent}
   Wait Until Element Is Visible    ${CT_CreateManualEvent}
   Click Element     ${CT_CreateManualEvent}
   ${CTManualEvent_PrimaryNarrative_Field}=     Execute Javascript    ${CTManualEvent_PrimaryNarrative}
   Wait Until Element Is Visible    ${CTManualEvent_PrimaryNarrative_Field}
   Input Text    ${CTManualEvent_PrimaryNarrative_Field}    ${CTPrimaryNarrative}
   ${CTManualEvent_Creation_EventType}=  Execute Javascript    ${CTManualEvent_Creation_EventType_JS}
   Click Element    ${CTManualEvent_Creation_EventType}
   ${CTManualEvent_Creation_EventType_SearchField}=  Execute Javascript    ${CTManualEvent_Creation_EventType_SearchField_JS}
   Wait Until Element Is Visible    ${CTManualEvent_Creation_EventType_SearchField}
   Input Text   ${CTManualEvent_Creation_EventType_SearchField}     ${CTSelectManualEventType}
   ${CTManualEvent_Creation_EventType_WithoutNo_Select}=   Execute Javascript    ${CTManualEvent_Creation_EventType_WithoutNo_Select_JS}
   Click Element    ${CTManualEvent_Creation_EventType_WithoutNo_Select}
   ${CTManualEvent_Create}=  Execute Javascript    ${CTManualEvent_Create_JS}
   Click Element    ${CTManualEvent_Create}
   capture page screenshot     ${currentDir}/Manual Event Without Number.png


Operator Lagout
    ${Operator_Lagout}=     Execute Javascript    ${Operator_Lagout_JS}
    Wait Until Element Is Visible    ${Operator_Lagout}      ${Timeout}
    Click Element    ${Operator_Lagout}
    ${Operator_Lagout_Yes}=  Execute Javascript    ${Operator_Lagout_Yes_JS}
    Click Element    ${Operator_Lagout_Yes}


TearDown Lagout
    Reload Page
    Handle Alert    action=ACCEPT      timeout=5s
    Sleep    5s
    ${Operator_Lagout}=     Execute Javascript    ${Operator_Lagout_JS}
    ${Status}=  Run Keyword And Return Status       Element Should Be Visible    ${Operator_Lagout}
    Run Keyword If    ${Status}    Operator Lagout

CT Add Person Supplemental info
    Wait Until Element Is Visible   ${CT_SUP}   ${Timeout}
    Click Element    ${CT_SUP}
    Click Element    ${CT_Supliment_Person_Suspect}
    ${CT_Supliment_Person_Suspect_Select}=   Execute Javascript      ${CT_Supliment_Person_Suspect_Select_JS}
    Click Element    ${CT_Supliment_Person_Suspect_Select}
    ${CT_Supliment_Person_Race}=     Execute Javascript    ${CT_Supliment_Person_Race_JS}
    Input Text    ${CT_Supliment_Person_Race}       ${CT_Supliment_Person_Race_Data}
    Click Element    ${CT_Supliment_Person_Gender_Field}
    ${CT_Supliment_Person_Gender}=   Execute Javascript    ${CT_Supliment_Person_Gender_Select}
    Click Element   ${CT_Supliment_Person_Gender}
    ${CT_Supliment_Person_Age_Field}=   Execute Javascript  ${CT_Supliment_Person_Age_JS}
    Input Text    ${CT_Supliment_Person_Age_Field}      ${CT_Supliment_Person_Age}
    ${CT_Supliment_Person_Clothing_Field}=   Execute Javascript  ${CT_Supliment_Person_Clothing_JS}
    Input Text    ${CT_Supliment_Person_Clothing_Field}     ${CT_Supliment_Person_Clothing}
    ${CT_Supliment_Person_Demeanor_Field}=   Execute Javascript  ${CT_Supliment_Person_Demeanor_JS}
    Input Text    ${CT_Supliment_Person_Demeanor_Field}     ${CT_Supliment_Person_Demeanor}
    ${CT_Supliment_Person_Name_Field}=   Execute Javascript  ${CT_Supliment_Person_Name_JS}
    Input Text    ${CT_Supliment_Person_Name_Field}     ${CT_Supliment_Person_Name}
    ${CT_Supliment_Person_Complexion_Field}=   Execute Javascript  ${CT_Supliment_Person_Complexion_JS}
    Input Text    ${CT_Supliment_Person_Complexion_Field}   ${CT_Supliment_Person_Complexion_JS}
    ${CT_Supliment_Person_Height_Field}=   Execute Javascript  ${CT_Supliment_Person_Height_JS}
    Input Text    ${CT_Supliment_Person_Height_Field}   ${CT_Supliment_Person_Height}
    ${CT_Supliment_Person_Weight_Field}=   Execute Javascript  ${CT_Supliment_Person_Weight_JS}
    Input Text    ${CT_Supliment_Person_Weight_Field}   ${CT_Supliment_Person_Weight}
    ${CT_Supliment_Person_Hair_Field}=   Execute Javascript  ${CT_Supliment_Person_Hair_JS}
    Input Text    ${CT_Supliment_Person_Hair_Field}     ${CT_Supliment_Person_Hair}
    ${CT_Supliment_Person_Eye_Field}=   Execute Javascript  ${CT_Supliment_Person_Eye_JS}
    Input Text    ${CT_Supliment_Person_Eye_Field}     ${CT_Supliment_Person_Eye}
    Click Element    ${CT_Supliment_Person_Relationship}
    ${CT_Supliment_Person_Relationship_Select}=  Execute Javascript    ${CT_Supliment_Person_Relationship_Select_JS}
    Click Element    ${CT_Supliment_Person_Relationship_Select}
    ${CT_Supliment_Person_Contact_Field}=   Execute Javascript  ${CT_Supliment_Person_Contact_JS}
    Input Text    ${CT_Supliment_Person_Contact_Field}     ${CT_Supliment_Person_Contact}
    ${CT_Supliment_Person_Other_Field}=   Execute Javascript  ${CT_Supliment_Person_Other_JS}
    Input Text    ${CT_Supliment_Person_Other_Field}     ${CT_Supliment_Person_Other}
    ${CT_Supliment_Person_Address_Field}=   Execute Javascript  ${CT_Supliment_Person_Address_JS}
    Input Text    ${CT_Supliment_Person_Address_Field}     ${CT_Supliment_Person_Address}
    Click Element    ${CT_Supliment_Person_Add}
    capture page screenshot     ${currentDir}/CT Add Person Supplemental info.png

CT Add Vehicle Supplemental info
    Wait Until Element Is Visible   ${CT_SUP}   ${Timeout}
    Click Element    ${CT_SUP}
    Click Element    ${CT_Supliment_Vehicle}
    Click Element    ${CT_Supliment_Vehicle_Type}
    ${CT_Supliment_Vehicle_Type_Field}=   Execute Javascript  ${CT_Supliment_Vehicle_Type_JS}
    Click Element    ${CT_Supliment_Vehicle_Type_Field}
    ${CT_Supliment_Vehicle_RegiPlate_Field}=   Execute Javascript  ${CT_Supliment_Vehicle_RegiPlate_JS}
    Input Text    ${CT_Supliment_Vehicle_RegiPlate_Field}   ${CT_Supliment_Vehicle_RegiPlate}
    ${CT_Supliment_Vehicle_RegiPlateState_Field}=   Execute Javascript  ${CT_Supliment_Vehicle_RegiPlateState_JS}
    Input Text    ${CT_Supliment_Vehicle_RegiPlateState_Field}  ${CT_Supliment_Vehicle_RegiPlateState}
    ${CT_Supliment_Vehicle_RegiPlateType_Field}=   Execute Javascript  ${CT_Supliment_Vehicle_RegiPlateType_JS}
    Input Text    ${CT_Supliment_Vehicle_RegiPlateType_Field}   ${CT_Supliment_Vehicle_RegiPlateType}
    ${CT_Supliment_Vehicle_Color_Field}=   Execute Javascript  ${CT_Supliment_Vehicle_Color_JS}
    Input Text    ${CT_Supliment_Vehicle_Color_Field}   ${CT_Supliment_Vehicle_Color}
    ${CT_Supliment_Vehicle_Model_Field}=   Execute Javascript  ${CT_Supliment_Vehicle_Model_JS}
    Input Text    ${CT_Supliment_Vehicle_Model_Field}   ${CT_Supliment_Vehicle_Model}
    ${CT_Supliment_Vehicle_Make_Field}=   Execute Javascript  ${CT_Supliment_Vehicle_Make_JS}
    Input Text    ${CT_Supliment_Vehicle_Make_Field}   ${CT_Supliment_Vehicle_Make}
    ${CT_Supliment_Vehicle_Number_Field}=   Execute Javascript  ${CT_Supliment_Vehicle_Number_JS}
    Input Text    ${CT_Supliment_Vehicle_Number_Field}   ${CT_Supliment_Vehicle_Number}
    ${CT_Supliment_Vehicle_Remarks_Field}=   Execute Javascript  ${CT_Supliment_Vehicle_Remarks_JS}
    Input Text    ${CT_Supliment_Vehicle_Remarks_Field}   ${CT_Supliment_Vehicle_Remarks}
    Click Element    ${CT_Supliment_Vehicle_Add}
    capture page screenshot     ${Calltaker_Screenshot_Path}/CT Add Vehicle Supplemental info.png

CT Add Location Supplemental info
    Wait Until Element Is Visible   ${CT_SUP}   ${Timeout}
    Click Element    ${CT_SUP}
    Click Element    ${CT_Supliment_Location}
    Input Text    ${CT_Supliment_Location_Tag_Field}    ${CT_Supliment_Location_Tag}
    ${CT_Supliment_Location_Caution_Field}=   Execute Javascript  ${CT_Supliment_Location_Caution_JS}
    Input Text    ${CT_Supliment_Location_Caution_Field}    ${CT_Supliment_Location_Caution}
    Click Element    ${CT_Supliment_Location_Add}
    capture page screenshot     ${Calltaker_Screenshot_Path}/CT Add Location Supplemental info.png

CT Add Other Supplemental info
    Wait Until Element Is Visible   ${CT_SUP}   ${Timeout}
    Click Element    ${CT_SUP}
    Click Element    ${CT_Supliment_Other}
    ${CT_Supliment_Other_NoOfInjuries_Field}=   Execute Javascript  ${CT_Supliment_Other_NoOfInjuries_JS}
    Input Text    ${CT_Supliment_Other_NoOfInjuries_Field}    ${CT_Supliment_Other_NoOfInjuries}
    ${CT_Supliment_Other_NoOfDeaths_Field}=   Execute Javascript  ${CT_Supliment_Other_NoOfDeaths_JS}
    Input Text    ${CT_Supliment_Other_NoOfDeaths_Field}    ${CT_Supliment_Other_NoOfDeaths}
    Click Element    ${CT_Supliment_Other_Add}
    capture page screenshot     ${Calltaker_Screenshot_Path}/CT Add Other Supplemental info.png

CT Change Call Type
    Wait Until Element Is Visible       ${CT_Validate_HomePage}    ${Timeout}
    Open Context Menu     ${CT_Eventevent}
    #CT_HomePageSikuli.Click Blankcall






CT Fill Distress Form for Police agency
     Wait Until Element Is Visible  ${CT_PoliceButton}   ${Timeout}
     Click Element    ${CT_PoliceButton}
     Sleep    3s
     ${CT_Address}=     Execute Javascript    ${CT_AddressField}
     Wait Until Element Is Visible    ${CT_Address}         ${Timeout}
     Input Text    ${CT_Address}    ${CT_Location}
     Sleep    3s
     ${CT_LandMark}=     Execute Javascript    ${CT_LandMark_Field}
     Wait Until Element Is Visible    ${CT_LandMark}         ${Timeout}
     Input Text    ${CT_LandMark}    ${CT_LandmarkK}

     ${CT_Place}=     Execute Javascript    ${CT_Place_Filed}
     Wait Until Element Is Visible    ${CT_Place}         ${Timeout}
     Input Text    ${CT_Place}    ${CT_Location}

     ${CT_Fname_Field}=     Execute Javascript    ${CT_firstName}
     Wait Until Element Is Visible    ${CT_Fname_Field}         ${Timeout}
     Input Text    ${CT_Fname_Field}    ${CT_fName}


     ${CT_IncformGender_Field}=  Execute Javascript    ${CT_IncformGender}
     Click Element    ${CT_IncformGender_Field}

     ${CT_Gender}=     Execute Javascript    ${CT_GenderTextField}
     Wait Until Element Is Visible    ${CT_Gender}         ${Timeout}
     Input Text    ${CT_Gender}    ${CT_GenderSelection}


     ${CT_Gender_DropDown_Click}=  Execute Javascript    ${CT_Gender_DropDown}
     Click Element    ${CT_Gender_DropDown_Click}


     ${CT_EVentform_Ph}=     Execute Javascript    ${CT_EVentform_Phnnumber}
     Wait Until Element Is Visible    ${CT_EVentform_Ph}         ${Timeout}
     Input Text    ${CT_EVentform_Ph}    ${CT_Phonenumber}

     ${CT_SubeventTypeClick}=  Execute Javascript    ${CT_SubeventType}
     Click Element    ${CT_SubeventTypeClick}

     ${CT_SubeventsearchTypeField}=     Execute Javascript    ${CT_SubeventsearchType}
     log  ${CT_SubeventsearchTypeField}
     Wait Until Element Is Visible    ${CT_SubeventsearchTypeField}         ${Timeout}
     Input Text    ${CT_SubeventsearchTypeField}    ${CT_SubEventTypeselection}
     Sleep    5s
     ${CT_SubeventTypeClickk}=  Execute Javascript    ${CT_SubeventTypeOption}
     log     ${CT_SubeventTypeClickk}
     Wait Until Element Is Visible    ${CT_SubeventTypeClickk}         ${Timeout}
     Click Element    ${CT_SubeventTypeClickk}

      Wait Until Element Is Visible  ${CT_Notify_No}   ${Timeout}
      Click Element    ${CT_Notify_No}
      Sleep    3s

      ${CT_Station_Filtericon}=  Execute Javascript    ${CT_Station_Filter}
      Wait Until Element Is Visible  ${CT_Station_Filtericon}   ${Timeout}
      Click Element    ${CT_Station_Filtericon}
      Sleep    2s
      Wait Until Element Is Visible  ${CT_Filter_PoliceStation}   ${Timeout}
      Click Element    ${CT_Filter_PoliceStation}
      Wait Until Element Is Visible  ${CT_SelectPoliceStation}   ${Timeout}
      Click Element    ${CT_SelectPoliceStation}
      Sleep     3s

CT DispatchEvent with Alrady opened Dispatcher

      Wait Until Element Is Visible  ${CT_EventDispatch}   ${Timeout}
      Click Element    ${CT_EventDispatch}
      Wait Until Element Is Visible  ${CT_OpenedDisp}   ${Timeout}
      Click Element    ${CT_OpenedDisp}

      #${CT_SelectedDispatcher}=  Execute Javascript    ${CT_SelectedEventDispatch}
      Wait Until Element Is Visible  ${CT_SelectedEventDispatch}   ${Timeout}
      Click Element    ${CT_SelectedEventDispatch}
      Sleep    2s
      Wait Until Element Is Visible  ${CT_Dispatch_Confirm}   ${Timeout}
      Click Element    ${CT_Dispatch_Confirm}
      Sleep    12s


CT Verify distress form filling for EMS agency
     Wait Until Element Is Visible  ${CT_EMS}   ${Timeout}
     Click Element    ${CT_EMS}
     Sleep    3s
     ${CT_Address}=     Execute Javascript    ${CT_AddressField}
     Wait Until Element Is Visible    ${CT_Address}         ${Timeout}
     Input Text    ${CT_Address}    ${CT_Location}
     Sleep    3s
     ${CT_LandMark}=     Execute Javascript    ${CT_LandMark_Field}
     Wait Until Element Is Visible    ${CT_LandMark}         ${Timeout}
     Input Text    ${CT_LandMark}    ${CT_LandmarkK}
     ${CT_Place}=     Execute Javascript    ${CT_Place_Filed}
     Wait Until Element Is Visible    ${CT_Place}         ${Timeout}
     Input Text    ${CT_Place}    ${CT_Location}
     ${CT_Fname_Field}=     Execute Javascript    ${CT_firstName}
     Wait Until Element Is Visible    ${CT_Fname_Field}         ${Timeout}
     Input Text    ${CT_Fname_Field}    ${CT_fName}
     ${CT_IncformGender_Field}=  Execute Javascript    ${CT_IncformGender}
     Click Element    ${CT_IncformGender_Field}
     ${CT_Gender}=     Execute Javascript    ${CT_GenderTextField}
     Wait Until Element Is Visible    ${CT_Gender}         ${Timeout}
     Input Text    ${CT_Gender}    ${CT_GenderSelection}
     ${CT_Gender_DropDown_Click}=  Execute Javascript    ${CT_Gender_DropDown}
     Click Element    ${CT_Gender_DropDown_Click}
     ${CT_EVentform_Ph}=     Execute Javascript    ${CT_EVentform_Phnnumber}
     Wait Until Element Is Visible    ${CT_EVentform_Ph}         ${Timeout}
     Input Text    ${CT_EVentform_Ph}    ${CT_Phonenumber}
     ${CT_SubeventTypeClick}=  Execute Javascript    ${CT_SubeventType}
     Click Element    ${CT_SubeventTypeClick}
     ${CT_SubeventsearchTypeField}=     Execute Javascript    ${CT_SubeventsearchType}
     Wait Until Element Is Visible    ${CT_SubeventsearchTypeField}         ${Timeout}
     Input Text    ${CT_SubeventsearchTypeField}    ${CT_SubEventTypeselection}
     Sleep    2s
     ${CT_SubeventTypeClickk}=  Execute Javascript    ${CT_SubeventTypeOption}
      Click Element    ${CT_SubeventTypeClickk}
      Wait Until Element Is Visible  ${CT_Notify_No}   ${Timeout}
      Click Element    ${CT_Notify_No}
      Sleep   3s
      Wait Until Element Is Visible  ${CT_EMS_Filter}   ${Timeout}
      Click Element    ${CT_EMS_Filter}
      Wait Until Element Is Visible  ${CT_Filter_Hospitals}   ${Timeout}
      Click Element    ${CT_Filter_Hospitals}
      Wait Until Element Is Visible  ${CT_Select_Hospital_Fire}   ${Timeout}
      Click Element    ${CT_Select_Hospital_Fire}
     ${CT_EnterPickUplocationField}=     Execute Javascript    ${CT_EnterPickUplocation}
     Wait Until Element Is Visible    ${CT_EnterPickUplocationField}         ${Timeout}
     Input Text    ${CT_EnterPickUplocationField}    ${CT_PicUplocation}
     Sleep    2s
     ${CT_EnterDropUplocationField}=     Execute Javascript    ${CT_EnterDropUplocation}
     Wait Until Element Is Visible    ${CT_EnterDropUplocationField}         ${Timeout}
     Input Text    ${CT_EnterDropUplocationField}    ${CT_DropLocation}
     Sleep    2s
     Scroll Element Into View   ${CT_TimeLapse}

      Sleep    2s
      ${CT_NatureEmergencyClick}=  Execute Javascript    ${CT_NatureEmergency}
      Wait Until Element Is Visible    ${CT_NatureEmergencyClick}         ${Timeout}
      Click Element    ${CT_NatureEmergencyClick}
      ${CT_EnterNatureEmergencyField}=     Execute Javascript    ${CT_EnterNatureEmergency}
      Wait Until Element Is Visible    ${CT_EnterNatureEmergencyField}         ${Timeout}
      Input Text    ${CT_EnterNatureEmergencyField}    ${CT_Emergencyype}
      Sleep    2s
      ${CT_SelectionEmergencyOption_click}=  Execute Javascript    ${CT_SelectionEmergencyOption}
      Wait Until Element Is Visible    ${CT_SelectionEmergencyOption_click}         ${Timeout}
      Click Element    ${CT_SelectionEmergencyOption_click}
      ${CT_HOS_serviceTypeClick}=  Execute Javascript    ${CT_HOS_serviceType}
      Wait Until Element Is Visible    ${CT_HOS_serviceTypeClick}         ${Timeout}
      Click Element    ${CT_HOS_serviceTypeClick}
      ${CT_SelectHOS_servicetypeClick}=  Execute Javascript    ${CT_SelectHOS_servicetype}
      Wait Until Element Is Visible    ${CT_SelectHOS_servicetypeClick}         ${Timeout}
      Click Element    ${CT_SelectHOS_servicetypeClick}

CT Verify distress form filling for Fire agency
    Wait Until Element Is Visible  ${CT_Fire}   ${Timeout}
    Click Element    ${CT_Fire}
    Sleep    3s
    ${CT_Address}=     Execute Javascript    ${CT_AddressField}
    Wait Until Element Is Visible    ${CT_Address}         ${Timeout}
    Input Text    ${CT_Address}    ${CT_Location}
    Sleep    3s
     ${CT_LandMark}=     Execute Javascript    ${CT_LandMark_Field}
     Wait Until Element Is Visible    ${CT_LandMark}         ${Timeout}
     Input Text    ${CT_LandMark}    ${CT_LandmarkK}
     ${CT_Place}=     Execute Javascript    ${CT_Place_Filed}
     Wait Until Element Is Visible    ${CT_Place}         ${Timeout}
     Input Text    ${CT_Place}    ${CT_Location}
     ${CT_Fname_Field}=     Execute Javascript    ${CT_firstName}
     Wait Until Element Is Visible    ${CT_Fname_Field}         ${Timeout}
     Input Text    ${CT_Fname_Field}    ${CT_fName}
     ${CT_IncformGender_Field}=  Execute Javascript    ${CT_IncformGender}
     Click Element    ${CT_IncformGender_Field}
     ${CT_Gender}=     Execute Javascript    ${CT_GenderTextField}
     Wait Until Element Is Visible    ${CT_Gender}         ${Timeout}
     Input Text    ${CT_Gender}    ${CT_GenderSelection}
     ${CT_Gender_DropDown_Click}=  Execute Javascript    ${CT_Gender_DropDown}
     Click Element    ${CT_Gender_DropDown_Click}
     ${CT_EVentform_Ph}=     Execute Javascript    ${CT_EVentform_Phnnumber}
     Wait Until Element Is Visible    ${CT_EVentform_Ph}         ${Timeout}
     Input Text    ${CT_EVentform_Ph}    ${CT_Phonenumber}
     ${CT_SubeventTypeClick}=  Execute Javascript    ${CT_SubeventType}
     Click Element    ${CT_SubeventTypeClick}
     ${CT_SubeventsearchTypeField}=     Execute Javascript    ${CT_SubeventsearchType}
     Wait Until Element Is Visible    ${CT_SubeventsearchTypeField}         ${Timeout}
     Input Text    ${CT_SubeventsearchTypeField}    ${CT_SubEventTypeselection}
     Sleep    2s
     ${CT_SubeventTypeClickk}=  Execute Javascript    ${CT_SubeventTypeOption}
     Click Element    ${CT_SubeventTypeClickk}
      Wait Until Element Is Visible  ${CT_Notify_No}   ${Timeout}
      Click Element    ${CT_Notify_No}
      Sleep   3s
      Wait Until Element Is Visible  ${CT_Fire_Filter}   ${Timeout}
      Click Element    ${CT_Fire_Filter}
      Wait Until Element Is Visible  ${CT_Filter_Fire_Stations}   ${Timeout}
      Click Element    ${CT_Filter_Fire_Stations}
      Wait Until Element Is Visible  ${CT_Select_Hospital_Fire}   ${Timeout}
      Click Element    ${CT_Select_Hospital_Fire}
      Scroll Element Into View   ${CT_TimeLapse}
      Sleep    2s
      ${CT_FireEmergencyClick}=  Execute Javascript    ${CT_FireEmergency}
      Wait Until Element Is Visible    ${CT_FireEmergencyClick}         ${Timeout}
      Click Element    ${CT_FireEmergencyClick}
      ${CT_FireEnterEmergencyField}=     Execute Javascript    ${CT_FireEnterEmergency}
      Wait Until Element Is Visible    ${CT_FireEnterEmergencyField}         ${Timeout}
      Input Text    ${CT_FireEnterEmergencyField}    ${CT_Emergencyype}
      Sleep    2s
      ${CT_FireSelectionOption_click}=  Execute Javascript    ${CT_FireSelectionOption}
      Wait Until Element Is Visible    ${CT_FireSelectionOption_click}         ${Timeout}
      Click Element    ${CT_FireSelectionOption_click}
      ${CT_FireEnterEmergencyField}=     Execute Javascript    ${CT_FireEnterEmergency}
      Wait Until Element Is Visible    ${CT_EnterFireNarative}         ${Timeout}
      Input Text    ${CT_EnterFireNarative}    ${CT_FireNarative}
      Sleep    2s


CT Update ANI info from the ANI/ALI section
      Wait Until Element Is Visible    ${CT_Eventevent}         ${Timeout}
      Click Element    ${CT_Eventevent}
      ${CT_AniEditt}=     Execute Javascript    ${CT_AniEdit}
      Wait Until Element Is Enabled    ${CT_AniEditt}         ${Timeout}
      Sleep    2s
      ${element}=    Execute Javascript    ${CT_AniEdit}.click()
      log       ${element}
      Sleep    3s
      ${CT_AniFirstnameField}=     Execute Javascript    ${CT_AniFirstname}
      Wait Until Element Is Visible    ${CT_AniFirstnameField}         ${Timeout}
      Input Text    ${CT_AniFirstnameField}    ${CAD_Fname}
      ${CT_AniLastnameField}=     Execute Javascript    ${CT_AniLastname}
      Wait Until Element Is Visible    ${CT_AniLastnameField}         ${Timeout}
      Input Text    ${CT_AniLastnameField}    ${CAD_Fname}
      ${CT_AniAlternativeCallNumberField}=     Execute Javascript    ${CT_AniAlternativeCallNumber}
      Wait Until Element Is Visible    ${CT_AniAlternativeCallNumberField}         ${Timeout}
      Input Text    ${CT_AniAlternativeCallNumberField}    ${CT_AniProvider}

      ${CT_AniEnterserviceproviderField}=     Execute Javascript    ${CT_AniEnterserviceprovider}
      Wait Until Element Is Visible    ${CT_AniEnterserviceproviderField}         ${Timeout}
      Input Text    ${CT_AniEnterserviceproviderField}    ${CTAniAlternativeNumber}

      ${CT_AniGenderselectClick}=  Execute Javascript    ${CT_AniGenderselect}
      Wait Until Element Is Visible    ${CT_AniGenderselectClick}         ${Timeout}
      Click Element    ${CT_AniGenderselectClick}
      Sleep    3s
      ${CT_AniEntergenderField}=     Execute Javascript    ${CT_AniEntergender}
      Wait Until Element Is Visible    ${CT_AniEntergenderField}         ${Timeout}
      Input Text    ${CT_AniEntergenderField}    ${CT_Ani_Gender}
      Sleep    3s
      ${CT_AnienteredGenderClick}=  Execute Javascript    ${CT_AnienteredGender}
      Wait Until Element Is Visible    ${CT_AnienteredGenderClick}         ${Timeout}
      Click Element    ${CT_AnienteredGenderClick}

      ${CT_ANI_SelectCityClick}=  Execute Javascript    ${CT_ANI_SelectCity}
      Wait Until Element Is Visible    ${CT_ANI_SelectCityClick}         ${Timeout}
      Click Element    ${CT_ANI_SelectCityClick}
      Sleep    3s
      ${CT_ANI_EnterCityField}=     Execute Javascript    ${CT_ANI_EnterCity}
      Wait Until Element Is Visible    ${CT_ANI_EnterCityField}         ${Timeout}
      Input Text    ${CT_ANI_EnterCityField}    ${CT_AniCity}
      Sleep    3s
      ${CT_ANI_Select_Entered_CityClick}=  Execute Javascript    ${CT_ANI_Select_Entered_City}
      Wait Until Element Is Visible    ${CT_ANI_Select_Entered_CityClick}         ${Timeout}
      Click Element    ${CT_ANI_Select_Entered_CityClick}

      ${Ct_ANI_AddressField}=     Execute Javascript    ${Ct_ANI_Address}
      Wait Until Element Is Visible    ${Ct_ANI_AddressField}         ${Timeout}
      Input Text    ${Ct_ANI_AddressField}    ${CT_AniCity}


      Wait Until Element Is Visible    ${CT_Save}         ${Timeout}
      Click Element    ${CT_Save}
      capture page screenshot     ${currentDir}/CT AddAniinformation.png

Verify the Toaster Ani Updated Successfully toaster
        Wait Until Element Is Visible      ${CT_getAniToaster}  ${Timeout}
        ${message}=  Get text  ${CT_getAniToaster}
        Should be equal  ${message}  ${CT_AniUpdatedSuccessfully}
        capture page screenshot     ${currentDir}/AniUpdatedSuccessFully.png
        Switch Browser

Verify Caller Number in Ani section

           Wait until element is visible  ${CT_getAniNumber}  ${Timeout}
           ${message}=  Get text  ${CT_getAniNumber}
           Should be equal  ${message}  ${CTManualEvent_Creation_Number}
           capture page screenshot     ${currentDir}/NumberValidation.png

Copy the ANI information to DistressInformation
          Wait Until Element Is Visible    ${CT_ANI_Copy}         ${Timeout}
          Click Element    ${CT_ANI_Copy}
          Wait Until Element Is Visible    ${CT_ANI_Save}         ${Timeout}
          Click Element    ${CT_ANI_Save}
          Wait until element is visible  ${CT_EventUpdatedSuccessFully}  ${Timeout}
          ${message}=  Get text  ${CT_EventUpdatedSuccessFully}
          Should be equal  ${message}  ${CT_AniUpdatedSuccessfully}
          capture page screenshot     ${currentDir}/NumberValidation.png


CT Block ANI Number

          Wait Until Element Is Visible    ${CT_ANI_BlockNumber}         ${Timeout}
          Click Element    ${CT_ANI_BlockNumber}
          Wait Until Element Is Visible    ${CT_ANI_Save}         ${Timeout}
          capture page screenshot     ${currentDir}/BlockNumber.png
          Click Element    ${CT_ANI_Save}



Open Chrome in Incognito Mode and Login To Dispatcher
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --incognito
    Call Method    ${chrome_options}    add_argument    --ignore-certificate-errors
    Create Webdriver    Chrome    options=${chrome_options}
    Go To    https://trespondapp.tsf.com/NGCADApp/#/login
    Maximize Browser Window
    Wait Until Page Contains Element    ${CAD_Dispatcher_Selection}         ${CAD_Dispatcher_Selection_Timeout}
    Select From List By Label   ${DISPOP_Selection}      ${Dispatcher_Operator}
    sleep   3
    Select From List By Value   ${CAD_Dispatcher_Workstation}      ${Dispatcher_Workstation}
    Wait Until Page Contains Element    ${DisPUserNameField}         ${Timeout}
    Click Element   ${DisPUserNameField}
    Input Text      ${UserNameField}        ${Dispatcher_User}
    Wait Until Page Contains Element    ${UserPasswordField}         ${Timeout}
    Input Text      ${UserPasswordField}         ${Cad_Password}
    capture page screenshot     ${Calltaker_Screenshot_Path}/CAD.png
    # Take a screenshot and save it in the specified destination path
    Capture Page Screenshot    ${currentDir}/ui.png
    Wait Until Page Contains Element    ${CAD_Login}         ${Timeout}
    Click Button    ${CAD_Login}
    Wait Until Element Is Visible       ${CTCreateManualEvent}    ${Timeout}
    Title Should Be     ngcadapp
    capture page screenshot     ${currentDir}/Login_to_Dispatcher.png
    Switch Browser    1
    capture page screenshot     ${currentDir}/verifyCalltaker.png

Verify the CFS Incident in Dispatcher
        Switch Browser    2
        Wait Until Page Contains Element    ${Disp_Verify_CFS}         ${Timeout}
        Click Element        ${Disp_Verify_CFS}
        Sleep    4s
        Should Contain Any    ${Disp_Verify_CFS}   ${cfs_id}

CT user verify SOP
    Wait Until Page Contains Element    ${CT_AddSop}         ${Timeout}
    Click Element        ${CT_AddSop}
    Wait Until Page Contains Element    ${CT_SOP_Information_Gathering}    ${Timeout}
    Wait Until Page Contains Element    ${CT_SOP_Behavioural}    ${Timeout}
    Wait Until Page Contains Element    ${CT_SOP_Operational}    ${Timeout}
    Click Element   ${CT_SOP_Information_Gathering}
    Wait Until Page Contains Element    ${CT_SOP_Attachment}    ${Timeout}
    Click Element   ${CT_SOP_Attachment}
    Capture Page Screenshot   ${currentDir}/ViewSOP.png


CT verify the Questionaries
    Wait Until Page Contains Element    ${CT_ADD_Quentionaries}         ${Timeout}
    Click Element        ${CT_ADD_Quentionaries}

CT user is able to view Related events
    Wait Until Page Contains Element
    Click Element

CT SelectMultiple Dispatch

    Wait Until Element Is Visible    ${CT_Multiselectcheckbox}         ${Timeout}
    Click Element    ${CT_Multiselectcheckbox}
    Wait Until Element Is Visible    ${CT_selectCheckboxone}         ${Timeout}
    Click Element    ${CT_selectCheckboxone}
    Wait Until Element Is Visible    ${CT_selectCheckboxSecond}         ${Timeout}
    Click Element    ${CT_selectCheckboxSecond}

CT all th selectedDispatcher Should clear

    Capture Page Screenshot   ${currentDir}/Beforeclear.png
    Wait Until Element Is Visible    ${CT_MultipleCheckboxclear}         ${Timeout}
    Click Element    ${CT_MultipleCheckboxclear}
    Capture Page Screenshot   ${currentDir}/Afterclearingcheckbox.png

User Marks the Address from the Map

    Wait Until Element Is Visible  ${CT_PoliceButton}   ${Timeout}
    Click Element    ${CT_PoliceButton}
    Sleep    3s
    Wait Until Element Is Visible    ${CT_AddMapButton}     ${Timeout}
    Click Element    ${CT_PoliceButton}
    Wait Until Element Is Visible    ${CT_EnterAddressOnMap}     ${Timeout}
    Input Text    ${CT_EnterAddressOnMap}       ${CAD_Addressdata}
    Sleep    4s
    SeleniumLibrary.Press Keys  None    ARROW_DOWN
    Wait Until Element Is Visible    ${CTSelectAddresspin}     ${Timeout}
    Click Element    ${CTSelectAddresspin}
    Sleep    3s
    Wait Until Element Is Visible    ${CT_UpdateAddress}     ${Timeout}
    Click Element    ${CT_UpdateAddress}

address Should select Successfully



Switch to Bigmap window and verify the Address



CT Dispatch

      Wait Until Element Is Visible  ${CT_EventDispatch}   ${Timeout}
      Click Element    ${CT_EventDispatch}
      Wait Until Element Is Visible  ${CT_AnyDisp}    ${Timeout}
      Click Element    ${CT_AnyDisp}

      #${CT_SelectedDispatcher}=  Execute Javascript    ${CT_SelectedEventDispatch}
      Wait Until Element Is Visible  ${CT_SelectedEventDispatch}   ${Timeout}
      Click Element    ${CT_SelectedEventDispatch}
      Sleep    2s
      Wait Until Element Is Visible  ${CT_Dispatch_Confirm}   ${Timeout}
      Click Element    ${CT_Dispatch_Confirm}































































