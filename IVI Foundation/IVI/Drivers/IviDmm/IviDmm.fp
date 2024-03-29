s��   	     �   N �  *h   �   ����                                IviDmm                          IviDmm Class Driver                                                                                   � � ��ViInt16  �  � ��ViInt32  � � ��ViReal64     � ��ViRsrc     	� 	��ViBoolean     	� 	��ViSession     � ��ViStatus     �  ViChar[]     � ��ViChar     � ��ViString     	�  ViInt16[]     	�  ViInt32[]     
�  	ViReal64[]     � 	 
ViBoolean[]     � ��ViConstString     � ��ViAttr     � ��ViAddr  Y    This instrument driver provides programming support for the IviDmm Class.  The driver contains all the functions that the IVI Foundation and VXIplug&play Systems Alliance require.  This driver requires the VISA and IVI libraries.
      
Use this driver to develop programs that are independent of a particular DMM.  You can use this class driver with any DMM that has an IVI instrument-specific driver that is compliant with the IviDmm class.  The IviDmm class driver accesses the specific driver for your instrument using the configuration information you supply with the IVI configuration utility.
      
The IviDmm class driver divides instrument capabilities into a fundamental capabilities group and multiple extension capability groups.  The IviDmmBase fundamental capabilities group supports DMMs that take one measurement at a time.  This group consists of the following functions and attributes.  These functions and attributes are implemented by all DMM instrument drivers that are compliant with the IviDmm class.
      
      IviDmm_ConfigureMeasurement()
      IviDmm_ConfigureTrigger()
      IviDmm_Read()
      IviDmm_Fetch()
      IviDmm_Abort()
      IviDmm_Initiate()
      IviDmm_IsOverRange()
      
      IVIDMM_ATTR_FUNCTION
      IVIDMM_ATTR_RANGE
      IVIDMM_ATTR_RESOLUTION_ABSOLUTE
      IVIDMM_ATTR_TRIGGER_SOURCE
      IVIDMM_ATTR_TRIGGER_DELAY
      
The IviDmm class driver identifies functions and attributes that belong to an extension group with the following abbreviations.  Instrument-specific drivers are not required to implement any of the extension capability groups.  If you use functions and attributes that belong to extension capability groups, every instrument-specific driver that you use must implement those extensions.
      
      Extension Capability Group        Abbreviation
      ----------------------------------------------
      IviDmmACMeasurement                   [AC]
      IviDmmFrequencyMeasurement            [FRQ]
      IviDmmTemperatureMeasurement          [TMP]
      IviDmmThermocouple                    [TC]
      IviDmmResistanceTemperatureDevice     [RTD]
      IviDmmThermistor                      [THM]
      IviDmmMultiPoint                      [MP]
      IviDmmTriggerSlope                    [TS]
      IviDmmSoftwareTrigger                 [SWT]
      IviDmmDeviceInfo                      [DI]
      IviDmmAutoRangeValue                  [ARV]
      IviDmmAutoZero                        [AZ]
      IviDmmPowerLineFrequency              [PLF]
      
The IviDmmACMeasurement extension group supports DMMs that take AC voltage or AC current measurements.  This group consists of the following functions and attributes:

      IviDmm_ConfigureACBandwidth()

      IVIDMM_ATTR_AC_MIN_FREQ
      IVIDMM_ATTR_AC_MAX_FREQ

The IviDmmFrequencyMeasurement extension group supports DMMs that take frequency measurements.  This group consists of the following functions and attributes:

      IviDmm_ConfigureFrequencyVoltageRange()

      IVIDMM_ATTR_FREQ_VOLTAGE_RANGE

The IviDmmTemperatureMeasurement extension group supports DMMs that take temperature measurements with a thermocouple, an RTD, or a thermistor transducer type.  This group consists of the following functions and attributes:

      IviDmm_ConfigureTransducerType()

      IVIDMM_ATTR_TEMP_TRANSDUCER_TYPE

The IviDmmThermocouple extension group supports DMMs that take temperature measurements using a thermocouple transducer type.
This group consists of the following functions and attributes:

      IviDmm_ConfigureFixedRefJunction()
      IviDmm_ConfigureThermocouple()

      IVIDMM_ATTR_TEMP_TC_TYPE
      IVIDMM_ATTR_TEMP_TC_REF_JUNC_TYPE
      IVIDMM_ATTR_TEMP_TC_FIXED_REF_JUNC

The IviDmmResistanceTemperatureDevice extension group supports DMMs that take temperature measurements using a resistance temperature device (RTD) transducer type.  This group consists of the following functions and attributes:

      IviDmm_ConfigureRTD()

      IVIDMM_ATTR_TEMP_RTD_ALPHA
      IVIDMM_ATTR_TEMP_RTD_RES

The IviDmmThermistor extension group supports DMMs that take temperature measurements using a thermistor transducer type.  This group consists of the following functions and attributes:

      IviDmm_ConfigureThermistor()

      IVIDMM_ATTR_TEMP_THERMISTOR_RES

The IviDmmMultiPoint extension group defines extensions for instruments capable of acquiring measurements based on multiple triggers, and acquiring multiple measurements for each trigger.  This group consists of the following functions and attributes:
      
      IviDmm_ConfigureMeasCompleteDest()
      IviDmm_ConfigureMultiPoint()
      IviDmm_ReadMultiPoint()
      IviDmm_FetchMultiPoint()
      
      IVIDMM_ATTR_MEAS_COMPLETE_DEST
      IVIDMM_ATTR_SAMPLE_TRIGGER
      IVIDMM_ATTR_SAMPLE_INTERVAL
      IVIDMM_ATTR_SAMPLE_COUNT
      IVIDMM_ATTR_TRIGGER_COUNT
      
The IviDmmTriggerSlope extension group supports DMMs that can specify the polarity of the external trigger signal.  This group consists of the following functions and attributes:
      
      IviDmm_ConfigureTriggerSlope()
      
      IVIDMM_ATTR_TRIGGER_SLOPE

The IviDmmSoftwareTrigger extension group supports DMMs that can initiate a measurement based on a software trigger signal.  This group consists of the following function:
      
      IviDmm_SendSoftwareTrigger()

The IviDmmDeviceInfo group defines a function and a set of attributes that you can query to gain additional information about the instrument's configuration.  This group consists of the following functions and attributes:
      
      IviDmm_GetApertureTimeInfo()
      
      IVIDMM_ATTR_APERTURE_TIME
      IVIDMM_ATTR_APERTURE_TIME_UNITS
      
The IviDmmAutoRangeValue extension supports DMMs with the capability to return the actual range value when auto ranging.  This group consists of the following functions and attributes:
      
      IviDmm_GetAutoRangeValue()
      
      IVIDMM_ATTR_AUTO_RANGE_VALUE

The IviDmmAutoZero extension supports DMMs with the capability to take an auto zero reading.  This group consists of the following functions and attributes:
      
      IviDmm_ConfigureAutoZeroMode()
      
      IVIDMM_ATTR_AUTO_ZERO

The IviDmmPowerLineFrequency extension supports DMMs with the capability to specify the power line frequency.  This group consists of the following functions and attributes:
      
      IviDmm_ConfigurePowerLineFrequency()
      
      IVIDMM_ATTR_POWERLINE_FREQ
        This class contains functions and sub-classes that configure the DMM.  The class includes high-level functions that configure the basic measurement operation and subclasses that configure the trigger and the multi-point measurement capability.  It also contains sub-classes that configure additional parameters for some measurement types and that return information about the current state of the instrument. The class also contains the low-level functions that set, get, and check individual attribute values.
     �    This class contains functions and sub-classes that configure additional parameters for some measurement types. These are the AC Voltage, AC Current, frequency, and temperature measurements.     �    This class contains functions that configure additional parameters for temperature measurements. These parameters include the transducer type and settings specific to each transducer type.     �    This class contains functions that configure the triggering capabilities of the DMM. These include the trigger source, trigger delay, and trigger slope.     W    This class contains functions that configure the multi-point capabilities of the DMM.     �    This class contains functions that configure the instrument for different measurement operations. These operations are the auto zero mode and powerline frequency.
     �    This class contains functions that return information about the current state of the instrument. This information includes the actual range, aperture time, and the aperture time units.
     T    This class contains sub-classes for the set, get, and check attribute functions.       �    This class contains functions that set an attribute to a new value.  There are typesafe functions for each attribute data type.     �    This class contains functions that obtain the current value of an attribute.  There are typesafe functions for each attribute data type.     �    This class contains functions that determine if you can set an attribute to a particular value.  There are typesafe functions for each attribute data type.    �    This class contains functions and sub-classes that initiate and retrieve measurements using the current configuration.  The class contains high-level read functions that initiate a measurement and fetch the data in one operation.  The class also contains low-level functions that initiate the measurement process, send a software trigger, and fetch measurement values in separate operations.
        The class contains functions that give low-level control over how the DMM takes measurements.  The functions perform the following operations:

- initiate the measurement process,
- send a software trigger, 
- fetch measurement values, and 
- abort the measurement process.  

    _    This class contains functions and sub-classes that control common instrument operations.  These functions include many of functions that VXIplug&play require, such as reset, self-test, revision query, error query, and error message.  This class also contains functions that access IVI error infomation, lock the session, and perform instrument I/O.
     R    This class contains functions that retrieve and clear the IVI error information.     J    This class contains functions that retrieve interchangeability warnings.     ?    This class contains functions that retrieve coercion records.     k    This class contains functions that lock and unlock IVI instrument driver sessions for multithread safefy.    A    This function performs the following initialization actions:

- Creates a new IVI instrument driver session.

- Opens a session to the specified device using the interface and address you specify for the Resource Name parameter.

- If the ID Query parameter is set to VI_TRUE, this function queries the instrument ID and checks that it is valid for this instrument driver.

- If the Reset parameter is set to VI_TRUE, this function resets the instrument to a known state.

- Sends initialization commands to set the instrument to the state necessary for the operation of the instrument driver.

- Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Note:  This function creates a new session each time you invoke it. Although you can open more than one IVI session for the same resource, it is best not to do so.  You can use the same session in multiple program threads.  You can use the IviDmm_LockSession and IviDmm_UnlockSession functions to protect sections of code that require exclusive access to the resource.

Content from the IVI specifications reproduced with permission from the IVI Foundation. 
 
The IVI Foundation and its member companies make no warranty of any kind with regard to this material, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose. The IVI Foundation and its member companies shall not be liable for errors contained herein or for incidental or consequential damages in connection with the furnishing, performance, or use of this material.    �    Pass the logical name that identifies the particular driver session to use.  The driver session, in turn, identifies a specific driver and device and specifies the initial settings for the session.  You configure the logical name, driver session, specific driver, and device with the IVI Configuration utility. 

If you want to use your program with a different physical instrument, you change the configuration of the logical name to use the driver session for the new physical instrument. You can change the initial settings for the session by changing the configuration of the driver session.

Default Value:  "SampleDMM"

Warning: 
All IVI names, such as logical names or virtual names, are case-sensitive.  If you use logical names, driver session names, or virtual names in your program, you must make sure that the name you use matches the name in the IVI Configuration Store file exactly, without any variations in the case of the characters in the name.        Specify whether you want the instrument driver to perform an ID Query.

Valid Range:
VI_TRUE  (1) - Perform ID Query (Default Value)
VI_FALSE (0) - Skip ID Query

When you set this parameter to VI_TRUE, the driver verifies that the instrument you initialize is a type that this driver supports.  

Circumstances can arise where it is undesirable to send an ID Query command string to the instrument.  When you set this parameter to VI_FALSE, the function initializes the instrument without performing an ID Query.     �    Specify whether you want the to reset the instrument during the initialization procedure.

Valid Range:
VI_TRUE  (1) - Reset Device (Default Value)
VI_FALSE (0) - Don't Reset

    �    Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Notes:

(1) This function creates a new session each time you invoke it.  This is useful if you have multiple physical instances of the same type of instrument.  

(2) Avoid creating multiple concurrent sessions to the same physical instrument.  Although you can create more than one IVI session for the same resource, it is best not to do so.  A better approach is to use the same IVI session in multiple execution threads.  You can use functions IviDmm_LockSession and IviDmm_UnlockSession to protect sections of code that require exclusive access to the resource.

    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    /o =   �  �    Logical Name                      3; : �       ID Query                          5F =� �       Reset Device                      6  �C �  �    Instrument Handle                 8�#����  �    Status                             "SampleDMM"   Yes VI_TRUE No VI_FALSE   Yes VI_TRUE No VI_FALSE    	           	          A    This function performs the following initialization actions:

- Creates a new IVI instrument driver session.

- Opens a session to the specified device using the interface and address you specify for the Resource Name parameter.

- If the ID Query parameter is set to VI_TRUE, this function queries the instrument ID and checks that it is valid for this instrument driver.

- If the Reset parameter is set to VI_TRUE, this function resets the instrument to a known state.

- Sends initialization commands to set the instrument to the state necessary for the operation of the instrument driver.

- Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Note:  This function creates a new session each time you invoke it. Although you can open more than one IVI session for the same resource, it is best not to do so.  You can use the same session in multiple program threads.  You can use the IviDmm_LockSession and IviDmm_UnlockSession functions to protect sections of code that require exclusive access to the resource.

Content from the IVI specifications reproduced with permission from the IVI Foundation. 
 
The IVI Foundation and its member companies make no warranty of any kind with regard to this material, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose. The IVI Foundation and its member companies shall not be liable for errors contained herein or for incidental or consequential damages in connection with the furnishing, performance, or use of this material.    �    Pass the logical name that identifies the particular driver session to use.  The driver session, in turn, identifies a specific driver and device and specifies the initial settings for the session.  You configure the logical name, driver session, specific driver, and device with the IVI Configuration utility. 

