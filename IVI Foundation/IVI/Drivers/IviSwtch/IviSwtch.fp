s��   	     ��   B y�  %`   �   ����                                IviSwtch                        IviSwtch Class Driver                                                                                 � � ��ViInt16  �  � ��ViInt32  � � ��ViReal64     � ��ViRsrc     	� 	��ViBoolean     	� 	��ViSession     � ��ViStatus     �  ViChar[]     � ��ViChar     � ��ViString     	�  ViInt16[]     	�  ViInt32[]     
�  	ViReal64[]     � 	 
ViBoolean[]     � ��ViConstString     � ��ViAttr  �    This instrument driver provides programming support for the IviSwtch Class.  The driver contains all the functions that the IVI Foundation and VXIplug&play Systems Alliance require.  This driver requires the VISA and IVI libraries.
      
Use this driver to develop programs that are independent of a particular switch.  You can use this class driver with any switch that has an IVI instrument-specific driver that is compliant with the IviSwtch class.  The IviSwtch class driver accesses the specific driver for your instrument using the configuration information you supply with the IVI configuration utility.

The IviSwtch class driver divides instrument capabilities into a fundamental capabilities group and multiple extension capability groups.  The IviSwtch fundamental capabilities group supports switches able to connect and disconnect paths on the instrument, determine the connectivity of two switches, and query the state of the switch module.  This group consists of the following functions and attributes.  These functions and attributes are implemented by all switch instrument drivers that are compliant with the IviSwitch class.

      IviSwtch_Connect()
      IviSwtch_Disconnect()
      IviSwtch_GetPath()
      IviSwtch_SetPath()
      IviSwtch_CanConnect()
      IviSwtch_DisconnectAll()
      IviSwtch_IsDebounced()
      IviSwtch_WaitForDebounce()

      IVISWTCH_ATTR_BANDWIDTH
      IVISWTCH_ATTR_CHARACTERISTIC_IMPEDANCE
      IVISWTCH_ATTR_IS_CONFIGURATION_CHANNEL
      IVISWTCH_ATTR_IS_DEBOUNCED
      IVISWTCH_ATTR_IS_SOURCE_CHANNEL
      IVISWTCH_ATTR_MAX_AC_VOLTAGE
      IVISWTCH_ATTR_MAX_CARRY_AC_CURRENT
      IVISWTCH_ATTR_MAX_CARRY_AC_POWER
      IVISWTCH_ATTR_MAX_CARRY_DC_CURRENT
      IVISWTCH_ATTR_MAX_CARRY_DC_POWER
      IVISWTCH_ATTR_MAX_DC_VOLTAGE
      IVISWTCH_ATTR_MAX_SWITCHING_AC_CURRENT
      IVISWTCH_ATTR_MAX_SWITCHING_AC_POWER
      IVISWTCH_ATTR_MAX_SWITCHING_DC_CURRENT
      IVISWTCH_ATTR_MAX_SWITCHING_DC_POWER
      IVISWTCH_ATTR_SETTLING_TIME
      IVISWTCH_ATTR_WIRE_MODE

The IviSwtch class driver identifies functions and attributes that belong to an extension group with the following abbreviations.  Instrument-specific drivers are not required to implement any of the extension capability groups.  If you use functions and attributes that belong to extension capability groups, every instrument-specific driver that you use must implement those extensions.
      
      Extension Capability Group        Abbreviation
      ----------------------------------------------
      IviSwtchScanner                       [SCN]
      IviSwtchSoftwareTrigger               [SWT]

The IviSwtchScanner extension group defines extensions for instruments capable of scanning channels.  This group consists of the following functions and attributes:

      IviSwtch_InitiateScan()
      IviSwtch_AbortScan()
      IviSwtch_IsScanning()
      IviSwtch_WaitForScanComplete()
      IviSwtch_ConfigureScanList()
      IviSwtch_ConfigureScanTrigger()

      IVISWTCH_ATTR_NUM_OF_ROWS
      IVISWTCH_ATTR_NUM_OF_COLUMNS
      IVISWTCH_ATTR_SCAN_LIST
      IVISWTCH_ATTR_SCAN_MODE
      IVISWTCH_ATTR_TRIGGER_INPUT
      IVISWTCH_ATTR_SCAN_ADVANCED_OUTPUT
      IVISWTCH_ATTR_SCAN_DELAY
      IVISWTCH_ATTR_IS_SCANNING
      IVISWTCH_ATTR_CONTINUOUS_SCAN

The IviSwtchSoftwareTrigger extension group defines extensions for instruments capable of receiving software triggers.  This group consists of the following function:

      IviSwtch_SendSoftwareTrigger()
        This class provides functions and classes that configure the switch.  The class includes high-level functions that configure the scan list and scan trigger.  The class also contains the low-level functions that set, get, and check individual attribute values.
     T    This class contains sub-classes for the set, get, and check attribute functions.       �    This class contains functions that set an attribute to a new value.  There are typesafe functions for each attribute data type.     �    This class contains functions that obtain the current value of an attribute.  There are typesafe functions for each attribute data type.     �    This class contains functions that obtain the current value of an attribute.  There are typesafe functions for each attribute data type.     �    This class contains functions and classes that initiate instrument operations and report their status.

Functions/SubClasses:

     G    This class contains low level functions for getting and setting paths     B    This class contains functions for configuring scanning switches.    _    This class contains functions and sub-classes that control common instrument operations.  These functions include many of functions that VXIplug&play require, such as reset, self-test, revision query, error query, and error message.  This class also contains functions that access IVI error infomation, lock the session, and perform instrument I/O.
     R    This class contains functions that retrieve and clear the IVI error information.     J    This class contains functions that retrieve interchangeability warnings.     ?    This class contains functions that retrieve coercion records.     k    This class contains functions that lock and unlock IVI instrument driver sessions for multithread safefy.    E    This function performs the following initialization actions:

- Creates a new IVI instrument driver session.

- Opens a session to the specified device using the interface and address you specify for the Resource Name parameter.

- If the ID Query parameter is set to VI_TRUE, this function queries the instrument ID and checks that it is valid for this instrument driver.

- If the Reset parameter is set to VI_TRUE, this function resets the instrument to a known state.

- Sends initialization commands to set the instrument to the state necessary for the operation of the instrument driver.

- Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Note:  This function creates a new session each time you invoke it. Although you can open more than one IVI session for the same resource, it is best not to do so.  You can use the same session in multiple program threads.  You can use the IviSwtch_LockSession and IviSwtch_UnlockSession functions to protect sections of code that require exclusive access to the resource.

Content from the IVI specifications reproduced with permission from the IVI Foundation. 
 
The IVI Foundation and its member companies make no warranty of any kind with regard to this material, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose. The IVI Foundation and its member companies shall not be liable for errors contained herein or for incidental or consequential damages in connection with the furnishing, performance, or use of this material.    �    Pass the logical name that identifies the particular driver session to use.  The driver session, in turn, identifies a specific driver and device and specifies the initial settings for the session.  You configure the logical name, driver session, specific driver, and device with the IVI Configuration utility. 

If you want to use your program with a different physical instrument, you change the configuration of the logical name to use the driver session for the new physical instrument. You can change the initial settings for the session by changing the configuration of the driver session.

Default Value:  "SampleSwitch"

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

(2) Avoid creating multiple concurrent sessions to the same physical instrument.  Although you can create more than one IVI session for the same resource, it is best not to do so.  A better approach is to use the same IVI session in multiple execution threads.  You can use functions IviSwtch_LockSession and IviSwtch_UnlockSession to protect sections of code that require exclusive access to the resource.

    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    ! =   �  �    Logical Name                       � : �       ID Query                          "� =� �       Reset Device                      #� �C �  �    Instrument Handle                 &u#����  �    Status                             "SampleSwitch"   Yes VI_TRUE No VI_FALSE   Yes VI_TRUE No VI_FALSE    	           	          E    This function performs the following initialization actions:

- Creates a new IVI instrument driver session.

- Opens a session to the specified device using the interface and address you specify for the Resource Name parameter.

- If the ID Query parameter is set to VI_TRUE, this function queries the instrument ID and checks that it is valid for this instrument driver.

- If the Reset parameter is set to VI_TRUE, this function resets the instrument to a known state.

- Sends initialization commands to set the instrument to the state necessary for the operation of the instrument driver.

- Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Note:  This function creates a new session each time you invoke it. Although you can open more than one IVI session for the same resource, it is best not to do so.  You can use the same session in multiple program threads.  You can use the IviSwtch_LockSession and IviSwtch_UnlockSession functions to protect sections of code that require exclusive access to the resource.

Content from the IVI specifications reproduced with permission from the IVI Foundation. 
 
The IVI Foundation and its member companies make no warranty of any kind with regard to this material, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose. The IVI Foundation and its member companies shall not be liable for errors contained herein or for incidental or consequential damages in connection with the furnishing, performance, or use of this material.    �    Pass the logical name that identifies the particular driver session to use.  The driver session, in turn, identifies a specific driver and device and specifies the initial settings for the session.  You configure the logical name, driver session, specific driver, and device with the IVI Configuration utility. 

If you want to use your program with a different physical instrument, you change the configuration of the logical name to use the driver session for the new physical instrument. You can change the initial settings for the session by changing the configuration of the driver session.

Default Value:  "SampleSwitch"

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

(2) Avoid creating multiple concurrent sessions to the same physical instrument.  Although you can create more than one IVI session for the same resource, it is best not to do so.  A better approach is to use the same IVI session in multiple execution threads.  You can use functions IviSwtch_LockSession and IviSwtch_UnlockSession to protect sections of code that require exclusive access to the resource.

    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
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
RangeCheck        IVISWTCH_ATTR_RANGE_CHECK
QueryInstrStatus  IVISWTCH_ATTR_QUERY_INSTRUMENT_STATUS   
Cache             IVISWTCH_ATTR_CACHE   
Simulate          IVISWTCH_ATTR_SIMULATE  
RecordCoercions   IVISWTCH_ATTR_RECORD_COERCIONS
InterchangeCheck  IVISWTCH_ATTR_INTERCHANGE_CHECK

The format of this string is, "AttributeName=Value" where AttributeName is the name of the attribute and Value is the value to which the attribute will be set.  To set multiple attributes, separate their assignments with a comma.  

If you pass NULL or an empty string for this parameter, the driver uses the values from the Measurement and Automation Explorer's IVI Configuration Utility.   You can override these values by assigning a value explicitly in a string you pass for this parameter.  You do not have to specify all of the attributes and may leave any of them out.  If you do not specify one of the attributes, the driver uses the value from the IVI Configuration Utility.  

The following are the valid values for ViBoolean attributes:

    True:     1, TRUE, or VI_TRUE
    False:    0, False, or VI_FALSE


Default Value:
       "Simulate=0,RangeCheck=1,QueryInstrStatus=0,Cache=1"    92 =   �  �    Logical Name                      = : �       ID Query                          ? =� �       Reset Device                      ?� �Y �  �    Instrument Handle                 B�#����  �    Status                            M� �  � �    Option String                      "SampleSwitch"   Yes VI_TRUE No VI_FALSE   Yes VI_TRUE No VI_FALSE    	           	           5"Simulate=0,RangeCheck=1,QueryInstrStatus=0,Cache=1"       This function configures the switch module for scanning.

Use the IviSwtch_ConfigureScanTrigger function to configure the scan trigger. Use the IviSwtch_InitiateScan function to start the scan.

Notes:

(1) This function is part of the IviSwtchScanner [SCN] extension group.
     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    Pass the scan list you want the instrument to use. The driver uses this value to set the IVISWTCH_ATTR_SCAN_LIST attribute.

The scan list is a string that specifies channel connections and trigger conditions for scanning.  After you call the IviSwtch_InitiateScan function, the instrument makes or breaks connections and waits for triggers according to the instructions in the scan list.

The scan list is comprised of channel names that you separate with special characters.  These special characters determine the operation the scanner performs on the channels when it executes this scan list.

To create a path between two channels, use '->' (a dash followed by a '>' sign) between the two channel names.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Example: "CH1->CH2" instructs the switch to make a path from channel CH1 to channel CH2.

To break or clear a path, use a '~' (tilde) as a prefix before the path.

Example: "~CH1->CH2" instructs the switch to break the path from channel CH1 to channel CH2.
 
To wait for a trigger event, use a ';' (semicolon) as a separator between paths.
   
Example: "CH1->CH2;CH3->CH4" instructs the switch to make the path from channel CH1 to channel CH2, wait for a trigger, and then make the path from CH3 to CH4.

To tell the switch module to create multiple paths simultaneously, use  an '&' character as a separator between the paths.
   
Example: "A->B;CH1->CH2&CH3->CH4" instructs the scanner to make the path between channels A and B, wait for a trigger, and then simultaneously make the paths between channels CH1 and CH2 and between channels CH3 and CH4.
    %    Pass the scan mode you want the instrument to use. The driver sets the IVISWTCH_ATTR_SCAN_MODE attribute to this value.

The scan mode specifies how the instrument breaks existing connections when scanning.

Defined Values:

IVISWTCH_VAL_NONE (0)
The instrument takes no action on existing connections.

IVISWTCH_VAL_BREAK_BEFORE_MAKE (1)
The instrument breaks an existing connection before creating a new one. This is useful if you want to prevent two channels from connecting together in the transitional period.

IVISWTCH_VAL_BREAK_AFTER_MAKE (2)
The instrument breaks an existing connection after creating a new one. This is useful if you want to prevent damage from occurring on inductive elements of a circuit that cannot stand rapid changes in the current flow.

Default Value:  IVISWTCH_VAL_NONE    VK-   �  �    Instrument Handle                 W#����  �    Status                            b D � �      Scan List                         i �1 �      Scan Mode                              	           ""               |No Action IVISWTCH_VAL_NONE Break Before Make IVISWTCH_VAL_BREAK_BEFORE_MAKE Break After Make IVISWTCH_VAL_BREAK_AFTER_MAKE    �    This function configures the scan triggers for the scan list you establish with IviSwtch_ConfigureScanList function.

Notes:

(1) This function is part of the IviSwtchScanner [SCN] extension group.
     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    )    Pass the minimum length of time you want the instrument to wait from the time the instrument creates a path until it asserts a trigger on the Scan Advanced output line. Express this value in seconds. The driver uses this value to set the IVISWTCH_ATTR_SCAN_DELAY attribute.

Default Value:  0.0
    �    Pass the trigger source you want the instrument to use for scanning. The driver uses this value to set the IVISWTCH_ATTR_TRIGGER_INPUT attribute.

The switch module waits for the trigger you specify when it encounters a semicolon in the scan list. When the trigger occurs, the switch module advances to the next entry in the scan list.

Defined Values:

IVISWTCH_VAL_IMMEDIATE     - Immediate (Default)
IVISWTCH_VAL_EXTERNAL      - External
IVISWTCH_VAL_SOFTWARE_TRIG - Software Trigger Function
IVISWTCH_VAL_TTL0          - PXI TRIG0 or VXI TTL0
IVISWTCH_VAL_TTL1          - PXI TRIG1 or VXI TTL1
IVISWTCH_VAL_TTL2          - PXI TRIG2 or VXI TTL2
IVISWTCH_VAL_TTL3          - PXI TRIG3 or VXI TTL3
IVISWTCH_VAL_TTL4          - PXI TRIG4 or VXI TTL4
IVISWTCH_VAL_TTL5          - PXI TRIG5 or VXI TTL5
IVISWTCH_VAL_TTL6          - PXI TRIG6 or VXI TTL6
IVISWTCH_VAL_TTL7          - PXI TRIG7 or VXI TTL7
IVISWTCH_VAL_ECL0          - VXI ECL0
IVISWTCH_VAL_ECL1          - VXI ECL1
IVISWTCH_VAL_PXI_STAR      - PXI Star
IVISWTCH_VAL_RTSI_0        - RTSI line 0
IVISWTCH_VAL_RTSI_1        - RTSI line 1
IVISWTCH_VAL_RTSI_2        - RTSI line 2
IVISWTCH_VAL_RTSI_3        - RTSI line 3
IVISWTCH_VAL_RTSI_4        - RTSI line 4
IVISWTCH_VAL_RTSI_5        - RTSI line 5
IVISWTCH_VAL_RTSI_6        - RTSI line 6

Notes:

(1) IVISWTCH_VAL_IMMEDIATE 
    Immediate Trigger. The switch module does not wait for a
    trigger before processing the next entry in the scan list.

(2) IVISWTCH_VAL_EXTERNAL
    External Trigger. The switch module waits until it receives
    a trigger from an external source through the "trigger in"
    connector.

(3) IVISWTCH_VAL_SOFTWARE_TRIG
    The switch module waits until you call the
    IviSwtch_SendSoftwareTrigger function.
    �    Pass the output on which you want the instrument to assert the scan advanced signal. The driver uses this value to set the IVISWTCH_ATTR_SCAN_ADVANCED_OUTPUT attribute.

After the instrument processes each entry in the scan list, it waits the length of time you specify in the Scan Delay parameter and then asserts a trigger on the line you specify with this parameter.

Defined Values:

IVISWTCH_VAL_NONE         - No Trigger (Default)
IVISWTCH_VAL_EXTERNAL     - External
IVISWTCH_VAL_GPIB_SRQ     - GPIB Service Request
IVISWTCH_VAL_TTL0         - PXI TRIG0 or VXI TTL0
IVISWTCH_VAL_TTL1         - PXI TRIG1 or VXI TTL1
IVISWTCH_VAL_TTL2         - PXI TRIG2 or VXI TTL2
IVISWTCH_VAL_TTL3         - PXI TRIG3 or VXI TTL3
IVISWTCH_VAL_TTL4         - PXI TRIG4 or VXI TTL4
IVISWTCH_VAL_TTL5         - PXI TRIG5 or VXI TTL5
IVISWTCH_VAL_TTL6         - PXI TRIG6 or VXI TTL6
IVISWTCH_VAL_TTL7         - PXI TRIG7 or VXI TTL7
IVISWTCH_VAL_ECL0         - VXI ECL0
IVISWTCH_VAL_ECL1         - VXI ECL1
IVISWTCH_VAL_PXI_STAR     - PXI Star
IVISWTCH_VAL_RTSI_0       - RTSI line 0
IVISWTCH_VAL_RTSI_1       - RTSI line 1
IVISWTCH_VAL_RTSI_2       - RTSI line 2
IVISWTCH_VAL_RTSI_3       - RTSI line 3
IVISWTCH_VAL_RTSI_4       - RTSI line 4
IVISWTCH_VAL_RTSI_5       - RTSI line 5
IVISWTCH_VAL_RTSI_6       - RTSI line 6

Notes:

(1)   IVISWTCH_VAL_NONE
      The switch module does not produce a Scan Advanced Output
      trigger.

(2)   IVISWTCH_VAL_EXTERNAL
      External Trigger. The switch module produces the Scan\
      Advanced Output trigger on the "trigger out" connector.

(3)   IVISWTCH_VAL_GPIB_SRQ
      The switch module produces the GPIB Service Request in
      place of the Scan Advanced Output trigger.

    n�-   �  �    Instrument Handle                 o=#����  �    Status                            zD O  �  �    Scan Delay                        {u O � � �    Trigger Input                     �\ O� � �    Scan Advanced Output                   	           0.0              �Immediate IVISWTCH_VAL_IMMEDIATE External IVISWTCH_VAL_EXTERNAL Software Trigger Function IVISWTCH_VAL_SOFTWARE_TRIG PXI TRIG0 or VXI TTL0 IVISWTCH_VAL_TTL0 PXI TRIG1 or VXI TTL1 IVISWTCH_VAL_TTL1 PXI TRIG2 or VXI TTL2 IVISWTCH_VAL_TTL2 PXI TRIG3 or VXI TTL3 IVISWTCH_VAL_TTL3 PXI TRIG4 or VXI TTL4 IVISWTCH_VAL_TTL4 PXI TRIG5 or VXI TTL5 IVISWTCH_VAL_TTL5 PXI TRIG6 or VXI TTL6 IVISWTCH_VAL_TTL6 PXI TRIG7 or VXI TTL7 IVISWTCH_VAL_TTL7 VXI ECL0 IVISWTCH_VAL_ECL0 VXI ECL1 IVISWTCH_VAL_ECL1 PXI Star IVISWTCH_VAL_PXI_STAR RTSI 0 IVISWTCH_VAL_RTSI_0 RTSI 1 IVISWTCH_VAL_RTSI_1 RTSI 2 IVISWTCH_VAL_RTSI_2 RTSI 3 IVISWTCH_VAL_RTSI_3 RTSI 4 IVISWTCH_VAL_RTSI_4 RTSI 5 IVISWTCH_VAL_RTSI_5 RTSI 6 IVISWTCH_VAL_RTSI_6              �None IVISWTCH_VAL_NONE External IVISWTCH_VAL_EXTERNAL GPIB Service Request IVISWTCH_VAL_GPIB_SRQ PXI TRIG0 or VXI TTL0 IVISWTCH_VAL_TTL0 PXI TRIG1 or VXI TTL1 IVISWTCH_VAL_TTL1 PXI TRIG2 or VXI TTL2 IVISWTCH_VAL_TTL2 PXI TRIG3 or VXI TTL3 IVISWTCH_VAL_TTL3 PXI TRIG4 or VXI TTL4 IVISWTCH_VAL_TTL4 PXI TRIG5 or VXI TTL5 IVISWTCH_VAL_TTL5 PXI TRIG6 or VXI TTL6 IVISWTCH_VAL_TTL6 PXI TRIG7 or VXI TTL7 IVISWTCH_VAL_TTL7 VXI ECL0 IVISWTCH_VAL_ECL0 VXI ECL1 IVISWTCH_VAL_ECL1 RTSI 0 IVISWTCH_VAL_RTSI_0 RTSI 1 IVISWTCH_VAL_RTSI_1 RTSI 2 IVISWTCH_VAL_RTSI_2 RTSI 3 IVISWTCH_VAL_RTSI_3 RTSI 4 IVISWTCH_VAL_RTSI_4 RTSI 5 IVISWTCH_VAL_RTSI_5 RTSI 6 IVISWTCH_VAL_RTSI_6    �    This function sets the continuous scan mode on the instrument.

Notes:

(1) This function is part of the IviSwtchScanner [SCN] extension group.
     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    Specifies whether the continuous scan mode is enabled or disabled.

Valid Values:   VI_FALSE (0) - disabled
                VI_TRUE  (1) - enabled
    �O-   �  �    Instrument Handle                 �	#����  �    Status                            � [ � �  �    Continuous Scan State                  	              �    This function sets the value of a ViInt32 attribute.

This is a low-level function that you can use to set the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
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
    G    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""
    �N-   �  �    Instrument Handle                 �#����  �    Status                            � � � �  �    Attribute Value                 ���� � ���                                           �* = � � �    Attribute ID                      �u =  �  �    Channel Name                           	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViReal64 attribute.

This is a low-level function that you can use to set the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
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
    G    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""
    �N-   �  �    Instrument Handle                 �#����  �    Status                            � � � �  �    Attribute Value                 ���� � ���                                           �* = � � �    Attribute ID                      �w =  �  �    Channel Name                           	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViString attribute.

This is a low-level function that you can use to set the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
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
    G    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""
    �P-   �  �    Instrument Handle                 �
#����  �    Status                            � � � �  �    Attribute Value                 ���� � ���                                           �, = � � �    Attribute ID                      �y =  �  �    Channel Name                           	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViBoolean attribute.

This is a low-level function that you can use to set the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
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
    G    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""
    �S-   �  �    Instrument Handle                 �#����  �    Status                            � � �  �    Attribute Value                 ���� � ���                                          
/ = � � �    Attribute ID                     | =  �  �    Channel Name                           	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViSession attribute.

This is a low-level function that you can use to set the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
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

Default Value: none    G    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

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
   V-   �  �    Instrument Handle                #����  �    Status                           & � � �  �    Attribute Value                  (2 =  �  �    Channel Name                     ,� = � � �    Attribute ID                    ���� � ���                                                	               ""                0    .Press <ENTER> for a list of 
value constants.   �    This function queries the value of a ViInt32 attribute.

This is a low-level function that you can use to get the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
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
    M    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be retrieved. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

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
   5T-   �  �    Instrument Handle                6#����  �    Status                           A � � �  �    Attribute Value                  B� =  �  �    Channel Name                     G  = � � �    Attribute ID                           	           	            ""                0   �    This function queries the value of a ViReal64 attribute.

This is a low-level function that you can use to get the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
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
    M    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be retrieved. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

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
   N�-   �  �    Instrument Handle                O�#����  �    Status                           Z� � � �  �    Attribute Value                  \c =  �  �    Channel Name                     `� = � � �    Attribute ID                           	           	           ""                0       This function queries the value of a ViString attribute.

