;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW32)
; This file was generated Wed Sep 11 14:41:58 2019
;--------------------------------------------------------
	.module game
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _game_loop
	.globl _prepare_scr
	.globl _game_init
	.globl _player_frame_selector
	.globl _flickscreen_do_vertical
	.globl _flickscreen_do_horizontal
	.globl _run_script
	.globl _language_select
	.globl _credits
	.globl _scr_the_end
	.globl _scr_game_over
	.globl _title
	.globl _pres
	.globl _bat_out
	.globl _bat_in
	.globl _hud_update
	.globl _draw_game_frame
	.globl _enems_move
	.globl _enems_load
	.globl _enems_persistent_deaths_load
	.globl _player_move
	.globl _player_kill
	.globl _player_to_pixels
	.globl _player_render
	.globl _player_init
	.globl _hotspots_create
	.globl _hotspots_paint
	.globl _hotspots_load
	.globl _textbox_do
	.globl _textbox_draw_text
	.globl _textbox_frame
	.globl _do_update_list_and_wait
	.globl _update_cycle
	.globl _pad_read
	.globl _collide_in
	.globl _pr_str
	.globl _draw_scr
	.globl _update_list_tile
	.globl _p_t
	.globl _ul_putc
	.globl _cls
	.globl _clear_update_list
	.globl _unrle
	.globl _unpack_bg_patterns
	.globl _memfill
	.globl _delay
	.globl _aPLib_depack_VRAM
	.globl _PSGSFXStop
	.globl _PSGSFXPlay
	.globl _PSGStop
	.globl _PSGPlay
	.globl _music_pause
	.globl _SG_doUpdateList
	.globl _SG_setUpdateList
	.globl _SG_copySpritestoSAT
	.globl _SG_resetPauseRequest
	.globl _SG_queryPauseRequested
	.globl _SG_getKeysStatus
	.globl _SG_getStp
	.globl _SG_addMetaSprite
	.globl _SG_addMetaSprite1x1
	.globl _SG_initSprites
	.globl _SG_waitForVBlank
	.globl _SG_setSpriteMode
	.globl _SG_VDPturnOffFeature
	.globl _SG_VDPturnOnFeature
	.globl _lang_offs
	.globl _opjewels
	.globl _pjewels
	.globl _first_totem
	.globl _first_medallion
	.globl _first_batucada
	.globl _first_text
	.globl _ol_prx
	.globl _tile_got
	.globl _springs_on
	.globl _ep_dead
	.globl _en_spr_id
	.globl _en_spr_x_mod
	.globl _en_ct
	.globl _en_status
	.globl _en_life
	.globl _en_cttouched
	.globl _en_flags
	.globl _en_state
	.globl _en_facing
	.globl _en_s
	.globl _en_my
	.globl _en_mx
	.globl _en_y2
	.globl _en_x2
	.globl _en_y1
	.globl _en_x1
	.globl _en_y
	.globl _en_x
	.globl _en_t
	.globl _flags
	.globl _fire_script_success
	.globl _lkact
	.globl _hact
	.globl _pctfr
	.globl _oam_index_player
	.globl _okilled
	.globl _oammo
	.globl _oobjs
	.globl _okeys
	.globl _olife
	.globl _flick_override
	.globl _level_reset
	.globl _warp_to_level
	.globl _game_over
	.globl _win_level
	.globl _paused
	.globl _frame_counter
	.globl _half_life
	.globl _on_pant
	.globl _n_pant
	.globl _c_max_enems
	.globl _level
	.globl _first_game
	.globl _map_buff
	.globl _fade_delay
	.globl _fader
	.globl _update_list
	.globl _update_index
	.globl _ntsc_frame
	.globl _ntsc
	.globl _sc_continuar
	.globl _sc_terminado
	.globl _script_result
	.globl _script
	.globl _next_script
	.globl _sc_c
	.globl _sc_n
	.globl _sc_y
	.globl _sc_x
	.globl _c_max_bolts
	.globl _c_hotspots
	.globl _c_enems
	.globl _c_locks
	.globl _c_map
	.globl _spr_enems
	.globl _c_behs
	.globl _c_ts_tmaps
	.globl _c_map_size
	.globl _c_map_h
	.globl _c_map_w
	.globl _ft
	.globl _do_process_breakable
	.globl _hrt
	.globl _hry
	.globl _hrx
	.globl _py_safe
	.globl _px_safe
	.globl _n_pant_safe
	.globl _pfiring
	.globl _pkilled
	.globl _pammo
	.globl _pobjs
	.globl _pkeys
	.globl _plife
	.globl _pcontinues
	.globl _pnotsafe
	.globl _pice
	.globl _pkill
	.globl _pry_old
	.globl _prx_old
	.globl _hith
	.globl _hitv
	.globl _opinv
	.globl _pinv
	.globl _pgtmy
	.globl _pgtmx
	.globl _phit
	.globl _pbouncing
	.globl _pflickering
	.globl _oppossee
	.globl _ppossee
	.globl _pgotten
	.globl _pctj
	.globl _pjb
	.globl _pj
	.globl _b_button
	.globl _a_button
	.globl _psprid
	.globl _pfr
	.globl _pfacing
	.globl _pcy
	.globl _pcx
	.globl _pry
	.globl _prx
	.globl _pvy
	.globl _pvx
	.globl _py
	.globl _px
	.globl _vertical_engine_type
	.globl _en_sg_2
	.globl _en_sg_1
	.globl __enf_vy
	.globl __enf_vx
	.globl __enf_y
	.globl __enf_x
	.globl __en_state
	.globl __en_facing
	.globl __en_ct
	.globl __en_my
	.globl __en_mx
	.globl __en_y2
	.globl __en_x2
	.globl __en_y1
	.globl __en_x1
	.globl __en_y
	.globl __en_x
	.globl __en_s
	.globl __en_t
	.globl _pregotten
	.globl _en_is_alive
	.globl _touched
	.globl _en_spr
	.globl _en_colly
	.globl _en_collx
	.globl _en_fr
	.globl _en_offs
	.globl _en_initial
	.globl _cur_stp
	.globl _caux
	.globl _cy2
	.globl _cy1
	.globl _cx2
	.globl _cx1
	.globl _at2
	.globl _at1
	.globl _ticker
	.globl _rdct
	.globl _rds
	.globl _rdm
	.globl _rdd
	.globl _rdc
	.globl _rdb
	.globl _rda
	.globl _rdit
	.globl _rdt
	.globl _rdy
	.globl _rdx
	.globl _gp_addr
	.globl _gp_ram
	.globl _gp_tmap
	.globl _gp_gen
	.globl _rds16
	.globl _gpjt
	.globl _gpit
	.globl _pad_this_frame
	.globl _pad0
	.globl __t
	.globl __n
	.globl __y
	.globl __x
	.globl _box_buff
	.globl _l_music
	.globl _l_hotspots
	.globl _l_enems
	.globl _l_n_bolts
	.globl _l_locks
	.globl _l_map
	.globl _l_spr_enems
	.globl _l_behs
	.globl _l_ts_tmaps
	.globl _l_ts_colours
	.globl _l_ts_patterns
	.globl _l_player_max_enems
	.globl _l_player_max_objects
	.globl _l_map_h
	.globl _l_map_w
	.globl _l_ini_y
	.globl _l_ini_x
	.globl _l_scr_ini
	.globl _custom_texts
	.globl _custom_text11
	.globl _custom_text10
	.globl _custom_text9
	.globl _custom_text8
	.globl _custom_text7
	.globl _custom_text6
	.globl _custom_text5
	.globl _custom_text4
	.globl _custom_text3
	.globl _custom_text2
	.globl _custom_text1
	.globl _custom_text0
	.globl _spr_hs
	.globl _spr_enems0
	.globl _spr_player
	.globl _behs1
	.globl _behs0
	.globl _jitter
	.globl _bits
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_VDPControlPort	=	0x00bf
_VDPStatusPort	=	0x00bf
_VDPDataPort	=	0x00be
_VDPVCounterPort	=	0x007e
_VDPHCounterPort	=	0x007f
_IOPortL	=	0x00dc
_IOPortH	=	0x00dd
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
__x::
	.ds 1
__y::
	.ds 1
__n::
	.ds 1
__t::
	.ds 1
_pad0::
	.ds 1
_pad_this_frame::
	.ds 1
_gpit::
	.ds 1
_gpjt::
	.ds 1
_rds16::
	.ds 2
_gp_gen::
	.ds 2
_gp_tmap::
	.ds 2
_gp_ram::
	.ds 2
_gp_addr::
	.ds 2
_rdx::
	.ds 1
_rdy::
	.ds 1
_rdt::
	.ds 1
_rdit::
	.ds 1
_rda::
	.ds 1
_rdb::
	.ds 1
_rdc::
	.ds 1
_rdd::
	.ds 1
_rdm::
	.ds 1
_rds::
	.ds 1
_rdct::
	.ds 1
_ticker::
	.ds 1
_at1::
	.ds 1
_at2::
	.ds 1
_cx1::
	.ds 1
_cx2::
	.ds 1
_cy1::
	.ds 1
_cy2::
	.ds 1
_caux::
	.ds 1
_cur_stp::
	.ds 2
_en_initial::
	.ds 1
_en_offs::
	.ds 1
_en_fr::
	.ds 1
_en_collx::
	.ds 1
_en_colly::
	.ds 1
_en_spr::
	.ds 1
_touched::
	.ds 1
_en_is_alive::
	.ds 1
_pregotten::
	.ds 1
__en_t::
	.ds 1
__en_s::
	.ds 1
__en_x::
	.ds 1
__en_y::
	.ds 1
__en_x1::
	.ds 1
__en_y1::
	.ds 1
__en_x2::
	.ds 1
__en_y2::
	.ds 1
__en_mx::
	.ds 1
__en_my::
	.ds 1
__en_ct::
	.ds 1
__en_facing::
	.ds 1
__en_state::
	.ds 1
__enf_x::
	.ds 2
__enf_y::
	.ds 2
__enf_vx::
	.ds 2
__enf_vy::
	.ds 2
_en_sg_1::
	.ds 1
_en_sg_2::
	.ds 1
_vertical_engine_type::
	.ds 1
_px::
	.ds 2
_py::
	.ds 2
_pvx::
	.ds 2
_pvy::
	.ds 2
_prx::
	.ds 1
_pry::
	.ds 1
_pcx::
	.ds 1
_pcy::
	.ds 1
_pfacing::
	.ds 1
_pfr::
	.ds 1
_psprid::
	.ds 1
_a_button::
	.ds 1
_b_button::
	.ds 1
_pj::
	.ds 1
_pjb::
	.ds 1
_pctj::
	.ds 1
_pgotten::
	.ds 1
_ppossee::
	.ds 1
_oppossee::
	.ds 1
_pflickering::
	.ds 1
_pbouncing::
	.ds 1
_phit::
	.ds 1
_pgtmx::
	.ds 2
_pgtmy::
	.ds 2
_pinv::
	.ds 1
_opinv::
	.ds 1
_hitv::
	.ds 1
_hith::
	.ds 1
_prx_old::
	.ds 1
_pry_old::
	.ds 1
_pkill::
	.ds 1
_pice::
	.ds 1
_pnotsafe::
	.ds 1
_pcontinues::
	.ds 1
_plife::
	.ds 1
_pkeys::
	.ds 1
_pobjs::
	.ds 1
_pammo::
	.ds 1
_pkilled::
	.ds 1
_pfiring::
	.ds 1
_n_pant_safe::
	.ds 1
_px_safe::
	.ds 2
_py_safe::
	.ds 2
_hrx::
	.ds 1
_hry::
	.ds 1
_hrt::
	.ds 1
_do_process_breakable::
	.ds 1
_ft::
	.ds 1
_c_map_w::
	.ds 1
_c_map_h::
	.ds 1
_c_map_size::
	.ds 1
_c_ts_tmaps::
	.ds 2
_c_behs::
	.ds 2
_spr_enems::
	.ds 2
_c_map::
	.ds 2
_c_locks::
	.ds 2
_c_enems::
	.ds 2
_c_hotspots::
	.ds 2
_c_max_bolts::
	.ds 1
_sc_x::
	.ds 1
_sc_y::
	.ds 1
_sc_n::
	.ds 1
_sc_c::
	.ds 1
_next_script::
	.ds 2
_script::
	.ds 2
_script_result::
	.ds 1
_sc_terminado::
	.ds 1
_sc_continuar::
	.ds 1
_ntsc::
	.ds 1
_ntsc_frame::
	.ds 1
_update_index::
	.ds 1
_update_list::
	.ds 96
_fader::
	.ds 1
_fade_delay::
	.ds 1
_map_buff::
	.ds 192
_first_game::
	.ds 1
_level::
	.ds 1
_c_max_enems::
	.ds 1
_n_pant::
	.ds 1
