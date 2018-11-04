;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW32)
; This file was generated Sun Nov 04 13:35:13 2018
;--------------------------------------------------------
	.module PSGlib
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _PSGSFXStatus
	.globl _PSGChannel3SFX
	.globl _PSGChannel2SFX
	.globl _PSGMusicStatus
	.globl _PSGSFXSubstringRetAddr
	.globl _PSGSFXSubstringLen
	.globl _PSGSFXLoopFlag
	.globl _PSGSFXSkipFrames
	.globl _PSGSFXLoopPoint
	.globl _PSGSFXPointer
	.globl _PSGSFXStart
	.globl _PSGChan2HighTone
	.globl _PSGChan3LowTone
	.globl _PSGChan2LowTone
	.globl _PSGChan3Volume
	.globl _PSGChan2Volume
	.globl _PSGMusicSubstringRetAddr
	.globl _PSGMusicSubstringLen
	.globl _PSGMusicLastLatch
	.globl _PSGLoopFlag
	.globl _PSGMusicSkipFrames
	.globl _PSGMusicLoopPoint
	.globl _PSGMusicPointer
	.globl _PSGMusicStart
	.globl _PSGStop
	.globl _PSGPlay
	.globl _PSGCancelLoop
	.globl _PSGPlayNoRepeat
	.globl _PSGGetStatus
	.globl _PSGSFXStop
	.globl _PSGSFXPlay
	.globl _PSGSFXCancelLoop
	.globl _PSGSFXGetStatus
	.globl _PSGSFXPlayLoop
	.globl _PSGFrame
	.globl _PSGSFXFrame
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_PSGPort	=	0x007f
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_PSGMusicStart::
	.ds 2
_PSGMusicPointer::
	.ds 2
_PSGMusicLoopPoint::
	.ds 2
_PSGMusicSkipFrames::
	.ds 1
_PSGLoopFlag::
	.ds 1
_PSGMusicLastLatch::
	.ds 1
_PSGMusicSubstringLen::
	.ds 1
_PSGMusicSubstringRetAddr::
	.ds 2
_PSGChan2Volume::
	.ds 1
_PSGChan3Volume::
	.ds 1
_PSGChan2LowTone::
	.ds 1
_PSGChan3LowTone::
	.ds 1
_PSGChan2HighTone::
	.ds 1
_PSGSFXStart::
	.ds 2
_PSGSFXPointer::
	.ds 2
_PSGSFXLoopPoint::
	.ds 2
_PSGSFXSkipFrames::
	.ds 1
_PSGSFXLoopFlag::
	.ds 1
_PSGSFXSubstringLen::
	.ds 1
_PSGSFXSubstringRetAddr::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_PSGMusicStatus::
	.ds 1
_PSGChannel2SFX::
	.ds 1
_PSGChannel3SFX::
	.ds 1