If you want to use your program with a different physical instrument, you change the configuration of the logical name to use the driver session for the new physical instrument. You can change the initial settings for the session by changing the configuration of the driver session.

Default Value:  "SampleDMM"

Warning: 
All IVI names, such as logical names or virtual names, are case-sensitive.  If you use logical names, driver session names, or virtual names in your program, you must make sure that the name you use matches the name in the IVI Configuration Store file exactly, without any variations in the case of the characters in the name.
        Specify whether you want the instrument driver to perform an ID Query.

Valid Range:
VI_TRUE  (1) - Perform ID Query (Default Value)
VI_FALSE (0) - Skip ID Query

When you set this parameter to VI_TRUE, the driver verifies that the instrument you initialize is a type that this driver supports.  

Circumstances can arise where it is undesirable to send an ID Query command string to the instrument.  When you set this parameter to VI_FALSE, the function initializes the instrument without performing an ID Query.     �    Specify whether you want the to reset the instrument during the initialization procedure.

Valid Range:
VI_TRUE  (1) - Reset Device (Default Value)
VI_FALSE (0) - Don't Reset

    �    Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Notes:

(1) This function creates a new session each time you invoke it.  This is useful if you have multiple physical instances of the same type of instrument.  

(2) Avoid creating multiple concurrent sessions to the same physical instrument.  Although you can create more than one IVI session for the same resource, it is best not to do so.  A better approach is to use the same IVI session in multiple execution threads.  You can use functions IviDmm_LockSession and IviDmm_UnlockSession to protect sections of code that require exclusive access to the resource.

    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    You can use this control to set the initial value of certain attributes for the session.  The following table lists the attributes and the name you use in this parameter to identify the attribute.

Name              Attribute Defined Constant   
--------------------------------------------
RangeCheck        IVIDMM_ATTR_RANGE_CHECK
QueryInstrStatus  IVIDMM_ATTR_QUERY_INSTRUMENT_STATUS   
Cache             IVIDMM_ATTR_CACHE   
Simulate          IVIDMM_ATTR_SIMULATE  
RecordCoercions   IVIDMM_ATTR_RECORD_COERCIONS
InterchangeCheck  IVIDMM_ATTR_INTERCHANGE_CHECK

The format of this string is, "AttributeName=Value" where AttributeName is the name of the attribute and Value is the value to which the attribute will be set.  To set multiple attributes, separate their assignments with a comma.  

If you pass NULL or an empty string for this parameter, the driver uses the values from the Measurement and Automation Explorer's IVI Configuration Utility.   You can override these values by assigning a value explicitly in a string you pass for this parameter.  You do not have to specify all of the attributes and may leave any of them out.  If you do not specify one of the attributes, the driver uses the value from the IVI Configuration Utility.  

The following are the valid values for ViBoolean attributes:

    True:     1, TRUE, or VI_TRUE
    False:    0, False, or VI_FALSE


Default Value:
       "Simulate=0,RangeCheck=1,QueryInstrStatus=0,Cache=1"    G =   �  �    Logical Name                      J� : �       ID Query                          L� =� �       Reset Device                      M� �Y �  �    Instrument Handle                 P`#����  �    Status                            W �  � �    Option String                      "SampleDMM"   Yes VI_TRUE No VI_FALSE   Yes VI_TRUE No VI_FALSE    	           	           5"Simulate=0,RangeCheck=1,QueryInstrStatus=0,Cache=1"    �    This function configures the common attributes of the DMM.  These attributes include the measurement function, maximum range, and the absolute resolution.
     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    d    Pass the measurement range you want to use.  The driver sets the IVIDMM_ATTR_RANGE attribute to this value.  

Use positive values to represent the absolute value of the maximum expected measurement.  The value must be in units appropriate for the measurement function.  For example, when you set the Measurement Function to IVIDMM_VAL_DC_VOLTS, you must specify the Range in volts.  Setting this parameter to 10.0 configures the DMM to measure DC voltages from -10.0 to +10.0 volts.

The driver reserves special negative values for controlling the DMM's auto-ranging capability.

Defined Values:
IVIDMM_VAL_AUTO_RANGE_ON   (-1.0) - Auto-range On
IVIDMM_VAL_AUTO_RANGE_OFF  (-2.0) - Auto-range Off
IVIDMM_VAL_AUTO_RANGE_ONCE (-3.0) - Auto-range Once

Default Value:
IVIDMM_VAL_AUTO_RANGE_ON (-1.0)

Notes:

(1) Setting this parameter to IVIDMM_VAL_AUTO_RANGE_ONCE configures the DMM to auto-range once, turn auto-range off, and then remain at the current maximum range.

(2) Setting this to parameter IVIDMM_VAL_AUTO_RANGE_OFF configures the DMM to stop auto-ranging and keep the range fixed at the current maximum range.
    �    Pass the measurement function you want the DMM to perform.  The driver sets the IVIDMM_ATTR_FUNCTION attribute to this value. 

Valid Values:
IVIDMM_VAL_DC_VOLTS           - DC Volts
IVIDMM_VAL_AC_VOLTS           - AC Volts
IVIDMM_VAL_DC_CURRENT         - DC Current
IVIDMM_VAL_AC_CURRENT         - AC Current
IVIDMM_VAL_2_WIRE_RES         - 2-Wire Resistance
IVIDMM_VAL_4_WIRE_RES         - 4-Wire Resistance
IVIDMM_VAL_AC_PLUS_DC_VOLTS   - AC plus DC Volts
IVIDMM_VAL_AC_PLUS_DC_CURRENT - AC plus DC Current
IVIDMM_VAL_FREQ               - Frequency
IVIDMM_VAL_PERIOD             - Period
IVIDMM_VAL_TEMPERATURE        - Temperature (C)

Default Value:
IVIDMM_VAL_DC_VOLTS
    �    Pass your desired measurement resolution in absolute units.  The driver sets the IVIDMM_ATTR_RESOLUTION_ABSOLUTE attribute to this value.

Setting this parameter to lower values increases the measurement accuracy.  Setting this parameter to higher values increases the measurement speed.      

Default Value: 0.001

Notes:

(1) This parameter is ignored if the 'Range' parameter is set to IVIDMM_VAL_AUTO_RANGE_ON.

    _B-   �  �    Instrument Handle                 _�#����  �    Status                            f� = �  �    Range                             k = X � �    Measurement Function              m� z X �  �    Resolution (absolute)                  	           IVIDMM_VAL_AUTO_RANGE_ON              zDC Volts IVIDMM_VAL_DC_VOLTS AC Volts IVIDMM_VAL_AC_VOLTS DC Current IVIDMM_VAL_DC_CURRENT AC Current IVIDMM_VAL_AC_CURRENT 2 Wire Resistance IVIDMM_VAL_2_WIRE_RES 4 Wire Resistance IVIDMM_VAL_4_WIRE_RES AC + DC Volts IVIDMM_VAL_AC_PLUS_DC_VOLTS AC + DC Current IVIDMM_VAL_AC_PLUS_DC_CURRENT Frequency IVIDMM_VAL_FREQ Period IVIDMM_VAL_PERIOD Temperature IVIDMM_VAL_TEMPERATURE    0.001   `    This function configures the AC minimum and maximum frequency for DMMs that take AC voltage or AC current measurements.

This function affects the behavior of the instrument only if the IVIDMM_ATTR_FUNCTION attribute is set to an AC voltage or AC current measurement.

Note:

(1) This function is part of the IviDmmACMeasurement [AC] extension group.     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
         �    Pass the minimum expected frequency component of the input signal in Hertz.  The driver sets the IVIDMM_ATTR_AC_MIN_FREQ attribute to this value. 

Default Value: 20.0
     �    Pass the maximum expected frequency component of the input signal in Hertz.  The driver sets the IVIDMM_ATTR_AC_MAX_FREQ attribute to this value. 

Default Value: 300000.0    s�-   �  �    Instrument Handle                 tL#����  �    Status                            z� ? X �  �    AC Minimum Frequency (Hz)         {� ?3 �  �    AC Maximum Frequency (Hz)              	           20.0    	300000.0   U    This function configures the frequency voltage range of the DMM for frequency and period measurements.

This function affects the behavior of the instrument only if the IVIDMM_ATTR_FUNCTION attribute is set to IVIDMM_VAL_FREQ or IVIDMM_VAL_PERIOD. 

Note:

(1) This function is part of the IviDmmFrequencyMeasurement [FRQ] extension group.     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    Pass the expected maximum value of the input signal for frequency and period measurements in volts RMS.  The driver sets the IVIDMM_ATTR_FREQ_VOLTAGE_RANGE attribute to this value. 

The driver reserves special negative values for the auto-range mode.

Defined Values:
IVIDMM_VAL_AUTO_RANGE_ON  (-1.0) - Auto-range On
IVIDMM_VAL_AUTO_RANGE_OFF (-2.0) - Auto-range Off

Default Value: 10.0
    ~�-   �  �    Instrument Handle                 m#����  �    Status                            � ? � �  �    Frequency Voltage Range (Vrms)         	           10.0   >    This function configures the DMM to take temperature measurements from a specified transducer type.

This function affects the behavior of the instrument only when the IVIDMM_ATTR_FUNCTION is set to IVIDMM_VAL_TEMPERATURE. 

Note:

(1) This function is part of the IviDmmTemperatureMeasurement [TMP] extension group.     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    Pass the type of device used to measure the temperature. The driver uses this value to set the IVIDMM_ATTR_TEMP_TRANSDUCER_TYPE attribute.

Defined Values:
IVIDMM_VAL_THERMOCOUPLE - Thermocouple
IVIDMM_VAL_THERMISTOR   - Thermistor
IVIDMM_VAL_2_WIRE_RTD   - 2 Wire Resistance Temperature Device
IVIDMM_VAL_4_WIRE_RTD   - 4 Wire Resistance Temperature Device

Default Value: IVIDMM_VAL_THERMOCOUPLE
    ��-   �  �    Instrument Handle                 �Z#����  �    Status                            � ? � � �    Transducer Type                        	                      �Thermocouple IVIDMM_VAL_THERMOCOUPLE Thermistor IVIDMM_VAL_THERMISTOR 2-Wire RTD IVIDMM_VAL_2_WIRE_RTD 4-Wire RTD IVIDMM_VAL_4_WIRE_RTD   �    This function configures the thermocouple type and the reference junction type of the thermocouple for DMMs that take temperature measurements using a thermocouple transducer type.

This function affects the behavior of the instrument only if the IVIDMM_ATTR_TEMP_TRANSDUCER_TYPE is set to IVIDMM_VAL_THERMOCOUPLE. 

Note:

(1) This function is part of the IviDmmThermocouple [TC] extension group.     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    Pass the type of thermocouple used to measure the temperature. The driver uses this value to set the IVIDMM_ATTR_TEMP_TC_TYPE attribute. 

Defined Values:

IVIDMM_VAL_TEMP_TC_B
IVIDMM_VAL_TEMP_TC_C
IVIDMM_VAL_TEMP_TC_D
IVIDMM_VAL_TEMP_TC_E
IVIDMM_VAL_TEMP_TC_G
IVIDMM_VAL_TEMP_TC_J
IVIDMM_VAL_TEMP_TC_K
IVIDMM_VAL_TEMP_TC_N
IVIDMM_VAL_TEMP_TC_R
IVIDMM_VAL_TEMP_TC_S
IVIDMM_VAL_TEMP_TC_T
IVIDMM_VAL_TEMP_TC_U
IVIDMM_VAL_TEMP_TC_V

Default Value: IVIDMM_VAL_TEMP_TC_B
         Pass the type of reference junction to be used in the reference junction compensation of a thermocouple measurement. The driver uses this value to set the IVIDMM_ATTR_TEMP_TC_REF_JUNC_TYPE attribute.

Defined Values:

IVIDMM_VAL_TEMP_REF_JUNC_INTERNAL - The DMM uses an internal reference junction type.
 
IVIDMM_VAL_TEMP_REF_JUNC_FIXED - The DMM uses a fixed value for the reference junction. Use the IviDmm_ConfigureFixedRefJunction function to specify the fixed reference junction value. 

Default Value: IVIDMM_VAL_TEMP_REF_JUNC_INTERNAL
    �z-   �  �    Instrument Handle                 �0#����  �    Status                            �� = l � �    Thermocouple Type                 �� =. � �    Reference Junction Type                	                     +B IVIDMM_VAL_TEMP_TC_B C IVIDMM_VAL_TEMP_TC_C D IVIDMM_VAL_TEMP_TC_D E IVIDMM_VAL_TEMP_TC_E G IVIDMM_VAL_TEMP_TC_G J IVIDMM_VAL_TEMP_TC_J K IVIDMM_VAL_TEMP_TC_K N IVIDMM_VAL_TEMP_TC_N R IVIDMM_VAL_TEMP_TC_R S IVIDMM_VAL_TEMP_TC_S T IVIDMM_VAL_TEMP_TC_T U IVIDMM_VAL_TEMP_TC_U V IVIDMM_VAL_TEMP_TC_V               PInternal IVIDMM_VAL_TEMP_REF_JUNC_INTERNAL Fixed IVIDMM_VAL_TEMP_REF_JUNC_FIXED   \    This function configures the fixed reference junction for a thermocouple with a fixed reference junction type.

This function affects the behavior of the instrument only when the IVIDMM_ATTR_TEMP_TC_REF_JUNC_TYPE attribute is set to IVIDMM_VAL_TEMP_REF_JUNC_FIXED.

Note:

(1) This function is part of the IviDmmThermocouple [TC] extension group.     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    Pass the reference junction temperature when a fixed reference junction type thermocouple is used to take the temperature measurement.  The units are degrees Celsius.  The driver sets the IVIDMM_ATTR_TEMP_TC_FIXED_REF_JUNC attribute to this value. 

Default Value: 0.0