_on_pant::
	.ds 1
_half_life::
	.ds 1
_frame_counter::
	.ds 1
_paused::
	.ds 1
_win_level::
	.ds 1
_game_over::
	.ds 1
_warp_to_level::
	.ds 1
_level_reset::
	.ds 1
_flick_override::
	.ds 1
_olife::
	.ds 1
_okeys::
	.ds 1
_oobjs::
	.ds 1
_oammo::
	.ds 1
_okilled::
	.ds 1
_oam_index_player::
	.ds 1
_pctfr::
	.ds 1
_hact::
	.ds 20
_lkact::
	.ds 16
_fire_script_success::
	.ds 1
_flags::
	.ds 2
_en_t::
	.ds 3
_en_x::
	.ds 3
_en_y::
	.ds 3
_en_x1::
	.ds 3
_en_y1::
	.ds 3
_en_x2::
	.ds 3
_en_y2::
	.ds 3
_en_mx::
	.ds 3
_en_my::
	.ds 3
_en_s::
	.ds 3
_en_facing::
	.ds 3
_en_state::
	.ds 3
_en_flags::
	.ds 3
_en_cttouched::
	.ds 3
_en_life::
	.ds 3
_en_status::
	.ds 3
_en_ct::
	.ds 3
_en_spr_x_mod::
	.ds 1
_en_spr_id::
	.ds 3
_ep_dead::
	.ds 60
_springs_on::
	.ds 1
_tile_got::
	.ds 24
_ol_prx::
	.ds 1
_first_text::
	.ds 1
_first_batucada::
	.ds 1
_first_medallion::
	.ds 1
_first_totem::
	.ds 1
_pjewels::
	.ds 1
_opjewels::
	.ds 1