This is a low-level function that you can use to get the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

You must provide a ViChar array to serve as a buffer for the value.  You pass the number of bytes in the buffer as the Buffer Size parameter.  If the current value of the attribute, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size-1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you want to call this function just to get the required buffer size, you can pass 0 for the Buffer Size and VI_NULL for the Attribute Value buffer.  

If you want the function to fill in the buffer regardless of the number of bytes in the value, pass a negative number for the Buffer Size parameter.

Default Value:  512

If state caching is available for the instrument driver and you have not disabled caching through MAX or through the optionsString parameter of the IviSwtch_InitWithOptions function, the IVI Engine caches the string between multiple invokes of this function until the user fetches the whole string. Otherwise, this function queries the instrument to refresh the string attribute value in each function call.     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the return buffer, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
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
    M    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be retrieved. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""
    �    Pass the number of bytes in the ViChar array you specify for the Attribute Value parameter.  

If the current value of the attribute, including the terminating NUL byte, contains more bytes that you indicate in this parameter, the function copies Buffer Size-1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Attribute Value buffer parameter.

Default Value:  512    �    Pass the ID of an attribute.

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
   m�-   �  �    Instrument Handle                na#����  �    Status or Required Size          {& � L � �    Attribute Value                  J =  �  �    Channel Name                     �� =� �  �    Buffer Size                      �� = � � �    Attribute ID                           	           	            ""    512                0   �    This function queries the value of a ViBoolean attribute.