Notes:

1) This attribute may also be used to specify the thermocouple junction temperature of an instrument that does not have an internal temperature sensor.
    ��-   �  �    Instrument Handle                 �v#����  �    Status                            �! ? � �  �    Fixed Reference Junction               	           0.0   �    This function configures the alpha and resistance parameters for a resistance temperature device.

This function affects the behavior of the instrument only when the IVIDMM_ATTR_TEMP_TRANSDUCER_TYPE attribute is set to IVIDMM_VAL_2_WIRE_RTD or IVIDMM_VAL_4_WIRE_RTD.

Note:

(1) This function is part of the IviDmmResistanceTemperatureDevice [RTD] extension group.

(2) The driver assumes that you are using a Platinum Resistance Temperature Device.     �    The ViSession handle that you obtain from the IviDmm_init.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    Specifies the R0 parameter (resistance) for a resistance temperature device. The RTD resistance is also known as the RTD reference value. The driver sets the IVIDMM_ATTR_TEMP_RTD_RES attribute to this value.

Default Value: 0.0     �    Pass the alpha parameter for a resistance temperature device. The driver sets the IVIDMM_ATTR_TEMP_RTD_ALPHA attribute to this value. 

Default Value: 0.0    �Z-   �  �    Instrument Handle                 ��#����  �    Status                            �� =. �  �    Resistance                        �� = l �  �    Alpha                                  	           0.0    0.0   ;    This function configures the resistance for a thermistor temperature measurement device.

This function affects the behavior of the instrument only when the IVIDMM_ATTR_TEMP_TRANSDUCER_TYPE attribute is set to IVIDMM_VAL_THERMISTOR.

Note:

(1) This function is part of the IviDmmThermistor [THM] extension group.     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    L    Pass the resistance of the thermistor in Ohms. The driver sets the IVIDMM_ATTR_TEMP_THERMISTOR_RES attrribute to this value.

Default Value: 0.0

Notes:

(1) The driver assumes that you are using an interchangeable thermistor. Interchangeable thermistors are thermistors that exhibit similar behavior for a given resistance value.    �^-   �  �    Instrument Handle                 �#����  �    Status                            ¿ ? � �  �    Resistance                             	           0.0    z    This function configures the common DMM trigger attributes.  These attributes are the trigger source and trigger delay.
     �    The ViSession handle that you obtain from the IviDmm_init.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    H    Specify the trigger source you want to use.  The driver sets the
IVIDMM_ATTR_TRIGGER_SOURCE attribute to this value.

After you call the IviDmm_Read or IviDmm_Initiate function,
the DMM waits for the trigger you specify in this parameter.
After it receives the trigger, the DMM waits the length of time
you specify in the Trigger Delay parameter.  The DMM then takes
a measurement.

Valid Values:
IVIDMM_VAL_IMMEDIATE     - Immediate
IVIDMM_VAL_EXTERNAL      - External
IVIDMM_VAL_SOFTWARE_TRIG - Software Trigger Function
IVIDMM_VAL_TTL0          - PXI TRIG0 or VXI TTL0
IVIDMM_VAL_TTL1          - PXI TRIG1 or VXI TTL1
IVIDMM_VAL_TTL2          - PXI TRIG2 or VXI TTL2
IVIDMM_VAL_TTL3          - PXI TRIG3 or VXI TTL3
IVIDMM_VAL_TTL4          - PXI TRIG4 or VXI TTL4
IVIDMM_VAL_TTL5          - PXI TRIG5 or VXI TTL5
IVIDMM_VAL_TTL6          - PXI TRIG6 or VXI TTL6
IVIDMM_VAL_TTL7          - PXI TRIG7 or VXI TTL7
IVIDMM_VAL_ECL0          - VXI ECL0
IVIDMM_VAL_ECL1          - VXI ECL1
IVIDMM_VAL_PXI_STAR      - PXI Star
IVIDMM_VAL_RTSI_0        - RTSI line 0
IVIDMM_VAL_RTSI_1        - RTSI line 1
IVIDMM_VAL_RTSI_2        - RTSI line 2
IVIDMM_VAL_RTSI_3        - RTSI line 3
IVIDMM_VAL_RTSI_4        - RTSI line 4
IVIDMM_VAL_RTSI_5        - RTSI line 5
IVIDMM_VAL_RTSI_6        - RTSI line 6

Default Value: IVIDMM_VAL_IMMEDIATE

Notes:

(1) IVIDMM_VAL_IMMEDIATE - The DMM does not wait for a trigger of any kind.

(2) IVIDMM_VAL_EXTERNAL - The DMM waits for a trigger on the external trigger input.

(3) IVIDMM_VAL_SOFTWARE_TRIG - The DMM waits until you call the IviDmm_SendSoftwareTrigger function.
    �    Pass the value you want to use for the trigger delay.  Express this value in seconds.  The driver sets the IVIDMM_ATTR_TRIGGER_DELAY attribute to this value. 

The trigger delay specifies the length of time the DMM waits after it receives the trigger and before it takes a measurement.

Use positive values to set the trigger delay in seconds.  The driver reserves negative values for configuring the DMM to calculate the trigger delay automatically.

Defined Values:
IVIDMM_VAL_AUTO_DELAY_OFF (-2.0) - Auto-delay off
IVIDMM_VAL_AUTO_DELAY_ON  (-1.0) - Auto-delay on

Default Value: 0.0

Notes:

(1) Setting this parameter to IVIDMM_VAL_AUTO_DELAY_ON  configures the DMM to calculate the trigger delay before each measurement.

(2) Setting this parameter to IVIDMM_VAL_AUTO_DELAY_OFF stops the DMM from calculating the trigger delay and sets the trigger delay to the last automatically calculated value.

    �K-   �  �    Instrument Handle                 ��#����  �    Status                            ̉ = l � �    Trigger Source                    �� =. �  �    Trigger Delay (sec)                    	                     �Immediate IVIDMM_VAL_IMMEDIATE External IVIDMM_VAL_EXTERNAL Software Trigger Function IVIDMM_VAL_SOFTWARE_TRIG PXI TRIG0 or VXI TTL0 IVIDMM_VAL_TTL0 PXI TRIG1 or VXI TTL1 IVIDMM_VAL_TTL1 PXI TRIG2 or VXI TTL2 IVIDMM_VAL_TTL2 PXI TRIG3 or VXI TTL3 IVIDMM_VAL_TTL3 PXI TRIG4 or VXI TTL4 IVIDMM_VAL_TTL4 PXI TRIG5 or VXI TTL5 IVIDMM_VAL_TTL5 PXI TRIG6 or VXI TTL6 IVIDMM_VAL_TTL6 PXI TRIG7 or VXI TTL7 IVIDMM_VAL_TTL7 ECL0 IVIDMM_VAL_ECL0 ECL1 IVIDMM_VAL_ECL1 PXI Star IVIDMM_VAL_PXI_STAR RTSI 0 IVIDMM_VAL_RTSI_0 RTSI 1 IVIDMM_VAL_RTSI_1 RTSI 2 IVIDMM_VAL_RTSI_2 RTSI 3 IVIDMM_VAL_RTSI_3 RTSI 4 IVIDMM_VAL_RTSI_4 RTSI 5 IVIDMM_VAL_RTSI_5 RTSI 6 IVIDMM_VAL_RTSI_6    0.0    �    This function configures the polarity of the external trigger source of the DMM.

Note:

(1) This function is part of the IviDmmTriggerSlope [TS] extension group.     �    The ViSession handle that you obtain from the IviDmm_init.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    Pass the polarity of the external trigger slope. The driver sets the IVIDMM_ATTR_TRIGGER_SLOPE attribute to this value. The DMM triggers on either the rising or the falling edge of the external trigger source depending on the value of this attribute.

Defined Values:

IVIDMM_VAL_POSITIVE - The driver triggers on the rising edge of the external trigger.

IVIDMM_VAL_NEGATIVE - The driver triggers on the falling edge of the external trigger.

Default: IVIDMM_VAL_POSITIVE
    ڧ-   �  �    Instrument Handle                 �:#����  �    Status                            �� = � � �    Trigger Slope                          	                      :Positive IVIDMM_VAL_POSITIVE Negative IVIDMM_VAL_NEGATIVE    �    This function configures the attributes for multi-point measurements.  These attributes include the trigger count, sample count, sample trigger and sample interval.

Note:

(1) This function is part of the IviDmmMultiPoint [MP] extension group.     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    Pass the number of triggers you want the DMM to receive before returning to the Idle state.  The driver sets the IVIDMM_ATTR_TRIGGER_COUNT attribute to this value.

Default Value: 1
     �    Pass the number of measurements you want the DMM to take each time it receives a trigger.  The driver sets the IVIDMM_ATTR_SAMPLE_COUNT attribute to this value. 

Default Value: 1
    l    Pass the type of sample trigger you want to use.  The driver sets the IVIDMM_ATTR_SAMPLE_TRIGGER attribute to this value. 

When the DMM takes a measurement and the Sample Count parameter is greater than 1, the DMM does not take the next measurement until the event you specify in the Sample Trigger parameter occurs.

Valid Values:
IVIDMM_VAL_IMMEDIATE     - Immediate
IVIDMM_VAL_EXTERNAL      - External
IVIDMM_VAL_SOFTWARE_TRIG - Software Trigger Function
IVIDMM_VAL_INTERVAL      - Interval
IVIDMM_VAL_TTL0          - PXI TRIG0 or VXI TTL0
IVIDMM_VAL_TTL1          - PXI TRIG1 or VXI TTL1
IVIDMM_VAL_TTL2          - PXI TRIG2 or VXI TTL2
IVIDMM_VAL_TTL3          - PXI TRIG3 or VXI TTL3
IVIDMM_VAL_TTL4          - PXI TRIG4 or VXI TTL4
IVIDMM_VAL_TTL5          - PXI TRIG5 or VXI TTL5
IVIDMM_VAL_TTL6          - PXI TRIG6 or VXI TTL6
IVIDMM_VAL_TTL7          - PXI TRIG7 or VXI TTL7
IVIDMM_VAL_ECL0          - VXI ECL0
IVIDMM_VAL_ECL1          - VXI ECL1
IVIDMM_VAL_PXI_STAR      - PXI Star
IVIDMM_VAL_RTSI_0        - RTSI line 0
IVIDMM_VAL_RTSI_1        - RTSI line 1
IVIDMM_VAL_RTSI_2        - RTSI line 2
IVIDMM_VAL_RTSI_3        - RTSI line 3
IVIDMM_VAL_RTSI_4        - RTSI line 4
IVIDMM_VAL_RTSI_5        - RTSI line 5
IVIDMM_VAL_RTSI_6        - RTSI line 6

Default Value: IVIDMM_VAL_IMMEDIATE

Notes:

(1) IVIDMM_VAL_IMMEDIATE - The DMM takes the next measurement immediately.  The DMM does not wait for a trigger of any kind.

(2) IVIDMM_VAL_EXTERNAL - The DMM takes the next measurement when a trigger occurs on the external trigger input.

(3) IVIDMM_VAL_SOFTWARE_TRIG - The DMM takes the next measurement when you call the IviDmm_SendSoftwareTrigger function.

(4) IVIDMM_VAL_INTERVAL - The DMM takes the next measurement after waiting the length of time you specify in the Sample Interval parameter.

(5) This parameter is ignored if the value of the 'Sample Count' parameter is 1.    �    Pass the length of time you want the DMM to wait between samples.  Express this value in seconds.  The driver sets the IVIDMM_ATTR_SAMPLE_INTERVAL attribute to this value. 

If the Sample Count parameter is greater than 1 and the Sample Trigger parameter is set to IVIDMM_VAL_INTERVAL, the DMM waits between measurements for the length of time you specify with this parameter. Otherwise, this attribute does not affect the behavior of the instrument.

Default Value: 0.0

Notes:

(1) This parameter is ignored if the value of the 'Sample Count' parameter is 1.

(2) This parameter is ignored if the value of the 'Sample Trigger' parameter is not IVIDMM_VAL_INTERVAL.    �-   �  �    Instrument Handle                 �t#����  �    Status                            � = l �  �    Trigger Count                     �� =. �  �    Sample Count                      � z l � �    Sample Trigger                    � z. �  �    Sample Interval (sec)                  	           1    1              �Immediate IVIDMM_VAL_IMMEDIATE External IVIDMM_VAL_EXTERNAL Software Trigger Function IVIDMM_VAL_SOFTWARE_TRIG Interval IVIDMM_VAL_INTERVAL PXI TRIG0 or VXI TTL0 IVIDMM_VAL_TTL0 PXI TRIG1 or VXI TTL1 IVIDMM_VAL_TTL1 PXI TRIG2 or VXI TTL2 IVIDMM_VAL_TTL2 PXI TRIG3 or VXI TTL3 IVIDMM_VAL_TTL3 PXI TRIG4 or VXI TTL4 IVIDMM_VAL_TTL4 PXI TRIG5 or VXI TTL5 IVIDMM_VAL_TTL5 PXI TRIG6 or VXI TTL6 IVIDMM_VAL_TTL6 PXI TRIG7 or VXI TTL7 IVIDMM_VAL_TTL7 ECL0 IVIDMM_VAL_ECL0 ECL1 IVIDMM_VAL_ECL1 PXI Star IVIDMM_VAL_PXI_STAR RTSI 0 IVIDMM_VAL_RTSI_0 RTSI 1 IVIDMM_VAL_RTSI_1 RTSI 2 IVIDMM_VAL_RTSI_2 RTSI 3 IVIDMM_VAL_RTSI_3 RTSI 4 IVIDMM_VAL_RTSI_4 RTSI 5 IVIDMM_VAL_RTSI_5 RTSI 6 IVIDMM_VAL_RTSI_6    0.0    �    This function configures the destination of the measurement-complete signal. This signal is commonly referred to as Voltmeter Complete.