_PSGSFXStatus::
	.ds 1
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;lib/PSGlib.c:64: void PSGStop (void) {
;	---------------------------------
; Function PSGStop
; ---------------------------------
_PSGStop::
;lib/PSGlib.c:68: if (PSGMusicStatus) {
	ld	a,(#_PSGMusicStatus + 0)
	or	a, a
	ret	Z
;lib/PSGlib.c:69: PSGPort=PSGLatch|PSGChannel0|PSGVolumeData|0x0F;   // latch channel 0, volume=0xF (silent)
	ld	a,#0x9F
	out	(_PSGPort),a
;lib/PSGlib.c:70: PSGPort=PSGLatch|PSGChannel1|PSGVolumeData|0x0F;   // latch channel 1, volume=0xF (silent)
	ld	a,#0xBF
	out	(_PSGPort),a
;lib/PSGlib.c:71: if (!(PSGChannel2SFX))
	ld	a,(#_PSGChannel2SFX + 0)
	or	a, a
	jr	NZ,00102$
;lib/PSGlib.c:72: PSGPort=PSGLatch|PSGChannel2|PSGVolumeData|0x0F;   // latch channel 2, volume=0xF (silent)
	ld	a,#0xDF
	out	(_PSGPort),a
00102$:
;lib/PSGlib.c:73: if (!(PSGChannel3SFX))
	ld	a,(#_PSGChannel3SFX + 0)
	or	a, a
	jr	NZ,00104$
;lib/PSGlib.c:74: PSGPort=PSGLatch|PSGChannel3|PSGVolumeData|0x0F;   // latch channel 3, volume=0xF (silent)
	ld	a,#0xFF
	out	(_PSGPort),a
00104$:
;lib/PSGlib.c:75: PSGMusicStatus=PSG_STOPPED;
	ld	hl,#_PSGMusicStatus + 0
	ld	(hl), #0x00
	ret
;lib/PSGlib.c:79: void PSGPlay (void *song) {
;	---------------------------------
; Function PSGPlay
; ---------------------------------
_PSGPlay::
;lib/PSGlib.c:83: PSGStop();
	call	_PSGStop
;lib/PSGlib.c:84: PSGLoopFlag=1;
	ld	hl,#_PSGLoopFlag + 0
	ld	(hl), #0x01
;lib/PSGlib.c:85: PSGMusicStart=song;           // store the begin point of music
	pop	bc
	pop	de
	push	de
	push	bc
	ld	(_PSGMusicStart),de
;lib/PSGlib.c:86: PSGMusicPointer=song;         // set music pointer to begin of music
	ld	(_PSGMusicPointer),de
;lib/PSGlib.c:87: PSGMusicLoopPoint=song;       // looppointer points to begin too
	ld	(_PSGMusicLoopPoint),de
;lib/PSGlib.c:89: PSGMusicSkipFrames=0;         // reset the skip frames
	ld	hl,#_PSGMusicSkipFrames + 0
	ld	(hl), #0x00
;lib/PSGlib.c:90: PSGMusicSubstringLen=0;       // reset the substring len (for compression)
	ld	hl,#_PSGMusicSubstringLen + 0
	ld	(hl), #0x00
;lib/PSGlib.c:91: PSGMusicLastLatch=PSGLatch|PSGChannel0|PSGVolumeData|0x0F;   // latch channel 0, volume=0xF (silent)
	ld	hl,#_PSGMusicLastLatch + 0
	ld	(hl), #0x9F
;lib/PSGlib.c:92: PSGMusicStatus=PSG_PLAYING;
	ld	hl,#_PSGMusicStatus + 0
	ld	(hl), #0x01
	ret
;lib/PSGlib.c:95: void PSGCancelLoop (void) {
;	---------------------------------
; Function PSGCancelLoop
; ---------------------------------
_PSGCancelLoop::
;lib/PSGlib.c:99: PSGLoopFlag=0;
	ld	hl,#_PSGLoopFlag + 0
	ld	(hl), #0x00
	ret
;lib/PSGlib.c:102: void PSGPlayNoRepeat (void *song) {
;	---------------------------------
; Function PSGPlayNoRepeat
; ---------------------------------
_PSGPlayNoRepeat::
;lib/PSGlib.c:106: PSGPlay(song);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_PSGPlay
	pop	af
;lib/PSGlib.c:107: PSGLoopFlag=0;
	ld	hl,#_PSGLoopFlag + 0
	ld	(hl), #0x00
	ret
;lib/PSGlib.c:110: unsigned char PSGGetStatus (void) {
;	---------------------------------
; Function PSGGetStatus
; ---------------------------------
_PSGGetStatus::
;lib/PSGlib.c:114: return(PSGMusicStatus);
	ld	iy,#_PSGMusicStatus
	ld	l,0 (iy)
	ret
;lib/PSGlib.c:117: void PSGSFXStop (void) {
;	---------------------------------
; Function PSGSFXStop
; ---------------------------------
_PSGSFXStop::
;lib/PSGlib.c:121: if (PSGSFXStatus) {
	ld	a,(#_PSGSFXStatus + 0)
	or	a, a
	ret	Z
;lib/PSGlib.c:122: if (PSGChannel2SFX) {
	ld	a,(#_PSGChannel2SFX + 0)
	or	a, a
	jr	Z,00105$
;lib/PSGlib.c:123: if (PSGMusicStatus) {
	ld	a,(#_PSGMusicStatus + 0)
	or	a, a
	jr	Z,00102$
;lib/PSGlib.c:124: PSGPort=PSGLatch|PSGChannel2|(PSGChan2LowTone&0x0F);
	ld	a,(#_PSGChan2LowTone + 0)
	and	a, #0x0F
	or	a, #0xC0
	out	(_PSGPort),a
;lib/PSGlib.c:125: PSGPort=PSGChan2HighTone&0x3F;
	ld	a,(#_PSGChan2HighTone + 0)
	and	a, #0x3F
	out	(_PSGPort),a
;lib/PSGlib.c:126: PSGPort=PSGLatch|PSGChannel2|PSGVolumeData|(PSGChan2Volume&0x0F);
	ld	a,(#_PSGChan2Volume + 0)
	and	a, #0x0F
	or	a, #0xD0
	out	(_PSGPort),a
	jr	00103$
00102$:
;lib/PSGlib.c:128: PSGPort=PSGLatch|PSGChannel2|PSGVolumeData|0x0F;
	ld	a,#0xDF
	out	(_PSGPort),a
00103$:
;lib/PSGlib.c:130: PSGChannel2SFX=PSG_STOPPED;
	ld	hl,#_PSGChannel2SFX + 0
	ld	(hl), #0x00
00105$:
;lib/PSGlib.c:133: if (PSGChannel3SFX) {
	ld	a,(#_PSGChannel3SFX + 0)
	or	a, a
	jr	Z,00110$
;lib/PSGlib.c:134: if (PSGMusicStatus) {
	ld	a,(#_PSGMusicStatus + 0)
	or	a, a
	jr	Z,00107$
;lib/PSGlib.c:135: PSGPort=PSGLatch|PSGChannel3|(PSGChan3LowTone&0x0F);
	ld	a,(#_PSGChan3LowTone + 0)
	and	a, #0x0F
	or	a, #0xE0
	out	(_PSGPort),a
;lib/PSGlib.c:136: PSGPort=PSGLatch|PSGChannel3|PSGVolumeData|(PSGChan3Volume&0x0F);
	ld	a,(#_PSGChan3Volume + 0)
	and	a, #0x0F
	or	a, #0xF0
	out	(_PSGPort),a
	jr	00108$
00107$:
;lib/PSGlib.c:138: PSGPort=PSGLatch|PSGChannel3|PSGVolumeData|0x0F;
	ld	a,#0xFF
	out	(_PSGPort),a
00108$:
;lib/PSGlib.c:140: PSGChannel3SFX=PSG_STOPPED;
	ld	hl,#_PSGChannel3SFX + 0
	ld	(hl), #0x00
00110$:
;lib/PSGlib.c:142: PSGSFXStatus=PSG_STOPPED;
	ld	hl,#_PSGSFXStatus + 0
	ld	(hl), #0x00
	ret
;lib/PSGlib.c:146: void PSGSFXPlay (void *sfx, unsigned char channels) {
;	---------------------------------
; Function PSGSFXPlay
; ---------------------------------
_PSGSFXPlay::
;lib/PSGlib.c:151: PSGSFXStop();
	call	_PSGSFXStop
;lib/PSGlib.c:152: PSGSFXLoopFlag=0;
	ld	hl,#_PSGSFXLoopFlag + 0
	ld	(hl), #0x00
;lib/PSGlib.c:153: PSGSFXStart=sfx;              // store begin of SFX
	pop	bc
	pop	de
	push	de
	push	bc
	ld	(_PSGSFXStart),de
;lib/PSGlib.c:154: PSGSFXPointer=sfx;            // set the pointer to begin of SFX
	ld	(_PSGSFXPointer),de
;lib/PSGlib.c:155: PSGSFXLoopPoint=sfx;          // looppointer points to begin too
	ld	(_PSGSFXLoopPoint),de
;lib/PSGlib.c:156: PSGSFXSkipFrames=0;           // reset the skip frames
	ld	hl,#_PSGSFXSkipFrames + 0
	ld	(hl), #0x00
;lib/PSGlib.c:157: PSGSFXSubstringLen=0;         // reset the substring len
	ld	hl,#_PSGSFXSubstringLen + 0
	ld	(hl), #0x00
;lib/PSGlib.c:158: PSGChannel2SFX=(channels&SFX_CHANNEL2)?PSG_PLAYING:PSG_STOPPED;
	ld	hl, #4+0
	add	hl, sp
	ld	a, (hl)
	rrca
	jr	NC,00103$
	ld	a,#0x01
	jr	00104$
00103$:
	ld	a,#0x00
00104$:
	ld	(#_PSGChannel2SFX + 0),a
;lib/PSGlib.c:159: PSGChannel3SFX=(channels&SFX_CHANNEL3)?PSG_PLAYING:PSG_STOPPED;
	ld	hl, #4+0
	add	hl, sp
	ld	a, (hl)
	and	a, #0x02
	jr	Z,00105$
	ld	a,#0x01
	jr	00106$
00105$:
	ld	a,#0x00
00106$:
	ld	(#_PSGChannel3SFX + 0),a
;lib/PSGlib.c:160: PSGSFXStatus=PSG_PLAYING;
	ld	hl,#_PSGSFXStatus + 0
	ld	(hl), #0x01
	ret
;lib/PSGlib.c:163: void PSGSFXCancelLoop (void) {
;	---------------------------------
; Function PSGSFXCancelLoop
; ---------------------------------
_PSGSFXCancelLoop::
;lib/PSGlib.c:167: PSGSFXLoopFlag=0;
	ld	hl,#_PSGSFXLoopFlag + 0
	ld	(hl), #0x00
	ret
;lib/PSGlib.c:170: unsigned char PSGSFXGetStatus (void) {
;	---------------------------------
; Function PSGSFXGetStatus
; ---------------------------------
_PSGSFXGetStatus::
;lib/PSGlib.c:174: return(PSGSFXStatus);
	ld	iy,#_PSGSFXStatus
	ld	l,0 (iy)
	ret
;lib/PSGlib.c:177: void PSGSFXPlayLoop (void *sfx, unsigned char channels) {
;	---------------------------------
; Function PSGSFXPlayLoop
; ---------------------------------
_PSGSFXPlayLoop::
;lib/PSGlib.c:182: PSGSFXPlay(sfx, channels);
	ld	hl, #4+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	ld	hl, #3
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	_PSGSFXPlay
	pop	af
	inc	sp
;lib/PSGlib.c:183: PSGSFXLoopFlag=1;
	ld	hl,#_PSGSFXLoopFlag + 0
	ld	(hl), #0x01
	ret
;lib/PSGlib.c:186: void PSGFrame (void) {
;	---------------------------------
; Function PSGFrame
; ---------------------------------
_PSGFrame::
;lib/PSGlib.c:365: __endasm;
	ld a,(_PSGMusicStatus) ; check if we have got to play a tune
	or a
	ret z
	ld a,(_PSGMusicSkipFrames) ; check if we have got to skip frames
	or a
	jr nz,_skipFrame
	ld hl,(_PSGMusicPointer) ; read current address
	_intLoop:
	ld b,(hl) ; load PSG byte (in B)
	inc hl ; point to next byte
	ld a,(_PSGMusicSubstringLen) ; read substring len
	or a
	jr z,_continue ; check if it is 0 (we are not in a substring)
	dec a ; decrease len
	ld (_PSGMusicSubstringLen),a ; save len
	jr nz,_continue
	ld hl,(_PSGMusicSubstringRetAddr) ; substring is over, retrieve return address
	_continue:
	ld a,b ; copy PSG byte into A
	cp #0x80 ; is it a latch?
	jr c,_noLatch ; if < $80 then it is NOT a latch
	ld (_PSGMusicLastLatch),a ; it is a latch - save it
; we have got the latch PSG byte both in A and in B
; and we have to check if the value should pass to PSG or not
	bit 6,a ; test if the latch it is for channels 0-1 or for 2-3
	jr z,_send2PSG_A ; jump if it is for channels 0-1
	bit 4,a ; test if it is a volume
	jr z,_low_part_Tone ; jump if tone data (it is the low part)
	bit 5,a ; test if volume it is for channel 2 or 3
	jr z,_a1 ; jump for channel 2
	ld (_PSGChan3Volume),a ; save volume data
	ld a,(_PSGChannel3SFX) ; channel 3 free?
	or a
	jr z,_send2PSG
	jp _intLoop
	_a1:
	ld (_PSGChan2Volume),a ; save volume data
	ld a,(_PSGChannel2SFX) ; channel 2 free?
	or a
	jr z,_send2PSG
	jp _intLoop
	_low_part_Tone:
; we have got the latch PSG byte both in A and in B
; and we have to check if the value should pass to PSG or not
	bit 5,a ; test if tone it is for channel 2 or 3
	jr z,_a2 ; jump if channel 2
	ld (_PSGChan3LowTone),a ; save tone LOW data
	ld a,(_PSGChannel3SFX) ; channel 3 free?
	or a
	jr z,_send2PSG
	jp _intLoop
	_a2:
	ld (_PSGChan2LowTone),a ; save tone LOW data
	ld a,(_PSGChannel2SFX) ; channel 2 free?
	or a
	jr z,_send2PSG
	jp _intLoop
	_skipFrame:
	dec a
	ld (_PSGMusicSkipFrames),a
	ret
	_noLatch:
	cp #0x40
	jr c,_command ; if < $40 then it is a command
; it is a data
	ld a,(_PSGMusicLastLatch) ; retrieve last latch
	jp _output_NoLatch
	_command:
	cp #0x38
	jr z,_done ; no additional frames
	jr c,_otherCommands ; other commands?
	and #0x07 ; take only the last 3 bits for skip frames
	ld (_PSGMusicSkipFrames),a ; we got additional frames
	_done:
	ld (_PSGMusicPointer),hl ; save current address
	ret ; frame done
	_otherCommands:
	cp #0x08
	jr nc,_substring
	cp #0x00
	jr z,_musicLoop
	cp #0x01
	jr z,_setLoopPoint
; ***************************************************************************
; we should never get here!
; if we do, it means the PSG file is probably corrupted, so we just RET
; ***************************************************************************
	ret
	_send2PSG:
	ld a,b
	_send2PSG_A:
	out (#0x7f),a ; output the byte
	jp _intLoop
	_output_NoLatch:
; we got the last latch in A and the PSG data in B
; and we have to check if the value should pass to PSG or not
	bit 6,a ; test if the latch it is for channels 0-1 or for 2-3
	jr z,_send2PSG ; if it is for chn 0 or 1 then we have done!
	bit 4,a ; test if it is a volume
	jr z,_high_part_Tone ; jump if tone data (it is the high part)
	bit 5,a ; test if volume it is for channel 2 or 3
	jr z,_a3
	ld a,b ; restore data in A
	ld (_PSGChan3Volume),a ; save volume data
	ld a,(_PSGChannel3SFX) ; channel 3 free?
	or a
	jr z,_send2PSG
	jp _intLoop
	_a3:
	ld a,b ; restore data in A
	ld (_PSGChan2Volume),a ; save volume data
	ld a,(_PSGChannel2SFX) ; channel 2 free?
	or a
	jr z,_send2PSG
	jp _intLoop
	_setLoopPoint:
	ld (_PSGMusicLoopPoint),hl
	jp _intLoop
	_musicLoop:
	ld a,(_PSGLoopFlag) ; looping requested?
	or a
	jp z,_PSGStop ; No:stop it!
	ld hl,(_PSGMusicLoopPoint)
	jp _intLoop
	_substring:
	sub #0x08 -4 ; len is value - $08 + 4
	ld (_PSGMusicSubstringLen),a ; save len
	ld c,(hl) ; load substring address (offset)
	inc hl
	ld b,(hl)
	inc hl
	ld (_PSGMusicSubstringRetAddr),hl ; save return address
	ld hl,(_PSGMusicStart)
	add hl,bc ; make substring current
	jp _intLoop
	_high_part_Tone:
; we got the last latch in A and the PSG data in B
; and we have to check if the value should pass to PSG or not
	bit 5,a ; test if tone it is for channel 2 or 3
	jr z,_a4 ; jump if channel 2
	ld a,b ; PSG data in A
	and #0x07 ; keep last 3 bits of PSG data only
	or #0x80|#0b01100000 ; set it to latch for channel 3
	ld (_PSGChan3LowTone),a ; save channel 3 tone LOW data (latched)
	ld a,(_PSGChannel3SFX) ; channel 3 free?
	or a
	jr z,_send2PSG
	jp _intLoop
	_a4:
	ld a,b ; PSG data in A
	ld (_PSGChan2HighTone),a ; save channel 2 tone HIGH data
	ld a,(_PSGChannel2SFX) ; channel 2 free?
	or a
	jr z,_send2PSG
	jp _intLoop
	ret
;lib/PSGlib.c:368: void PSGSFXFrame (void) {
;	---------------------------------
; Function PSGSFXFrame
; ---------------------------------
_PSGSFXFrame::
;lib/PSGlib.c:454: __endasm;
	ld a,(_PSGSFXStatus) ; check if we have got to play SFX
	or a
	ret z
	ld a,(_PSGSFXSkipFrames) ; check if we have got to skip frames
	or a
	jp nz,_skipFrame_SFX
	ld hl,(_PSGSFXPointer) ; read current SFX address
	_intLoop_SFX:
	ld b,(hl) ; load a byte in B, temporary
	inc hl ; point to next byte
	ld a,(_PSGSFXSubstringLen) ; read substring len
	or a ; check if it is 0 (we are not in a substring)
	jr z,_continue_SFX
	dec a ; decrease len
	ld (_PSGSFXSubstringLen),a ; save len
	jr nz,_continue_SFX
	ld hl,(_PSGSFXSubstringRetAddr) ; substring over, retrieve return address
	_continue_SFX:
	ld a,b ; restore byte
	cp #0x40
	jp c,_command_SFX ; if less than $40 then it is a command
	out (#0x7f),a ; output the byte
	jp _intLoop_SFX
	_skipFrame_SFX:
	dec a
	ld (_PSGSFXSkipFrames),a
	ret
	_command_SFX:
	cp #0x38
	jr z,_done_SFX ; no additional frames
	jr c,_otherCommands_SFX ; other commands?
	and #0x07 ; take only the last 3 bits for skip frames
	ld (_PSGSFXSkipFrames),a ; we got additional frames to skip
	_done_SFX:
	ld (_PSGSFXPointer),hl ; save current address
	ret ; frame done
	_otherCommands_SFX:
	cp #0x08
	jr nc,_substring_SFX
	cp #0x00
	jr z,_sfxLoop_SFX
	cp #0x01
	jr z,_setLoopPoint_SFX
; ***************************************************************************
; we should never get here!
; if we do, it means the PSG SFX file is probably corrupted, so we just RET
; ***************************************************************************
	ret
	_setLoopPoint_SFX:
	ld (_PSGSFXLoopPoint),hl
	jp _intLoop_SFX
	_sfxLoop_SFX:
	ld a,(_PSGSFXLoopFlag) ; is it a looping SFX?
	or a
	jp z, _PSGSFXStop ; No:stop it!
	ld hl,(_PSGSFXLoopPoint)
	ld (_PSGSFXPointer),hl
	jp _intLoop_SFX
	_substring_SFX:
	sub #0x08 -4 ; len is value - $08 + 4
	ld (_PSGSFXSubstringLen),a ; save len
	ld c,(hl) ; load substring address (offset)
	inc hl
	ld b,(hl)
	inc hl
	ld (_PSGSFXSubstringRetAddr),hl ; save return address
	ld hl,(_PSGSFXStart)
	add hl,bc ; make substring current
	jp _intLoop_SFX
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__PSGMusicStatus:
	.db #0x00	; 0
__xinit__PSGChannel2SFX:
	.db #0x00	; 0
__xinit__PSGChannel3SFX:
	.db #0x00	; 0
__xinit__PSGSFXStatus:
	.db #0x00	; 0
	.area _CABS (ABS)