This is a low-level function that you can use to get the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
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
    M    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be retrieved. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

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
   ��-   �  �    Instrument Handle                �W#����  �    Status                           �^ � � �  �    Attribute Value                  � =  �  �    Channel Name                     �k = � � �    Attribute ID                           	           	            ""                0   �    This function queries the value of a ViSession attribute.

This is a low-level function that you can use to get the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
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
    M    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be retrieved. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

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
   �9-   �  �    Instrument Handle                ��#����  �    Status                           �� � � �  �    Attribute Value                  �� =  �  �    Channel Name                     � = � � �    Attribute ID                           	           	            ""                0    S    This function checks the validity of a value you specify for a ViInt32 attribute.     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
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

Default Value: none    K    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be checked. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

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
   �C-   �  �    Instrument Handle                ��#����  �    Status                           � � � �  �    Attribute Value                  �4 =  �  �    Channel Name                    ���� � ���                                          ҇ = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    T    This function checks the validity of a value you specify for a ViReal64 attribute.     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
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

Default Value: none    K    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be checked. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

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
   ��-   �  �    Instrument Handle                ڂ#����  �    Status                           � � � �  �    Attribute Value                  � =  �  �    Channel Name                    ���� � ���                                          � = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    T    This function checks the validity of a value you specify for a ViString attribute.     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
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