Note:

(1) This function is part of the IviDmmMultiPoint [MP] extension group.     �    The ViSession handle that you obtain from the IviDmm_init.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    Specify the destination of the measurement-complete signal. The driver sets the IVIDMM_ATTR_MEAS_COMPLETE_DEST attribute to this value. 

Defined Values:
IVIDMM_VAL_NONE     - None
IVIDMM_VAL_EXTERNAL - External
IVIDMM_VAL_TTL0     - PXI TRIG0 or VXI TTL0
IVIDMM_VAL_TTL1     - PXI TRIG1 or VXI TTL1
IVIDMM_VAL_TTL2     - PXI TRIG2 or VXI TTL2
IVIDMM_VAL_TTL3     - PXI TRIG3 or VXI TTL3
IVIDMM_VAL_TTL4     - PXI TRIG4 or VXI TTL4
IVIDMM_VAL_TTL5     - PXI TRIG5 or VXI TTL5
IVIDMM_VAL_TTL6     - PXI TRIG6 or VXI TTL6
IVIDMM_VAL_TTL7     - PXI TRIG7 or VXI TTL7
IVIDMM_VAL_ECL0     - VXI ECL0
IVIDMM_VAL_ECL1     - VXI ECL1
IVIDMM_VAL_PXI_STAR - PXI Star
IVIDMM_VAL_RTSI_0   - RTSI line 0
IVIDMM_VAL_RTSI_1   - RTSI line 1
IVIDMM_VAL_RTSI_2   - RTSI line 2
IVIDMM_VAL_RTSI_3   - RTSI line 3
IVIDMM_VAL_RTSI_4   - RTSI line 4
IVIDMM_VAL_RTSI_5   - RTSI line 5
IVIDMM_VAL_RTSI_6   - RTSI line 6

Default Value:  IVIDMM_VAL_NONE

Notes:

(1) This signal is commonly referred to as Voltmeter Complete.
    ��-   �  �    Instrument Handle                 �I#����  �    Status                           � = � � �    Meas Complete Destination              	                     XNone IVIDMM_VAL_NONE External IVIDMM_VAL_EXTERNAL PXI TRIG0 or VXI TTL0 IVIDMM_VAL_TTL0 PXI TRIG1 or VXI TTL1 IVIDMM_VAL_TTL1 PXI TRIG2 or VXI TTL2 IVIDMM_VAL_TTL2 PXI TRIG3 or VXI TTL3 IVIDMM_VAL_TTL3 PXI TRIG4 or VXI TTL4 IVIDMM_VAL_TTL4 PXI TRIG5 or VXI TTL5 IVIDMM_VAL_TTL5 PXI TRIG6 or VXI TTL6 IVIDMM_VAL_TTL6 PXI TRIG7 or VXI TTL7 IVIDMM_VAL_TTL7 ECL0 IVIDMM_VAL_ECL0 ECL1 IVIDMM_VAL_ECL1 PXI Star IVIDMM_VAL_PXI_STAR RTSI 0 IVIDMM_VAL_RTSI_0 RTSI 1 IVIDMM_VAL_RTSI_1 RTSI 2 IVIDMM_VAL_RTSI_2 RTSI 3 IVIDMM_VAL_RTSI_3 RTSI 4 IVIDMM_VAL_RTSI_4 RTSI 5 IVIDMM_VAL_RTSI_5 RTSI 6 IVIDMM_VAL_RTSI_6    �    This function configures the auto zero mode of the DMM.

Note:

(1) This function is part of the IviDmmAutoZero [AZ] extension group.     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    2    Specify the auto-zero mode. The driver sets the IVIDMM_ATTR_AUTO_ZERO attribute to this value.

When the auto-zero mode is enabled, the DMM internally disconnects the input signal and takes a Zero Reading. The DMM then subtracts the Zero Reading from the measurement. This prevents offset voltages present in the instrument's input circuitry from affecting measurement accuracy.

Defined Values:

IVIDMM_VAL_AUTO_ZERO_ON - Configures the DMM to take a Zero Reading for each measurement. The DMM subtracts the Zero Reading from the value it measures.

IVIDMM_VAL_AUTO_ZERO_OFF - Disables the auto-zero feature.

IVIDMM_VAL_AUTO_ZERO_ONCE - Configures the DMM to take a Zero Reading immediately. The DMM then subtracts this Zero Reading from all subsequent values it measures.

Default Value: IVIDMM_VAL_AUTO_ZERO_OFF
   �-   �  �    Instrument Handle                A#����  �    Status                           � = � � �    Auto Zero Mode                         	                     WOn IVIDMM_VAL_AUTO_ZERO_ON Off IVIDMM_VAL_AUTO_ZERO_OFF Once IVIDMM_VAL_AUTO_ZERO_ONCE    �    This function configures the power line frequency of the DMM.

Note:

(1) This function is part of the IviDmmPowerLineFrequency [PLF] extension group.     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    Specify the power line frequency in Hertz. The driver sets the IVIDMM_ATTR_POWERLINE_FREQ attribute to this value.

Default Value: 60.0   �-   �  �    Instrument Handle                �#����  �    Status                            < = � �  �    Power Line Frequency                   	           60.0    �    This function returns the actual range the DMM is currently using, even while it is auto-ranging.

Note: 

(1) This function is part of the IviDmmAutoRangeValue [ARV] extension group.
     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    Returns the value of the IVIDMM_ATTR_AUTO_RANGE_VALUE attribute.  

The units of the returned value depend on the value of the IVIDMM_ATTR_FUNCTION attribute.

   "F-   �  �    Instrument Handle                "�#����  �    Status                           )� = � �  �    Actual Range                           	           	           �    This function returns additional information about the state of the instrument. Specifically, it returns the aperture time and the aperture time units.

Note: 

(1) This function is part of the IviDmmDeviceInfo [DI] extension group.
     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    Returns the value of the IVIDMM_ATTR_APERTURE_TIME attribute.  

The units of this attribute depend on the value of the IVIDMM_ATTR_APERTURE_TIME_UNITS attribute.     �    Returns the value of the IVIDMM_ATTR_APERTURE_TIME_UNITS attribute.

Defined Return Values:

IVIDMM_VAL_SECONDS           - Seconds
IVIDMM_VAL_POWER_LINE_CYCLES - Powerline cycles
   +�-   �  �    Instrument Handle                ,�#����  �    Status                           3` = | �  �    Aperture Time                    4 =. �  �    Aperture Time Units                    	           	           	           �    This function sets the value of a ViInt32 attribute.

This is a low-level function that you can use to set the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    C    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViInt32 type. 
  If you choose to see all IVI attributes, the data types appear
  to the right of the attribute names in the list box.  The data
  types that are not consistent with this function are dim.
  If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
     p    DMM attributes are not channel-based. Pass VI_NULL or an empty string for this parameter.

Default Value:  ""
   :�-   �  �    Instrument Handle                ;j#����  �    Status                           B � � �  �    Attribute Value                 ���� � ���                                          D0 = � � �    Attribute ID                     I{ =  �  �    Channel Name                           	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViReal64 attribute.

This is a low-level function that you can use to set the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
            Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    E    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViReal64 
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
     p    DMM attributes are not channel-based. Pass VI_NULL or an empty string for this parameter.

Default Value:  ""
   P}-   �  �    Instrument Handle                Q3#����  �    Status                           W� � � �  �    Attribute Value                 ���� � ���                                          Y� = � � �    Attribute ID                     _J =  �  �    Channel Name                           	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViString attribute.

This is a low-level function that you can use to set the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
            Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    E    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViString 
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
     p    DMM attributes are not channel-based. Pass VI_NULL or an empty string for this parameter.

Default Value:  ""
   fL-   �  �    Instrument Handle                g#����  �    Status                           m� � � �  �    Attribute Value                 ���� � ���                                          o� = � � �    Attribute ID                     u =  �  �    Channel Name                           	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViBoolean attribute.

This is a low-level function that you can use to set the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
            Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    E    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViBoolean
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
     p    DMM attributes are not channel-based. Pass VI_NULL or an empty string for this parameter.

Default Value:  ""
   |-   �  �    Instrument Handle                |�#����  �    Status                           �� � � �  �    Attribute Value                 ���� � ���                                          �� = � � �    Attribute ID                     �� =  �  �    Channel Name                           	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViSession attribute.

This is a low-level function that you can use to set the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
            Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none     p    DMM attributes are not channel-based. Pass VI_NULL or an empty string for this parameter.

Default Value:  ""
    E    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViSession
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
   ��-   �  �    Instrument Handle                ��#����  �    Status                           �Q � � �  �    Attribute Value                  �l =  �  �    Channel Name                     �� = � � �    Attribute ID                    ���� � ���                                                	               ""                0    .Press <ENTER> for a list of 
value constants.   �    This function queries the value of a ViInt32 attribute.

This is a low-level function that you can use to get the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        �    Returns the current value of the attribute.  Pass the address of a ViInt32 variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  
     p    DMM attributes are not channel-based. Pass VI_NULL or an empty string for this parameter.

Default Value:  ""
    �    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Help text is
  shown for each attribute.  Select an attribute by 
  double-clicking on it or by selecting it and then pressing
  <ENTER>.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViInt32 type. 
  If you choose to see all IVI attributes, the data types appear
  to the right of the attribute names in the list box.  The data
  types that are not consistent with this function are dim.
  If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
   ��-   �  �    Instrument Handle                �m#����  �    Status                           � � � �  �    Attribute Value                  �� =  �  �    Channel Name                     �J = � � �    Attribute ID                           	           	            ""                0   �    This function queries the value of a ViReal64 attribute.

This is a low-level function that you can use to get the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        �    Returns the current value of the attribute.  Pass the address of a ViReal64 variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  
     p    DMM attributes are not channel-based. Pass VI_NULL or an empty string for this parameter.

Default Value:  ""
    �    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Help text is
  shown for each attribute.  Select an attribute by 
  double-clicking on it or by selecting it and then pressing
  <ENTER>.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViReal64
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
   �-   �  �    Instrument Handle                ��#����  �    Status                           �z � � �  �    Attribute Value                  �1 =  �  �    Channel Name                     �� = � � �    Attribute ID                           	           	           ""                0   �    This function queries the value of a ViString attribute.

This is a low-level function that you can use to get the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

You must provide a ViChar array to serve as a buffer for the value.  You pass the number of bytes in the buffer as the Buffer Size parameter.  If the current value of the attribute, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size-1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you want to call this function just to get the required buffer size, you can pass 0 for the Buffer Size and VI_NULL for the Attribute Value buffer.  

If you want the function to fill in the buffer regardless of the number of bytes in the value, pass a negative number for the Buffer Size parameter.

If state caching is available for the instrument driver and you have not disabled caching through MAX or through the optionsString parameter of the IviDmm_InitWithOptions function, the IVI Engine caches the string between multiple invokes of this function until the user fetches the whole string. Otherwise, this function queries the instrument to refresh the string attribute value in each function call.     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    ]    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the attribute, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        The buffer in which the function returns the current value of the attribute.  The buffer must be of type ViChar and have at least as many bytes as indicated in the Buffer Size parameter.

If the current value of the attribute, including the terminating NUL byte, contains more bytes that you indicate in this parameter, the function copies Buffer Size-1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you specify 0 for the Buffer Size parameter, you can pass VI_NULL for this parameter.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  
     p    DMM attributes are not channel-based. Pass VI_NULL or an empty string for this parameter.

Default Value:  ""
    �    Pass the number of bytes in the ViChar buffer you specify for the Attribute Value parameter.  

If the current value of the attribute, including the terminating NUL byte, contains more bytes that you indicate in this parameter, the function copies Buffer Size-1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Attribute Value buffer parameter.

Default Value:  512
    �    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Help text is
  shown for each attribute.  Select an attribute by 
  double-clicking on it or by selecting it and then pressing
  <ENTER>.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViString
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
   ́-   �  �    Instrument Handle                �7#����  �    Status or Required Size          ՜ � L � �    Attribute Value                  �� =  �  �    Channel Name                     �8 =� �  �    Buffer Size                      �/ = � � �    Attribute ID                           	           	            ""    512                0   �    This function queries the value of a ViBoolean attribute.

This is a low-level function that you can use to get the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        �    Returns the current value of the attribute.  Pass the address of a ViBoolean variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  
     p    DMM attributes are not channel-based. Pass VI_NULL or an empty string for this parameter.

Default Value:  ""
    �    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Help text is
  shown for each attribute.  Select an attribute by 
  double-clicking on it or by selecting it and then pressing
  <ENTER>.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViBoolean
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
   �8-   �  �    Instrument Handle                ��#����  �    Status                           � � � �  �    Attribute Value                  �U =  �  �    Channel Name                     �� = � � �    Attribute ID                           	           	            ""                0   �    This function queries the value of a ViSession attribute.

This is a low-level function that you can use to get the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        �    Returns the current value of the attribute.  Pass the address of a ViSession variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  
     p    DMM attributes are not channel-based. Pass VI_NULL or an empty string for this parameter.

Default Value:  ""
    �    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Help text is
  shown for each attribute.  Select an attribute by 
  double-clicking on it or by selecting it and then pressing
  <ENTER>.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViSession
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
   ��-   �  �    Instrument Handle                �Q#����  �    Status                           �  � � �  �    Attribute Value                  �� =  �  �    Channel Name                      0 = � � �    Attribute ID                           	           	            ""                0    S    This function checks the validity of a value you specify for a ViInt32 attribute.     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        '    Pass the value that you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none     p    DMM attributes are not channel-based. Pass VI_NULL or an empty string for this parameter.