_lang_offs::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
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
;./engine/textbox.h:17: void textbox_frame (void) {
;	---------------------------------
; Function textbox_frame
; ---------------------------------
_textbox_frame::
;./engine/textbox.h:19: rdct = 0; _x = 0; _y = TEXTBOX_TOP;
	ld	hl,#_rdct + 0
	ld	(hl), #0x00
	ld	hl,#__x + 0
	ld	(hl), #0x00
	ld	hl,#__y + 0
	ld	(hl), #0x08
;./engine/textbox.h:20: gp_ram = rdm ? ((unsigned char *) box_buff) : (map_buff + (((_y - TOP_ADJUST) >> 1) << 4));
	ld	a,(#_rdm + 0)
	or	a, a
	jr	Z,00117$
	ld	hl,#_box_buff
	jr	00118$
00117$:
	ld	hl,#_map_buff+48
00118$:
	ld	(_gp_ram),hl
;./engine/textbox.h:21: if (!rdm) {_y --; gpit = 80; } else gpit = 64; 
	ld	a,(#_rdm + 0)
	or	a, a
	jr	NZ,00102$
	ld	hl,#__y + 0
	ld	(hl), #0x07
	ld	hl,#_gpit + 0
	ld	(hl), #0x50
	jr	00112$
00102$:
	ld	hl,#_gpit + 0
	ld	(hl), #0x40
;./engine/textbox.h:22: while (gpit --) {
00112$:
	ld	hl,#_gpit + 0
	ld	d, (hl)
	ld	hl, #_gpit+0
	dec	(hl)
	ld	a,d
	or	a, a
	ret	Z
;./engine/textbox.h:23: rdt = *gp_ram ++; 
	ld	hl,(_gp_ram)
	ld	a,(hl)
	ld	(#_rdt + 0),a
	ld	hl, #_gp_ram+0
	inc	(hl)
	jr	NZ,00151$
	ld	hl, #_gp_ram+1
	inc	(hl)
00151$:
;./engine/textbox.h:24: if (rdct == 0) clear_update_list ();
	ld	a,(#_rdct + 0)
	or	a, a
	jr	NZ,00105$
	call	_clear_update_list
00105$:
;./engine/textbox.h:25: if (rdt != 0xff) { 
	ld	a,(#_rdt + 0)
	inc	a
	jr	Z,00107$
;./engine/textbox.h:26: _t = rdt + rdm;
	ld	hl,#_rdm
	push	de
	ld	iy,#__t
	push	iy
	pop	de
	ld	a,(#_rdt + 0)
	add	a, (hl)
	ld	(de),a
	pop	de
;./engine/textbox.h:27: update_list_tile (); 
	call	_update_list_tile
00107$:
;./engine/textbox.h:29: _x = (_x + 2) & 0x1f; if (_x == 0) _y += 2;
	ld	a,(#__x + 0)
	add	a, #0x02
	and	a, #0x1F
	ld	(#__x + 0),a
	or	a, a
	jr	NZ,00109$
	ld	hl, #__y+0
	inc	(hl)
	ld	hl, #__y+0
	inc	(hl)
00109$:
;./engine/textbox.h:30: ++ rdct; if (rdct == 4) { do_update_list_and_wait (); rdct = 0; }
	ld	hl, #_rdct+0
	inc	(hl)
	ld	a,(#_rdct + 0)
	sub	a, #0x04
	jr	NZ,00112$
	call	_do_update_list_and_wait
	ld	hl,#_rdct + 0
	ld	(hl), #0x00
	jr	00112$
_bits:
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
_jitter:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
_behs0:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0A	; 10
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
_behs1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x22	; 34
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x0A	; 10
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
_spr_player:
	.dw _ss_pl_00
	.dw _ss_pl_01
	.dw _ss_pl_02
	.dw _ss_pl_03
	.dw _ss_pl_04
	.dw _ss_pl_00
	.dw _ss_pl_05
	.dw _ss_pl_06
	.dw _ss_pl_07
	.dw _ss_pl_08
_spr_enems0:
	.dw _ss_ena_00
	.dw _ss_ena_01
	.dw #0x0000
	.dw #0x0000
	.dw _ss_ena_00
	.dw _ss_ena_01
	.dw #0x0000
	.dw #0x0000
	.dw _ss_enb_00
	.dw _ss_enb_01
	.dw #0x0000
	.dw #0x0000
	.dw _ss_enb_00
	.dw _ss_enb_01
	.dw #0x0000
	.dw #0x0000
	.dw _ss_enc_00
	.dw _ss_enc_01
	.dw #0x0000
	.dw #0x0000
	.dw _ss_enc_00
	.dw _ss_enc_01
	.dw #0x0000
	.dw #0x0000
	.dw _ss_plat_00
	.dw _ss_plat_00
	.dw #0x0000
	.dw #0x0000
	.dw _ss_plat_00
	.dw _ss_plat_00
	.dw #0x0000
	.dw #0x0000
	.dw _ss_it_03
_spr_hs:
	.dw _ss_it_05
	.dw _ss_it_00
	.dw _ss_it_01
	.dw _ss_it_02
_custom_text0:
	.ascii "AY, CON LO BIEN QUE%ESTARIA YO SABOREANDO%UNOS ESPETITO DE L"
	.ascii "A%TIERRA... PERO HAY%TRABAJO QUE HACER!%PUTOS BATUCADAS!!!%"
	.db 0x00
_custom_text1:
	.ascii "TENGO QUE LIBRARME DE%TODA ESTA PESTE SI%QUIERO PODER DISFRU"
	.ascii "-%TAR DEL CONCIERTO%TRANQUILO. Y AUN QUE-%DAN UN MONTONACO!%"
	.db 0x00
_custom_text2:
	.ascii "ESTOS MEDALLONES ME%DAN BUEN ROLLO.%SEGUN LA LEYENDA,%TENGO "
	.ascii "QUE LLEVARLOS%A LOS TOTEMS DEL%PODEWWWR!%"
	.db 0x00
_custom_text3:
	.ascii "VAYA, SE LO HA COMIDO%AHI ESTA ER TIO! HAY%QUE REPETIR HASTA"
	.ascii " 15%VECES PARA COMPLETAR%EL SACRIFICIO . . .%MANOS A LA OBRA"
	.ascii "!%"
	.db 0x00
_custom_text4:
	.ascii "OMG HOW BADLY DO I%NEED A BEER... BUT%THERE IS WORK TO DO%TH"
	.ascii "AT CANNOT WAIT!!!%BLOODY HELL!!! DAMN%YOU FUCKING BATUCADAS%"
	.db 0x00
_custom_text5:
	.ascii "I HAVE TO GET RID OF%THIS PAIN IN THE ASS%IF I WANT TO ENJOY"
	.ascii "%THE CONCERT IN PEACE,%AND THERE IS STILL%PLENTY OF THEM!!!%"
	.db 0x00
_custom_text6:
	.ascii "THESE CHARMS GIVE ME%THE GOOD VIBES. THE%LEGEND SAYS THAT WE"
	.ascii "%HAVE TO TAKE THEM %TO THE TOTEMS OF THE%PODEWWWR! COOL!!!%"
	.db 0x00
_custom_text7:
	.ascii "OH LOOK MAN!!! IT%ATE IT!!! WE MUST DO%THAT FIFTEEN TIMES%UN"
	.ascii "TIL WE COMPLETE%THE SACRIFICE. LESS%TALKING, LET'S GO!!!%"
	.db 0x00
_custom_text8:
	.ascii "OH MANNOMANN, ALTER!%BRAUCH ECHT MAN BIER%ABER ERST DIE ARBE"
	.ascii "IT,%DANN DER SUESSE LOHN!%VERDAMMICH!!! DIESE%VERKACKTEN BAT"
	.ascii "UCADAS%"
	.db 0x00
_custom_text9:
	.ascii "ICH MUSS DIESE BE-%SCHISSENEN NERVTOETER%LOSWERDEN, WENN ICH"
	.ascii "%DAS KONZERT IN RUHE%GENIESSEN WILL. ABER%ES SIND NOCH SO VI"
	.ascii "ELE%"
	.db 0x00
_custom_text10:
	.ascii "DIESE MEDAILLIEN SIND%RICHTIG GEILES ZEUG!%DIE LEGENDE SAGT,"
	.ascii " MAN%MUSS SIE ZU'N KRASSEN%POOWAAA TOTEMS KARREN%GEILER SCHE"
	.ascii "ISS, ALTER%"
	.db 0x00
_custom_text11:
	.ascii "GUCK MAL ALTER! DAS%HAT'S VOLL GESNACKT!%NOCH 15 MEHR DAVON,"
	.ascii "%DAMIT DAS OPFER VOLL-%BRACHT IST. SO, NICH%MEHR SCHNACKEN. "
	.ascii "LOS!!%"
	.db 0x00
_custom_texts:
	.dw _custom_text0
	.dw _custom_text1
	.dw _custom_text2
	.dw _custom_text3
	.dw _custom_text4
	.dw _custom_text5
	.dw _custom_text6
	.dw _custom_text7
	.dw _custom_text8
	.dw _custom_text9
	.dw _custom_text10
	.dw _custom_text11
_l_scr_ini:
	.db #0x13	; 19
	.db #0x12	; 18
_l_ini_x:
	.db #0x0D	; 13
	.db #0x09	; 9
_l_ini_y:
	.db #0x03	; 3
	.db #0x03	; 3
_l_map_w:
	.db #0x05	; 5
	.db #0x04	; 4
_l_map_h:
	.db #0x04	; 4
	.db #0x05	; 5
_l_player_max_objects:
	.db #0x0F	; 15
	.db #0x0F	; 15
_l_player_max_enems:
	.db #0x38	; 56	'8'
	.db #0x2D	; 45
_l_ts_patterns:
	.dw _ts0_patterns_c
	.dw _ts1_patterns_c
_l_ts_colours:
	.dw _ts0_colours_c
	.dw _ts1_colours_c
_l_ts_tmaps:
	.dw _ts0_tmaps
	.dw _ts1_tmaps
_l_behs:
	.dw _behs0
	.dw _behs1
_l_spr_enems:
	.dw _spr_enems0
	.dw _spr_enems0
_l_map:
	.dw _map_0
	.dw _map_1
_l_locks:
	.dw _map_0_locks
	.dw #0x0000
_l_n_bolts:
	.db #0x04	; 4
	.db #0x00	; 0
_l_enems:
	.dw _enems_0
	.dw _enems_1
_l_hotspots:
	.dw _hotspots_0
	.dw _hotspots_1
_l_music:
	.dw _m_n_stagea_psg
	.dw _m_n_stagea_psg
_box_buff:
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0xFF	; 255
	.db #0xFF	; 255
;./engine/textbox.h:34: void textbox_draw_text (void) {
;	---------------------------------
; Function textbox_draw_text
; ---------------------------------
_textbox_draw_text::
;./engine/textbox.h:41: rda = 1; // New line marker!
	ld	hl,#_rda + 0
	ld	(hl), #0x01
;./engine/textbox.h:42: rdy = TEXTBOX_TOP+1;
	ld	hl,#_rdy + 0
	ld	(hl), #0x09
;./engine/textbox.h:43: while (rdt = *gp_gen ++) {
00108$:
	ld	hl,(_gp_gen)
	ld	d,(hl)
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00133$
	ld	hl, #_gp_gen+1
	inc	(hl)
00133$:
	ld	hl,#_rdt + 0
	ld	(hl), d
	ld	a,d
	or	a, a
	ret	Z
;./engine/textbox.h:47: if (rda) { clear_update_list (); rda = 0; gp_addr = PNTADDRESS + 6 + (rdy << 5); }
	ld	a,(#_rda + 0)
	or	a, a
	jr	Z,00102$
	call	_clear_update_list
	ld	hl,#_rda + 0
	ld	(hl), #0x00
	ld	iy,#_rdy
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de,hl
	ld	hl,#0x1806
	add	hl,de
	ld	(_gp_addr),hl
00102$:
;./engine/textbox.h:49: if (rdt == '%') rda = 1; else { _n = rdt - 32; ul_putc (); }
	ld	a,(#_rdt + 0)
	sub	a, #0x25
	jr	NZ,00104$
	ld	hl,#_rda + 0
	ld	(hl), #0x01
	jr	00105$
00104$:
	ld	hl,#__n
	ld	a,(#_rdt + 0)
	add	a,#0xE0
	ld	(hl),a
	call	_ul_putc
00105$:
;./engine/textbox.h:50: if (rda) { do_update_list_and_wait (); ++ rdy; }
	ld	a,(#_rda + 0)
	or	a, a
	jr	Z,00108$
	call	_do_update_list_and_wait
	ld	hl, #_rdy+0
	inc	(hl)
	jr	00108$
;./engine/textbox.h:54: void textbox_do (void) {
;	---------------------------------
; Function textbox_do
; ---------------------------------
_textbox_do::
;./engine/textbox.h:59: rdm = TEXT_BOX_FRAME_TILE_OFFSET; textbox_frame ();
	ld	hl,#_rdm + 0
	ld	(hl), #0x20
	call	_textbox_frame
;./engine/textbox.h:69: textbox_draw_text ();
	call	_textbox_draw_text
;./engine/textbox.h:70: while (1) {
00104$:
;./engine/textbox.h:71: do_update_list_and_wait ();
	call	_do_update_list_and_wait
;./engine/textbox.h:72: pad_read (); if (pad_this_frame & (PAD_A|PAD_B)) break;
	call	_pad_read
	ld	a,(#_pad_this_frame + 0)
	and	a, #0x30
	jr	Z,00104$
;./engine/textbox.h:75: rdm = 0; textbox_frame ();
	ld	hl,#_rdm + 0
	ld	(hl), #0x00
	call	_textbox_frame
;./engine/textbox.h:76: clear_update_list ();
	call	_clear_update_list
;./engine/textbox.h:78: HW_resetPauseRequest ();
	jp  _SG_resetPauseRequest
;./engine/hotspots.h:7: void hotspots_load (void) {
;	---------------------------------
; Function hotspots_load
; ---------------------------------
_hotspots_load::
;./engine/hotspots.h:9: gp_gen = (unsigned char *) c_hotspots;
	ld	hl,(_c_hotspots)
	ld	(_gp_gen),hl
;./engine/hotspots.h:11: for (gpit = 0; gpit < MAP_SIZE; gpit ++) {
	ld	hl,#_gpit + 0
	ld	(hl), #0x00
	ld	de,#_hact+0
00102$:
;./engine/hotspots.h:16: hact [gpit] = 1;
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	(hl),#0x01
;./engine/hotspots.h:11: for (gpit = 0; gpit < MAP_SIZE; gpit ++) {
	ld	hl, #_gpit+0
	inc	(hl)
	ld	a,(#_gpit + 0)
	sub	a, #0x14
	jr	C,00102$
	ret
;./engine/hotspots.h:20: void hotspots_paint (void) {
;	---------------------------------
; Function hotspots_paint
; ---------------------------------
_hotspots_paint::
;./engine/hotspots.h:30: rda = hrt;
	ld	a,(#_hrt + 0)
	ld	(#_rda + 0),a
;./engine/hotspots.h:38: spr_hs [rda]
	ld	de,#_spr_hs+0
	ld	iy,#_rda
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
;./engine/hotspots.h:37: hrx, hry + SPRITE_ADJUST, 
	ld	a,(#_hry + 0)
	add	a, #0xF7
	ld	h,a
	push	de
	push	hl
	inc	sp
	ld	a,(_hrx)
	push	af
	inc	sp
	call	_SG_addMetaSprite1x1
	pop	af
	pop	af
	ret
;./engine/hotspots.h:42: void hotspots_create (void) {
;	---------------------------------
; Function hotspots_create
; ---------------------------------
_hotspots_create::
;./engine/hotspots.h:54: gp_gen = (unsigned char *) (c_hotspots + (n_pant << 1));
	ld	iy,#_n_pant
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ld	d,l
	ld	e,h
	ld	hl,#_gp_gen
	ld	a,(#_c_hotspots + 0)
	add	a, d
	ld	(hl),a
	ld	a,(#_c_hotspots + 1)
	adc	a, e
	inc	hl
	ld	(hl),a
;./engine/hotspots.h:55: hrt = *gp_gen ++; rda = *gp_gen; 
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_hrt + 0),a
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00115$
	ld	hl, #_gp_gen+1
	inc	(hl)
00115$:
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rda + 0),a
;./engine/hotspots.h:56: if (hrt && hact [n_pant]) {
	ld	a,(#_hrt + 0)
	or	a, a
	jr	Z,00102$
	ld	de,#_hact+0
	ld	hl,(_n_pant)
	ld	h,#0x00
	add	hl,de
	ld	a,(hl)
	or	a, a
	jr	Z,00102$
;./engine/hotspots.h:57: hry = rda & 0xf0; hrx = rda << 4;
	ld	a,(#_rda + 0)
	and	a, #0xF0
	ld	(#_hry + 0),a
	ld	a,(#_rda + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	(#_hrx + 0),a
	ret
00102$:
;./engine/hotspots.h:58: } else hrt = 0;
	ld	hl,#_hrt + 0
	ld	(hl), #0x00
	ret
;./engine/../my/game_frame.h:7: void draw_game_frame (void) {
;	---------------------------------
; Function draw_game_frame
; ---------------------------------
_draw_game_frame::
;./engine/../my/game_frame.h:8: gp_gen = frame_rle; unrle ();
	ld	hl,#_frame_rle+0
	ld	(_gp_gen),hl
	jp  _unrle
;./engine/frame.h:9: void hud_update (void) {
;	---------------------------------
; Function hud_update
; ---------------------------------
_hud_update::
;./engine/frame.h:12: if (okilled != pkilled) {
	ld	a,(#_okilled + 0)
	ld	iy,#_pkilled
	sub	a, 0 (iy)
	jr	Z,00102$
;./engine/frame.h:13: okilled = pkilled;
	ld	a,(#_pkilled + 0)
	ld	(#_okilled + 0),a
;./engine/frame.h:14: _x = KILLED_X; _y = KILLED_Y; _n = c_max_enems - pkilled; p_t ();
	ld	hl,#__x + 0
	ld	(hl), #0x14
	ld	hl,#__y + 0
	ld	(hl), #0x00
	ld	hl,#_pkilled
	push	de
	ld	iy,#__n
	push	iy
	pop	de
	ld	a,(#_c_max_enems + 0)
	sub	a, (hl)
	ld	(de),a
	pop	de
	call	_p_t
00102$:
;./engine/frame.h:19: if (oobjs != pobjs) {
	ld	a,(#_oobjs + 0)
	ld	iy,#_pobjs
	sub	a, 0 (iy)
	jr	Z,00104$
;./engine/frame.h:20: oobjs = pobjs;
	ld	a,(#_pobjs + 0)
	ld	(#_oobjs + 0),a
;./engine/frame.h:21: _x = OBJECTS_X; _y = OBJECTS_Y; 
	ld	hl,#__x + 0
	ld	(hl), #0x14
	ld	hl,#__y + 0
	ld	(hl), #0x01
;./engine/frame.h:23: _n = PLAYER_MAX_OBJECTS - pobjs;
	ld	de,#_l_player_max_objects+0
	ld	hl,(_level)
	ld	h,#0x00
	add	hl,de
	ld	d,(hl)
	ld	hl,#_pobjs
	ld	iy,#__n
	ld	a,d
	sub	a, (hl)
	ld	0 (iy),a
;./engine/frame.h:27: p_t ();
	call	_p_t
00104$:
;./engine/frame.h:32: if (okeys != pkeys) {
	ld	a,(#_okeys + 0)
	ld	iy,#_pkeys
	sub	a, 0 (iy)
	jr	Z,00106$
;./engine/frame.h:33: okeys = pkeys;
	ld	hl,#_pkeys + 0
	ld	d, (hl)
	ld	hl,#_okeys + 0
	ld	(hl), d
;./engine/frame.h:34: _x = KEYS_X; _y = KEYS_Y; _n = pkeys; p_t ();
	ld	hl,#__x + 0
	ld	(hl), #0x1D
	ld	hl,#__y + 0
	ld	(hl), #0x01
	ld	hl,#__n + 0
	ld	(hl), d
	call	_p_t
00106$:
;./engine/frame.h:39: if (olife != plife) {
	ld	a,(#_olife + 0)
	ld	iy,#_plife
	sub	a, 0 (iy)
	jr	Z,00108$
;./engine/frame.h:40: olife = plife;
	ld	hl,#_plife + 0
	ld	d, (hl)
	ld	hl,#_olife + 0
	ld	(hl), d
;./engine/frame.h:41: _x = LIFE_X; _y = LIFE_Y; _n = plife; p_t ();
	ld	hl,#__x + 0
	ld	(hl), #0x1D
	ld	hl,#__y + 0
	ld	(hl), #0x00
	ld	hl,#__n + 0
	ld	(hl), d
	call	_p_t
00108$:
;./engine/frame.h:56: spr_hs [flags [FLAG_INVENTORY]]
	ld	a, (#_flags + 0)
	ld	l,a
	ld	h,#0x00
	add	hl, hl
	ld	de,#_spr_hs
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
;./engine/frame.h:55: HS_INV_X, HS_INV_Y,
	push	de
	ld	hl,#0xF738
	push	hl
	call	_SG_addMetaSprite1x1
	pop	af
	pop	af
;./engine/../my/extra_hud_update.h:8: if (level == 1) {
	ld	a,(#_level + 0)
	dec	a
	ret	NZ
;./engine/../my/extra_hud_update.h:9: if (pjewels != opjewels) {
	ld	a,(#_pjewels + 0)
	ld	iy,#_opjewels
	sub	a, 0 (iy)
	ret	Z
;./engine/../my/extra_hud_update.h:10: _x = 7; _y = 4; _n = pjewels; p_t ();
	ld	hl,#__x + 0
	ld	(hl), #0x07
	ld	hl,#__y + 0
	ld	(hl), #0x04
	ld	a,(#_pjewels + 0)
	ld	(#__n + 0),a
	call	_p_t
;./engine/../my/extra_hud_update.h:11: opjewels = pjewels;
	ld	a,(#_pjewels + 0)
	ld	(#_opjewels + 0),a
	ret
;./my/pres.h:6: void bat_in (void) {
;	---------------------------------
; Function bat_in
; ---------------------------------
_bat_in::
;./my/pres.h:7: SG_displayOn ();
	ld	hl,#0x0140
	push	hl
	call	_SG_VDPturnOnFeature
	pop	af
;./my/pres.h:8: while (SG_getKeysStatus ());
00101$:
	call	_SG_getKeysStatus
	ld	a,l
	or	a, a
	jr	NZ,00101$
	ret
;./my/pres.h:11: void bat_out (void) {
;	---------------------------------
; Function bat_out
; ---------------------------------
_bat_out::
;./my/pres.h:12: PSGStop ();
	call	_PSGStop
;./my/pres.h:13: SG_displayOff ();
	ld	hl,#0x0140
	push	hl
	call	_SG_VDPturnOffFeature
	pop	af
;./my/pres.h:14: SG_initSprites ();
	call	_SG_initSprites
;./my/pres.h:15: SG_copySpritestoSAT ();	
	jp  _SG_copySpritestoSAT
;./my/pres.h:18: void pres (void (*func) (void), unsigned char *music) {
;	---------------------------------
; Function pres
; ---------------------------------
_pres::
;./my/pres.h:19: cls ();
	call	_cls
;./my/pres.h:20: (*func) ();
	pop	bc
	pop	hl
	push	hl
	push	bc
	call	___sdcc_call_hl
;./my/pres.h:21: bat_in ();
	call	_bat_in
;./my/pres.h:22: if (music) PSGPlay (music);
	ld	iy,#4
	add	iy,sp
	ld	a,1 (iy)
	or	a,0 (iy)
	jr	Z,00106$
	ld	l,0 (iy)
	ld	h,1 (iy)
	push	hl
	call	_PSGPlay
	pop	af
;./my/pres.h:23: while (1) {
00106$:
;./my/pres.h:24: pad_read ();
	call	_pad_read
;./my/pres.h:25: if (pad_this_frame & (PAD_A|PAD_B|PAD_START)) break;
	ld	a,(#_pad_this_frame + 0)
	and	a, #0x30
	jr	Z,00106$
;./my/pres.h:27: bat_out ();
	jp  _bat_out
;./my/pres.h:46: void title (void) {
;	---------------------------------
; Function title
; ---------------------------------
_title::
;./my/pres.h:47: unpack_bg_patterns (tsT_patterns_c, tsT_colours_c, 72*8, 7);
	ld	de,#_tsT_patterns_c
	ld	a,#0x07
	push	af
	inc	sp
	ld	hl,#0x0240
	push	hl
	ld	hl,#_tsT_colours_c
	push	hl
	push	de
	call	_unpack_bg_patterns
	ld	hl,#7
	add	hl,sp
	ld	sp,hl
;./my/pres.h:48: gp_gen = title_rle; unrle ();
	ld	hl,#_title_rle+0
	ld	(_gp_gen),hl
	call	_unrle
;./my/pres.h:50: _x = 7; _y = 12; pr_str ("SELECT AND PUSH 1!");
	ld	hl,#__x + 0
	ld	(hl), #0x07
	ld	hl,#__y + 0
	ld	(hl), #0x0C
	ld	hl,#___str_12
	push	hl
	call	_pr_str
	pop	af
;./my/pres.h:52: _x = 12; _y = 16; pr_str ("MISSION 1");
	ld	hl,#__x + 0
	ld	(hl), #0x0C
	ld	hl,#__y + 0
	ld	(hl), #0x10
	ld	hl,#___str_13
	push	hl
	call	_pr_str
	pop	af
;./my/pres.h:53: _y = 18; pr_str ("MISSION 2");
	ld	hl,#__y + 0
	ld	(hl), #0x12
	ld	hl,#___str_14
	push	hl
	call	_pr_str
	pop	af
;./my/pres.h:55: _x = 5; _y = 23; pr_str ("@ 2019 THE MOJON TWINS");
	ld	hl,#__x + 0
	ld	(hl), #0x05
	ld	hl,#__y + 0
	ld	(hl), #0x17
	ld	hl,#___str_15
	push	hl
	call	_pr_str
	pop	af
;./my/pres.h:57: bat_in ();
	call	_bat_in
;./my/pres.h:60: while (1) {
00115$:
;./my/pres.h:61: update_cycle ();
	call	_update_cycle
;./my/pres.h:62: SG_addMetaSprite (82, 122 + (level << 4), ss_pl_00);
	ld	hl,#_ss_pl_00
	ld	a,(#_level + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	add	a, #0x7A
	push	hl
	ld	d,a
	ld	e,#0x52
	push	de
	call	_SG_addMetaSprite
	pop	af
;./my/pres.h:63: SG_addMetaSprite (140, 55, ss_pl_09);
	ld	hl, #_ss_pl_09
	ex	(sp),hl
	ld	hl,#0x378C
	push	hl
	call	_SG_addMetaSprite
	pop	af
	pop	af
;./my/pres.h:64: pad_read ();
	call	_pad_read
;./my/pres.h:65: rda = level;
	ld	a,(#_level + 0)
	ld	(#_rda + 0),a
;./my/pres.h:66: if (pad_this_frame & PAD_DOWN) {
	ld	hl,#_pad_this_frame+0
	bit	1, (hl)
	jr	Z,00104$
;./my/pres.h:67: ++ level; if (level == 2) level = 0;
	ld	hl, #_level+0
	inc	(hl)
	ld	a,(#_level + 0)
	sub	a, #0x02
	jr	NZ,00104$
	ld	hl,#_level + 0
	ld	(hl), #0x00
00104$:
;./my/pres.h:69: if (pad_this_frame & PAD_UP) {
	ld	hl,#_pad_this_frame+0
	bit	0, (hl)
	jr	Z,00109$
;./my/pres.h:70: if (level) -- level; else level = 1;
	ld	a,(#_level + 0)
	or	a, a
	jr	Z,00106$
	ld	hl, #_level+0
	dec	(hl)
	jr	00109$
00106$:
	ld	hl,#_level + 0
	ld	(hl), #0x01
00109$:
;./my/pres.h:72: if (level != rda) PSGSFXPlay (SFX_USE, 1);
	ld	a,(#_level + 0)
	ld	iy,#_rda
	sub	a, 0 (iy)
	jr	Z,00111$
	ld	de,#_s_03_use2_psg
	ld	a,#0x01
	push	af
	inc	sp
	push	de
	call	_PSGSFXPlay
	pop	af
	inc	sp
00111$:
;./my/pres.h:73: if (pad_this_frame & PAD_1) break;
	ld	hl,#_pad_this_frame+0
	bit	4, (hl)
	jp	Z,00115$
;./my/pres.h:76: PSGSFXPlay (SFX_START, 1); delay (20);
	ld	de,#_s_00_start2_psg+0
	ld	a,#0x01
	push	af
	inc	sp
	push	de
	call	_PSGSFXPlay
	pop	af
	inc	sp
	ld	a,#0x14
	push	af
	inc	sp
	call	_delay
	inc	sp
;./my/pres.h:77: bat_out ();
	jp  _bat_out
___str_12:
	.ascii "SELECT AND PUSH 1!"
	.db 0x00
___str_13:
	.ascii "MISSION 1"
	.db 0x00
___str_14:
	.ascii "MISSION 2"
	.db 0x00
___str_15:
	.ascii "@ 2019 THE MOJON TWINS"
	.db 0x00
;./my/pres.h:80: void scr_game_over (void) {
;	---------------------------------
; Function scr_game_over
; ---------------------------------
_scr_game_over::
;./my/pres.h:81: _x = 11; _y = 15; pr_str ("GAME OVER!");
	ld	hl,#__x + 0
	ld	(hl), #0x0B
	ld	hl,#__y + 0
	ld	(hl), #0x0F
	ld	hl,#___str_16
	push	hl
	call	_pr_str
	pop	af
	ret
___str_16:
	.ascii "GAME OVER!"
	.db 0x00
;./my/pres.h:84: void scr_the_end (void) {
;	---------------------------------
; Function scr_the_end
; ---------------------------------
_scr_the_end::
;./my/pres.h:85: unpack_bg_patterns (tsE_patterns_c, tsE_colours_c, 72*8, 7);
	ld	de,#_tsE_patterns_c
	ld	a,#0x07
	push	af
	inc	sp
	ld	hl,#0x0240
	push	hl
	ld	hl,#_tsE_colours_c
	push	hl
	push	de
	call	_unpack_bg_patterns
	ld	hl,#7
	add	hl,sp
	ld	sp,hl
;./my/pres.h:86: gp_gen = ending_rle; unrle ();
	ld	hl,#_ending_rle+0
	ld	(_gp_gen),hl
	call	_unrle
;./my/pres.h:87: _x =3; _y = 13; switch (lang_offs) {
	ld	hl,#__x + 0
	ld	(hl), #0x03
	ld	hl,#__y + 0
	ld	(hl), #0x0D
	ld	a,(#_lang_offs + 0)
	or	a, a
	jr	Z,00101$
	ld	a,(#_lang_offs + 0)
	cp	a,#0x04
	jr	Z,00102$
	sub	a, #0x08
	jr	Z,00103$
	ret
;./my/pres.h:88: case 0:
00101$:
;./my/pres.h:89: pr_str ("PUTOS BATUCADAS, PENSE QUE%%NO LLEGABA AL CONCIERTO DE%%LOS MAS GRANDES, CAGUEN...%%A VER SI ESTOS SE PORTAN!!");
	ld	hl,#___str_17
	push	hl
	call	_pr_str
	pop	af
;./my/pres.h:90: break;
	ret
;./my/pres.h:91: case 4:
00102$:
;./my/pres.h:92: pr_str ("BLOODY BATUCADAS, THEY%%ALMOST MADE ME LATE FOR%%THE GREATEST BAND ON EARTH%%I HOPE THEY ROCK DA PLACE!");
	ld	hl,#___str_18
	push	hl
	call	_pr_str
	pop	af
;./my/pres.h:93: break;
	ret
;./my/pres.h:94: case 8:
00103$:
;./my/pres.h:95: pr_str ("KACK BATUCADAS, ICH DACHTE,%%ICH KAEM NICHT ZUM KONZERT%%DER ALLERGROESSTEN, YEAH!!%%MAL SEHEN OB SIE ROCKEN!");
	ld	hl,#___str_19
	push	hl
	call	_pr_str
	pop	af
;./my/pres.h:97: }
	ret
___str_17:
	.ascii "PUTOS BATUCADAS, PENSE QUE%%NO LLEGABA AL CONCIERTO DE%%LOS "
	.ascii "MAS GRANDES, CAGUEN...%%A VER SI ESTOS SE PORTAN!!"
	.db 0x00
___str_18:
	.ascii "BLOODY BATUCADAS, THEY%%ALMOST MADE ME LATE FOR%%THE GREATES"
	.ascii "T BAND ON EARTH%%I HOPE THEY ROCK DA PLACE!"
	.db 0x00
___str_19:
	.ascii "KACK BATUCADAS, ICH DACHTE,%%ICH KAEM NICHT ZUM KONZERT%%DER"
	.ascii " ALLERGROESSTEN, YEAH!!%%MAL SEHEN OB SIE ROCKEN!"
	.db 0x00
;./my/pres.h:100: void credits (void) {
;	---------------------------------
; Function credits
; ---------------------------------
_credits::
;./my/pres.h:101: cls ();
	call	_cls
;./my/pres.h:103: _x = 0; _y = 0; if (ntsc) pr_str ("NTSC"); else pr_str ("PAL");
	ld	hl,#__x + 0
	ld	(hl), #0x00
	ld	hl,#__y + 0
	ld	(hl), #0x00
	ld	a,(#_ntsc + 0)
	or	a, a
	jr	Z,00102$
	ld	hl,#___str_20
	push	hl
	call	_pr_str
	pop	af
	jr	00103$
00102$:
	ld	hl,#___str_21
	push	hl
	call	_pr_str
	pop	af
00103$:
;./my/pres.h:105: rds16 = 0; rdy = 240;
	ld	hl,#0x0000
	ld	(_rds16),hl
	ld	hl,#_rdy + 0
	ld	(hl), #0xF0
;./my/pres.h:106: _x = 0; _y = 18; 
	ld	hl,#__x + 0
	ld	(hl), #0x00
	ld	hl,#__y + 0
	ld	(hl), #0x12
;./my/pres.h:107: pr_str ("     CHEMAN PUTAS BATUCADAS%%         ORIGINAL GAME%     @ 2018 THE MOJON TWINS%       REPROGRAMMED GAME%     @ 2019 THE MOJON TWINS");
	ld	hl,#___str_22+0
	push	hl
	call	_pr_str
;./my/pres.h:109: SG_displayOn ();
	ld	hl, #0x0140
	ex	(sp),hl
	call	_SG_VDPturnOnFeature
	pop	af
;./my/pres.h:111: while (!(SG_getKeysStatus () & PAD_START) && rds16 < 300) {
00105$:
	call	_SG_getKeysStatus
	bit	4, l
	jr	NZ,00107$
	ld	a,(#_rds16 + 0)
	sub	a, #0x2C
	ld	a,(#_rds16 + 1)
	rla
	ccf
	rra
	sbc	a, #0x81
	jr	NC,00107$
;./my/pres.h:114: update_cycle ();
	call	_update_cycle
;./my/pres.h:115: rds16 ++;
	ld	hl, #_rds16+0
	inc	(hl)
	jr	NZ,00105$
	ld	hl, #_rds16+1
	inc	(hl)
	jr	00105$
00107$:
;./my/pres.h:118: SG_displayOff ();
	ld	hl,#0x0140
	push	hl
	call	_SG_VDPturnOffFeature
	pop	af
	ret
___str_20:
	.ascii "NTSC"
	.db 0x00
___str_21:
	.ascii "PAL"
	.db 0x00
___str_22:
	.ascii "     CHEMAN PUTAS BATUCADAS%%         ORIGINAL GAME%     @ 2"
	.ascii "018 THE MOJON TWINS%       REPROGRAMMED GAME%     @ 2019 THE"
	.ascii " MOJON TWINS"
	.db 0x00
;./my/pres.h:121: void language_select (void) {
;	---------------------------------
; Function language_select
; ---------------------------------
_language_select::
;./my/pres.h:122: gp_gen = language_rle; unrle ();
	ld	hl,#_language_rle+0
	ld	(_gp_gen),hl
	call	_unrle
;./my/pres.h:123: lang_offs = 0;
	ld	hl,#_lang_offs + 0
	ld	(hl), #0x00
;./my/pres.h:125: bat_in ();
	call	_bat_in
;./my/pres.h:127: while (1) {
00114$:
;./my/pres.h:128: update_cycle ();
	call	_update_cycle
;./my/pres.h:129: SG_addMetaSprite1x1 (80, 9*8 + (lang_offs << 2), ss_it_06);
	ld	hl,#_ss_it_06
	ld	a,(#_lang_offs + 0)
	add	a, a
	add	a, a
	add	a, #0x48
	push	hl
	ld	d,a
	ld	e,#0x50
	push	de
	call	_SG_addMetaSprite1x1
	pop	af
	pop	af
;./my/pres.h:130: pad_read ();
	call	_pad_read
;./my/pres.h:132: if (pad_this_frame & PAD_UP) {
	ld	hl,#_pad_this_frame+0
	bit	0, (hl)
	jr	Z,00105$
;./my/pres.h:133: if (lang_offs) lang_offs -= 4; else lang_offs = 8;
	ld	a,(#_lang_offs + 0)
	or	a, a
	jr	Z,00102$
	ld	hl,#_lang_offs
	ld	a,(hl)
	add	a,#0xFC
	ld	(hl),a
	jr	00105$
00102$:
	ld	hl,#_lang_offs + 0
	ld	(hl), #0x08
00105$:
;./my/pres.h:135: if (pad_this_frame & PAD_DOWN) {
	ld	hl,#_pad_this_frame+0
	bit	1, (hl)
	jr	Z,00110$
;./my/pres.h:136: if (lang_offs < 8) lang_offs += 4; else lang_offs = 0;
	ld	a,(#_lang_offs + 0)
	sub	a, #0x08
	jr	NC,00107$
	ld	hl, #_lang_offs+0
	inc	(hl)
	ld	hl, #_lang_offs+0
	inc	(hl)
	ld	hl, #_lang_offs+0
	inc	(hl)
	ld	hl, #_lang_offs+0
	inc	(hl)
	jr	00110$
00107$:
	ld	hl,#_lang_offs + 0
	ld	(hl), #0x00
00110$:
;./my/pres.h:139: if (pad_this_frame & (PAD_1|PAD_2)) break;
	ld	a,(#_pad_this_frame + 0)
	and	a, #0x30
	jr	Z,00114$
;./my/pres.h:142: bat_out ();	
	jp  _bat_out
;./mainloop/flickscreen.h:7: void flickscreen_do_horizontal (void) {
;	---------------------------------
; Function flickscreen_do_horizontal
; ---------------------------------
_flickscreen_do_horizontal::
;./mainloop/flickscreen.h:8: if (prx == 4 && 
	ld	a,(#_prx + 0)
	sub	a, #0x04
	jr	NZ,00105$
;./mainloop/flickscreen.h:14: ) {
	ld	a,(#_pvx + 1)
	bit	7,a
	jr	Z,00105$
;./mainloop/flickscreen.h:15: -- n_pant;
	ld	hl, #_n_pant+0
	dec	(hl)
;./mainloop/flickscreen.h:16: px = 244 << FIXBITS;
	ld	hl,#0x3D00
	ld	(_px),hl
	ret
00105$:
;./mainloop/flickscreen.h:17: } else if (prx == 244 && 
	ld	a,(#_prx + 0)
	sub	a, #0xF4
	ret	NZ
;./mainloop/flickscreen.h:23: ) {
	xor	a, a
	ld	iy,#_pvx
	cp	a, 0 (iy)
	ld	iy,#_pvx
	sbc	a, 1 (iy)
	jp	PO, 00130$
	xor	a, #0x80
00130$:
	ret	P
;./mainloop/flickscreen.h:24: ++ n_pant;
	ld	hl, #_n_pant+0
	inc	(hl)
;./mainloop/flickscreen.h:25: px = 4 << FIXBITS;
	ld	hl,#0x0100
	ld	(_px),hl
	ret
;./mainloop/flickscreen.h:29: void flickscreen_do_vertical (void) {
;	---------------------------------
; Function flickscreen_do_vertical
; ---------------------------------
_flickscreen_do_vertical::
;./mainloop/flickscreen.h:42: if (pry == 0 && pvy < 0 && n_pant >= c_map_w) {
	ld	a,(#_pry + 0)
	or	a, a
	jr	NZ,00108$
	ld	a,(#_pvy + 1)
	bit	7,a
	jr	Z,00108$
	ld	hl,#_c_map_w
	ld	a,(#_n_pant + 0)
	sub	a, (hl)
	jr	C,00108$
;./mainloop/flickscreen.h:43: n_pant -= c_map_w;
	ld	hl,#_c_map_w
	push	de
	ld	iy,#_n_pant
	push	iy
	pop	de
	ld	a,(de)
	sub	a, (hl)
	ld	(de),a
	pop	de
;./mainloop/flickscreen.h:44: py = 192 << FIXBITS;
	ld	hl,#0x3000
	ld	(_py),hl
;./mainloop/flickscreen.h:46: if (pvy > -PLAYER_VY_JUMP_MAX) pvy = -PLAYER_VY_JUMP_MAX;
	xor	a, a
	ld	iy,#_pvy
	cp	a, 0 (iy)
	ld	a,#0xFF
	ld	iy,#_pvy
	sbc	a, 1 (iy)
	jp	PO, 00142$
	xor	a, #0x80
00142$:
	ret	P
	ld	hl,#0xFF00
	ld	(_pvy),hl
	ret
00108$:
;./mainloop/flickscreen.h:48: } else if (pry >= 192 && pvy > 0 && n_pant < c_map_size - c_map_w) {
	ld	a,(#_pry + 0)
	sub	a, #0xC0
	ret	C
	xor	a, a
	ld	iy,#_pvy
	cp	a, 0 (iy)
	ld	iy,#_pvy
	sbc	a, 1 (iy)
	jp	PO, 00143$
	xor	a, #0x80
00143$:
	ret	P
	ld	hl,#_c_map_size + 0
	ld	e, (hl)
	ld	d,#0x00
	ld	iy,#_c_map_w
	ld	l,0 (iy)
	ld	h,#0x00
	ld	a,e
	sub	a, l
	ld	e,a
	ld	a,d
	sbc	a, h
	ld	d,a
	ld	iy,#_n_pant
	ld	h,0 (iy)
	ld	l,#0x00
	ld	a,h
	sub	a, e
	ld	a,l
	sbc	a, d
	jp	PO, 00144$
	xor	a, #0x80
00144$:
	ret	P
;./mainloop/flickscreen.h:49: n_pant += c_map_w;
	ld	hl,#_c_map_w
	push	de
	ld	iy,#_n_pant
	push	iy
	pop	de
	ld	a,(de)
	add	a, (hl)
	ld	(de),a
	pop	de
;./mainloop/flickscreen.h:50: py = 0;
	ld	hl,#0x0000
	ld	(_py),hl
	ret
;./mainloop.h:6: void player_frame_selector (void) {
;	---------------------------------
; Function player_frame_selector
; ---------------------------------
_player_frame_selector::
;./my/player_frame_selector.h:12: if (ppossee || pgotten) {
	ld	a,(#_ppossee + 0)
	or	a, a
	jr	NZ,00109$
	ld	a,(#_pgotten + 0)
	or	a, a
	jr	Z,00110$
00109$:
;./my/player_frame_selector.h:14: if (pvx > PLAYER_VX_MIN || pvx < -PLAYER_VX_MIN) {
	ld	a,#0x40
	ld	iy,#_pvx
	cp	a, 0 (iy)
	ld	a,#0x00
	ld	iy,#_pvx
	sbc	a, 1 (iy)
	jp	PO, 00131$
	xor	a, #0x80
00131$:
	jp	M,00105$
	ld	a,(#_pvx + 0)
	sub	a, #0xC0
	ld	a,(#_pvx + 1)
	rla
	ccf
	rra
	sbc	a, #0x7F
	jr	NC,00106$
00105$:
;./my/player_frame_selector.h:15: if ((prx >> 3) != ol_prx) { 
	ld	hl,#_prx + 0
	ld	d, (hl)
	srl	d
	srl	d
	srl	d
	ld	a,(#_ol_prx + 0)
	sub	a, d
	jr	Z,00104$
;./my/player_frame_selector.h:16: pfr ++; if (pfr == 3) pfr = 0;
	ld	hl, #_pfr+0
	inc	(hl)
	ld	a,(#_pfr + 0)
	sub	a, #0x03
	jr	NZ,00102$
	ld	hl,#_pfr + 0
	ld	(hl), #0x00
00102$:
;./my/player_frame_selector.h:17: ol_prx = prx >> 3;
	ld	hl,#_ol_prx + 0
	ld	(hl), d
00104$:
;./my/player_frame_selector.h:19: psprid = CELL_WALK_CYCLE + pfr;
	ld	hl,#_psprid
	ld	a,(#_pfr + 0)
	inc	a
	ld	(hl),a
	jr	00111$
00106$:
;./my/player_frame_selector.h:20: } else { psprid = CELL_IDLE; pfr = 0; }
	ld	hl,#_psprid + 0
	ld	(hl), #0x00
	ld	hl,#_pfr + 0
	ld	(hl), #0x00
	jr	00111$
00110$:
;./my/player_frame_selector.h:21: } else psprid = CELL_AIRBORNE;
	ld	hl,#_psprid + 0
	ld	(hl), #0x04
00111$:
;./my/player_frame_selector.h:23: psprid += pfacing;
	ld	hl,#_pfacing
	push	de
	ld	iy,#_psprid
	push	iy
	pop	de
	ld	a,(de)
	add	a, (hl)
	ld	(de),a
	pop	de
	ret
;./mainloop.h:10: void game_init (void) {
;	---------------------------------
; Function game_init
; ---------------------------------
_game_init::
;./mainloop.h:12: win_level = game_over = 0;
	ld	hl,#_game_over + 0
	ld	(hl), #0x00
	ld	hl,#_win_level + 0
	ld	(hl), #0x00
;./mainloop/asset_setup.h:9: c_ts_tmaps = 	l_ts_tmaps [level];
	ld	iy,#_level
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	hl,#_l_ts_tmaps
	add	hl,bc
	ld	a,(hl)
	ld	iy,#_c_ts_tmaps
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_c_ts_tmaps + 1),a
;./mainloop/asset_setup.h:10: c_behs = 		l_behs [level];
	ld	hl,#_l_behs
	add	hl,bc
	ld	a,(hl)
	ld	iy,#_c_behs
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_c_behs + 1),a
;./mainloop/asset_setup.h:11: spr_enems = 	l_spr_enems [level];
	ld	hl,#_l_spr_enems
	add	hl,bc
	ld	a,(hl)
	ld	iy,#_spr_enems
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_spr_enems + 1),a
;./mainloop/asset_setup.h:13: c_map = 		l_map [level];
	ld	hl,#_l_map
	add	hl,bc
	ld	a,(hl)
	ld	iy,#_c_map
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_c_map + 1),a
;./mainloop/asset_setup.h:23: c_locks = 	l_locks [level];
	ld	hl,#_l_locks
	add	hl,bc
	ld	a,(hl)
	ld	iy,#_c_locks
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_c_locks + 1),a
;./mainloop/asset_setup.h:25: l_n_bolts [level];
	ld	a,#<(_l_n_bolts)
	ld	hl,#_level
	add	a, (hl)
	ld	e,a
	ld	a,#>(_l_n_bolts)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#_c_max_bolts + 0),a
;./mainloop/asset_setup.h:28: c_enems = 		l_enems [level];
	ld	hl,#_l_enems
	add	hl,bc
	ld	a,(hl)
	ld	iy,#_c_enems
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_c_enems + 1),a
;./mainloop/asset_setup.h:29: c_hotspots = 	l_hotspots [level];	
	ld	hl,#_l_hotspots
	add	hl,bc
	ld	a,(hl)
	ld	iy,#_c_hotspots
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_c_hotspots + 1),a
;./mainloop/asset_setup.h:31: c_max_enems = 	l_player_max_enems [level];
	ld	a,#<(_l_player_max_enems)
	ld	hl,#_level
	add	a, (hl)
	ld	e,a
	ld	a,#>(_l_player_max_enems)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#_c_max_enems + 0),a
;./mainloop/asset_setup.h:33: c_map_w = 		l_map_w [level];
	ld	a,#<(_l_map_w)
	ld	hl,#_level
	add	a, (hl)
	ld	e,a
	ld	a,#>(_l_map_w)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#_c_map_w + 0),a
;./mainloop/asset_setup.h:34: c_map_h = 		l_map_h [level];
	ld	a,#<(_l_map_h)
	ld	hl,#_level
	add	a, (hl)
	ld	e,a
	ld	a,#>(_l_map_h)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
;./mainloop/asset_setup.h:84: rda = c_map_h; c_map_size = 0; while (rda --) c_map_size += c_map_w;
	ld	(#_c_map_h + 0),a
	ld	(#_rda + 0),a
	ld	hl,#_c_map_size + 0
	ld	(hl), #0x00
00101$:
	ld	hl,#_rda + 0
	ld	d, (hl)
	ld	hl, #_rda+0
	dec	(hl)
	ld	a,d
	or	a, a
	jr	Z,00103$
	ld	hl,#_c_map_w
	push	de
	ld	iy,#_c_map_size
	push	iy
	pop	de
	ld	a,(de)
	add	a, (hl)
	ld	(de),a
	pop	de
	jr	00101$
00103$:
;./my/level_pattern_unpacker.h:20: unpack_bg_patterns (l_ts_patterns [level], l_ts_colours [level], 72*8, 7);
	ld	hl,#_l_ts_colours
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#_l_ts_patterns
	add	hl,bc
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,#0x07
	push	af
	inc	sp
	ld	hl,#0x0240
	push	hl
	push	de
	push	bc
	call	_unpack_bg_patterns
	ld	hl,#7
	add	hl,sp
	ld	sp,hl
	call	_cls
;./mainloop.h:22: draw_game_frame ();
	call	_draw_game_frame
;./mainloop.h:25: hotspots_load ();
	call	_hotspots_load
;./mainloop.h:28: memfill (lkact, 1, c_max_bolts);
	ld	hl,#_c_max_bolts + 0
	ld	c, (hl)
	ld	b,#0x00
	ld	de,#_lkact
	push	bc
	ld	a,#0x01
	push	af
	inc	sp
	push	de
	call	_memfill
	pop	af
	pop	af
	inc	sp
;./mainloop.h:31: if (!warp_to_level)	{
	ld	a,(#_warp_to_level + 0)
	or	a, a
	jr	NZ,00105$
;./mainloop.h:32: n_pant = SCR_INI;
	ld	de,#_l_scr_ini+0
	ld	hl,(_level)
	ld	h,#0x00
	add	hl,de
	ld	a,(hl)
	ld	(#_n_pant + 0),a
;./mainloop.h:33: px = (4 + (PLAYER_INI_X << 4)) << FIXBITS;
	ld	de,#_l_ini_x+0
	ld	hl,(_level)
	ld	h,#0x00
	add	hl,de
	ld	l,(hl)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc,#0x0004
	add	hl,bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	(_px),hl
;./mainloop.h:34: py = (PLAYER_INI_Y << 4) << FIXBITS;
	ld	de,#_l_ini_y+0
	ld	hl,(_level)
	ld	h,#0x00
	add	hl,de
	ld	l,(hl)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	(_py),hl
00105$:
;./mainloop.h:36: player_to_pixels ();
	call	_player_to_pixels
;./mainloop.h:37: player_init ();
	call	_player_init
;./mainloop.h:44: enems_persistent_deaths_load ();
	call	_enems_persistent_deaths_load
;./mainloop.h:48: pobjs = 0;
	ld	hl,#_pobjs + 0
	ld	(hl), #0x00
;./mainloop.h:56: pkeys = 0;
	ld	hl,#_pkeys + 0
	ld	(hl), #0x00
;./mainloop.h:84: springs_on = 0;
	ld	hl,#_springs_on + 0
	ld	(hl), #0x00
;./mainloop.h:105: rda = n_pant << 3;
	ld	a,(#_n_pant + 0)
	rlca
	rlca
	rlca
	and	a,#0xF8
	ld	(#_rda + 0),a
;./mainloop.h:106: gp_addr = PERSISTENT_TILE_GET_ADDR + (rda << 1) + rda;
	ld	hl,#_rda + 0
	ld	d, (hl)
	ld	e,#0x00
	ld	l, d
	ld	h, e
	add	hl, hl
	ld	bc, #0x1E20
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	a,c
	ld	hl,#_gp_addr
	add	a, d
	ld	(hl),a
	ld	a,b
	adc	a, e
	inc	hl
	ld	(hl),a
;./mainloop.h:108: DISABLE_INTERRUPTS;
	di 
;./mainloop.h:110: VDPControlPort = LO (PERSISTENT_TILE_GET_ADDR);
	ld	a,#0x20
	out	(_VDPControlPort),a
;./mainloop.h:111: VDPControlPort = HI (PERSISTENT_TILE_GET_ADDR) | 0x40;
	ld	a,#0x5E
	out	(_VDPControlPort),a
;./mainloop.h:114: for (rds16 = 0; rds16 < MAP_SIZE*24; rds16 ++) VDPDataPort = 0;
	ld	hl,#0x0000
	ld	(_rds16),hl
00109$:
	ld	a,#0x00
	out	(_VDPDataPort),a
	ld	hl, #_rds16+0
	inc	(hl)
	jr	NZ,00137$
	ld	hl, #_rds16+1
	inc	(hl)
00137$:
	ld	a,(#_rds16 + 0)
	sub	a, #0xE0
	ld	a,(#_rds16 + 1)
	rla
	ccf
	rra
	sbc	a, #0x81
	jr	C,00109$
;./mainloop.h:116: ENABLE_INTERRUPTS;
	ei 
;./mainloop.h:119: half_life = 0;
	ld	hl,#_half_life + 0
	ld	(hl), #0x00
;./mainloop.h:120: frame_counter = 0;
	ld	hl,#_frame_counter + 0
	ld	(hl), #0x00
;./mainloop.h:121: olife = oammo = oobjs = okeys = 0xff;
	ld	hl,#_okeys + 0
	ld	(hl), #0xFF
	ld	hl,#_oobjs + 0
	ld	(hl), #0xFF
	ld	hl,#_oammo + 0
	ld	(hl), #0xFF
	ld	hl,#_olife + 0
	ld	(hl), #0xFF
;./mainloop.h:122: okilled = 0xff;
	ld	hl,#_okilled + 0
	ld	(hl), #0xFF
;./my/extra_inits.h:7: pfacing = CELL_FACING_LEFT;
	ld	hl,#_pfacing + 0
	ld	(hl), #0x05
;./my/extra_inits.h:8: first_text = 1;
	ld	hl,#_first_text + 0
	ld	(hl), #0x01
;./my/extra_inits.h:9: first_batucada = 1;
	ld	hl,#_first_batucada + 0
	ld	(hl), #0x01
;./my/extra_inits.h:10: first_medallion = 1;
	ld	hl,#_first_medallion + 0
	ld	(hl), #0x01
;./my/extra_inits.h:11: first_totem = 1;
	ld	hl,#_first_totem + 0
	ld	(hl), #0x01
;./my/extra_inits.h:12: c_max_enems = MAX_ENEMS_TYPE_3_0;
	ld	hl,#_c_max_enems + 0
	ld	(hl), #0x19
;./my/extra_inits.h:13: pjewels = 0;
	ld	hl,#_pjewels + 0
	ld	(hl), #0x00
;./my/extra_inits.h:14: opjewels = 0xff;
	ld	hl,#_opjewels + 0
	ld	(hl), #0xFF
;./my/extra_inits.h:16: springs_on = (level == 1);
	ld	a,(#_level + 0)
	dec	a
	jr	NZ,00138$
	ld	a,#0x01
	jr	00139$
00138$:
	xor	a,a
00139$:
	ld	(#_springs_on + 0),a
;./my/extra_inits.h:19: if (level == 0) { _x = 1; _y = 1; pr_str ("        "); }
	ld	a,(#_level + 0)
	or	a, a
	ret	NZ
	ld	hl,#__x + 0
	ld	(hl), #0x01
	ld	hl,#__y + 0
	ld	(hl), #0x01
	ld	hl,#___str_23
	push	hl
	call	_pr_str
	pop	af
	ret
___str_23:
	.ascii "        "
	.db 0x00
;./mainloop.h:137: void prepare_scr (void) {
;	---------------------------------
; Function prepare_scr
; ---------------------------------
_prepare_scr::
;./mainloop.h:138: if (!ft) {
	ld	a,(#_ft + 0)
	or	a, a
	jr	NZ,00103$
;./mainloop.h:139: HW_displayOff ();
	ld	hl,#0x0140
	push	hl
	call	_SG_VDPturnOffFeature
	pop	af
;./mainloop.h:144: rda = on_pant << 3;
	ld	a,(#_on_pant + 0)
	rlca
	rlca
	rlca
	and	a,#0xF8
	ld	(#_rda + 0),a
;./mainloop.h:145: gp_addr = PERSISTENT_TILE_GET_ADDR + (rda << 1) + rda;
	ld	hl,#_rda + 0
	ld	d, (hl)
	ld	e,#0x00
	ld	l, d
	ld	h, e
	add	hl, hl
	ld	bc, #0x1E20
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	a,c
	ld	hl,#_gp_addr
	add	a, d
	ld	(hl),a
	ld	a,b
	adc	a, e
	inc	hl
	ld	(hl),a
;./mainloop.h:147: DISABLE_INTERRUPTS;
	di 
;./mainloop.h:149: VDPControlPort = LO (gp_addr);
	ld	a,(#_gp_addr + 0)
	out	(_VDPControlPort),a
;./mainloop.h:150: VDPControlPort = HI (gp_addr) | 0x40;
	ld	a,(#_gp_addr + 1)
	set	6, a
	out	(_VDPControlPort),a
;./mainloop.h:153: for (gpit = 0; gpit < 24; gpit ++) VDPDataPort = tile_got [gpit];
	ld	hl,#_gpit + 0
	ld	(hl), #0x00
	ld	de,#_tile_got+0
00110$:
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(hl)
	out	(_VDPDataPort),a
	ld	iy,#_gpit
	inc	0 (iy)
	ld	a,(#_gpit + 0)
	sub	a, #0x18
	jr	C,00110$
;./mainloop.h:155: ENABLE_INTERRUPTS;		
	ei 
00103$:
;./mainloop.h:159: ft = 0;
	ld	iy,#_ft
	ld	0 (iy),#0x00
;./mainloop.h:161: update_list [update_index] = 0xff;
	ld	a,(#_update_index + 0)
	add	a, #<(_update_list)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_update_list)
	ld	h, a
	ld	(hl),#0xFF
;./mainloop.h:162: HW_doUpdateList ();
	call	_SG_doUpdateList
;./mainloop.h:163: clear_update_list ();
	call	_clear_update_list
;./mainloop.h:175: enems_load ();
	call	_enems_load
;./mainloop.h:176: hotspots_create ();	
	call	_hotspots_create
;./mainloop.h:200: rda = n_pant << 3;
	ld	a,(#_n_pant + 0)
	rlca
	rlca
	rlca
	and	a,#0xF8
	ld	(#_rda + 0),a
;./mainloop.h:201: gp_addr = PERSISTENT_TILE_GET_ADDR + (rda << 1) + rda;
	ld	hl,#_rda + 0
	ld	d, (hl)
	ld	e,#0x00
	ld	l, d
	ld	h, e
	add	hl, hl
	ld	bc, #0x1E20
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	a,c
	ld	hl,#_gp_addr
	add	a, d
	ld	(hl),a
	ld	a,b
	adc	a, e
	inc	hl
	ld	(hl),a
;./mainloop.h:203: DISABLE_INTERRUPTS;
	di 
;./mainloop.h:205: VDPControlPort = LO (gp_addr);
	ld	a,(#_gp_addr + 0)
	out	(_VDPControlPort),a
;./mainloop.h:206: VDPControlPort = HI (gp_addr);
	ld	a,(#_gp_addr + 1)
	out	(_VDPControlPort),a
;./mainloop.h:209: for (gpit = 0; gpit < 24; gpit ++) tile_got [gpit] = VDPDataPort;
	ld	hl,#_gpit + 0
	ld	(hl), #0x00
	ld	de,#_tile_got+0
00112$:
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	in	a,(_VDPDataPort)
	ld	(hl),a
	ld	hl, #_gpit+0
	inc	(hl)
	ld	a,(#_gpit + 0)
	sub	a, #0x18
	jr	C,00112$
;./mainloop.h:211: ENABLE_INTERRUPTS;
	ei 
;./mainloop.h:214: draw_scr ();
	call	_draw_scr
;./mainloop.h:253: HW_initSprites ();
	call	_SG_initSprites
;./mainloop.h:263: run_script (2 * MAP_SIZE + 1);
	ld	a,#0x29
	push	af
	inc	sp
	call	_run_script
	inc	sp
;./mainloop.h:265: run_script (n_pant << 1);
	ld	a,(#_n_pant + 0)
	add	a, a
	push	af
	inc	sp
	call	_run_script
	inc	sp
;./mainloop.h:270: gpit = 3; while (gpit --) en_spr_id [gpit] = en_s [gpit];
	ld	hl,#_gpit + 0
	ld	(hl), #0x03
00105$:
	ld	hl,#_gpit + 0
	ld	e, (hl)
	ld	hl, #_gpit+0
	dec	(hl)
	ld	a,e
	or	a, a
	jr	Z,00107$
	ld	a,#<(_en_spr_id)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_spr_id)
	adc	a, #0x00
	ld	d,a
	ld	iy,#_en_s
	ld	bc,(_gpit)
	ld	b,#0x00
	add	iy, bc
	ld	a, 0 (iy)
	ld	(de),a
	jr	00105$
00107$:
;./mainloop.h:272: prx = px >> FIXBITS; pry = py >> FIXBITS;
	ld	hl,(_px)
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	iy,#_prx
	ld	0 (iy),l
	ld	hl,(_py)
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	iy,#_pry
	ld	0 (iy),l
;./mainloop.h:277: player_move ();
	call	_player_move
;./mainloop.h:278: player_frame_selector ();
	call	_player_frame_selector
;./mainloop.h:280: enems_move ();
	call	_enems_move
;./mainloop.h:282: if (hrt) hotspots_paint ();
	ld	a,(#_hrt + 0)
	or	a, a
	jr	Z,00109$
	call	_hotspots_paint
00109$:
;./mainloop.h:297: hud_update ();
	call	_hud_update
;./mainloop.h:298: HW_copySpritestoSAT ();
	call	_SG_copySpritestoSAT
;./mainloop.h:299: update_list [update_index] = 0xff;
	ld	a,#<(_update_list)
	ld	hl,#_update_index
	add	a, (hl)
	ld	l, a
	ld	a, #>(_update_list)
	adc	a, #0x00
	ld	h, a
	ld	(hl),#0xFF
;./mainloop.h:300: HW_doUpdateList ();
	call	_SG_doUpdateList
;./mainloop.h:301: clear_update_list ();	
	call	_clear_update_list
;./mainloop.h:302: HW_displayOn ();
	ld	hl,#0x0140
	push	hl
	call	_SG_VDPturnOnFeature
	pop	af
;./mainloop.h:304: pad0 = 0;
	ld	hl,#_pad0 + 0
	ld	(hl), #0x00
	ret
;./mainloop.h:307: void game_loop (void) {
;	---------------------------------
; Function game_loop
; ---------------------------------
_game_loop::
;./mainloop.h:308: clear_update_list ();
	call	_clear_update_list
;./mainloop.h:310: on_pant = 99; ft = 1; fade_delay = 1;
	ld	hl,#_on_pant + 0
	ld	(hl), #0x63
	ld	hl,#_ft + 0
	ld	(hl), #0x01
	ld	hl,#_fade_delay + 0
	ld	(hl), #0x01
;./mainloop.h:320: run_script (2 * MAP_SIZE);
	ld	a,#0x28
	push	af
	inc	sp
	call	_run_script
	inc	sp
;./mainloop.h:323: ntsc_frame = level_reset = warp_to_level = 0; 
	ld	hl,#_warp_to_level + 0
	ld	(hl), #0x00
	ld	hl,#_level_reset + 0
	ld	(hl), #0x00
	ld	hl,#_ntsc_frame + 0
	ld	(hl), #0x00
;./mainloop.h:324: ticker = 50;
	ld	hl,#_ticker + 0
	ld	(hl), #0x32
;./mainloop.h:327: PSGPlay (l_music [level]);
	ld	iy,#_level
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ld	de,#_l_music
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	call	_PSGPlay
	pop	af
;./mainloop.h:332: paused = 0; HW_resetPauseRequest ();
	ld	hl,#_paused + 0
	ld	(hl), #0x00
	call	_SG_resetPauseRequest
;./mainloop.h:334: while (1) {
00180$:
;./mainloop.h:339: if (n_pant != 0xfe && on_pant != 0xfe) 
	ld	a,(#_n_pant + 0)
	sub	a, #0xFE
	jr	Z,00102$
	ld	a,(#_on_pant + 0)
	sub	a, #0xFE
	jr	Z,00102$
;./mainloop.h:341: hud_update ();
	call	_hud_update
00102$:
;./mainloop.h:345: if (pkill) player_kill ();
	ld	a,(#_pkill + 0)
	or	a, a
	jr	Z,00105$
	call	_player_kill
00105$:
;./mainloop.h:346: if (game_over || level_reset) break;			
	ld	a,(#_game_over + 0)
	or	a, a
	jp	NZ,00181$
	ld	a,(#_level_reset + 0)
	or	a, a
	jp	NZ,00181$
;./mainloop.h:352: flick_override = 0;
	ld	hl,#_flick_override + 0
	ld	(hl), #0x00
;./mainloop.h:355: flickscreen_do_horizontal ();
	call	_flickscreen_do_horizontal
;./mainloop.h:356: flickscreen_do_vertical ();
	call	_flickscreen_do_vertical
;./mainloop.h:362: if (on_pant != n_pant) {
	ld	a,(#_on_pant + 0)
	ld	iy,#_n_pant
	sub	a, 0 (iy)
	jr	Z,00112$
;./mainloop.h:363: prepare_scr ();
	call	_prepare_scr
;./mainloop.h:364: on_pant = n_pant;
	ld	a,(#_n_pant + 0)
	ld	(#_on_pant + 0),a
00112$:
;./mainloop.h:383: HW_waitForVBlank ();
	call	_SG_waitForVBlank
;./mainloop.h:384: HW_copySpritestoSAT ();
	call	_SG_copySpritestoSAT
;./mainloop.h:385: update_list [update_index] = 0xff;
	ld	a,#<(_update_list)
	ld	hl,#_update_index
	add	a, (hl)
	ld	l, a
	ld	a, #>(_update_list)
	adc	a, #0x00
	ld	h, a
	ld	(hl),#0xFF
;./mainloop.h:386: HW_doUpdateList ();
	call	_SG_doUpdateList
;./mainloop.h:387: clear_update_list ();
	call	_clear_update_list
;./mainloop.h:391: pad_read ();
	call	_pad_read
;./mainloop.h:392: a_button = (pad_this_frame & PAD_A);
	ld	a,(#_pad_this_frame + 0)
	and	a, #0x20
	ld	(#_a_button + 0),a
;./mainloop.h:393: b_button = (pad_this_frame & PAD_B);
	ld	a,(#_pad_this_frame + 0)
	and	a, #0x10
	ld	(#_b_button + 0),a
;./mainloop.h:397: ntsc_frame ++; if (ntsc_frame == 6) ntsc_frame = 0;
	ld	hl, #_ntsc_frame+0
	inc	(hl)
	ld	a,(#_ntsc_frame + 0)
	sub	a, #0x06
	jr	NZ,00114$
	ld	hl,#_ntsc_frame + 0
	ld	(hl), #0x00
00114$:
;./mainloop.h:399: if (paused == 0 && (ntsc == 0 || ntsc_frame)) {
	ld	a,(#_paused + 0)
	or	a, a
	jp	NZ,00172$
	ld	a,(#_ntsc + 0)
	or	a, a
	jr	Z,00171$
	ld	a,(#_ntsc_frame + 0)
	or	a, a
	jp	Z,00172$
00171$:
;./mainloop.h:400: HW_initSprites ();
	call	_SG_initSprites
;./mainloop.h:403: if (ticker) -- ticker; else ticker = 50;
	ld	a,(#_ticker + 0)
	or	a, a
	jr	Z,00116$
	ld	hl, #_ticker+0
	dec	(hl)
	jr	00117$
00116$:
	ld	hl,#_ticker + 0
	ld	(hl), #0x32
00117$:
;./mainloop.h:404: half_life ^= 1;
	ld	a,(#_half_life + 0)
	xor	a, #0x01
	ld	(#_half_life + 0),a
;./mainloop.h:405: ++ frame_counter;
	ld	hl, #_frame_counter+0
	inc	(hl)
;./mainloop/hotspots.h:6: if (hrt) {
	ld	a,(#_hrt + 0)
	or	a, a
	jp	Z,00133$
;./mainloop/hotspots.h:7: if (collide_in (prx + 4, pry + 8, hrx, hry)) {
	ld	a,(#_pry + 0)
	add	a, #0x08
	ld	b,a
	ld	hl,#_prx + 0
	ld	d, (hl)
	inc	d
	inc	d
	inc	d
	inc	d
	ld	a,(_hry)
	push	af
	inc	sp
	ld	a,(_hrx)
	push	af
	inc	sp
	ld	c, d
	push	bc
	call	_collide_in
	pop	af
	pop	af
	ld	a,l
	or	a, a
	jp	Z,00133$
;./mainloop/hotspots.h:128: gp_gen = 0; rdm = 1;
	ld	hl,#0x0000
	ld	(_gp_gen),hl
	ld	hl,#_rdm + 0
	ld	(hl), #0x01
;./mainloop/hotspots.h:129: switch (hrt) {
	ld	a,(#_hrt + 0)
	sub	a, #0x01
	jr	C,00123$
	ld	a,#0x03
	ld	iy,#_hrt
	sub	a, 0 (iy)
	jr	C,00123$
	ld	iy,#_hrt
	ld	e,0 (iy)
	dec	e
	ld	d,#0x00
	ld	hl,#00375$
	add	hl,de
	add	hl,de
;./mainloop/hotspots.h:131: case HOTSPOT_TYPE_OBJECT:
	jp	(hl)
00375$:
	jr	00118$
	jr	00121$
	jr	00122$
00118$:
;./mainloop/hotspots.h:134: if (flags [ONLY_ONE_OBJECT_FLAG] == 0) {
	ld	a, (#_flags + 0)
	or	a, a
	jr	NZ,00123$
;./mainloop/hotspots.h:135: flags [ONLY_ONE_OBJECT_FLAG] = 1;
	ld	hl,#_flags
	ld	(hl),#0x01
;./mainloop/hotspots.h:136: gp_gen = SFX_OBJECT;
	ld	hl,#_gp_gen + 0
	ld	(hl), #<(_s_02_object2_psg)
	ld	hl,#_gp_gen + 1
	ld	(hl), #>(_s_02_object2_psg)
;./mainloop/hotspots.h:148: break;
	jr	00123$
;./mainloop/hotspots.h:151: case HOTSPOT_TYPE_KEYS:
00121$:
;./mainloop/hotspots.h:152: ++ pkeys;
	ld	hl, #_pkeys+0
	inc	(hl)
;./mainloop/hotspots.h:153: gp_gen = SFX_OBJECT;
	ld	hl,#_gp_gen + 0
	ld	(hl), #<(_s_02_object2_psg)
	ld	hl,#_gp_gen + 1
	ld	(hl), #>(_s_02_object2_psg)
;./mainloop/hotspots.h:154: break;
	jr	00123$
;./mainloop/hotspots.h:156: case HOTSPOT_TYPE_REFILL:
00122$:
;./mainloop/hotspots.h:157: plife += PLAYER_REFILL;
	ld	hl, #_plife+0
	inc	(hl)
	ld	hl, #_plife+0
	inc	(hl)
	ld	hl, #_plife+0
	inc	(hl)
;./mainloop/hotspots.h:161: gp_gen = SFX_USE;
	ld	hl,#_gp_gen + 0
	ld	(hl), #<(_s_03_use2_psg)
	ld	hl,#_gp_gen + 1
	ld	(hl), #>(_s_03_use2_psg)
;./mainloop/hotspots.h:162: rdm = 2;
	ld	hl,#_rdm + 0
	ld	(hl), #0x02
;./mainloop/hotspots.h:192: }
00123$:
;./mainloop/hotspots.h:193: if (gp_gen) {
	ld	a,(#_gp_gen + 1)
	ld	hl,#_gp_gen + 0
	or	a,(hl)
	jr	Z,00125$
;./mainloop/hotspots.h:194: PSGSFXPlay (gp_gen, rdm);
	ld	de,(_gp_gen)
	ld	a,(_rdm)
	push	af
	inc	sp
	push	de
	call	_PSGSFXPlay
	pop	af
	inc	sp
;./mainloop/hotspots.h:195: hrt = 0;
	ld	hl,#_hrt + 0
	ld	(hl), #0x00
;./mainloop/hotspots.h:196: hact [n_pant] = 0;
	ld	a,#<(_hact)
	ld	hl,#_n_pant
	add	a, (hl)
	ld	e,a
	ld	a,#>(_hact)
	adc	a, #0x00
	ld	d,a
	xor	a, a
	ld	(de),a
00125$:
;./mainloop/hotspots.h:201: if (opinv != pinv) {
	ld	a,(#_opinv + 0)
	ld	iy,#_pinv
	sub	a, 0 (iy)
	jr	Z,00133$
;./mainloop/../my/on_object_got.h:9: pjewels ++;
	ld	hl, #_pjewels+0
	inc	(hl)
;./mainloop/../my/on_object_got.h:10: if (pjewels == 50) {
	ld	a,(#_pjewels + 0)
	sub	a, #0x32
	jr	NZ,00133$
;./mainloop/../my/on_object_got.h:11: plife ++; pjewels = 0;
	ld	hl, #_plife+0
	inc	(hl)
	ld	hl,#_pjewels + 0
	ld	(hl), #0x00
;./mainloop/../my/on_object_got.h:12: PSGSFXPlay (SFX_FANFARE, 2);
	ld	de,#_s_19_fanfare2_psg
	ld	a,#0x02
	push	af
	inc	sp
	push	de
	call	_PSGSFXPlay
	pop	af
	inc	sp
00133$:
;./mainloop.h:425: if (!warp_to_level) {
	ld	a,(#_warp_to_level + 0)
	or	a, a
	jr	NZ,00135$
;./mainloop.h:426: player_move ();
	call	_player_move
;./mainloop.h:427: player_frame_selector ();
	call	_player_frame_selector
00135$:
;./my/extra_checks.h:14: win_level = (pobjs == MAX_HOTSPOTS_TYPE_1_0 && pkilled == MAX_ENEMS_TYPE_3_0);
	ld	a,(#_pobjs + 0)
	sub	a, #0x0F
	jr	NZ,00184$
	ld	a,(#_pkilled + 0)
	sub	a, #0x19
	jr	Z,00185$
00184$:
	ld	a,#0x00
	jr	00186$
00185$:
	ld	a,#0x01
00186$:
;./mainloop/win_level_condition.h:10: win_level
	ld	(#_win_level + 0),a
	or	a, a
	jr	Z,00137$
;./mainloop/win_level_condition.h:23: PSGStop ();
	call	_PSGStop
;./mainloop/win_level_condition.h:24: delay (50);
	ld	a,#0x32
	push	af
	inc	sp
	call	_delay
	inc	sp
;./mainloop/win_level_condition.h:25: break;
	jp	00181$
00137$:
;./mainloop.h:464: cur_stp = HW_getStp (); 
	call	_SG_getStp
	ld	(_cur_stp),hl
;./mainloop.h:465: if (!warp_to_level)	player_render ();
	ld	a,(#_warp_to_level + 0)
	or	a, a
	jr	NZ,00139$
	call	_player_render
00139$:
;./mainloop.h:469: enems_move ();
	call	_enems_move
;./mainloop.h:473: if (warp_to_level) {
	ld	a,(#_warp_to_level + 0)
	or	a, a
	jr	Z,00141$
;./mainloop.h:474: update_cycle (); PSGStop (); break;
	call	_update_cycle
	call	_PSGStop
	jp	00181$
00141$:
;./mainloop.h:485: if (hrt) hotspots_paint ();
	ld	a,(#_hrt + 0)
	or	a, a
	jr	Z,00143$
	call	_hotspots_paint
00143$:
;./my/extra_routines.h:9: (level == 1 && n_pant == 18)
	ld	a,(#_level + 0)
	dec	a
	jr	NZ,00382$
	ld	a,#0x01
	jr	00383$
00382$:
	xor	a,a
00383$:
	ld	d,a
;./my/extra_routines.h:8: (level == 0 && (n_pant == 2 || n_pant == 7 || n_pant == 12 || n_pant == 17)) ||
	ld	a,(#_level + 0)
	or	a, a
	jr	NZ,00154$
	ld	a,(#_n_pant + 0)
	sub	a, #0x02
	jr	Z,00147$
	ld	a,(#_n_pant + 0)
	sub	a, #0x07
	jr	Z,00147$
	ld	a,(#_n_pant + 0)
	sub	a, #0x0C
	jr	Z,00147$
	ld	a,(#_n_pant + 0)
	sub	a, #0x11
	jr	Z,00147$
00154$:
;./my/extra_routines.h:9: (level == 1 && n_pant == 18)
	ld	a,d
	or	a, a
	jr	Z,00148$
	ld	a,(#_n_pant + 0)
	sub	a, #0x12
	jr	NZ,00148$
00147$:
;./my/extra_routines.h:11: if (flags [ONLY_ONE_OBJECT_FLAG] && (half_life)) {
	ld	a, (#_flags + 0)
	or	a, a
	jr	Z,00148$
	ld	a,(#_half_life + 0)
	or	a, a
	jr	Z,00148$
;./my/extra_routines.h:14: ss_it_04
;./my/extra_routines.h:13: 112, level == 1 ? 103 : 151,  
	ld	a,d
	or	a, a
	jr	Z,00187$
	ld	b,#0x67
	jr	00188$
00187$:
	ld	b,#0x97
00188$:
	ld	hl,#_ss_it_04
	push	hl
	push	bc
	inc	sp
	ld	a,#0x70
	push	af
	inc	sp
	call	_SG_addMetaSprite1x1
	pop	af
	pop	af
00148$:
;./my/extra_routines.h:19: if (first_game) {
	ld	a,(#_first_game + 0)
	or	a, a
	jp	Z,00172$
;./my/extra_routines.h:20: gp_gen = 0;
	ld	hl,#0x0000
	ld	(_gp_gen),hl
;./my/extra_routines.h:22: if (ppossee && first_text) {
	ld	a,(#_ppossee + 0)
	or	a, a
	jr	Z,00156$
	ld	a,(#_first_text + 0)
	or	a, a
	jr	Z,00156$
;./my/extra_routines.h:23: first_text = 0;
	ld	hl,#_first_text + 0
	ld	(hl), #0x00
;./my/extra_routines.h:24: gp_gen = custom_texts [lang_offs];
	ld	iy,#_lang_offs
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ld	de,#_custom_texts
	add	hl,de
	ld	a,(hl)
	ld	iy,#_gp_gen
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_gp_gen + 1),a
00156$:
;./my/extra_routines.h:27: if (pkilled && first_batucada) {
	ld	a,(#_pkilled + 0)
	or	a, a
	jr	Z,00159$
	ld	a,(#_first_batucada + 0)
	or	a, a
	jr	Z,00159$
;./my/extra_routines.h:28: first_batucada = 0;
	ld	hl,#_first_batucada + 0
	ld	(hl), #0x00
;./my/extra_routines.h:29: gp_gen = custom_texts [lang_offs + 1];
	ld	iy,#_lang_offs
	ld	l,0 (iy)
	inc	l
	ld	h,#0x00
	add	hl, hl
	ld	de,#_custom_texts
	add	hl,de
	ld	a,(hl)
	ld	iy,#_gp_gen
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_gp_gen + 1),a
00159$:
;./my/extra_routines.h:32: if (flags [ONLY_ONE_OBJECT_FLAG] && first_medallion) {
	ld	a,(#_flags + 0)
	or	a, a
	jr	Z,00162$
	ld	a,(#_first_medallion + 0)
	or	a, a
	jr	Z,00162$
;./my/extra_routines.h:33: first_medallion = 0;
	ld	hl,#_first_medallion + 0
	ld	(hl), #0x00
;./my/extra_routines.h:34: gp_gen = custom_texts [lang_offs + 2];
	ld	iy,#_lang_offs
	ld	l,0 (iy)
	inc	l
	inc	l
	ld	h,#0x00
	add	hl, hl
	ld	de,#_custom_texts
	add	hl,de
	ld	a,(hl)
	ld	iy,#_gp_gen
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_gp_gen + 1),a
00162$:
;./my/extra_routines.h:37: if (pobjs && first_totem) {
	ld	a,(#_pobjs + 0)
	or	a, a
	jr	Z,00165$
	ld	a,(#_first_totem + 0)
	or	a, a
	jr	Z,00165$
;./my/extra_routines.h:38: first_totem = 0;
	ld	hl,#_first_totem + 0
	ld	(hl), #0x00
;./my/extra_routines.h:39: gp_gen = custom_texts [lang_offs + 3];
	ld	a,(#_lang_offs + 0)
	add	a, #0x03
	ld	l,a
	ld	h,#0x00
	add	hl, hl
	ld	de,#_custom_texts
	add	hl,de
	ld	a,(hl)
	ld	iy,#_gp_gen
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_gp_gen + 1),a
00165$:
;./my/extra_routines.h:42: if (gp_gen) {
	ld	a,(#_gp_gen + 1)
	ld	hl,#_gp_gen + 0
	or	a,(hl)
	jr	Z,00172$
;./my/extra_routines.h:44: SG_initSprites ();
	call	_SG_initSprites
;./my/extra_routines.h:45: player_render ();
	call	_player_render
;./my/extra_routines.h:46: SG_waitForVBlank ();
	call	_SG_waitForVBlank
;./my/extra_routines.h:47: SG_copySpritestoSAT ();
	call	_SG_copySpritestoSAT
;./my/extra_routines.h:49: textbox_do ();	
	call	_textbox_do
00172$:
;./mainloop/cheat.h:5: if ((pad0 & (PAD_B|PAD_SELECT|PAD_UP)) == (PAD_B|PAD_SELECT|PAD_UP)) break;
	ld	a,(#_pad0 + 0)
	and	a, #0x31
	sub	a, #0x31
	jr	Z,00181$
	call	_SG_queryPauseRequested
	bit	0,l
	jp	Z,00180$
;./mainloop/pause.h:6: HW_resetPauseRequest ();
	call	_SG_resetPauseRequest
;./mainloop/pause.h:7: paused ^= 1;
	ld	a,(#_paused + 0)
	xor	a, #0x01
	ld	(#_paused + 0),a
;./mainloop/pause.h:8: music_pause (paused);
	ld	a,(_paused)
	push	af
	inc	sp
	call	_music_pause
	inc	sp
	jp	00180$
00181$:
;./mainloop.h:529: PSGStop ();
	call	_PSGStop
;./mainloop.h:530: PSGSFXStop ();
	call	_PSGSFXStop
;./mainloop.h:531: HW_displayOff ();
	ld	hl,#0x0140
	push	hl
	call	_SG_VDPturnOffFeature
	pop	af
;./mainloop.h:532: HW_initSprites ();
	call	_SG_initSprites
;./mainloop.h:533: HW_copySpritestoSAT ();	
	jp  _SG_copySpritestoSAT
;./game.c:141: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;./game.c:142: HW_displayOff ();
	ld	hl,#0x0140
	push	hl
	call	_SG_VDPturnOffFeature
;./game.c:143: HW_setSpriteMode (SG_SPRITEMODE_LARGE);
	ld	h,#0x01
	ex	(sp),hl
	inc	sp
	call	_SG_setSpriteMode
	inc	sp
;./game.c:144: HW_setUpdateList (update_list);
	ld	hl,#_update_list+0
	push	hl
	call	_SG_setUpdateList
	pop	af
;./game.c:145: first_game = 1;
	ld	hl,#_first_game + 0
	ld	(hl), #0x01
;./game.c:150: ntsc = 1;
	ld	hl,#_ntsc + 0
	ld	(hl), #0x01
;./game.c:153: unpack_bg_patterns (tsFONT_patterns_c, tsFONT_colours_c, 0, 7);
	ld	de,#_tsFONT_colours_c+0
	ld	bc,#_tsFONT_patterns_c+0
	ld	a,#0x07
	push	af
	inc	sp
	ld	hl,#0x0000
	push	hl
	push	de
	push	bc
	call	_unpack_bg_patterns
	ld	hl,#7
	add	hl,sp
	ld	sp,hl
;./game.c:154: credits ();
	call	_credits
;./game.c:155: aPLib_depack_VRAM (SGT_BASE, ssALL_patterns_c);
	ld	hl,#_ssALL_patterns_c+0
	push	hl
	ld	hl,#0x3800
	push	hl
	call	_aPLib_depack_VRAM
	pop	af
	pop	af
;./game.c:156: language_select ();
	call	_language_select
;./game.c:158: while (1) {	
00108$:
;./game.c:159: title ();
	call	_title
;./game.c:161: plife = PLAYER_LIFE;
	ld	hl,#_plife + 0
	ld	(hl), #0x05
;./game.c:166: game_init (); 
	call	_game_init
;./game.c:167: game_loop ();
	call	_game_loop
;./game.c:169: if (game_over) {
	ld	a,(#_game_over + 0)
	or	a, a
	jr	Z,00102$
;./game.c:170: pres (scr_game_over, 0);
	ld	hl,#0x0000
	push	hl
	ld	hl,#_scr_game_over
	push	hl
	call	_pres
	pop	af
	pop	af
;./game.c:171: break;
	jr	00106$
00102$:
;./game.c:173: pres (scr_the_end, 0);
	ld	hl,#0x0000
	push	hl
	ld	hl,#_scr_the_end
	push	hl
	call	_pres
	pop	af
	pop	af
;./game.c:174: break;
00106$:
;./game.c:178: first_game = 0;
	ld	hl,#_first_game + 0
	ld	(hl), #0x00
	jr	00108$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