Default Value: none    K    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be checked. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

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
   �O-   �  �    Instrument Handle                �	#����  �    Status                           � � � �  �    Attribute Value                  @ =  �  �    Channel Name                    ���� � ���                                          � = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    U    This function checks the validity of a value you specify for a ViBoolean attribute.     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
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

Default Value: none    K    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be checked. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

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
   �-   �  �    Instrument Handle                �#����  �    Status                           � � � �  �    Attribute Value                  � =  �  �    Channel Name                    ���� � ���                                           = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    U    This function checks the validity of a value you specify for a ViSession attribute.     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
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

Default Value: none    K    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be checked. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

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
   &`-   �  �    Instrument Handle                '#����  �    Status                           2! � � �  �    Attribute Value                  4Q =  �  �    Channel Name                    ���� � ���                                          8� = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0   �    This function creates a path between Channel 1 and Channel 2.  The driver calculates the shortest path between the two channels.  If a path is not available, the function returns one of the following errors:

IVISWTCH_ERROR_EXPLICIT_CONNECTION_EXISTS, if the two channels
                  are already explicitly connected by calling
                  either the IviSwtch_Connect or 
                  IviSwtch_SetPath function.

IVISWTCH_ERROR_IS_CONFIGURATION_CHANNEL, if a channel is a
                  configuration channel.  Error elaboration
                  contains information about which of the two
                  channels is a configuration channel.

IVISWTCH_ERROR_ATTEMPT_TO_CONNECT_SOURCES, if both channels are
                  connected to a different source.  Error
                  elaboration contains information about sources
                  to which channel 1 and 2 connect.
                  
IVISWTCH_ERROR_CANNOT_CONNECT_TO_ITSELF, if channels 1 and 2 are
                  one and the same channel.

IVISWTCH_ERROR_PATH_NOT_FOUND, if the driver cannot find a path
                  between the two channels.

This function applies default values to attributes that have not been set by the user under the following conditions:

(1) If the user has not set the value of any attribute in the IviSwtchScanner extension,  the following default values are used:

IVISWTCH_ATTR_SCAN_LIST            - "" (Empty string)
IVISWTCH_ATTR_TRIGGER_INPUT        - IVISWTCH_VAL_EXTERNAL
IVISWTCH_ATTR_SCAN_ADVANCED_OUTPUT - IVISWTCH_VAL_EXTERNAL
IVISWTCH_ATTR_SCAN_DELAY           - 0

Notes:

(1) The paths are bidirectional. For example, if a path exists
    from channel CH1 to CH2, then a path from channel
    CH2 to CH1 also exists.

(2) This function performs interchangeability checking when the IVISWTCH_ATTR_INTERCHANGE_CHECK attribute is set to VI_TRUE.  If the IVISWTCH_ATTR_SPY attribute is set to VI_TRUE, you use the NI I/O Trace utility to view interchangeability warnings.  You use the IviSwtch_GetNextInterchangeWarning function to retrieve interchangeability warnings when the IVISWTCH_ATTR_SPY attribute is set to VI_FALSE.  For more information about interchangeability checking, refer to the help text for the IVISWTCH_ATTR_INTERCHANGE_CHECK attribute.
    3    You identify a path with two channels. Pass one of the virtual channel names for which you want to create a path.  Pass the other channel name as the Channel 2 parameter.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value: ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.
     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    3    You identify a path with two channels. Pass one of the virtual channel names for which you want to create a path.  Pass the other channel name as the Channel 1 parameter.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value: ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.
   H� Q 9 �  �    Channel 1                        L�-   �  �    Instrument Handle                M�#����  �    Status                           X� N` �  �    Channel 2                          ""        	           ""    ~    This function destroys the path between two channels that you create with the IviSwtch_Connect or IviSwtch_SetPath function.     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    4    You identify a path with two channels. Pass one of the virtual channel names for which you want to destroy a path.  Pass the other channel name as the Channel 2 parameter.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value: ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    4    You identify a path with two channels. Pass one of the virtual channel names for which you want to destroy a path.  Pass the other channel name as the Channel 1 parameter.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value: ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.
   ^:-   �  �    Instrument Handle                ^�#����  �    Status                           i� Q 9 �  �    Channel 1                        n7 N` �  �    Channel 2                              	           ""    ""    �    This function disconnects all existing paths.

Note: If the switch module is not capable of disconnecting all paths, this function returns the warning IVISWTCH_WARN_PATH_REMAINS.     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
   t-   �  �    Instrument Handle                t�#����  �    Status                                 	           o    This function returns a value that indicates whether all the paths that you previously created have settled.
     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        Indicates the state of the switch module. The driver returns the value of the IVISWTCH_ATTR_IS_DEBOUNCED attribute.

The value VI_TRUE indicates that all the paths that you created have settled.

The value VI_FALSE indicates that all the paths that you created have  not settled.
   ��-   �  �    Instrument Handle                ��#����  �    Status                           �� b � �  �    Is Debounced                           	           	           �    Calling this function causes the driver to return process control back to the user only after all the paths that you previouslt created have settled.

     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    	    Specifies the maximum length of time for this function to wait until all switches in the switch module debounce.
If the time you specify elapses before all switches debounce, this function returns a timeout error.

The units are milliseconds.