Default Value:  ""
    B    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViInt32 type.
  If you choose to see all IVI attributes, the data types appear
  to the right of the attribute names in the list box.  The data
  types that are not consistent with this function are dim.
  If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
   l-   �  �    Instrument Handle                "#����  �    Status                           � � � �  �    Attribute Value                    =  �  �    Channel Name                    ���� � ���                                          x = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    T    This function checks the validity of a value you specify for a ViReal64 attribute.     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        (    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none     p    DMM attributes are not channel-based. Pass VI_NULL or an empty string for this parameter.

Default Value:  ""
    D    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViReal64
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
   �-   �  �    Instrument Handle                o#����  �    Status                            � � �  �    Attribute Value                  !N =  �  �    Channel Name                    ���� � ���                                          !� = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    T    This function checks the validity of a value you specify for a ViString attribute.     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        (    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none     p    DMM attributes are not channel-based. Pass VI_NULL or an empty string for this parameter.

Default Value:  ""
    D    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViString
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
   )	-   �  �    Instrument Handle                )�#����  �    Status                           0n � � �  �    Attribute Value                  2� =  �  �    Channel Name                    ���� � ���                                          3 = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    U    This function checks the validity of a value you specify for a ViBoolean attribute.     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        (    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none     p    DMM attributes are not channel-based. Pass VI_NULL or an empty string for this parameter.

Default Value:  ""
    E    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViBoolean
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
   :Z-   �  �    Instrument Handle                ;#����  �    Status                           A� � � �  �    Attribute Value                  C� =  �  �    Channel Name                    ���� � ���                                          Dg = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    U    This function checks the validity of a value you specify for a ViSession attribute.     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        (    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none     p    DMM attributes are not channel-based. Pass VI_NULL or an empty string for this parameter.

Default Value:  ""
    E    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViSession
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
   K�-   �  �    Instrument Handle                Lb#����  �    Status                           S � � �  �    Attribute Value                  UA =  �  �    Channel Name                    ���� � ���                                          U� = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0   {    This function initiates a measurement, waits until the DMM has returned to the Idle state, and returns the measured value.

Notes:

(1) After this function executes, the Reading parameter contains  an actual reading or a value indicating that an over-range condition occurred.

(2) If an over-range condition occurs, the Reading parameter contains an IEEE defined NaN (Not a Number) value and the function returns IVIDMM_WARN_OVER_RANGE (0x3FFA2001).  

(3) You can test the measurement value for an over-range condition by calling the IviDmm_IsOverRange function.

(4) This function performs interchangeability checking when the IVIDMM_ATTR_INTERCHANGE_CHECK attribute is set to VI_TRUE.  If the IVIDMM_ATTR_SPY attribute is set to VI_TRUE, you use the NI I/O Trace utility to view interchangeability warnings.  You use the IviDmm_GetNextInterchangeWarning function to retrieve interchangeability warnings when the IVIDMM_ATTR_SPY attribute is set to VI_FALSE.  For more information about interchangeability checking, refer to the help text for the IVIDMM_ATTR_INTERCHANGE_CHECK attribute.

(5) The class driver returns a simulated measurement when this  function is called and the IVIDMM_ATTR_SIMULATE attribute is set to VI_TRUE and the IVIDMM_ATTR_USE_SPECIFIC_SIMULATION attribute is set to VI_FALSE.  For information on how to configure a simulated measurement, refer to the online help manual.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
         �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    @    Returns the measured value.  The value you specify for the Measurement Function parameter of the IviDmm_ConfigureMeasurement function determines the units of this parameter as shown in the following table.

  DC Volts           - volts
  AC Volts           - volts
  DC Current         - amperes
  AC Current         - amperes
  2-Wire Resistance  - ohms
  4-Wire Resistance  - ohms
  AC plus DC Volts   - volts
  AC plus DC Current - amperes
  Temperature        - celsius
  Frequency          - hertz
  Period             - seconds

Notes:

(1) If an over-range condition occurs, the Reading parameter contains an IEEE defined NaN (Not a Number) value and the function returns IVIDMM_WARN_OVER_RANGE (0x3FFA2001).  

(2) You can test the measurement value for an over-range condition by calling the IviDmm_IsOverRange function.
    �    Pass the maximum length of time in which to allow the read operation to complete.  Express this value in milliseconds.  

If the operation does not complete within this time interval, the function returns the IVIDMM_ERROR_MAX_TIME_EXCEEDED (0xBFFA2003) error code.  When this occurs, you can call IviDmm_Abort to cancel the read operation and return the instrument to the Idle state.  

Defined Values:
IVIDMM_VAL_MAX_TIME_INFINITE  - Wait indefinitely for a timeout.
IVIDMM_VAL_MAX_TIME_IMMEDIATE - Do not wait for a timeout.

Default Value: 5000

Notes:

(1) The Maximum Time parameter affects only this function.  It has no effect on other timeout parameters or attributes.
   b$#����  �    Status                           h�-   �  �    Instrument Handle                i� =0 �  �    Reading                          l� = l �  �    Maximum Time (ms)                  	               	           5000   �    This function initiates the measurement, waits for the DMM to return to the Idle state, and returns an array of measured values.  The number of measurements the DMM takes is determined by the values you specify for the Trigger Count and Sample Count parameters of the IviDmm_ConfigureMultiPoint function.

Notes:

(1) This function is part of the IviDmmMultiPoint [MP] extension group.

(2) After this function executes, each element in the Reading Array parameter is an actual reading or a value indicating that an over-range condition occurred.

(3) If an over-range condition occurs, the corresponding Reading Array element contains an IEEE defined NaN (Not a Number) value and the function returns IVIDMM_WARN_OVER_RANGE (0x3FFA2001). 

(4) You can test each element in the Reading Array parameter for an over-range condition by calling the IviDmm_IsOverRange function.

(5) This function performs interchangeability checking when the IVIDMM_ATTR_INTERCHANGE_CHECK attribute is set to VI_TRUE.  If the IVIDMM_ATTR_SPY attribute is set to VI_TRUE, you use the NI I/O Trace utility to view interchangeability warnings.  You use the IviDmm_GetNextInterchangeWarning function to retrieve interchangeability warnings when the IVIDMM_ATTR_SPY attribute is set to VI_FALSE.  For more information about interchangeability checking, refer to the help text for the IVIDMM_ATTR_INTERCHANGE_CHECK attribute.

(6) The class driver initiates an array of simulated measurements when this function is called and the IVIDMM_ATTR_SIMULATE attribute is set to VI_TRUE and the IVIDMM_ATTR_USE_SPECIFIC_SIMULATION attribute is set to VI_FALSE.  For information on how to configure a simulated measurement, refer to the online help manual.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
         �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns an array of the measured values.  The value you specify for the Measurement Function parameter of the IviDmm_ConfigureMeasurement function determines the units of this parameter as shown in the following table:

  DC Volts           - volts
  AC Volts           - volts
  DC Current         - amperes
  AC Current         - amperes
  2-Wire Resistance  - ohms
  4-Wire Resistance  - ohms
  AC plus DC Volts   - volts
  AC plus DC Current - amperes
  Temperature        - celsius
  Frequency          - hertz
  Period             - seconds

Notes:

(1) The size of the Reading Array must be at least the size you specify for the Array Size parameter.

(2) If an over-range condition occurs, the corresponding Reading Array element contains an IEEE defined NaN (Not a Number) value and the function returns IVIDMM_WARN_OVER_RANGE (0x3FFA2001). 

(3) You can test each element in the Reading Array parameter for an over-range condition by calling the IviDmm_IsOverRange function.
     S    Pass the number of elements in the Reading Array parameter.

Default Value: None
     ]    Indicates the number of measured values the function places in the Reading Array parameter.    �    Pass the maximum length of time in which to allow the multi-point read operation to complete.  Express this value in milliseconds.  

If the operation does not complete within this time interval, the function returns the IVIDMM_ERROR_MAX_TIME_EXCEEDED (0xBFFA2003) error code.  When this occurs, you can call IviDmm_Abort to cancel the multi-point read operation and return the instrument to the Idle state.  

Defined Values:
IVIDMM_VAL_MAX_TIME_INFINITE  - Wait indefinitely for a timeout.
IVIDMM_VAL_MAX_TIME_IMMEDIATE - Do not wait for a timeout.

Default Value: 5000

Notes:

(1) The Maximum Time parameter affects only this function.  It has no effect on other timeout parameters or attributes.
   w<#����  �    Status                           }�-   �  �    Instrument Handle                ~� z0 �  �    Reading Array                    �� =0 �  �    Array Size                       �� �0 �  �    Actual Number of Points          �D = l �  �    Maximum Time (ms)                  	               	                	            5000   k    This function initiates a measurement.  After you call this function, the DMM leaves the Idle state and waits for a trigger.

Notes:

(1) This function does not check the instrument status.   Typically, you call this function only in a sequence of calls to other low-level driver functions.  The sequence performs one operation.  You use the low-level functions to optimize one or more aspects of interaction with the instrument.  If you want to check the instrument status, call the IviDmm_error_query function at the conclusion of the sequence.

(2) This function performs interchangeability checking when the IVIDMM_ATTR_INTERCHANGE_CHECK attribute is set to VI_TRUE.  If the IVIDMM_ATTR_SPY attribute is set to VI_TRUE, you use the NI I/O Trace utility to view interchangeability warnings.  You use the IviDmm_GetNextInterchangeWarning function to retrieve interchangeability warnings when the IVIDMM_ATTR_SPY attribute is set to VI_FALSE.  For more information about interchangeability checking, refer to the help text for the IVIDMM_ATTR_INTERCHANGE_CHECK attribute.

(3) The class driver initiates a simulated measurement when this  function is called and the IVIDMM_ATTR_SIMULATE attribute is set to VI_TRUE and the IVIDMM_ATTR_USE_SPECIFIC_SIMULATION attribute is set to VI_FALSE.  For information on how to configure a simulated measurement, refer to the online help manual.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
         �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   ��#����  �    Status                           ��-   �  �    Instrument Handle                  	              �    This function sends a command to trigger the DMM.  Call this function if you pass IVIDMM_VAL_SOFTWARE_TRIG for the Trigger Source parameter of the IviDmm_ConfigureTrigger function or the Sample Trigger parameter of the IviDmm_ConfigureMultiPoint function.

Notes:

(1) This function is part of the IviDmmSoftwareTrigger [SWT] extension group.

(2) If neither the IVIDMM_ATTR_TRIGGER_SOURCE nor the  IVIDMM_ATTR_SAMPLE_TRIGGER attribute is set to the IVIDMM_VAL_SOFTWARE_TRIG value, this function returns an error.

(3) This function does not check the instrument status.   Typically, you call this function only in a sequence of calls to other low-level driver functions.  The sequence performs one operation.  You use the low-level functions to optimize one or more aspects of interaction with the instrument.  If you want to check the instrument status, call the IviDmm_error_query function at the conclusion of the sequence.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
         �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   �x#����  �    Status                           �'-   �  �    Instrument Handle                  	              C    This function returns the value from a previously initiated measurement.

You must first call the IviDmm_Initiate function to initiate a measurement before calling this function.

Notes:

(1) After this function executes, the Reading parameter contains  an actual reading or a value indicating that an over-range condition occurred.

(2) If an over-range condition occurs, the Reading parameter contains an IEEE defined NaN (Not a Number) value and the function returns IVIDMM_WARN_OVER_RANGE (0x3FFA2001).  

(3) You can test the measurement value for an over-range condition by calling the IviDmm_IsOverRange function.

(4) The class driver returns a simulated measurement when this  function is called and the IVIDMM_ATTR_SIMULATE attribute is set to VI_TRUE and the IVIDMM_ATTR_USE_SPECIFIC_SIMULATION attribute is set to VI_FALSE.  For information on how to configure a simulated measurement, refer to the online help manual.

(5) This function does not check the instrument status.   Typically, you call this function only in a sequence of calls to other low-level driver functions.  The sequence performs one operation.  You use the low-level functions to optimize one or more aspects of interaction with the instrument.  If you want to check the instrument status, call the IviDmm_error_query function at the conclusion of the sequence.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
         �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    @    Returns the measured value.  The value you specify for the Measurement Function parameter of the IviDmm_ConfigureMeasurement function determines the units of this parameter as shown in the following table.

  DC Volts           - volts
  AC Volts           - volts
  DC Current         - amperes
  AC Current         - amperes
  2-Wire Resistance  - ohms
  4-Wire Resistance  - ohms
  AC plus DC Volts   - volts
  AC plus DC Current - amperes
  Temperature        - celsius
  Frequency          - hertz
  Period             - seconds

Notes:

(1) If an over-range condition occurs, the Reading parameter contains an IEEE defined NaN (Not a Number) value and the function returns IVIDMM_WARN_OVER_RANGE (0x3FFA2001).  

(2) You can test the measurement value for an over-range condition by calling the IviDmm_IsOverRange function.
    �    Pass the maximum length of time in which to allow the fetch operation to complete.  Express this value in milliseconds.  

If the operation does not complete within this time interval, the function returns the IVIDMM_ERROR_MAX_TIME_EXCEEDED (0xBFFA2003) error code.  When this occurs, you can call IviDmm_Abort to cancel the fetch operation and return the instrument to the Idle state.  

Defined Values:
IVIDMM_VAL_MAX_TIME_INFINITE  - Wait indefinitely for a timeout.
IVIDMM_VAL_MAX_TIME_IMMEDIATE - Do not wait for a timeout.

Default Value: 5000

Notes:

(1) The Maximum Time parameter affects only this function.  It has no effect on other timeout parameters or attributes.
   ��#����  �    Status                           �Q-   �  �    Instrument Handle                � =0 �  �    Reading                          �O = l �  �    Maximum Time (ms)                  	               	           5000   t    This function returns an array of values from a previously initiated multi-point measurement.  The number of measurements the DMM takes is determined by the values you specify for the Trigger Count and Sample Count parameters of the IviDmm_ConfigureMultiPoint function.

