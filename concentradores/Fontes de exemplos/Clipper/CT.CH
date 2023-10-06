****
*
*    CT.CH
*
*    General adaptations for CA-Clipper Tools II / 5.2
*    Lothar Bongartz / Michael Peters
*    Copyright (c) 1991-93 Computer Associates International.
*    All rights reserved.
*
*    Version 5.2
*
*    This include file contains settings to ensure optimal
*    co-operation with Clipper 5.2 and the compatibility with
*    former versions.
*    We recommend you to link this file with the pre-processor
*    command
*
*		     #include "CT.CH"
*
*    for applications developped under Clipper Summer '87
*    which included Toolbox functions, that need to be migrated
*    to Clipper 5.2.
*
*************************************************************************

#ifndef _CT_DEFINED

*************************************************************************
*
* The following #command definition should ensure the compatibility
* to the toolbox function CSETRDONLY(). The READONLY clause is valid
* as soon as declared with USE. Without this clause, the open mode
* is depending on the current setting returned by CSETRDONLY().
*
* Example:
*
* #include "CT.CH"
*
* USE stock READONLY
* USE stock
*
* The .ppo file contains the following code:
*
* dbUseArea( .F.,, "STOCK",, if(.F. .OR. .F., !.F., NIL), .T. )
* dbUseArea( .F.,, "STOCK",, if(.F. .OR. .F., !.F., NIL), CSETRDONLY() )
*

#command USE <(db)>							;
	     [VIA <rdd>]						;
	     [ALIAS <a>]						;
	     [<new: NEW>]						;
	     [<ex: EXCLUSIVE>]						;
	     [<sh: SHARED>]						;
	     [INDEX <(index1)> [, <(indexn)>]]				;
									;
      => dbUseArea(							;
		    <.new.>, <rdd>, <(db)>, <(a)>,			;
		    if(<.sh.> .or. <.ex.>, !<.ex.>, NIL), CSETRDONLY()	;
		  )							;
									;
      [; dbSetIndex( <(index1)> )]					;
      [; dbSetIndex( <(indexn)> )]

*************************************************************************
*
* In the new release of CA-Clipper Tools all functions having
* returning enhanced key codes have been migrated to BIOS coding.
* All functions retrieving this code are completely compatible
* (both kinds of coding are accepted). Problems can arise at
* KEYREAD() or the QUIT file option (see DSETQFILE(), chapter 2,
* Expanded Driver).
*
* This incompatibility is manifested, when key codes returned
* by KEYREAD() or from a QUIT file are compared to specified codes,
* corresponding to the former table with ASC1/ASC2.
* According to this table, the low byte contains an ASCII code at a
* high byte 0, and a scan code at a high byte 1. With BIOS coding,
* both code types, ASCII code (if existing) and scan code, are
* available. Unfortunately, the first edition of the manual still contains
* the former table with ASC1/ASC2. For BIOS codes, please use
* the #include file CTSCAN.CH.
*
* When linking this file and with that the following function call,
* KEYREAD() and the QUIT option behave exactly as like under Clipper
* Summer '87.
* BIOS coding should be activated for newly created application, so we
* recommend NOT using this function call.

 EXTERNAL _S87KEYS	    // former coding corr. ASC1/ASC2

*
***************************************************************************
*
* CSETFUNC() / CSETKEY()
*
* Relative to the Clipper commands SET KEY .. TO .. and
* SET FUNCTION .. TO .. there are significant internal modifications.
* (see also the command definition in the file STD.CH.)
* The CSETKEY() and CSETFUNC() functions are also affected.
* To retain the compatibility with the previous tools, we
* have created the following pre-processor code. Based on a small
* expansion of both functions, the key code as well as the allocated
* procedure name (resp. string) will be saved in a specified
* memory range of the toolbox. This makes it possible to retrieve
* this information on request (function call).

* The function mentioned above ensures the compatibility for
* applications developped under S'87, but it also can be used
* as an example for the possibilities of the Clipper pre-processor.
*
* IMPORTANT:
* The following functions with the new parameter should not be used
* for new applications, since wi cannot guarante, that they will be
* available in future versions of the Clipper Tools.
*

#command SET KEY <n> TO <proc>						;
      => SetKey( <n>, {|p, l, v| <proc>(p, l, v)} )			;
       ; CSETKEY(<n>, <(proc)>)

#command SET KEY <n> [TO]						;
      => SetKey( <n>, NIL ) ; CSETKEY(<n>, "")

#command SET FUNCTION <n> [TO] [<c>]					;
      => __SetFunction( <n>, <c> ) ; CSETFUNC(<n>, <c>)

*
***************************************************************************

***************************************************************************
*
* Compatibility for KEYREAD()
*
* The internal _CLEARKEYR() function informs the KEYREAD() function
* about a buffer modification. The function is then completely
* compatible to Summer '87.

#command  SET TYPEAHEAD TO <n> => Set( _SET_TYPEAHEAD, <n> ) ; _CLEARKEYR()

*
***************************************************************************


***************************************************************************
*
* Compatibility for SETCURSOR()
* Under Clipper 5.2, the SETCURSOR() function returns the current
* cursor setting, while the function in the former Tools reset
* both cursors, the insert as well as the overtyping mode.
*
* To keep compatibility with existing applications, the following
* #translate command converts the call of SETCURSOR() WITHOUT
* parameter into two other calls of the same function, both WITH
* parameter. These two function calls reset both cursor modes,
* corresponding to the cursor forms valid under Clipper 5.01.


#translate SETCURSOR() => SETCURSOR(1, .F.) ; SETCURSOR(2, .T.)

*
***************************************************************************
* Warning when using TOKENNEXT() without parameters!
* The compiler will return a warning in the form of the following text
* in the corresponding program line.

#translate TOKENNEXT() =>;
x WARNING_TOKENNEXT_HAS_BEEN_USED_WITHOUT_PARAMETER__SEE_HANDBOOK_OR_NG

*
***************************************************************************
#define _CT_DEFINED
#endif