Default Value: None   �-   �  �    Instrument Handle                ��#����  �    Status                           �� b � �  �    Maximum Time (ms)                      	              	    This function verifies that the switch module is capable of creating a path between the two channels you specify with the Channel 1 and Channel 2 parameters.  If the switch module is capable of creating a path, this function indicates whether the path is currently available given the existing connections.

If the path is not available due to currently existing connections, but the implicit connection between the two channels already exists, the function returns the warning IVISWTCH_WARN_IMPLICIT_CONNECTION_EXISTS.     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    3    You identify a path with two channels. Pass one of the virtual channel names for which you want to verify a path.  Pass the other channel name as the Channel 2 parameter.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value: ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    3    You identify a path with two channels. Pass one of the virtual channel names for which you want to verify a path.  Pass the other channel name as the Channel 1 parameter.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value: ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.
        Indicates whether a path is valid. Possible values include:

IVISWTCH_VAL_PATH_AVAILABLE                 1
IVISWTCH_VAL_PATH_EXISTS                    2
IVISWTCH_VAL_PATH_UNSUPPORTED               3
IVISWTCH_VAL_RSRC_IN_USE                    4
IVISWTCH_VAL_SOURCE_CONFLICT                5
IVISWTCH_VAL_CHANNEL_NOT_AVAILABLE          6

Notes:

(1) IVISWTCH_VAL_PATH_AVAILABLE indicates that the driver can create the path at this time.

(2) IVISWTCH_VAL_PATH_EXISTS indicates that the path already exists.

(3) IVISWTCH_VAL_PATH_UNSUPPORTED indicates that the instrument is not capable of creating a path between the channels you specify.

(4) IVISWTCH_VAL_RSRC_IN_USE indicates that although the path is valid, the driver cannot create the path at this moment because the switch module is currently using one or more of the required channels to create another path. You must destroy the other path before creating this one.

(5) IVISWTCH_VAL_SOURCE_CONFLICT indicates that the instrument cannot create a path because both channels are connected to a different source channel.

(6) IVISWTCH_VAL_CHANNEL_NOT_AVAILABLE indicates that the driver cannot create a path between the two channels because one of the channels is a configuration channel and thus unavailable for external connections.   ��-   �  �    Instrument Handle                �`#����  �    Status                           �g b  �  �    Channel 1                        �� b � �  �    Channel 2                        �� b� �  �    Path Capability                        	           ""    ""    	           \    This function connects two channels by establishing the exact path you specify with the pathList parameter.

This function applies default values to attributes that have not been set by the user under the following conditions:

(1) If the user has not set the value of any attribute in the IviSwtchScanner extension,  the following default values are used:

IVISWTCH_ATTR_SCAN_LIST            - "" (Empty string)
IVISWTCH_ATTR_TRIGGER_INPUT        - IVISWTCH_VAL_EXTERNAL
IVISWTCH_ATTR_SCAN_ADVANCED_OUTPUT - IVISWTCH_VAL_EXTERNAL
IVISWTCH_ATTR_SCAN_DELAY           - 0

Notes:

(1) This function performs interchangeability checking when the IVISWTCH_ATTR_INTERCHANGE_CHECK attribute is set to VI_TRUE.  If the IVISWTCH_ATTR_SPY attribute is set to VI_TRUE, you use the NI I/O Trace utility to view interchangeability warnings.  You use the IviSwtch_GetNextInterchangeWarning function to retrieve interchangeability warnings when the IVISWTCH_ATTR_SPY attribute is set to VI_FALSE.  For more information about interchangeability checking, refer to the help text for the IVISWTCH_ATTR_INTERCHANGE_CHECK attribute.
     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        Pass the path list for the path you previously created that you want the switch module to establish. You obtain the path list for a path you previously created with the IviSwtch_GetPath function.

Example: The path from Ch1 to Ch3 over Conf1 is:

"Ch1->Conf1,Conf1->Ch3"   ��-   �  �    Instrument Handle                �B#����  �    Status                           �I L � �      Path List                              	           ""   t    In some cases there is more than one possible path between two channels. The driver or the instrument selects the path when you connect two channels with the IviSwtch_Connect function. Thus, you cannot guarantee that every call to the IviSwtch_Connect function establishes exactly the same path when you pass the same channels. This function returns a string that uniquely identifies the path you create with the IviSwtch_Connect function. You can pass this string to the IviSwtch_SetPath function to establish the exact same path in the future.

Note:

(1) This function returns only those paths that you explicitly
    create by calling IviSwtch_Connect and IviSwtch_SetPath
    functions. For example, if you connect channels CH1 and CH3,
    and then channels CH2 and CH3, the explicit path between
    channels CH1 and Ch2 does not exist and this function
    returns an error.     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the return buffer, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    You identify a path with two channels. Pass one of the channel names for which you want to obtain a path. Pass the other channel name as the Channel 2 parameter.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Valid Channel Names:  1

Default Value:  ""
    �    You identify a path with two channels. Pass one of the channel names for which you want to obtain a path. Pass the other channel name as the Channel 1 parameter.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Valid Channel Names:  1

Default Value:  ""
     d    The comma-separated path between channels you specify in the Channel 1 and Channel 2 parameters.

    �    Pass the number of bytes in the ViChar array you specify for the Path List parameter.  

If the current value of the attribute, including the terminating NUL byte, contains more bytes that you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "R1->C1" and the Buffer Size is 4, the function places "R1-" into the buffer and returns 7.

If you pass 0, you can pass VI_NULL for the Path parameter. This enables you to find out the path size and to allocate the buffer of the appropriate size before calling this function again. 
   Β-   �  �    Instrument Handle                �L#����  �    Status or Required Size          � J  �  �    Channel 1                        �� J � �  �    Channel 2                        ߃ � � �      Path                             �� J� �  �    Buffer Size                            	           ""    ""    	               	    This function initiates a scan using the scan list and triggers you configure with the IviSwtch_ConfigureScanList and IviSwtch_ConfigureScanTrigger functions. This function returns immediately.

Once you start the scanning operation, you cannot perform any other operation other than GetAttribute, AbortScan, or SendSoftwareTrigger. All other functions return IVISWTCH_ERROR_SCAN_IN_PROGRESS.

To stop the scanning operation, call the IviSwtch_AbortScan function.

This function applies default values to attributes that have not been set by the user under the following conditions:

(1) If the user has not set the value of any attribute in the IviSwtchScanner extension,  the following default values are used:

IVISWTCH_ATTR_SCAN_LIST            - "" (Empty string)
IVISWTCH_ATTR_TRIGGER_INPUT        - IVISWTCH_VAL_EXTERNAL
IVISWTCH_ATTR_SCAN_ADVANCED_OUTPUT - IVISWTCH_VAL_EXTERNAL
IVISWTCH_ATTR_SCAN_DELAY           - 0

Notes:

(1) This function performs interchangeability checking when the IVISWTCH_ATTR_INTERCHANGE_CHECK attribute is set to VI_TRUE.  If the IVISWTCH_ATTR_SPY attribute is set to VI_TRUE, you use the NI I/O Trace utility to view interchangeability warnings.  You use the IviSwtch_GetNextInterchangeWarning function to retrieve interchangeability warnings when the IVISWTCH_ATTR_SPY attribute is set to VI_FALSE.  For more information about interchangeability checking, refer to the help text for the IVISWTCH_ATTR_INTERCHANGE_CHECK attribute.

(2) This function is part of the IviSwtchScanner [SCN] extension group.
     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
   �<-   �  �    Instrument Handle                ��#����  �    Status                                 	          4    This function aborts a previously initiated scan. You initiate a scan with the IviSwtch_InitiateScan function.

If the instrument is not currently scanning, this function returns the IVISWTCH_ERROR_NO_SCAN_IN_PROGRESS error.

Notes:

(1) This function is part of the IviSwtchScanner [SCN] extension group.
     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
   ��-   �  �    Instrument Handle                �m#����  �    Status                                 	           �    This function returns the state of the switch module. It indicates if the instrument is currently scanning or is idle.

Notes:

(1) This function is part of the IviSwtchScanner [SCN] extension group.
     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    Indicates the state of the switch module.  The driver returns the value of IVISWTCH_ATTR_IS_SCANNING attribute.


The value VI_TRUE indicates that the switch module is scanning.

The value VI_FALSE indicates that the switch module is idle.   �-   �  �    Instrument Handle                z#����  �    Status                           � a � �  �    Is Scanning                            	           	           �    This function waits until the instrument stops scanning.

Notes:

(1) This function is part of the IviSwtchScanner [SCN] extension group.
     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    Specifies the maximum length of time for this function to wait until the instrument stops scanning.
If the time you specify elapses before it stops scanning, this function returns a timeout error.

The units are milliseconds.   �-   �  �    Instrument Handle                �#����  �    Status                           � a � �  �    Maximum Time (ms)                      	              �    This function sends a command to trigger the switch.  Call this function if you pass IVISWTCH_VAL_SOFTWARE_TRIG for the Trigger Input parameter of the IviSwtch_ConfigureScanTrigger function.

Notes:

(1) This function does not check the instrument status.   Typically, you call this function only in a sequence of calls to other low-level driver functions.  The sequence performs one operation.  You use the low-level functions to optimize one or more aspects of interaction with the instrument.  If you want to check the instrument status, call the IviSwtch_error_query function at the conclusion of the sequence.

(2) This function is part of the IviSwtchSoftwareTrigger [SWT] extension group.
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   "�#����  �    Status                           -�-   �  �    Instrument Handle                  	              &    This function resets the instrument to a known state and sends initialization commands to the instrument.  The initialization commands set instrument settings such as Headers Off, Short Command form, and Data Transfer Binary to the state necessary for the operation of the instrument driver.
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   0S#����  �    Status                           ;Z-   �  �    Instrument Handle                  	               �    This function resets the instrument and applies initial user specified settings from the Logical Name which was used to initialize the session.    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviSwtch_error_message function.  To obtain additional information about the error condition, use the IviSwtch_GetError and IviSwtch_ClearError functions.

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
     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   ='#����  �    Status                           A�-   �  �    Instrument Handle                  	               Z    This function runs the instrument's self test routine and returns the test result(s). 

    &    This control contains the value returned from the instrument self test.  Zero means success.  For any other code, see the device's operator's manual.

Self-Test Code    Description
---------------------------------------
   0              Passed self test
   1              Self test failed

     �    Returns the self-test response string from the instrument. See the device's operation manual for an explanation of the string's contents.

You must pass a ViChar array with at least 256 bytes.    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   Ch =  �  �    Self Test Result                 D� = � � ,    Self-Test Message                E`#����  �    Status                           Pg-   �  �    Instrument Handle                  	           	            	               �    This function places the instrument in a quiescent state where it has minimal or no impact on the system to which it is connected.    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviSwtch_error_message function.  To obtain additional information about the error condition, use the IviSwtch_GetError and IviSwtch_ClearError functions.

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
     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   R�#����  �    Status                           WT-   �  �    Instrument Handle                  	               P    This function invalidates the cached values of all attributes for the session.    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviSwtch_error_message function.  To obtain additional information about the error condition, use the IviSwtch_GetError and IviSwtch_ClearError functions.

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
     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   X�#����  �    Status                           ]�-   �  �    Instrument Handle                  	               `    This function returns the revision numbers of the instrument driver and instrument firmware.

     �    Returns the instrument driver software revision numbers in the form of a string.