You must first call the IviDmm_Initiate function to initiate a measurement before calling this function.

Notes:

(1) This function is part of the IviDmmMultiPoint [MP] extension group.

(2) After this function executes, each element in the Reading Array parameter is an actual reading or a value indicating that an over-range condition occurred.

(3) If an over-range condition occurs, the corresponding Reading Array element contains an IEEE defined NaN (Not a Number) value and the function returns IVIDMM_WARN_OVER_RANGE (0x3FFA2001). 

(4) You can test each element in the Reading Array parameter for over-range with the IviDmm_IsOverRange function.

(5) The class driver returns a simulated measurement when this  function is called and the IVIDMM_ATTR_SIMULATE attribute is set to VI_TRUE and the IVIDMM_ATTR_USE_SPECIFIC_SIMULATION attribute is set to VI_FALSE.  For information on how to configure a simulated measurement, refer to the online help manual.

(6) This function does not check the instrument status.   Typically, you call this function only in a sequence of calls to other low-level driver functions.  The sequence performs one operation.  You use the low-level functions to optimize one or more aspects of interaction with the instrument.  If you want to check the instrument status, call the IviDmm_error_query function at the conclusion of the sequence.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
         �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns an array of the most recent measurement values.  The value you specify for the Measurement Function parameter of the IviDmm_ConfigureMeasurement function determines the units of this parameter as shown in the following table.

  DC Volts           - volts
  AC Volts           - volts
  DC Current         - amperes
  AC Current         - amperes
  2-Wire Resistance  - ohms
  4-Wire Resistance  - ohms
  AC plus DC Volts   - volts
  AC plus DC Current - amperes
  Temperature        - celsius
  Frequency          - hertz
  Period             - seconds

Notes:

(1) The size of the Reading Array must be at least the size you specify for the Array Size parameter.

(2) If an over-range condition occurs, the corresponding Reading Array element contains an IEEE defined NaN (Not a Number) value and the function returns IVIDMM_WARN_OVER_RANGE (0x3FFA2001). 

(3) You can test each element in the Reading Array parameter for an over-range condition by calling the IviDmm_IsOverRange function.
     S    Pass the number of elements in the Reading Array parameter.

Default Value: None
     ]    Indicates the number of measured values the function places in the Reading Array parameter.    �    Pass the maximum length of time in which to allow the multi-point fetch operation to complete.  Express this value in milliseconds.  

If the operation does not complete within this time interval, the function returns the IVIDMM_ERROR_MAX_TIME_EXCEEDED (0xBFFA2003) error code.  When this occurs, you can call IviDmm_Abort to cancel the multi-point fetch operation and return the instrument to the Idle state.  

Defined Values:
IVIDMM_VAL_MAX_TIME_INFINITE  - Wait indefinitely for a timeout.
IVIDMM_VAL_MAX_TIME_IMMEDIATE - Do not wait for a timeout.

Default Value: 5000

Notes:

(1) The Maximum Time parameter affects only this function.  It has no effect on other timeout parameters or attributes.
   �t#����  �    Status                           �#-   �  �    Instrument Handle                �� z0 �  �    Reading Array                    �� =0 �  �    Array Size                       �& �0 �  �    Actual Number of Points          Ƌ = l �  �    Maximum Time (ms)                  	               	                	            5000       This function aborts a previously initiated measurement and returns the DMM to the Idle state.

Notes:

(1) This function does not check the instrument status.   Typically, you call this function only in a sequence of calls to other low-level driver functions.  The sequence performs one operation.  You use the low-level functions to optimize one or more aspects of interaction with the instrument.  If you want to check the instrument status, call the IviDmm_error_query function at the conclusion of the sequence.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
         �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   ��#����  �    Status                           Ӄ-   �  �    Instrument Handle                  	              O    This function takes a measurement value that you obtain from one of the Read or Fetch functions and determines if the value is a valid measurement value or a value indicating an over-range condition occurred.  

Notes:

(1) If an over-range condition occurs, the measurement value contains an IEEE defined NaN (Not a Number) value.

    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
         �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns whether the measured value is a valid measurement or a value indicating that an over-range condition occurred.

Valid Return Values:
VI_TRUE  (1) - The value indicates an over-range condition   
               occurred.
VI_FALSE (0) - The value is a valid measurement.

Notes:

(1) If an over-range condition occurs, the measurement value contains an IEEE defined NaN (Not a Number) value.
    w    Pass the measurement value that you obtain from one of the Read or Fetch functions.  The driver tests this value to determine if the value is a valid measurement value or a value indicating that an over-range condition occurred.  

Default Value: None

Notes:

(1) If an over-range condition occurs, the measurement value contains an IEEE defined NaN (Not a Number) value.
   �
#����  �    Status                           ܹ-   �  �    Instrument Handle                �o =2 �  �    Is Over-Range                    � = l �  �    Measurement Value                  	               	              &    This function resets the instrument to a known state and sends initialization commands to the instrument.  The initialization commands set instrument settings such as Headers Off, Short Command form, and Data Transfer Binary to the state necessary for the operation of the instrument driver.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
         �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   �#����  �    Status                           �W-   �  �    Instrument Handle                  	               �    This function resets the instrument and applies initial user specified settings from the Logical Name which was used to initialize the session.    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviDmm_error_message function.  To obtain additional information about the error condition, use the IviDmm_GetError and IviDmm_ClearError functions.

Status Codes:

Status    Description
-------------------------------------------------
       0  No error (the call was successful).

3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

3FFC0102  Reset not supported.

BFFF0000  Miscellaneous or system error occurred.
BFFF000E  Invalid session handle.
BFFF0015  Timeout occurred before operation could complete.
BFFF0034  Violation of raw write protocol occurred.
BFFF0035  Violation of raw read protocol occurred.
BFFF0036  Device reported an output protocol error.
BFFF0037  Device reported an input protocol error.
BFFF0038  Bus error occurred during transfer.
BFFF003A  Invalid setup (attributes are not consistent).
BFFF005F  A "no listeners" condition was detected.
BFFF0060  This interface is not the controller-in-charge.
BFFF0067  Operation is not supported on this session.
     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   � #����  �    Status                           ��-   �  �    Instrument Handle                  	               Z    This function runs the instrument's self test routine and returns the test result(s). 

     �    This control contains the value returned from the instrument self test.  A return value of zero indicates a successful self-test.  For any other code, see the device's operator's manual.

Valid Return Values:
0 - Self test passed
1 - Self test failed
     �    Returns the self-test response string from the instrument. See the device's operation manual for an explanation of the string's contents.

Note:

(1) You must pass a ViChar array with at least 256 bytes.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
         �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   �W =  �  �    Self Test Result                 �\ = � � ,    Self-Test Message                �1#����  �    Status                           ��-   �  �    Instrument Handle                  	           	            	               �    This function places the instrument in a quiescent state where it has minimal or no impact on the system to which it is connected.    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviDmm_error_message function.  To obtain additional information about the error condition, use the IviDmm_GetError and IviDmm_ClearError functions.

Status Codes:

Status    Description
-------------------------------------------------
       0  No error (the call was successful).

3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

3FFC0102  Reset not supported.

BFFF0000  Miscellaneous or system error occurred.
BFFF000E  Invalid session handle.
BFFF0015  Timeout occurred before operation could complete.
BFFF0034  Violation of raw write protocol occurred.
BFFF0035  Violation of raw read protocol occurred.
BFFF0036  Device reported an output protocol error.
BFFF0037  Device reported an input protocol error.
BFFF0038  Bus error occurred during transfer.
BFFF003A  Invalid setup (attributes are not consistent).
BFFF005F  A "no listeners" condition was detected.
BFFF0060  This interface is not the controller-in-charge.
BFFF0067  Operation is not supported on this session.
     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   �#����  �    Status                            �-   �  �    Instrument Handle                  	               P    This function invalidates the cached values of all attributes for the session.    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviDmm_error_message function.  To obtain additional information about the error condition, use the IviDmm_GetError and IviDmm_ClearError functions.

Status Codes:

Status    Description
-------------------------------------------------
       0  No error (the call was successful).

3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

3FFC0102  Reset not supported.

BFFF0000  Miscellaneous or system error occurred.
BFFF000E  Invalid session handle.
BFFF0015  Timeout occurred before operation could complete.
BFFF0034  Violation of raw write protocol occurred.
BFFF0035  Violation of raw read protocol occurred.
BFFF0036  Device reported an output protocol error.
BFFF0037  Device reported an input protocol error.
BFFF0038  Bus error occurred during transfer.
BFFF003A  Invalid setup (attributes are not consistent).
BFFF005F  A "no listeners" condition was detected.
BFFF0060  This interface is not the controller-in-charge.
BFFF0067  Operation is not supported on this session.
     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   K#����  �    Status                           �-   �  �    Instrument Handle                  	               `    This function returns the revision numbers of the instrument driver and instrument firmware.

     �    Returns the instrument driver software revision numbers in the form of a string.

Note:

(1) You must pass a ViChar array with at least 256 bytes.     �    Returns the instrument firmware revision numbers in the form of a string.

Note:

(1) You must pass a ViChar array with at least 256 bytes.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
         �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   � = 3 �  �    Instrument Driver Revision       	$ =6 �  �    Firmware Revision                	�#����  �    Status                           i-   �  �    Instrument Handle                  	            	            	               V    This function reads an error code and a message from the instrument's error queue.

     B    Returns the error code read from the instrument's error queue.

     �    Returns the error message string read from the instrument's error message queue.

Note:

