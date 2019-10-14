;*******************************************************************************
;                                                                              *
;    Microchip licenses this software to you solely for use with Microchip     *
;    products. The software is owned by Microchip and/or its licensors, and is *
;    protected under applicable copyright laws.  All rights reserved.          *
;                                                                              *
;    This software and any accompanying information is for suggestion only.    *
;    It shall not be deemed to modify Microchip?s standard warranty for its    *
;    products.  It is your responsibility to ensure that this software meets   *
;    your requirements.                                                        *
;                                                                              *
;    SOFTWARE IS PROVIDED "AS IS".  MICROCHIP AND ITS LICENSORS EXPRESSLY      *
;    DISCLAIM ANY WARRANTY OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING  *
;    BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS    *
;    FOR A PARTICULAR PURPOSE, OR NON-INFRINGEMENT. IN NO EVENT SHALL          *
;    MICROCHIP OR ITS LICENSORS BE LIABLE FOR ANY INCIDENTAL, SPECIAL,         *
;    INDIRECT OR CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, HARM TO     *
;    YOUR EQUIPMENT, COST OF PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR    *
;    SERVICES, ANY CLAIMS BY THIRD PARTIES (INCLUDING BUT NOT LIMITED TO ANY   *
;    DEFENSE THEREOF), ANY CLAIMS FOR INDEMNITY OR CONTRIBUTION, OR OTHER      *
;    SIMILAR COSTS.                                                            *
;                                                                              *
;    To the fullest extend allowed by law, Microchip and its licensors         *
;    liability shall not exceed the amount of fee, if any, that you have paid  *
;    directly to Microchip to use this software.                               *
;                                                                              *
;    MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE OF    *
;    THESE TERMS.                                                              *
;                                                                              *
;*******************************************************************************
;                                                                              *
;    Filename:                                                                 *
;    Date:                                                                     *
;    File Version:                                                             *
;    Author:                                                                   *
;    Company:                                                                  *
;    Description:                                                              *
;                                                                              *
;*******************************************************************************
;                                                                              *
;    Notes: In the MPLAB X Help, refer to the MPASM Assembler documentation    *
;    for information on assembly instructions.                                 *
;                                                                              *
;*******************************************************************************
;                                                                              *
;    Known Issues: This template is designed for relocatable code.  As such,   *
;    build errors such as "Directive only allowed when generating an object    *
;    file" will result when the 'Build in Absolute Mode' checkbox is selected  *
;    in the project properties.  Designing code in absolute mode is            *
;    antiquated - use relocatable mode.                                        *
;                                                                              *
;*******************************************************************************
;                                                                              *
;    Revision History:                                                         *
;                                                                              *
;*******************************************************************************