You must pass a ViChar array with at least 256 bytes.     �    Returns the instrument firmware revision numbers in the form of a string.

You must pass a ViChar array with at least 256 bytes.
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   _' = 3 �  �    Instrument Driver Revision       _� =6 �  �    Firmware Revision                `C#����  �    Status                           kJ-   �  �    Instrument Handle                  	            	            	               V    This function reads an error code and a message from the instrument's error queue.

     B    Returns the error code read from the instrument's error queue.

     �    Returns the error message string read from the instrument's error message queue.

You must pass a ViChar array with at least 256 bytes.
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   m^ =  �  �    Error Code                       m� = � � ,    Error Message                    n:#����  �    Status                           yA-   �  �    Instrument Handle                  	           	            	               n    This function converts a status code returned by an instrument driver function into a user-readable string.     )Z    Pass the Status parameter that is returned from any of the instrument driver functions.
          
Default Value:  0  (VI_SUCCESS)
          
IviSwtch Status Codes:
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
IVI Engine Status Codes:
Status    Description
-------------------------------------------------
ERRORS:
BFFA0001  Instrument error. Call IviSwtch_error_query.
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

You must pass a ViChar array with at least 256 bytes.
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

You can pass VI_NULL for this parameter.  This is useful when one of the initialize functions fail.