(1) You must pass a ViChar array with at least 256 bytes.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
         �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   y =  �  �    Error Code                       � = � � ,    Error Message                    `#����  �    Status                           -   �  �    Instrument Handle                  	           	            	               n    This function converts a status code returned by an instrument driver function into a user-readable string.     %    Pass the Status parameter that is returned from any of the instrument driver functions.
          
Default Value:  0  (VI_SUCCESS)
          
IviDmm Status Codes:
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Over range condition.
          
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
IVI Engine Status Codes:
Status    Description
-------------------------------------------------
ERRORS:
BFFA0001  Instrument error. Call IviDmm_error_query.
BFFA0002  Cannot open file.
BFFA0003  Error reading from file.
BFFA0004  Error writing to file.
BFFA0005  Driver module file not found.
BFFA0006  Cannot open driver module file for reading.
BFFA0007  Driver module has invalid file format or invalid data.
BFFA0008  Driver module contains undefined references.
BFFA0009  Cannot find function in driver module.
BFFA000A  Failure loading driver module.
BFFA000B  Invalid path name.
BFFA000C  Invalid attribute.
BFFA000D  IVI attribute is not writable.
BFFA000E  IVI attribute is not readable.
BFFA000F  Invalid parameter.
BFFA0010  Invalid value.
BFFA0011  Function not supported.
BFFA0012  Attribute not supported.
BFFA0013  Value not supported.
BFFA0014  Invalid type.
BFFA0015  Types do not match.
BFFA0016  Attribute already has a value waiting to be updated.
BFFA0017  Specified item already exists.
BFFA0018  Not a valid configuration.
BFFA0019  Requested item does not exist or value not available.
BFFA001A  Requested attribute value not known.
BFFA001B  No range table.
BFFA001C  Range table is invalid.
BFFA001D  Object or item is not initialized.
BFFA001E  Non-interchangeable behavior.
BFFA001F  No channel table has been built for the session.
BFFA0020  Channel name specified is not valid.
BFFA0021  Unable to allocate system resource.
BFFA0022  Permission to access file was denied.
BFFA0023  Too many files are already open.
BFFA0024  Unable to create temporary file in target directory.
BFFA0025  All temporary filenames already used.
BFFA0026  Disk is full.
BFFA0027  Cannot find configuration file on disk.
BFFA0028  Cannot open configuration file.
BFFA0029  Error reading configuration file.
BFFA002A  Invalid ViInt32 value in configuration file.
BFFA002B  Invalid ViReal64 value in configuration file.
BFFA002C  Invalid ViBoolean value in configuration file.
BFFA002D  Entry missing from configuration file.
BFFA002E  Initialization failed in driver DLL.
BFFA002F  Driver module has unresolved external reference.
BFFA0030  Cannot find CVI Run-Time Engine.
BFFA0031  Cannot open CVI Run-Time Engine.
BFFA0032  CVI Run-Time Engine has invalid format.
BFFA0033  CVI Run-Time Engine is missing required function(s).
BFFA0034  CVI Run-Time Engine initialization failed.
BFFA0035  CVI Run-Time Engine has unresolved external reference.
BFFA0036  Failure loading CVI Run-Time Engine.
BFFA0037  Cannot open DLL for read exports.
BFFA0038  DLL file is corrupt.
BFFA0039  No DLL export table in DLL.
BFFA003A  Unknown attribute name in default configuration file.
BFFA003B  Unknown attribute value in default configuration file.
BFFA003C  Memory pointer specified is not known.
BFFA003D  Unable to find any channel strings.
BFFA003E  Duplicate channel string.
BFFA003F  Duplicate virtual channel name.
BFFA0040  Missing virtual channel name.
BFFA0041  Bad virtual channel name.
BFFA0042  Unassigned virtual channel name.
BFFA0043  Bad virtual channel assignment.
BFFA0044  Channel name required.
BFFA0045  Channel name not allowed.
BFFA0046  Attribute not valid for channel.
BFFA0047  Attribute must be channel based.
BFFA0048  Channel already excluded.
BFFA0049  Missing option name (nothing before the '=').
BFFA004A  Missing option value (nothing after the '=').
BFFA004B  Bad option name.
BFFA004C  Bad option value.
BFFA004D  Operation only valid on a class driver session.
BFFA004E  "ivi.ini" filename is reserved.
BFFA004F  Duplicate run-time configuration entry.
BFFA0050  Index parameter is one-based.
BFFA0051  Index parameter is too high.
BFFA0052  Attribute is not cacheable.
BFFA0053  You cannot export a ViAddr attribute to the end-user.
BFFA0054  Bad channel string in channel string list.
BFFA0055  Bad prefix name in default configuration file.
         
VISA Status Codes:
Status    Description
-------------------------------------------------
WARNINGS:
3FFF0002 Event enabled for one or more specified mechanisms.
3FFF0003 Event disabled for one or more specified mechanisms.
3FFF0004 Successful, but queue already empty.
3FFF0005 Specified termination character was read.
3FFF0006 Number of bytes transferred equals input count.
3FFF0077 Configuration non-existant or could not be loaded.
3FFF007D Open successful, but the device not responding.
3FFF0080 Wait successful, but more event objects available.
3FFF0082 Specified object reference is uninitialized.
3FFF0084 Attribute value not supported.
3FFF0085 Status code could not be interpreted.
3FFF0088 Specified I/O buffer type not supported.
3FFF0098 Successful,  but invoke no handlers for this event.
3FFF0099 Successful but session has nested shared locks.
3FFF009A Successful but session has nested exclusive locks.
3FFF009B Successful but operation not asynchronous.
         
ERRORS:
BFFF0000 Unknown system error (miscellaneous error).
BFFF000E Session or object reference is invalid.
BFFF000F Resource is locked.
BFFF0010 Invalid expression specified for search.
BFFF0011 Resource is not present in the system.
BFFF0012 Invalid resource reference specified.  Parsing error.
BFFF0013 Invalid access mode.
BFFF0015 Timeout expired before operation completed.
BFFF0016 Unable to deallocate session data structures.
BFFF001B Specified degree is invalid.
BFFF001C Specified job identifier is invalid.
BFFF001D Attribute is not supported by the referenced object.
BFFF001E Attribute state not supported by the referenced object.
BFFF001F Specified attribute is read-only.
BFFF0020 Lock type lock not supported by this resource.
BFFF0021 Invalid access key.
BFFF0026 Specified event type not supported by the resource.
BFFF0027 Invalid mechanism specified.
BFFF0028 A handler was not installed.
BFFF0029 Handler reference either invalid or was not installed.
BFFF002A Specified event context invalid.
BFFF002D Event queue for specified type has overflowed.
BFFF002F Event type must be enabled in order to receive.
BFFF0030 User abort during transfer.
BFFF0034 Violation of raw write protocol during transfer.
BFFF0035 Violation of raw read protocol during transfer.
BFFF0036 Device reported output protocol error during transfer.
BFFF0037 Device reported input protocol error during transfer.
BFFF0038 Bus error during transfer.
BFFF0039 Unable to queue asynchronous operation.
BFFF003A Unable to start operation because setup is invalid.
BFFF003B Unable to queue the asynchronous operation.
BFFF003C Insufficient resources to perform memory allocation.
BFFF003D Invalid buffer mask specified.
BFFF003E I/O error.
BFFF003F Format specifier invalid.
BFFF0041 Format specifier not supported.
BFFF0042 Trigger line is currently in use.
BFFF004A Service request not received for the session.
BFFF004E Invalid address space specified.
BFFF0051 Invalid offset specified.
BFFF0052 Invalid access width specified.
BFFF0054 Offset not accessible from this hardware.
BFFF0055 Source and destination widths are different.
BFFF0057 Session not currently mapped.
BFFF0059 Previous response still pending.
BFFF005F No listeners condition detected.
BFFF0060 Interface not currently the controller in charge.
BFFF0061 Interface not the system controller.
BFFF0067 Session does not support this operation.
BFFF006A A parity error occurred during transfer.
BFFF006B A framing error occurred during transfer.
BFFF006C An overrun error occurred during transfer.
BFFF0070 Offset not properly aligned for operation access width.
BFFF0071 Specified user buffer not valid.
BFFF0072 Resource valid, but VISA cannot access it.
BFFF0076 Width not supported by this hardware.
BFFF0078 Invalid parameter value, parameter unknown.
BFFF0079 Invalid protocol.
BFFF007B Invalid window size.
BFFF0080 Session currently contains a mapped window.
BFFF0081 Operation not implemented.
BFFF0083 Invalid length.
BFFF0091 Invalid mode.
BFFF009C Session did not have a lock on the resource.
BFFF009D The device does not export any memory.
BFFF009E VISA-required code library not located or not loaded.
         
VXIPnP Driver Status Codes:
Status    Description
-------------------------------------------------
WARNINGS:
3FFC0101  Instrument does not have ID Query capability.
3FFC0102  Instrument does not have Reset capability.
3FFC0103  Instrument does not have Self-Test capability.
3FFC0104  Instrument does not have Error Query capability.
3FFC0105  Instrument does not have Revision Query capability.
          
ERRORS:
BFFC0001  Parameter 1 out of range, or error trying to set it.
BFFC0002  Parameter 2 out of range, or error trying to set it.
BFFC0003  Parameter 3 out of range, or error trying to set it.
BFFC0004  Parameter 4 out of range, or error trying to set it.
BFFC0005  Parameter 5 out of range, or error trying to set it.
BFFC0006  Parameter 6 out of range, or error trying to set it.
BFFC0007  Parameter 7 out of range, or error trying to set it.
BFFC0008  Parameter 8 out of range, or error trying to set it.
BFFC0011  Instrument failed the ID Query.
BFFC0012  Invalid response from instrument.
     �    Returns the user-readable message string that corresponds to the status code you specify.

Note:

(1) You must pass a ViChar array with at least 256 bytes.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
            The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

You can pass VI_NULL for this parameter.  This is useful when one of the initialize functions fail.

Default Value:  VI_NULL
   7 =  �  h    Error Code                       AG = � � �    Error Message                    A�#����  �    Status                           H�-   �  �    Instrument Handle                  0    	            	           VI_NULL    h    This function returns the C session instrument handle you use to call the specific driver's functions.     Z    Returns the C session instrument handle you use to call the specific driver's functions.     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
       K& = � �  �    Specific Driver C Handle         K�-   �  �    Instrument Handle                L>#����  �    Status                             	               	          �    This function retrieves and then clears the IVI error information for the session or the current execution thread. One exception exists: If the BufferSize parameter is 0, the function does not clear the error information. By passing 0 for the buffer size, the caller can ascertain the buffer size required to get the entire error description string and then call the function again with a sufficiently large buffer.

If the user specifies a valid IVI session for the InstrumentHandle parameter, Get Error retrieves and then clears the error information for the session.  If the user passes VI_NULL for the InstrumentHandle parameter, this function retrieves and then clears the error information for the current execution thread.  If the InstrumentHandle parameter is an invalid session, the function does nothing and returns an error. Normally, the error information describes the first error that occurred since the user last called IviDmm_GetError or IviDmm_ClearError.
    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviDmm_error_message function.  To obtain additional information about the error condition, use the IviDmm_GetError and IviDmm_ClearError functions.

Status Codes:

Status    Description
-------------------------------------------------
       0  No error (the call was successful).

3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

3FFC0102  Reset not supported.

BFFF0000  Miscellaneous or system error occurred.
BFFF000E  Invalid session handle.
BFFF0015  Timeout occurred before operation could complete.
BFFF0034  Violation of raw write protocol occurred.
BFFF0035  Violation of raw read protocol occurred.
BFFF0036  Device reported an output protocol error.
BFFF0037  Device reported an input protocol error.
BFFF0038  Bus error occurred during transfer.
BFFF003A  Invalid setup (attributes are not consistent).
BFFF005F  A "no listeners" condition was detected.
BFFF0060  This interface is not the controller-in-charge.
BFFF0067  Operation is not supported on this session.
     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Pass the number of bytes in the ViChar array you specify for the Description parameter.

If the error description, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies BufferSize - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Description buffer parameter.

Default Value:  None     �    Returns the error code for the session or execution thread.

If you pass 0 for the Buffer Size, you can pass VI_NULL for this parameter.
    �    Returns the error description for the IVI session or execution thread.  If there is no description, the function returns an empty string.

The buffer must contain at least as many elements as the value you specify with the Buffer Size parameter.  If the error description, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass 0 for the Buffer Size, you can pass VI_NULL for this parameter.   W#����  �    Status                           \$-   �  �    Instrument Handle                \� =B �  �    BufferSize                       _� = Q �  �    Code                             `M � Q � �    Description                        	                   	           	           ^    This function clears the error code and error description for the IVI session. If the user specifies a valid IVI session for the instrumenthandle parameter, this function clears the error information for the session. If the user passes VI_NULL for the Vi parameter, this function clears the error information for the current execution thread. If the Vi parameter is an invalid session, the function does nothing and returns an error.
The function clears the error code by setting it to VI_SUCCESS.  If the error description string is non-NULL, the function de-allocates the error description string and sets the address to VI_NULL.

Maintaining the error information separately for each thread is useful if the user does not have a session handle to pass to the IviDmm_GetError function, which occurs when a call to IviDmm_init or IviDmm_InitWithOptions fails.    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviDmm_error_message function.  To obtain additional information about the error condition, use the IviDmm_GetError and IviDmm_ClearError functions.

Status Codes:

Status    Description
-------------------------------------------------
       0  No error (the call was successful).

3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

3FFC0102  Reset not supported.

BFFF0000  Miscellaneous or system error occurred.
BFFF000E  Invalid session handle.
BFFF0015  Timeout occurred before operation could complete.
BFFF0034  Violation of raw write protocol occurred.
BFFF0035  Violation of raw read protocol occurred.
BFFF0036  Device reported an output protocol error.
BFFF0037  Device reported an input protocol error.
BFFF0038  Bus error occurred during transfer.
BFFF003A  Invalid setup (attributes are not consistent).
BFFF005F  A "no listeners" condition was detected.
BFFF0060  This interface is not the controller-in-charge.
BFFF0067  Operation is not supported on this session.
     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   g�#����  �    Status                           l�-   �  �    Instrument Handle                  	              �    This function returns the interchangeability warnings associated with the IVI session.  It retrieves and clears the oldest instance in which the class driver recorded an interchangeability warning.  Interchangeability warnings indicate that using your application with a different instrument might cause different behavior.  If the IVIDMM_ATTR_SPY attribute is set to VI_FALSE, you use this function to retrieve interchangeability warnings.  If the IVIDMM_ATTR_SPY attribute is set to VI_TRUE, you use the NI I/O Trace utility to view interchangeability warnings.

The class driver performs interchangeability checking when the IVIDMM_ATTR_INTERCHANGE_CHECK attribute is set to VI_TRUE and you call one of the following functions:

IviDmm_Initiate ()
IviDmm_Read ()
IviDmm_ReadMultiPoint ()

If the next interchangeability warning string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number for the buffer size, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0 for the buffer size, you can pass VI_NULL for the Interchange Warning buffer parameter.

The function returns an empty string in the Interchange Warning parameter if no interchangeability warnings remain for the session.

Interchangeability checking examines the attributes in a capability group only if you specify a value for at least one attribute within that group.  In general, the class driver generates interchangeability warnings when it encounters one of the following conditions:

(1) An attribute that affects the behavior of the instrument is in a state that you did not specify.

(2) You set a class-defined attribute to an instrument-specific value.

(3) You set the value of an attribute that the class driver defines as read-only.

(4) The class driver encounters an error when it tries to apply a value to an extension attribute that your program never configures.

    a    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the return buffer, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    �    Pass the number of bytes in the ViChar array you specify for the Interchange Warning parameter.

If the next interchangeability warning string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Interchange Warning buffer parameter.

Default Value:  None
        Returns the next interchange warning for the IVI session.  If there are no interchange warnings, the function returns an empty  string.

The buffer must contain at least as many elements as the value you specify with the Buffer Size parameter.  If the next interchangeability warning string, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

This parameter returns an empty string if no interchangeability
warnings remain for the session.

   v�#����  �    Status or Required Size          -   �  �    Instrument Handle                � = � �  �    Buffer Size                      �� � Q � �    Interchange Warning                	                   	            �    The specific driver performs interchangeability checking if the IVIDMM_ATTR_INTERCHANGE_CHECK attribute is set to VI_TRUE.  This function clears the list of current interchange warnings.
     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
       ��-   �  �    Instrument Handle                �^#����  �    Status                                 	          �    When developing a complex test system that consists of multiple test modules, it is generally a good idea to design the test modules so that they can run in any order.  To do so requires ensuring that each test module completely configures the state of each instrument it uses.  If a particular test module does not completely configure the state of an instrument, the state of the instrument depends on the configuration from a previously executed test module.  If you execute the test modules in a different order, the behavior of the instrument and therefore the entire test module is likely to change.  This change in behavior is generally instrument specific and represents an interchangeability problem.

You can use this function to test for such cases.  After you call this function, the interchangeability checking algorithms in the specific driver ignore all previous configuration operations.  By calling this function at the beginning of a test module, you can determine whether the test module has dependencies on the operation of previously executed test modules.

This function does not clear the interchangeability warnings from the list of previously recorded interchangeability warnings.  If you want to guarantee that the IviDmm_GetNextInterchangeWarning function only returns those interchangeability warnings that are generated after calling this function, you must clear the list of interchangeability warnings.  You can clear the interchangeability warnings list by repeatedly calling the IviDmm_GetNextInterchangeWarning function until no more interchangeability warnings are returned.  If you are not interested in the content of those warnings, you can call the IviDmm_ClearInterchangeWarnings function.     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
       �R-   �  �    Instrument Handle                �#����  �    Status                                 	          k    This function obtains the coercion information associated with the IVI session.  It retrieves and clears the oldest instance in which the specific driver coerced a value you specified to another value.