;*******************************************************************************
; Processor Inclusion
;
; TODO Step #1 Open the task list under Window > Tasks.  Include your
; device .inc file - e.g. #include <device_name>.inc.  Available
; include files are in C:\Program Files\Microchip\MPLABX\mpasmx
; assuming the default installation path for MPLAB X.  You may manually find
; the appropriate include file for your device here and include it, or
; simply copy the include generated by the configuration bits
; generator (see Step #2).
;
;*******************************************************************************

; TODO INSERT INCLUDE CODE HERE

;*******************************************************************************
;
; TODO Step #2 - Configuration Word Setup
;
; The 'CONFIG' directive is used to embed the configuration word within the
; .asm file. MPLAB X requires users to embed their configuration words
; into source code.  See the device datasheet for additional information
; on configuration word settings.  Device configuration bits descriptions
; are in C:\Program Files\Microchip\MPLABX\mpasmx\P<device_name>.inc
; (may change depending on your MPLAB X installation directory).
;
; MPLAB X has a feature which generates configuration bits source code.  Go to
; Window > PIC Memory Views > Configuration Bits.  Configure each field as
; needed and select 'Generate Source Code to Output'.  The resulting code which
; appears in the 'Output Window' > 'Config Bits Source' tab may be copied
; below.
;
;*******************************************************************************

; TODO INSERT CONFIG HERE

;*******************************************************************************
;
; TODO Step #3 - Variable Definitions
;
; Refer to datasheet for available data memory (RAM) organization assuming
; relocatible code organization (which is an option in project
; properties > mpasm (Global Options)).  Absolute mode generally should
; be used sparingly.
;
; Example of using GPR Uninitialized Data
;
;   GPR_VAR        UDATA
;   MYVAR1         RES        1      ; User variable linker places
;   MYVAR2         RES        1      ; User variable linker places
;   MYVAR3         RES        1      ; User variable linker places
;
;   ; Example of using Access Uninitialized Data Section (when available)
;   ; The variables for the context saving in the device datasheet may need
;   ; memory reserved here.
;   INT_VAR        UDATA_ACS
;   W_TEMP         RES        1      ; w register for context saving (ACCESS)
;   STATUS_TEMP    RES        1      ; status used for context saving
;   BSR_TEMP       RES        1      ; bank select used for ISR context saving
;
;*******************************************************************************

; TODO PLACE VARIABLE DEFINITIONS GO HERE

;*******************************************************************************
; Reset Vector
;*******************************************************************************

RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START                   ; go to beginning of program

;*******************************************************************************
; TODO Step #4 - Interrupt Service Routines
;
; There are a few different ways to structure interrupt routines in the 8
; bit device families.  On PIC18's the high priority and low priority
; interrupts are located at 0x0008 and 0x0018, respectively.  On PIC16's and
; lower the interrupt is at 0x0004.  Between device families there is subtle
; variation in the both the hardware supporting the ISR (for restoring
; interrupt context) as well as the software used to restore the context
; (without corrupting the STATUS bits).
;
; General formats are shown below in relocatible format.
;
;------------------------------PIC16's and below--------------------------------
;
; ISR       CODE    0x0004           ; interrupt vector location
;
;     <Search the device datasheet for 'context' and copy interrupt
;     context saving code here.  Older devices need context saving code,
;     but newer devices like the 16F#### don't need context saving code.>
;
;     RETFIE
;
;----------------------------------PIC18's--------------------------------------
;
; ISRHV     CODE    0x0008
;     GOTO    HIGH_ISR
; ISRLV     CODE    0x0018
;     GOTO    LOW_ISR
;
; ISRH      CODE                     ; let linker place high ISR routine
; HIGH_ISR
;     <Insert High Priority ISR Here - no SW context saving>
;     RETFIE  FAST
;
; ISRL      CODE                     ; let linker place low ISR routine
; LOW_ISR
;       <Search the device datasheet for 'context' and copy interrupt
;       context saving code here>
;     RETFIE
;
;*******************************************************************************

; TODO INSERT ISR HERE

;*******************************************************************************
; MAIN PROGRAM
;*******************************************************************************

MAIN_PROG CODE                      ; let linker place main program

START

    ; TODO Step #5 - Insert Your Program Here
; DESARROLLO DEL PROGRAMA
;1
VALOR
	BTFSS	PORTB,0 		; prueba del bit 0 del puerto B
	GOTO		NUEVO_VALOR
	MOVLW	B'00000000' 		; mueve 0xAA al registro W
	MOVWF	PORTA			; pasa el valor al puerto A
	GOTO		VALOR
NUEVO_VALOR
	MOVLW	B'00000001' 		; mueve 0x55 al registro W
	MOVWF	PORTA			; pasa el valor al puerto A
	GOTO    VALOR2
VALOR2
	BTFSS	PORTB,0
	GOTO		NUEVO_VALOR
	MOVLW	B'00000000' 		
	MOVWF	PORTA
	GOTO VALOR3

;2
VALOR3
	BTFSS	PORTB,0
	GOTO		NUEVO_VALOR2
	MOVLW	B'00000000' 		
	MOVWF	PORTA			
	GOTO		VALOR3
NUEVO_VALOR2
	MOVLW	B'00000010' 		
	MOVWF	PORTA			
	GOTO    VALOR4
VALOR4
	BTFSS	PORTB,0
	GOTO		NUEVO_VALOR2
	MOVLW	B'00000000' 		
	MOVWF	PORTA
	GOTO VALOR5
	
;3
VALOR5
	BTFSS	PORTB,0
	GOTO		NUEVO_VALOR3
	MOVLW	B'00000000' 		
	MOVWF	PORTA			
	GOTO		VALOR5
NUEVO_VALOR3
	MOVLW	B'00000100' 		
	MOVWF	PORTA			
	GOTO    VALOR6
VALOR6
	BTFSS	PORTB,0
	GOTO		NUEVO_VALOR3
	MOVLW	B'00000000' 		
	MOVWF	PORTA
	GOTO VALOR7

;4
VALOR7
	BTFSS	PORTB,0
	GOTO		NUEVO_VALOR4
	MOVLW	B'00000000' 		
	MOVWF	PORTA			
	GOTO		VALOR7
NUEVO_VALOR4
	MOVLW	B'00001000' 		
	MOVWF	PORTA			
	GOTO    VALOR8
VALOR8
	BTFSS	PORTB,0	
	GOTO		NUEVO_VALOR4
	MOVLW	B'00000000' 		
	MOVWF	PORTA
	GOTO VALOR9

;5
VALOR9
	BTFSS	PORTB,0	
	GOTO		NUEVO_VALOR5
	MOVLW	B'00000000' 		
	MOVWF	PORTA			
	GOTO		VALOR9
NUEVO_VALOR5
	MOVLW	B'00010000' 		
	MOVWF	PORTA			
	GOTO    VALOR10
VALOR10
	BTFSS	PORTB,0	
	GOTO		NUEVO_VALOR5
	MOVLW	B'00000000' 		
	MOVWF	PORTA
	GOTO VALOR11

;6
VALOR11
	BTFSS	PORTB,0
	GOTO		NUEVO_VALOR6
	MOVLW	B'00000000' 		
	MOVWF	PORTA			
	GOTO		VALOR11
NUEVO_VALOR6
	MOVLW	B'00100000' 		
	MOVWF	PORTA			
	GOTO    VALOR12
VALOR12
	BTFSS	PORTB,0
	GOTO		NUEVO_VALOR6
	MOVLW	B'00000000' 		
	MOVWF	PORTA
	GOTO VALOR13

;7
VALOR13
	BTFSS	PORTB,0
	GOTO		NUEVO_VALOR7
	MOVLW	B'00000000' 		
	MOVWF	PORTA			
	GOTO		VALOR13
NUEVO_VALOR7
	MOVLW	B'00111111' 		
	MOVWF	PORTA			
	GOTO    VALOR14
VALOR14
	BTFSS	PORTB,0
	GOTO		NUEVO_VALOR7
	MOVLW	B'00000000' 		
	MOVWF	PORTA
	GOTO VALOR15

;8
VALOR15
	BTFSS	PORTB,1
	GOTO		NUEVO_VALOR8
	MOVLW	B'00000000' 		
	MOVWF	PORTA			
	GOTO		VALOR15
NUEVO_VALOR8
	MOVLW	B'00111111' 		
	MOVWF	PORTA			
	GOTO    VALOR16
VALOR16
	BTFSS	PORTB,1
	GOTO		NUEVO_VALOR8
	MOVLW	B'00000000' 		
	MOVWF	PORTA
	GOTO VALOR17
	
;9
VALOR17
	BTFSS	PORTB,1
	GOTO		NUEVO_VALOR9
	MOVLW	B'00000000' 		
	MOVWF	PORTA			
	GOTO		VALOR17
NUEVO_VALOR9
	MOVLW	B'00100000' 		
	MOVWF	PORTA			
	GOTO    VALOR18
VALOR18
	BTFSS	PORTB,1	
	GOTO		NUEVO_VALOR9
	MOVLW	B'00000000' 		
	MOVWF	PORTA
	GOTO VALOR19
	
;10
VALOR19
	BTFSS	PORTB,1
	GOTO		NUEVO_VALOR10
	MOVLW	B'00000000' 		
	MOVWF	PORTA			
	GOTO		VALOR19
NUEVO_VALOR10
	MOVLW	B'00010000' 		
	MOVWF	PORTA			
	GOTO    VALOR20
VALOR20
	BTFSS	PORTB,1
	GOTO		NUEVO_VALOR10
	MOVLW	B'00000000' 		
	MOVWF	PORTA
	GOTO VALOR21
	
;11
VALOR21
	BTFSS	PORTB,1
	GOTO		NUEVO_VALOR11
	MOVLW	B'00000000' 		
	MOVWF	PORTA			
	GOTO		VALOR21
NUEVO_VALOR11
	MOVLW	B'00001000' 		
	MOVWF	PORTA			
	GOTO    VALOR22
VALOR22
	BTFSS	PORTB,1
	GOTO		NUEVO_VALOR11
	MOVLW	B'00000000' 		
	MOVWF	PORTA
	GOTO VALOR23
	
;12
VALOR23
	BTFSS	PORTB,1
	GOTO		NUEVO_VALOR12
	MOVLW	B'00000000' 		
	MOVWF	PORTA			
	GOTO		VALOR23
NUEVO_VALOR12
	MOVLW	B'00000100' 		
	MOVWF	PORTA			
	GOTO    VALOR24
VALOR24
	BTFSS	PORTB,1
	GOTO		NUEVO_VALOR12
	MOVLW	B'00000000' 		
	MOVWF	PORTA
	GOTO VALOR25
	
;13
VALOR25
	BTFSS	PORTB,1
	GOTO		NUEVO_VALOR13
	MOVLW	B'00000000' 		
	MOVWF	PORTA			
	GOTO		VALOR25
NUEVO_VALOR13
	MOVLW	B'00000010' 		
	MOVWF	PORTA			
	GOTO    VALOR26
VALOR26
	BTFSS	PORTB,1
	GOTO		NUEVO_VALOR13
	MOVLW	B'00000000' 		
	MOVWF	PORTA
	GOTO VALOR27
	
;14
VALOR27
	BTFSS	PORTB,1
	GOTO		NUEVO_VALOR14
	MOVLW	B'00000000' 		
	MOVWF	PORTA			
	GOTO		VALOR27
NUEVO_VALOR14
	MOVLW	B'00000001' 		
	MOVWF	PORTA			
	GOTO    VALOR28
VALOR28
	BTFSS	PORTB,1
	GOTO		NUEVO_VALOR14
	MOVLW	B'00000000' 		
	MOVWF	PORTA
	GOTO VALOR29
	
;15
VALOR29
	BTFSS	PORTB,1
	GOTO		NUEVO_VALOR15
	MOVLW	B'00000000' 		
	MOVWF	PORTA			
	GOTO		VALOR29
NUEVO_VALOR15
	MOVLW	B'00111111' 		
	MOVWF	PORTA			
	GOTO    VALOR30
VALOR30
	BTFSS	PORTB,1
	GOTO		NUEVO_VALOR15
	MOVLW	B'00000000' 		
	MOVWF	PORTA
	GOTO VALOR
	
	END