Default Value:  VI_NULL
   {m =  �  h    Error Code                       �� = � � �    Error Message                    �j#����  �    Status                           �q-   �  �    Instrument Handle                  0    	            	           VI_NULL    `    The function returns the channel string that is in the channel table at an index you specify.
     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviSwtch_error_message function.  To obtain additional information about the error condition, use the IviSwtch_GetError and IviSwtch_ClearError functions.

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
     =    A 1-based index into the channel table.


Default Value:  1     �    Returns the channel string that is in the channel table at the index you specify.

Do not modify the contents of the channel string.    �    Pass the number of bytes in the ViChar array you specify for the Channel Name parameter.

If the channel name, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies BufferSize - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Channel Name buffer parameter.

Default Value:  None   ��-   �  �    Instrument Handle                ��#����  �    Status                           �\ = 0 �  �    Index                            �� �# �  �    Channel String                   �/ � / �  �    Buffer Size                            	           1    	                h    This function returns the C session instrument handle you use to call the specific driver's functions.     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     Z    Returns the C session instrument handle you use to call the specific driver's functions.   ��-   �  �    Instrument Handle                �d#����  �    Status                           �k = � �  �    Specific Driver C Handle               	           	          �    This function retrieves and then clears the IVI error information for the session or the current execution thread. One exception exists: If the BufferSize parameter is 0, the function does not clear the error information. By passing 0 for the buffer size, the caller can ascertain the buffer size required to get the entire error description string and then call the function again with a sufficiently large buffer.

If the user specifies a valid IVI session for the InstrumentHandle parameter, Get Error retrieves and then clears the error information for the session.  If the user passes VI_NULL for the InstrumentHandle parameter, this function retrieves and then clears the error information for the current execution thread.  If the InstrumentHandle parameter is an invalid session, the function does nothing and returns an error. Normally, the error information describes the first error that occurred since the user last called IviSwtch_GetError or IviSwtch_ClearError.
    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviSwtch_error_message function.  To obtain additional information about the error condition, use the IviSwtch_GetError and IviSwtch_ClearError functions.

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
     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Pass the number of bytes in the ViChar array you specify for the Description parameter.

If the error description, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies BufferSize - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Description buffer parameter.

Default Value:  None     �    Returns the error code for the session or execution thread.

If you pass 0 for the Buffer Size, you can pass VI_NULL for this parameter.
    �    Returns the error description for the IVI session or execution thread.  If there is no description, the function returns an empty string.

The buffer must contain at least as many elements as the value you specify with the Buffer Size parameter.  If the error description, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass 0 for the Buffer Size, you can pass VI_NULL for this parameter.   �c#����  �    Status                           �-   �  �    Instrument Handle                �� =@ �  �    BufferSize                       ֨ = Q �  �    Code                             �; � Q � �    Description                        	                   	           	           d    This function clears the error code and error description for the IVI session. If the user specifies a valid IVI session for the instrumentHandle parameter, this function clears the error information for the session. If the user passes VI_NULL for the Vi parameter, this function clears the error information for the current execution thread. If the Vi parameter is an invalid session, the function does nothing and returns an error.
The function clears the error code by setting it to VI_SUCCESS.  If the error description string is non-NULL, the function de-allocates the error description string and sets the address to VI_NULL.

Maintaining the error information separately for each thread is useful if the user does not have a session handle to pass to the IviSwtch_GetError function, which occurs when a call to IviSwtch_init or IviSwtch_InitWithOptions fails.    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviSwtch_error_message function.  To obtain additional information about the error condition, use the IviSwtch_GetError and IviSwtch_ClearError functions.

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
     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   ��#����  �    Status                           �-   �  �    Instrument Handle                  	              �    This function returns the interchangeability warnings associated with the IVI session.  It retrieves and clears the oldest instance in which the class driver recorded an interchangeability warning.  Interchangeability warnings indicate that using your application with a different instrument might cause different behavior.  If the IVISWTCH_ATTR_SPY attribute is set to VI_FALSE, you use this function to retrieve interchangeability warnings.  If the IVISWTCH_ATTR_SPY attribute is set to VI_TRUE, you use the NI I/O Trace utility to view interchangeability warnings.

The class driver performs interchangeability checking when the IVISWTCH_ATTR_INTERCHANGE_CHECK attribute is set to VI_TRUE and you call one of the following functions:

IviSwtch_Connect ()
IviSwtch_SetPath ()
IviSwtch_InitiateScan ()

If the next interchangeability warning string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number for the buffer size, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0 for the buffer size, you can pass VI_NULL for the Interchange Warning buffer parameter.

The function returns an empty string in the Interchange Warning parameter if no interchangeability warnings remain for the session.

Interchangeability checking examines the attributes in a capability group only if you specify a value for at least one attribute within that group.  In general, the class driver generates interchangeability warnings when it encounters one of the following conditions:

(1) An attribute that affects the behavior of the instrument is in a state that you did not specify.

(2) You set a class-defined attribute to an instrument-specific value.

(3) You set the value of an attribute that the class driver defines as read-only.

(4) The class driver encounters an error when it tries to apply a value to an extension attribute that your program never configures.

    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the return buffer, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    �    Pass the number of bytes in the ViChar array you specify for the Interchange Warning parameter.

If the next interchangeability warning string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Interchange Warning buffer parameter.

Default Value:  None
        Returns the next interchange warning for the IVI session.  If there are no interchange warnings, the function returns an empty  string.

The buffer must contain at least as many elements as the value you specify with the Buffer Size parameter.  If the next interchangeability warning string, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

This parameter returns an empty string if no interchangeability
warnings remain for the session.

   ��#����  �    Status or Required Size          �s-   �  �    Instrument Handle                �, = � �  �    Buffer Size                      �3 � Q � �    Interchange Warning                	                   	            �    The specific driver performs interchangeability checking if the IVISWTCH_ATTR_INTERCHANGE_CHECK attribute is set to VI_TRUE.  This function clears the list of current interchange warnings.
     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
   - 	  �  �    Instrument Handle                �#����  �    Status                                 	          �    When developing a complex test system that consists of multiple test modules, it is generally a good idea to design the test modules so that they can run in any order.  To do so requires ensuring that each test module completely configures the state of each instrument it uses.  If a particular test module does not completely configure the state of an instrument, the state of the instrument depends on the configuration from a previously executed test module.  If you execute the test modules in a different order, the behavior of the instrument and therefore the entire test module is likely to change.  This change in behavior is generally instrument specific and represents an interchangeability problem.

You can use this function to test for such cases.  After you call this function, the interchangeability checking algorithms in the specific driver ignore all previous configuration operations.  By calling this function at the beginning of a test module, you can determine whether the test module has dependencies on the operation of previously executed test modules.

This function does not clear the interchangeability warnings from the list of previously recorded interchangeability warnings.  If you want to guarantee that the IviSwtch_GetNextInterchangeWarning function only returns those interchangeability warnings that are generated after calling this function, you must clear the list of interchangeability warnings.  You can clear the interchangeability warnings list by repeatedly calling the IviSwtch_GetNextInterchangeWarning function until no more interchangeability warnings are returned.  If you are not interested in the content of those warnings, you can call the IviSwtch_ClearInterchangeWarnings function.     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    -   �  �    Instrument Handle                �#����  �    Status                                 	          q    This function obtains the coercion information associated with the IVI session.  It retrieves and clears the oldest instance in which the specific driver coerced a value you specified to another value.

If you set the IVISWTCH_ATTR_RECORD_COERCIONS attribute to VI_TRUE, the specific driver keeps a list of all coercions it makes on ViInt32 or ViReal64 values you pass to instrument driver functions.  If the IVISWTCH_ATTR_SPY attribute is set to VI_FALSE, you use this function to retrieve information from that list.  If the IVISWTCH_ATTR_SPY attribute is set to VI_TRUE, you use the NI I/O Trace utility to view the coercion information.

If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Coercion Record buffer parameter.

The function returns an empty string in the Coercion Record parameter if no coercion records remain for the session.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the return buffer, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

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
   '�#����  �    Status or Required Size          4�-   �  �    Instrument Handle                5R � Q � �    Coercion Record                  98 = � �  �    Buffer Size                        	               	               :    This function obtains a multithread lock on the instrument session.  Before it does so, it waits until all other execution threads have released their locks on the instrument session.

Other threads might have obtained a lock on this session in the following ways:

- The user's application called IviSwtch_LockSession.

- A call to the instrument driver locked the session.

- A call to the IVI engine locked the session.

After your call to IviSwtch_LockSession returns successfully, no other threads can access the instrument session until you call IviSwtch_UnlockSession.

Use IviSwtch_LockSession and IviSwtch_UnlockSession around a sequence of calls to instrument driver functions if you require that the instrument retain its settings through the end of the sequence.

You can safely make nested calls to IviSwtch_LockSession within the same thread.  To completely unlock the session, you must balance each call to IviSwtch_LockSession with a call to IviSwtch_UnlockSession.  If, however, you use the Caller Has Lock parameter in all calls to IviSwtch_LockSession and IviSwtch_UnlockSession within a function, the IVI Library locks the session only once within the function regardless of the number of calls you make to IviSwtch_LockSession.  This allows you to call IviSwtch_UnlockSession just once at the end of the function. 
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    This parameter serves as a convenience.  If you do not want to use this parameter, pass VI_NULL. 

Use this parameter in complex functions to keep track of whether you obtain a lock and therefore need to unlock the session.  Pass the address of a local ViBoolean variable.  In the declaration of the local variable, initialize it to VI_FALSE.  Pass the address of the same local variable to any other calls you make to IviSwtch_LockSession or IviSwtch_UnlockSession in the same function.

The parameter is an input/output parameter.  IviSwtch_LockSession and IviSwtch_UnlockSession each inspect the current value and take the following actions:

- If the value is VI_TRUE, IviSwtch_LockSession does not lock the session again.  If the value is VI_FALSE, IviSwtch_LockSession obtains the lock and sets the value of the parameter to VI_TRUE.

- If the value is VI_FALSE, IviSwtch_UnlockSession does not attempt to unlock the session.  If the value is VI_TRUE, IviSwtch_UnlockSession releases the lock and sets the value of the parameter to VI_FALSE.
 
Thus, you can, call IviSwtch_UnlockSession at the end of your function without worrying about whether you actually have the lock.  

Example:

ViStatus TestFunc (ViSession vi, ViInt32 flags)
{
    ViStatus error = VI_SUCCESS;
    ViBoolean haveLock = VI_FALSE;

    if (flags & BIT_1)
        {
        viCheckErr( IviSwtch_LockSession(vi, &haveLock));
        viCheckErr( TakeAction1(vi));
        if (flags & BIT_2)
            {
            viCheckErr( IviSwtch_UnlockSession(vi, &haveLock));
            viCheckErr( TakeAction2(vi));
            viCheckErr( IviSwtch_LockSession(vi, &haveLock);
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
    IviSwtch_UnlockSession(vi, &haveLock);
    return error;
}   Bb#����  �    Status                           Mi-   �  �    Instrument Handle                N# H � �  �    Caller Has Lock                    	               	            �    This function releases a lock that you acquired on an instrument session using IviSwtch_LockSession.  Refer to IviSwtch_LockSession for additional information on session locks.
    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    This parameter serves as a convenience.  If you do not want to use this parameter, pass VI_NULL. 

Use this parameter in complex functions to keep track of whether you obtain a lock and therefore need to unlock the session. 
Pass the address of a local ViBoolean variable.  In the declaration of the local variable, initialize it to VI_FALSE.  Pass the address of the same local variable to any other calls you make to IviSwtch_LockSession or IviSwtch_UnlockSession in the same function.

The parameter is an input/output parameter.  IviSwtch_LockSession and IviSwtch_UnlockSession each inspect the current value and take the following actions:

- If the value is VI_TRUE, IviSwtch_LockSession does not lock the session again.  If the value is VI_FALSE, IviSwtch_LockSession obtains the lock and sets the value of the parameter to VI_TRUE.

- If the value is VI_FALSE, IviSwtch_UnlockSession does not attempt to unlock the session.  If the value is VI_TRUE, IviSwtch_UnlockSession releases the lock and sets the value of the parameter to VI_FALSE.
 
Thus, you can, call IviSwtch_UnlockSession at the end of your function without worrying about whether you actually have the lock.  

Example:

ViStatus TestFunc (ViSession vi, ViInt32 flags)
{
    ViStatus error = VI_SUCCESS;
    ViBoolean haveLock = VI_FALSE;

    if (flags & BIT_1)
        {
        viCheckErr( IviSwtch_LockSession(vi, &haveLock));
        viCheckErr( TakeAction1(vi));
        if (flags & BIT_2)
            {
            viCheckErr( IviSwtch_UnlockSession(vi, &haveLock));
            viCheckErr( TakeAction2(vi));
            viCheckErr( IviSwtch_LockSession(vi, &haveLock);
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
    IviSwtch_UnlockSession(vi, &haveLock);
    return error;
}   Wi#����  �    Status                           bp-   �  �    Instrument Handle                c* H � �  �    Caller Has Lock                    	               	           �    This function performs the following operations:

- Closes the instrument I/O session.

- Destroys the instrument driver session and all of its attributes.

- Deallocates any memory resources the driver uses.

Notes:

(1) You must unlock the session before calling IviSwtch_close.

(2) After calling IviSwtch_close, you cannot use the instrument driver again until you call IviSwtch_init.

    
�    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviSwtch_error_message function.  To obtain additional information about the error condition, call the IviSwtch_GetError function.  To clear the error information from the driver, call the IviSwtch_ClearError function.
          
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
3FFA2001  Some connections remain after disconnecting.
3FFA2002  The channels are implicitly connected.  

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2001  Invalid path string.
BFFA2002  Invalid Scan List string.
BFFA2003  One of the channels is in use.
BFFA2004  The scan list string is empty.
BFFA2005  The path string is empty.
BFFA2006  The switch module is currently in scanning mode.
BFFA2007  The switch module is not currently in scanning mode.
BFFA2008  No explicit path exists between the two channels.
BFFA2009  Cannot explicitly connect a configuration channel.
BFFA200A  One path channel is not a configuration channel.
BFFA200B  Cannot connect two sources.
BFFA200C  The channels are explicitly connected.
BFFA200D  A leg in the path does not begin with a channel name.
BFFA200E  A leg in the path is missing the second channel name.
BFFA200F  The first and second channels in the leg are the same.
BFFA2010  Duplicate channel in the path string.
BFFA2011  No path found between the channels.
BFFA2012  Beginning and end of adjacent legs are not the same.
BFFA2013  Path contains a leg with un-connectable channels.
BFFA2014  A leg in the path is already connected.
BFFA2015  A channel cannot be connected to itself.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviSwtch_init or IviSwtch_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   mE#����  �    Status                           xL-   �  �    Instrument Handle                  	            ����         �  1|             K.        init                                                                                                                                    ����         2�  SX             K.        InitWithOptions                                                                                                                         ����         U.  l>             K.        ConfigureScanList                                                                                                                       ����         m�  �             K.        ConfigureScanTrigger                                                                                                                    ����         ��  ��             K.        SetContinuousScan                                                                                                                       ����         �`  ��             K.        SetAttributeViInt32                                                                                                                     ����         �_  ��             K.        SetAttributeViReal64                                                                                                                    ����         �a  ��             K.        SetAttributeViString                                                                                                                    ����         �c �             K.        SetAttributeViBoolean                                                                                                                   ����        f 1�             K.        SetAttributeViSession                                                                                                                   ����        3i K�             K.        GetAttributeViInt32                                                                                                                     ����        L� e[             K.        GetAttributeViReal64                                                                                                                    ����        f� �7             K.        GetAttributeViString                                                                                                                    ����        �� �             K.        GetAttributeViBoolean                                                                                                                   ����        �L ��             K.        GetAttributeViSession                                                                                                                   ����        �� ��             K.        CheckAttributeViInt32                                                                                                                   ����        �l �X             K.        CheckAttributeViReal64                                                                                                                  ����        �� 
�             K.        CheckAttributeViString                                                                                                                  ����        z $h             K.        CheckAttributeViBoolean                                                                                                                 ����        & =�             K.        CheckAttributeViSession                                                                                                                 ����        ?� \�             K.        Connect                                                                                                                                 ����        ]� rs             K.        Disconnect                                                                                                                              ����        sc �             K.        DisconnectAll                                                                                                                           ����        �Z ��             K.        IsDebounced                                                                                                                             ����        �o ��             K.        WaitForDebounce                                                                                                                         ����        �� ��             K.        CanConnect                                                                                                                              ����        �$ �a             K.        SetPath                                                                                                                                 ����        � ��             K.        GetPath                                                                                                                                 ����        �+ ��             K.        InitiateScan                                                                                                                            ����        �w t             K.        AbortScan                                                                                                                               ����        � z             K.        IsScanning                                                                                                                              ����        5 u             K.        WaitForScanComplete                                                                                                                     ����         ( .�             K.        SendSoftwareTrigger                                                                                                                     ����        /% <             K.        reset                                                                                                                                   ����        <� B�             K.        ResetWithDefaults                                                                                                                       ����        C Q!             K.        self_test                                                                                                                               ����        R X             K.        Disable                                                                                                                                 ����        X� ^E             K.        InvalidateAllAttributes                                                                                                                 ����        ^� l             K.        revision_query                                                                                                                          ����        m  y�             K.        error_query                                                                                                                             ����        z� ��             K.        error_message                                                                                                                           ����        �� �             K.        GetChannelName                                                                                                                          ����        �: ��             K.        GetSpecificDriverCHandle                                                                                                                ����        ʈ �7             K.        GetError                                                                                                                                ����        �l �=             K.        ClearError                                                                                                                              ����        � Y             K.        GetNextInterchangeWarning                                                                                                               ����        M �             K.        ClearInterchangeWarnings                                                                                                                ����        O !�             K.        ResetInterchangeCheck                                                                                                                   ����        "[ <,             K.        GetNextCoercionRecord                                                                                                                   ����        =  U�             K.        LockSession                                                                                                                             ����        V� j�             K.        UnlockSession                                                                                                                           ����        k� y             K.        close                                                                                                                                                                                                                              �Initialize                                                                           �Initialize With Options                                                             �Configuration                                                                        �Configure Scan List [SCN]                                                            �Configure Scan Trigger [SCN]                                                         �Set Continuous Scan [SCN]                                                           �Set/Get/Check Attribute                                                             8Set Attribute                                                                        �Set Attribute ViInt32                                                                �Set Attribute ViReal64                                                               �Set Attribute ViString                                                               �Set Attribute ViBoolean                                                              �Set Attribute ViSession                                                             �Get Attribute                                                                        �Get Attribute ViInt32                                                                �Get Attribute ViReal64                                                               �Get Attribute ViString                                                               �Get Attribute ViBoolean                                                              �Get Attribute ViSession                                                             SCheck Attribute                                                                      �Check Attribute ViInt32                                                              �Check Attribute ViReal64                                                             �Check Attribute ViString                                                             �Check Attribute ViBoolean                                                            �Check Attribute ViSession                                                           �Route                                                                                �Connect Channels                                                                     �Disconnect Channels                                                                  �Disconnect All Channels                                                              �Switch Is Debounced?                                                                 �Wait For Debounce                                                                    �Can Connect Channels?                                                               nPaths                                                                                �Set Path                                                                             �Get Path                                                                            �Scan                                                                                 �Initiate Scan [SCN]                                                                  �Abort Scan [SCN]                                                                     �Switch Is Scanning? [SCN]                                                            �Wait For Scan To Complete [SCN]                                                      �Send Software Trigger [SWT]                                                         Utility                                                                              �Reset                                                                                �Reset With Defaults                                                                  �Self-Test                                                                            �Disable                                                                              �Invalidate All Attributes                                                            �Revision Query                                                                       �Error-Query                                                                          �Error Message                                                                        �Get Channel Name                                                                     �Get Specific Driver C Handle                                                        nError Info                                                                           �Get Error                                                                            �Clear Error                                                                         �Interchangeability Info                                                              �Get Next Interchange Warning                                                         �Clear Interchange Warnings                                                           �Reset Interchange Check                                                             Coercion Info                                                                        �Get Next Coercion Record                                                            aLocking                                                                              �Lock Session                                                                         �Unlock Session                                                                       �Close                                                                           