If you set the IVIDMM_ATTR_RECORD_COERCIONS attribute to VI_TRUE, the specific driver keeps a list of all coercions it makes on ViInt32 or ViReal64 values you pass to instrument driver functions.  If the IVIDMM_ATTR_SPY attribute is set to VI_FALSE, you use this function to retrieve information from that list.  If the IVIDMM_ATTR_SPY attribute is set to VI_TRUE, you use the NI I/O Trace utility to view the coercion information.

If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Coercion Record buffer parameter.

The function returns an empty string in the Coercion Record parameter if no coercion records remain for the session.
    a    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the return buffer, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    �    Returns the next coercion record for the IVI session.  If there are no coercion records, the function returns an empty string.

This buffer must contain at least as many elements as the value you specify with the Buffer Size parameter.  If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into this buffer and returns 7.

If you pass a negative number for the buffer size, the function copies the value to this buffer regardless of the number of bytes in the value.

If you pass 0 for the buffer size, you can pass VI_NULL for this parameter.

This parameter returns an empty string if no coercion records remain for the session.
    �    Pass the number of bytes in the ViChar array you specify for the Coercion Record parameter.

If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Coercion Record buffer parameter.

Default Value:  None
   ��#����  �    Status or Required Size          �-   �  �    Instrument Handle                �� � Q � �    Coercion Record                  �� = � �  �    Buffer Size                        	               	                    This function obtains a multithread lock on the instrument session.  Before doing so, it waits until all other execution threads have released their locks on the instrument session.

Other threads might have obtained a lock on this session in the following ways:

- The user's application called IviDmm_LockSession.

- A call to the instrument driver locked the session.

- A call to the IVI engine locked the session.

After your call to IviDmm_LockSession returns successfully, no other threads can access the instrument session until you call IviDmm_UnlockSession.

Use IviDmm_LockSession and IviDmm_UnlockSession around a sequence of calls to instrument driver functions if you require that the instrument retain its settings through the end of the sequence.

You can safely make nested calls to IviDmm_LockSession within the same thread.  To completely unlock the session, you must balance each call to IviDmm_LockSession with a call to IviDmm_UnlockSession.  If, however, you use the Caller Has Lock parameter in all calls to IviDmm_LockSession and IviDmm_UnlockSession within a function, the IVI Library locks the session only once within the function regardless of the number of calls you make to IviDmm_LockSession.  This allows you to call IviDmm_UnlockSession just once at the end of the function. 
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
         �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    This parameter serves as a convenience.  If you do not want to use this parameter, pass VI_NULL. 

Use this parameter in complex functions to keep track of whether you obtain a lock and therefore need to unlock the session.  Pass the address of a local ViBoolean variable.  In the declaration of the local variable, initialize it to VI_FALSE.  Pass the address of the same local variable to any other calls you make to IviDmm_LockSession or IviDmm_UnlockSession in the same function.

The parameter is an input/output parameter.  IviDmm_LockSession and IviDmm_UnlockSession each inspect the current value and take the following actions:

- If the value is VI_TRUE, IviDmm_LockSession does not lock the session again.  If the value is VI_FALSE, IviDmm_LockSession obtains the lock and sets the value of the parameter to VI_TRUE.

- If the value is VI_FALSE, IviDmm_UnlockSession does not attempt to unlock the session.  If the value is VI_TRUE, IviDmm_UnlockSession releases the lock and sets the value of the parameter to VI_FALSE.
 
You can then call IviDmm_UnlockSession at the end of your function without worrying about whether you actually have the lock.  

Example:

ViStatus TestFunc (ViSession vi, ViInt32 flags)
{
    ViStatus error = VI_SUCCESS;
    ViBoolean haveLock = VI_FALSE;

    if (flags & BIT_1)
        {
        viCheckErr( IviDmm_LockSession(vi, &haveLock));
        viCheckErr( TakeAction1(vi));
        if (flags & BIT_2)
            {
            viCheckErr( IviDmm_UnlockSession(vi, &haveLock));
            viCheckErr( TakeAction2(vi));
            viCheckErr( IviDmm_LockSession(vi, &haveLock);
            } 
        if (flags & BIT_3)
            viCheckErr( TakeAction3(vi));
        }

Error:
    /* 
       At this point, you cannot really be sure that 
       you have the lock.  Fortunately, the haveLock 
       variable takes care of that for you.          
    */
    IviDmm_UnlockSession(vi, &haveLock);
    return error;
}   ��#����  �    Status                           �g-   �  �    Instrument Handle                � H � �  �    Caller Has Lock                    	               	            �    This function releases a lock that you acquired on an instrument session using IviDmm_LockSession.  Refer to IviDmm_LockSession for additional information on session locks.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
         �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    This parameter serves as a convenience.  If you do not want to use this parameter, pass VI_NULL. 

Use this parameter in complex functions to keep track of whether you obtain a lock and therefore need to unlock the session. 
Pass the address of a local ViBoolean variable.  In the declaration of the local variable, initialize it to VI_FALSE.  Pass the address of the same local variable to any other calls you make to IviDmm_LockSession or IviDmm_UnlockSession in the same function.

The parameter is an input/output parameter.  IviDmm_LockSession and IviDmm_UnlockSession each inspect the current value and take the following actions:

- If the value is VI_TRUE, IviDmm_LockSession does not lock the session again.  If the value is VI_FALSE, IviDmm_LockSession obtains the lock and sets the value of the parameter to VI_TRUE.

- If the value is VI_FALSE, IviDmm_UnlockSession does not attempt to unlock the session.  If the value is VI_TRUE, IviDmm_UnlockSession releases the lock and sets the value of the parameter to VI_FALSE.
 
You can then call IviDmm_UnlockSession at the end of your function without worrying about whether you actually have the lock.  

Example:

ViStatus TestFunc (ViSession vi, ViInt32 flags)
{
    ViStatus error = VI_SUCCESS;
    ViBoolean haveLock = VI_FALSE;

    if (flags & BIT_1)
        {
        viCheckErr( IviDmm_LockSession(vi, &haveLock));
        viCheckErr( TakeAction1(vi));
        if (flags & BIT_2)
            {
            viCheckErr( IviDmm_UnlockSession(vi, &haveLock));
            viCheckErr( TakeAction2(vi));
            viCheckErr( IviDmm_LockSession(vi, &haveLock);
            } 
        if (flags & BIT_3)
            viCheckErr( TakeAction3(vi));
        }

Error:
    /* 
       At this point, you cannot really be sure that 
       you have the lock.  Fortunately, the haveLock 
       variable takes care of that for you.          
    */
    IviDmm_UnlockSession(vi, &haveLock);
    return error;
}   �C#����  �    Status                           ��-   �  �    Instrument Handle                Ѩ H � �  �    Caller Has Lock                    	               	           �    This function performs the following operations:

- Closes the instrument I/O session.

- Destroys the instrument driver session and all of its attributes.

- Deallocates any memory resources the driver uses.

Notes:

(1) You must unlock the session before calling IviDmm_close.

(2) After calling IviDmm_close, you cannot use the instrument driver again until you call IviDmm_init.

    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
         �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   ۡ#����  �    Status                           �P-   �  �    Instrument Handle                  	            ����         )&  ?e             K.        init                                                                                                                                    ����         @�  \�             K.        InitWithOptions                                                                                                                         ����         ^�  og             K.        ConfigureMeasurement                                                                                                                    ����         r.  |b             K.        ConfigureACBandwidth                                                                                                                    ����         }Z  ��             K.        ConfigureFrequencyVoltageRange                                                                                                          ����         �^  ��             K.        ConfigureTransducerType                                                                                                                 ����         ��  ��             K.        ConfigureThermocouple                                                                                                                   ����         �\  ��             K.        ConfigureFixedRefJunction                                                                                                               ����         ��  �)             K.        ConfigureRTD                                                                                                                            ����         �  �             K.        ConfigureThermistor                                                                                                                     ����         ��  �l             K.        ConfigureTrigger                                                                                                                        ����         ��  ��             K.        ConfigureTriggerSlope                                                                                                                   ����         ��  ��             K.        ConfigureMultiPoint                                                                                                                     ����         �� �             K.        ConfigureMeasCompleteDest                                                                                                               ����        � &             K.        ConfigureAutoZeroMode                                                                                                                   ����        ;  �             K.        ConfigurePowerLineFrequency                                                                                                             ����        !� *Q             K.        GetAutoRangeValue                                                                                                                       ����        + 4�             K.        GetApertureTimeInfo                                                                                                                     ����        5� I�             K.        SetAttributeViInt32                                                                                                                     ����        K� _�             K.        SetAttributeViReal64                                                                                                                    ����        a] u�             K.        SetAttributeViString                                                                                                                    ����        w, �a             K.        SetAttributeViBoolean                                                                                                                   ����        �� �1             K.        SetAttributeViSession                                                                                                                   ����        �� ��             K.        GetAttributeViInt32                                                                                                                     ����        �) �L             K.        GetAttributeViReal64                                                                                                                    ����        ŉ ��             K.        GetAttributeViString                                                                                                                    ����        �K �q             K.        GetAttributeViBoolean                                                                                                                   ����        �� �             K.        GetAttributeViSession                                                                                                                   ����         �             K.        CheckAttributeViInt32                                                                                                                   ����        ] '             K.        CheckAttributeViReal64                                                                                                                  ����        (� 8b             K.        CheckAttributeViString                                                                                                                  ����        9� I�             K.        CheckAttributeViBoolean                                                                                                                 ����        KO [             K.        CheckAttributeViSession                                                                                                                 ����        \� o�             K.        Read                                                                                                                                    ����        px �             K.        ReadMultiPoint                                                                                                                          ����        �} �U             K.        Initiate                                                                                                                                ����        �� ��             K.        SendSoftwareTrigger                                                                                                                     ����        �W �              K.        Fetch                                                                                                                                   ����        �� �T             K.        FetchMultiPoint                                                                                                                         ����        �� �9             K.        Abort                                                                                                                                   ����        Գ ��             K.        IsOverRange                                                                                                                             ����        �z �             K.        reset                                                                                                                                   ����        � �{             K.        ResetWithDefaults                                                                                                                       ����        �� ��             K.        self_test                                                                                                                               ����        �� y             K.        Disable                                                                                                                                 ����        � �             K.        InvalidateAllAttributes                                                                                                                 ����                       K.        revision_query                                                                                                                          ����         �             K.        error_query                                                                                                                             ����        � I�             K.        error_message                                                                                                                           ����        J� R�             K.        GetSpecificDriverCHandle                                                                                                                ����        S� cI             K.        GetError                                                                                                                                ����        d~ m?             K.        ClearError                                                                                                                              ����        m� ��             K.        GetNextInterchangeWarning                                                                                                               ����        �� �             K.        ClearInterchangeWarnings                                                                                                                ����        �� ��             K.        ResetInterchangeCheck                                                                                                                   ����        �1 ��             K.        GetNextCoercionRecord                                                                                                                   ����        �� ��             K.        LockSession                                                                                                                             ����        Ɍ �\             K.        UnlockSession                                                                                                                           ����        � �             K.        close                                                                                                                                         $                                                                                     �Initialize                                                                           �Initialize With Options                                                             �Configuration                                                                        �Configure Measurement                                                               �Specific Measurements                                                                �Configure AC Bandwidth [AC]                                                          �Configure Freq Volt Range [FRQ]                                                     UTemperature                                                                          �Configure Transducer Type [TMP]                                                      �Configure Thermocouple [TC]                                                          �Configure Fixed Ref Junc [TC]                                                        �Configure RTD [RTD]                                                                  �Configure Thermistor [THM]                                                          Trigger                                                                              �Configure Trigger                                                                    �Configure Trigger Slope [TS]                                                        �MultiPoint                                                                           �Configure Multi-Point [MP]                                                           �Configure Meas Comp Dest [MP]                                                        Measurement Operation Options                                                        �Configure Auto Zero Mode [AZ]                                                        �Configure Power Line Freq [PLF]                                                      �Configuration Information                                                            �Get Auto Range Value [ARV]                                                           �Get Aperture Time Info [DI]                                                         !�Set/Get/Check Attribute                                                             !�Set Attribute                                                                        �Set Attribute ViInt32                                                                �Set Attribute ViReal64                                                               �Set Attribute ViString                                                               �Set Attribute ViBoolean                                                              �Set Attribute ViSession                                                             "qGet Attribute                                                                        �Get Attribute ViInt32                                                                �Get Attribute ViReal64                                                               �Get Attribute ViString                                                               �Get Attribute ViBoolean                                                              �Get Attribute ViSession                                                             #Check Attribute                                                                      �Check Attribute ViInt32                                                              �Check Attribute ViReal64                                                             �Check Attribute ViString                                                             �Check Attribute ViBoolean                                                            �Check Attribute ViSession                                                           #�Measurement                                                                          �Read                                                                                 �Read Multi-Point [MP]                                                               %:Low-Level Measurement                                                                �Initiate                                                                             �Send Software Trigger [SWT]                                                          �Fetch                                                                                �Fetch Multi-Point [MP]                                                               �Abort                                                                                �Is Over-Range                                                                       &YUtility                                                                              �Reset                                                                                �Reset With Defaults                                                                  �Self-Test                                                                            �Disable                                                                              �Invalidate All Attributes                                                            �Revision Query                                                                       �Error-Query                                                                          �Error Message                                                                        �Get Specific Driver C Handle                                                        '�Error Info                                                                           �Get Error                                                                            �Clear Error                                                                         (Interchangeability Info                                                              �Get Next Interchange Warning                                                         �Clear Interchange Warnings                                                           �Reset Interchange Check                                                             (lCoercion Info                                                                        �Get Next Coercion Record                                                            (�Locking                                                                              �Lock Session                                                                         �Unlock Session                                                                       �Close                                                                           