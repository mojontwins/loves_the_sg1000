;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW32)
; This file was generated Fri Sep 13 13:07:35 2019
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
	.globl _credits
	.globl _game_ending
	.globl _scr_sclear
	.globl _scr_game_over
	.globl _title
	.globl _logo
	.globl _snip
	.globl _pres
	.globl _bat_out
	.globl _bat_in
	.globl _hud_update
	.globl _draw_game_frame
	.globl _enems_move
	.globl _enems_load
	.globl _enems_persistent_update
	.globl _enems_persistent_load
	.globl _player_move
	.globl _player_kill
	.globl _player_to_pixels
	.globl _player_render
	.globl _player_init
	.globl _chac_chacs_do
	.globl _propellers_do
	.globl _hotspots_create
	.globl _hotspots_paint
	.globl _hotspots_load
	.globl _update_cycle
	.globl _pad_read
	.globl _collide_in
	.globl _pr_str
	.globl _draw_scr
	.globl _p_t
	.globl _cls
	.globl _clear_update_list
	.globl _unrle
	.globl _unpack_bg_patterns
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
	.globl _SG_addMetaSprite1x1
	.globl _SG_initSprites
	.globl _SG_setTileatXY
	.globl _SG_waitForVBlank
	.globl _SG_setSpriteMode
	.globl _SG_VDPturnOffFeature
	.globl _SG_VDPturnOnFeature
	.globl _level_done
	.globl ___player_rx
	.globl ___player_ax
	.globl ___player_vx_max
	.globl ___player_vy_jetpac_max
	.globl ___player_ay_jetpac
	.globl ___player_g
	.globl ___player_vy_falling_max
	.globl _ol_prx
	.globl _game_puri
	.globl _shaker_ct
	.globl _chac_chacs_queue_write
	.globl _chac_chacs_queue_read
	.globl _chac_chacs_queue
	.globl _chac_chacs_ct
	.globl _chac_chacs_idlewait
	.globl _chac_chacs_state
	.globl _chac_chacs_yx
	.globl _max_chac_chacs
	.globl _propellers_on
	.globl _prp_yx
	.globl _prp_idx
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
	.globl _c_max_bolts
	.globl _c_hotspots
	.globl _c_enems
	.globl _c_locks
	.globl _c_decos
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
	.globl _pfiring
	.globl _pkilled
	.globl _pammo
	.globl _pobjs
	.globl _plife
	.globl _pcontinues
	.globl _pnotsafe
	.globl _pice
	.globl _pkill
	.globl _pry_old
	.globl _prx_old
	.globl _pfloating
	.globl _hith
	.globl _hitv
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
	.globl _en_rmx
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
	.globl _l_music
	.globl _l_hotspots
	.globl _l_enems
	.globl _l_decos
	.globl _l_map
	.globl _l_spr_enems
	.globl _l_behs
	.globl _l_ts_tmaps
	.globl _l_player_max_enems
	.globl _l_player_max_objects
	.globl _l_map_h
	.globl _l_map_w
	.globl _l_ini_y
	.globl _l_ini_x
	.globl _l_scr_ini
	.globl _spr_hs
	.globl _spr_enems1
	.globl _spr_enems0
	.globl _spr_player
	.globl _behs3
	.globl _behs2
	.globl _behs1
	.globl _behs0
	.globl _jitter
	.globl _bits
	.globl _chac_chacs_t3
	.globl _chac_chacs_t2
	.globl _chac_chacs_t1
	.globl _chac_chacs_times
	.globl _chac_chacs_initial_times
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
_en_rmx::
	.ds 3
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
_hitv::
	.ds 1
_hith::
	.ds 1
_pfloating::
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
_pobjs::
	.ds 1
_pammo::
	.ds 1
_pkilled::
	.ds 1
_pfiring::
	.ds 1
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
_c_decos::
	.ds 1
_c_locks::
	.ds 2
_c_enems::
	.ds 2
_c_hotspots::
	.ds 2
_c_max_bolts::
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
	.ds 35
_flags::
	.ds 16
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
_prp_idx::
	.ds 1
_prp_yx::
	.ds 4
_propellers_on::
	.ds 1
_max_chac_chacs::
	.ds 1
_chac_chacs_yx::
	.ds 4
_chac_chacs_state::
	.ds 4
_chac_chacs_idlewait::
	.ds 4
_chac_chacs_ct::
	.ds 4
_chac_chacs_queue::
	.ds 16
_chac_chacs_queue_read::
	.ds 1
_chac_chacs_queue_write::
	.ds 1
_shaker_ct::
	.ds 1
_game_puri::
	.ds 1
_ol_prx::
	.ds 1
___player_vy_falling_max::
	.ds 1
___player_g::
	.ds 1
___player_ay_jetpac::
	.ds 1
___player_vy_jetpac_max::
	.ds 1
___player_vx_max::
	.ds 1
___player_ax::
	.ds 1
___player_rx::
	.ds 1
_level_done::
	.ds 3
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
	sub	a, #0x23
	jr	C,00102$
	ret
_chac_chacs_initial_times:
	.db #0x19	; 25
	.db #0x32	; 50	'2'
	.db #0x64	; 100	'd'
_chac_chacs_times:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x64	; 100	'd'
	.db #0x10	; 16
	.db #0x10	; 16
_chac_chacs_t1:
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x11	; 17
_chac_chacs_t2:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x11	; 17
	.db #0x00	; 0
_chac_chacs_t3:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
_behs1:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x40	; 64
_behs2:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
_behs3:
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
_spr_player:
	.dw _ss_pl_00
	.dw _ss_pl_01
	.dw _ss_pl_02
	.dw _ss_pl_01
	.dw _ss_pl_03
	.dw _ss_pl_04
	.dw _ss_pl_05
	.dw _ss_pl_06
	.dw _ss_pl_05
	.dw _ss_pl_07
	.dw _ss_pl_08
	.dw _ss_pl_09
	.dw _ss_pl_0a
	.dw #0x0000
	.dw _ss_pl_0b
	.dw _ss_pl_0c
	.dw _ss_pl_0d
	.dw _ss_pl_0e
	.dw #0x0000
	.dw _ss_pl_0f
_spr_enems0:
	.dw _ss_en0_00
	.dw _ss_en0_01
	.dw #0x0000
	.dw #0x0000
	.dw _ss_en0_00
	.dw _ss_en0_01
	.dw #0x0000
	.dw #0x0000
	.dw _ss_en0_02
	.dw _ss_en0_03
	.dw #0x0000
	.dw #0x0000
	.dw _ss_en0_02
	.dw _ss_en0_03
	.dw #0x0000
	.dw #0x0000
	.dw _ss_en0_04
	.dw _ss_en0_05
	.dw #0x0000
	.dw #0x0000
	.dw _ss_en0_04
	.dw _ss_en0_05
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
_spr_enems1:
	.dw _ss_en1_00
	.dw _ss_en1_01
	.dw #0x0000
	.dw #0x0000
	.dw _ss_en1_00
	.dw _ss_en1_01
	.dw #0x0000
	.dw #0x0000
	.dw _ss_en1_02
	.dw _ss_en1_03
	.dw #0x0000
	.dw #0x0000
	.dw _ss_en1_02
	.dw _ss_en1_03
	.dw #0x0000
	.dw #0x0000
	.dw _ss_en1_04
	.dw _ss_en1_05
	.dw #0x0000
	.dw #0x0000
	.dw _ss_en1_04
	.dw _ss_en1_05
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
_spr_hs:
	.dw #0x0000
	.dw _ss_it_00
	.dw #0x0000
	.dw _ss_it_01
	.dw #0x0000
_l_scr_ini:
	.db #0x1C	; 28
	.db #0x1C	; 28
	.db #0x1C	; 28
	.db #0x0C	; 12
_l_ini_x:
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
_l_ini_y:
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x06	; 6
_l_map_w:
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x04	; 4
_l_map_h:
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x04	; 4
_l_player_max_objects:
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x0B	; 11
_l_player_max_enems:
	.db #0x20	; 32
	.db #0x22	; 34
	.db #0x22	; 34
	.db #0x09	; 9
_l_ts_tmaps:
	.dw _ts0_tmaps
	.dw _ts1_tmaps
	.dw _ts2_tmaps
	.dw _ts3_tmaps
_l_behs:
	.dw _behs0
	.dw _behs1
	.dw _behs2
	.dw _behs3
_l_spr_enems:
	.dw _spr_enems0
	.dw _spr_enems1
	.dw _spr_enems1
	.dw _spr_enems0
_l_map:
	.dw _map_0
	.dw _map_1
	.dw _map_2
	.dw _map_3
_l_decos:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
_l_enems:
	.dw _enems_0
	.dw _enems_1
	.dw _enems_2
	.dw _enems_3
_l_hotspots:
	.dw _hotspots_0
	.dw _hotspots_1
	.dw _hotspots_2
	.dw _hotspots_3
_l_music:
	.dw _m_n_stagea_psg
	.dw _m_n_stageb_psg
	.dw _m_n_stagec_psg
	.dw _m_n_stageb_psg
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
;./engine/frame.h:19: if (oobjs != pobjs) {
	ld	a,(#_oobjs + 0)
	ld	iy,#_pobjs
	sub	a, 0 (iy)
	jr	Z,00102$
;./engine/frame.h:20: oobjs = pobjs;
	ld	a,(#_pobjs + 0)
	ld	(#_oobjs + 0),a
;./engine/frame.h:21: _x = OBJECTS_X; _y = OBJECTS_Y; 
	ld	hl,#__x + 0
	ld	(hl), #0x05
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
00102$:
;./engine/frame.h:39: if (olife != plife) {
	ld	a,(#_olife + 0)
	ld	iy,#_plife
	sub	a, 0 (iy)
	ret	Z
;./engine/frame.h:40: olife = plife;
	ld	hl,#_plife + 0
	ld	d, (hl)
	ld	hl,#_olife + 0
	ld	(hl), d
;./engine/frame.h:41: _x = LIFE_X; _y = LIFE_Y; _n = plife; p_t ();
	ld	hl,#__x + 0
	ld	(hl), #0x19
	ld	hl,#__y + 0
	ld	(hl), #0x01
	ld	hl,#__n + 0
	ld	(hl), d
	jp  _p_t
;./my/pres.h:6: void bat_in (void) {
;	---------------------------------
; Function bat_in
; ---------------------------------
_bat_in::
;./my/pres.h:7: HW_displayOn ();
	ld	hl,#0x0140
	push	hl
	call	_SG_VDPturnOnFeature
	pop	af
;./my/pres.h:8: while (HW_getKeysStatus ());
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
;./my/pres.h:13: HW_displayOff ();
	ld	hl,#0x0140
	push	hl
	call	_SG_VDPturnOffFeature
	pop	af
;./my/pres.h:14: HW_initSprites ();
	call	_SG_initSprites
;./my/pres.h:15: HW_copySpritestoSAT ();	
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
;./my/pres.h:30: void snip (void) {
;	---------------------------------
; Function snip
; ---------------------------------
_snip::
;./my/pres.h:35: gp_addr = PNTADDRESS + (rdy << 5);
	ld	iy,#_rdy
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de,hl
	ld	hl,#0x1800
	add	hl,de
	ld	(_gp_addr),hl
;./my/pres.h:36: VDPControlPort = LO (gp_addr); VDPControlPort = HI (gp_addr) | 0x40;
	ld	a,(#_gp_addr + 0)
	out	(_VDPControlPort),a
	ld	a,(#_gp_addr + 1)
	set	6, a
	out	(_VDPControlPort),a
;./my/pres.h:37: while (rda --) {
00104$:
	ld	hl,#_rda + 0
	ld	d, (hl)
	ld	hl, #_rda+0
	dec	(hl)
	ld	a,d
	or	a, a
	ret	Z
;./my/pres.h:38: HW_waitForVBlank ();
	call	_SG_waitForVBlank
;./my/pres.h:39: gpit = 32; while (gpit --) {
	ld	hl,#_gpit + 0
	ld	(hl), #0x20
00101$:
	ld	hl,#_gpit + 0
	ld	d, (hl)
	ld	hl, #_gpit+0
	dec	(hl)
	ld	a,d
	or	a, a
	jr	Z,00104$
;./my/pres.h:40: VDPDataPort = *gp_tmap ++;
	ld	hl,(_gp_tmap)
	ld	a,(hl)
	out	(_VDPDataPort),a
	ld	hl, #_gp_tmap+0
	inc	(hl)
	jr	NZ,00101$
	ld	hl, #_gp_tmap+1
	inc	(hl)
	jr	00101$
;./my/pres.h:45: void logo (void) {
;	---------------------------------
; Function logo
; ---------------------------------
_logo::
;./my/pres.h:46: rda = 5; rdy = 3; 
	ld	hl,#_rda + 0
	ld	(hl), #0x05
	ld	hl,#_rdy + 0
	ld	(hl), #0x03
;./my/pres.h:47: gp_tmap = game_puri ? title_cutout_puri : title_cutout_paco;
	ld	a,(#_game_puri + 0)
	or	a, a
	jr	Z,00103$
	ld	hl,#_title_cutout_puri+0
	jr	00104$
00103$:
	ld	hl,#_title_cutout_paco+0
00104$:
	ld	(_gp_tmap),hl
;./my/pres.h:48: snip ();
	jp  _snip
;./my/pres.h:51: void title (void) {	
;	---------------------------------
; Function title
; ---------------------------------
_title::
;./my/pres.h:52: gp_gen = title_rle; unrle ();
	ld	hl,#_title_rle+0
	ld	(_gp_gen),hl
	call	_unrle
;./my/pres.h:54: logo ();
	call	_logo
;./my/pres.h:56: _x = 5; _y = 23; pr_str ("@ 2018 THE MOJON TWINS");
	ld	hl,#__x + 0
	ld	(hl), #0x05
	ld	hl,#__y + 0
	ld	(hl), #0x17
	ld	hl,#___str_0
	push	hl
	call	_pr_str
	pop	af
;./my/pres.h:58: for (gpit = 0; gpit < 3; gpit ++) 
	ld	hl,#_gpit + 0
	ld	(hl), #0x00
	ld	de,#_level_done+0
00127$:
;./my/pres.h:59: if (level_done [gpit]) HW_setTileatXY (21, (gpit << 1) + 15, 10);
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(hl)
	or	a, a
	jr	Z,00128$
	ld	a,(#_gpit + 0)
	add	a, a
	add	a, #0x0F
	ld	b,a
	push	de
	ld	a,#0x0A
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a,#0x15
	push	af
	inc	sp
	call	_SG_setTileatXY
	pop	af
	inc	sp
	pop	de
00128$:
;./my/pres.h:58: for (gpit = 0; gpit < 3; gpit ++) 
	ld	hl, #_gpit+0
	inc	(hl)
	ld	a,(#_gpit + 0)
	sub	a, #0x03
	jr	C,00127$
;./my/pres.h:61: bat_in ();
	call	_bat_in
;./my/pres.h:63: PSGPlay (MUSIC_TITLE);
	ld	hl,#_m_n_title_psg
	push	hl
	call	_PSGPlay
	pop	af
;./my/pres.h:64: while (1) {
00120$:
;./my/pres.h:65: update_cycle ();
	call	_update_cycle
;./my/pres.h:66: HW_addMetaSprite1x1 (80, 116 + (level << 4), spr_player [game_puri]);
	ld	iy,#_game_puri
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ld	de,#_spr_player
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(#_level + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	add	a, #0x74
	push	de
	ld	d,a
	ld	e,#0x50
	push	de
	call	_SG_addMetaSprite1x1
	pop	af
	pop	af
;./my/pres.h:67: pad_read ();
	call	_pad_read
;./my/pres.h:68: rda = level;
	ld	a,(#_level + 0)
	ld	(#_rda + 0),a
;./my/pres.h:69: if (pad_this_frame & PAD_DOWN) {
	ld	hl,#_pad_this_frame+0
	bit	1, (hl)
	jr	Z,00107$
;./my/pres.h:70: ++ level; if (level == 3) level = 0;
	ld	hl, #_level+0
	inc	(hl)
	ld	a,(#_level + 0)
	sub	a, #0x03
	jr	NZ,00107$
	ld	hl,#_level + 0
	ld	(hl), #0x00
00107$:
;./my/pres.h:72: if (pad_this_frame & PAD_UP) {
	ld	hl,#_pad_this_frame+0
	bit	0, (hl)
	jr	Z,00112$
;./my/pres.h:73: if (level) -- level; else level = 2;
	ld	a,(#_level + 0)
	or	a, a
	jr	Z,00109$
	ld	hl, #_level+0
	dec	(hl)
	jr	00112$
00109$:
	ld	hl,#_level + 0
	ld	(hl), #0x02
00112$:
;./my/pres.h:75: if (pad_this_frame & (PAD_LEFT|PAD_RIGHT)) {
	ld	a,(#_pad_this_frame + 0)
	and	a, #0x0C
	jr	Z,00114$
;./my/pres.h:76: game_puri = CELL_PURI - game_puri;
	ld	hl,#_game_puri
	ld	a,#0x0A
	sub	a, (hl)
	ld	(hl),a
;./my/pres.h:77: logo ();
	call	_logo
00114$:
;./my/pres.h:79: if (level != rda) PSGSFXPlay (SFX_USE, 1);
	ld	a,(#_level + 0)
	ld	iy,#_rda
	sub	a, 0 (iy)
	jr	Z,00116$
	ld	de,#_s_03_use2_psg
	ld	a,#0x01
	push	af
	inc	sp
	push	de
	call	_PSGSFXPlay
	pop	af
	inc	sp
00116$:
;./my/pres.h:80: if (pad_this_frame & PAD_1) break;
	ld	hl,#_pad_this_frame+0
	bit	4, (hl)
	jp	Z,00120$
;./my/pres.h:83: if (pad0 & PAD_2) { level = 3; plife = 20; }
	ld	hl,#_pad0+0
	bit	5, (hl)
	jr	Z,00123$
	ld	hl,#_level + 0
	ld	(hl), #0x03
	ld	hl,#_plife + 0
	ld	(hl), #0x14
00123$:
;./my/pres.h:85: PSGSFXPlay (SFX_START, 1); delay (20);
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
;./my/pres.h:87: bat_out ();
	call	_bat_out
;./my/pres.h:90: if (game_puri) {
	ld	a,(#_game_puri + 0)
	or	a, a
	jr	Z,00125$
;./my/pres.h:91: __player_vy_falling_max = 48;
	ld	hl,#___player_vy_falling_max + 0
	ld	(hl), #0x30
;./my/pres.h:92: __player_g              = 4;
	ld	hl,#___player_g + 0
	ld	(hl), #0x04
;./my/pres.h:93: __player_ay_jetpac      = 16;
	ld	hl,#___player_ay_jetpac + 0
	ld	(hl), #0x10
;./my/pres.h:94: __player_vy_jetpac_max  = 72;
	ld	hl,#___player_vy_jetpac_max + 0
	ld	(hl), #0x48
;./my/pres.h:95: __player_vx_max         = 128;
	ld	hl,#___player_vx_max + 0
	ld	(hl), #0x80
;./my/pres.h:96: __player_ax             = 8;
	ld	hl,#___player_ax + 0
	ld	(hl), #0x08
;./my/pres.h:97: __player_rx             = 12;
	ld	hl,#___player_rx + 0
	ld	(hl), #0x0C
	ret
00125$:
;./my/pres.h:99: __player_vy_falling_max = 64;
	ld	hl,#___player_vy_falling_max + 0
	ld	(hl), #0x40
;./my/pres.h:100: __player_g              = 4;
	ld	hl,#___player_g + 0
	ld	(hl), #0x04
;./my/pres.h:101: __player_ay_jetpac      = 12;
	ld	hl,#___player_ay_jetpac + 0
	ld	(hl), #0x0C
;./my/pres.h:102: __player_vy_jetpac_max  = 64;
	ld	hl,#___player_vy_jetpac_max + 0
	ld	(hl), #0x40
;./my/pres.h:103: __player_vx_max         = 112;
	ld	hl,#___player_vx_max + 0
	ld	(hl), #0x70
;./my/pres.h:104: __player_ax             = 16;
	ld	hl,#___player_ax + 0
	ld	(hl), #0x10
;./my/pres.h:105: __player_rx             = 16;
	ld	hl,#___player_rx + 0
	ld	(hl), #0x10
	ret
___str_0:
	.ascii "@ 2018 THE MOJON TWINS"
	.db 0x00
;./my/pres.h:109: void scr_game_over (void) {
;	---------------------------------
; Function scr_game_over
; ---------------------------------
_scr_game_over::
;./my/pres.h:110: gp_gen = cuts_rle; unrle ();
	ld	hl,#_cuts_rle+0
	ld	(_gp_gen),hl
	call	_unrle
;./my/pres.h:111: _x = 10; _y = 8; pr_str ("GAME OVER!");
	ld	hl,#__x + 0
	ld	(hl), #0x0A
	ld	hl,#__y + 0
	ld	(hl), #0x08
	ld	hl,#___str_1
	push	hl
	call	_pr_str
	pop	af
;./my/pres.h:112: _x =  4; _y = 10; pr_str ("NICE TRY, BUT NO BANANA!");
	ld	hl,#__x + 0
	ld	(hl), #0x04
	ld	hl,#__y + 0
	ld	(hl), #0x0A
	ld	hl,#___str_2
	push	hl
	call	_pr_str
	pop	af
;./my/pres.h:113: _x =  5; _y = 12; pr_str ("DO IT BETTER NEXT TIME");
	ld	hl,#__x + 0
	ld	(hl), #0x05
	ld	hl,#__y + 0
	ld	(hl), #0x0C
	ld	hl,#___str_3
	push	hl
	call	_pr_str
	pop	af
;./my/pres.h:114: _x =  9; _y = 14; pr_str ("MISSION FAILED");
	ld	hl,#__x + 0
	ld	(hl), #0x09
	ld	hl,#__y + 0
	ld	(hl), #0x0E
	ld	hl,#___str_4
	push	hl
	call	_pr_str
	pop	af
	ret
___str_1:
	.ascii "GAME OVER!"
	.db 0x00
___str_2:
	.ascii "NICE TRY, BUT NO BANANA!"
	.db 0x00
___str_3:
	.ascii "DO IT BETTER NEXT TIME"
	.db 0x00
___str_4:
	.ascii "MISSION FAILED"
	.db 0x00
;./my/pres.h:117: void scr_sclear (void) {
;	---------------------------------
; Function scr_sclear
; ---------------------------------
_scr_sclear::
;./my/pres.h:118: gp_gen = cuts_rle; unrle ();
	ld	hl,#_cuts_rle+0
	ld	(_gp_gen),hl
	call	_unrle
;./my/pres.h:119: _x = 9; _y = 8; pr_str ("CONGRATULATIONS!");
	ld	hl,#__x + 0
	ld	(hl), #0x09
	ld	hl,#__y + 0
	ld	(hl), #0x08
	ld	hl,#___str_5
	push	hl
	call	_pr_str
	pop	af
;./my/pres.h:120: _x = 3; _y = 10; pr_str ("ALL CRISTALS ARE RECOVERED");
	ld	hl,#__x + 0
	ld	(hl), #0x03
	ld	hl,#__y + 0
	ld	(hl), #0x0A
	ld	hl,#___str_6
	push	hl
	call	_pr_str
	pop	af
;./my/pres.h:121: _x = 2; _y = 12; pr_str ("NOW YOU CAN GET BACK TO YOUR");
	ld	hl,#__x + 0
	ld	(hl), #0x02
	ld	hl,#__y + 0
	ld	(hl), #0x0C
	ld	hl,#___str_7
	push	hl
	call	_pr_str
	pop	af
;./my/pres.h:122: _x = 3; _y = 14; pr_str ("BASE AND HAVE A GOOD REST!");	
	ld	hl,#__x + 0
	ld	(hl), #0x03
	ld	hl,#__y + 0
	ld	(hl), #0x0E
	ld	hl,#___str_8
	push	hl
	call	_pr_str
	pop	af
	ret
___str_5:
	.ascii "CONGRATULATIONS!"
	.db 0x00
___str_6:
	.ascii "ALL CRISTALS ARE RECOVERED"
	.db 0x00
___str_7:
	.ascii "NOW YOU CAN GET BACK TO YOUR"
	.db 0x00
___str_8:
	.ascii "BASE AND HAVE A GOOD REST!"
	.db 0x00
;./my/pres.h:125: void game_ending (void) {
;	---------------------------------
; Function game_ending
; ---------------------------------
_game_ending::
;./my/pres.h:126: gp_gen = ending_rle; unrle ();
	ld	hl,#_ending_rle+0
	ld	(_gp_gen),hl
	call	_unrle
;./my/pres.h:127: _x = 2; _y = 13; pr_str ("'WE ARE SET, PACO!'%%'SO IT SEEMS, PURI! LET'S GO%%BACK TO OUR PLANET NOW!'");
	ld	hl,#__x + 0
	ld	(hl), #0x02
	ld	hl,#__y + 0
	ld	(hl), #0x0D
	ld	hl,#___str_9
	push	hl
	call	_pr_str
	pop	af
;./my/pres.h:128: _x = 10; _y = 20; pr_str ("T H E  E N D");
	ld	hl,#__x + 0
	ld	(hl), #0x0A
	ld	hl,#__y + 0
	ld	(hl), #0x14
	ld	hl,#___str_10
	push	hl
	call	_pr_str
	pop	af
;./my/pres.h:129: unpack_bg_patterns (tsE_patterns_c, tsE_colours_c, 64*8, 7);
	ld	de,#_tsE_patterns_c
	ld	a,#0x07
	push	af
	inc	sp
	ld	hl,#0x0200
	push	hl
	ld	hl,#_tsE_colours_c
	push	hl
	push	de
	call	_unpack_bg_patterns
	ld	hl,#7
	add	hl,sp
	ld	sp,hl
;./my/pres.h:130: bat_in ();
	call	_bat_in
;./my/pres.h:131: PSGPlay (MUSIC_ENDING);
	ld	hl,#_m_n_ending_psg
	push	hl
	call	_PSGPlay
	pop	af
;./my/pres.h:132: while (1) {
00104$:
;./my/pres.h:133: pad_read ();
	call	_pad_read
;./my/pres.h:134: if (pad_this_frame & (PAD_A|PAD_B|PAD_START)) break;
	ld	a,(#_pad_this_frame + 0)
	and	a, #0x30
	jr	Z,00104$
;./my/pres.h:136: bat_out ();	
	call	_bat_out
;./my/pres.h:137: unpack_bg_patterns (tsALL_patterns_c, tsALL_colours_c, 64*8, 7);
	ld	de,#_tsALL_patterns_c
	ld	a,#0x07
	push	af
	inc	sp
	ld	hl,#0x0200
	push	hl
	ld	hl,#_tsALL_colours_c
	push	hl
	push	de
	call	_unpack_bg_patterns
	ld	hl,#7
	add	hl,sp
	ld	sp,hl
	ret
___str_9:
	.ascii "'WE ARE SET, PACO!'%%'SO IT SEEMS, PURI! LET'S GO%%BACK TO O"
	.ascii "UR PLANET NOW!'"
	.db 0x00
___str_10:
	.ascii "T H E  E N D"
	.db 0x00
;./my/pres.h:140: void credits (void) {
;	---------------------------------
; Function credits
; ---------------------------------
_credits::
;./my/pres.h:141: cls ();
	call	_cls
;./my/pres.h:143: _x = 0; _y = 0; if (ntsc) pr_str ("NTSC"); else pr_str ("PAL");
	ld	hl,#__x + 0
	ld	(hl), #0x00
	ld	hl,#__y + 0
	ld	(hl), #0x00
	ld	a,(#_ntsc + 0)
	or	a, a
	jr	Z,00102$
	ld	hl,#___str_11
	push	hl
	call	_pr_str
	pop	af
	jr	00103$
00102$:
	ld	hl,#___str_12
	push	hl
	call	_pr_str
	pop	af
00103$:
;./my/pres.h:145: rds16 = 0; rdy = 240;
	ld	hl,#0x0000
	ld	(_rds16),hl
	ld	hl,#_rdy + 0
	ld	(hl), #0xF0
;./my/pres.h:146: _x = 0; _y = 18; 
	ld	hl,#__x + 0
	ld	(hl), #0x00
	ld	hl,#__y + 0
	ld	(hl), #0x12
;./my/pres.h:147: pr_str ("       JET PACO & JET PURI%%         ORIGINAL GAME:%     @ 2013 THE MOJON TWINS%       REPROGRAMMED GAME:%     @ 2018 THE MOJON TWINS");
	ld	hl,#___str_13+0
	push	hl
	call	_pr_str
;./my/pres.h:149: HW_displayOn ();
	ld	hl, #0x0140
	ex	(sp),hl
	call	_SG_VDPturnOnFeature
	pop	af
;./my/pres.h:151: while (!(HW_getKeysStatus () & PAD_START) && rds16 < 300) {
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
;./my/pres.h:154: update_cycle ();
	call	_update_cycle
;./my/pres.h:155: rds16 ++;
	ld	hl, #_rds16+0
	inc	(hl)
	jr	NZ,00105$
	ld	hl, #_rds16+1
	inc	(hl)
	jr	00105$
00107$:
;./my/pres.h:158: HW_displayOff ();
	ld	hl,#0x0140
	push	hl
	call	_SG_VDPturnOffFeature
	pop	af
	ret
___str_11:
	.ascii "NTSC"
	.db 0x00
___str_12:
	.ascii "PAL"
	.db 0x00
___str_13:
	.ascii "       JET PACO & JET PURI%%         ORIGINAL GAME:%     @ 2"
	.ascii "013 THE MOJON TWINS%       REPROGRAMMED GAME:%     @ 2018 TH"
	.ascii "E MOJON TWINS"
	.db 0x00
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
	jr	NZ,00106$
	ld	a,(#_pvy + 1)
	bit	7,a
	jr	Z,00106$
	ld	hl,#_c_map_w
	ld	a,(#_n_pant + 0)
	sub	a, (hl)
	jr	C,00106$
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
	ret
00106$:
;./mainloop/flickscreen.h:48: } else if (pry >= 192 && pvy > 0 && n_pant < c_map_size - c_map_w) {
	ld	a,(#_pry + 0)
	sub	a, #0xC0
	ret	C
	xor	a, a
	ld	iy,#_pvy
	cp	a, 0 (iy)
	ld	iy,#_pvy
	sbc	a, 1 (iy)
	jp	PO, 00136$
	xor	a, #0x80
00136$:
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
	jp	PO, 00137$
	xor	a, #0x80
00137$:
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
;./my/player_frame_selector.h:14: if (ppossee || pgotten) {
	ld	a,(#_ppossee + 0)
	or	a, a
	jr	NZ,00112$
	ld	a,(#_pgotten + 0)
	or	a, a
	jp	Z,00113$
00112$:
;./my/player_frame_selector.h:16: if (pvx > PLAYER_VX_MIN || pvx < -PLAYER_VX_MIN) {
	ld	iy,#___player_ax
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	ld	d,l
	ld	e,h
	ld	a,d
	ld	iy,#_pvx
	sub	a, 0 (iy)
	ld	a,e
	ld	iy,#_pvx
	sbc	a, 1 (iy)
	jp	PO, 00138$
	xor	a, #0x80
00138$:
	jp	M,00108$
	xor	a, a
	sub	a, d
	ld	d,a
	ld	a, #0x00
	sbc	a, e
	ld	e,a
	ld	a,(#_pvx + 0)
	sub	a, d
	ld	iy,#_pvx
	ld	a,1 (iy)
	sbc	a, e
	jp	PO, 00139$
	xor	a, #0x80
00139$:
	jp	P,00109$
00108$:
;./my/player_frame_selector.h:18: if ((prx >> 3) != ol_prx) { 
	ld	hl,#_prx + 0
	ld	d, (hl)
	srl	d
	srl	d
	srl	d
;./my/player_frame_selector.h:17: if (game_puri) {
	ld	a,(#_game_puri + 0)
	or	a, a
	jr	Z,00106$
;./my/player_frame_selector.h:18: if ((prx >> 3) != ol_prx) { 
	ld	a,(#_ol_prx + 0)
	sub	a, d
	jr	Z,00104$
;./my/player_frame_selector.h:19: pfr ++; if (pfr == 3) pfr = 0;
	ld	hl, #_pfr+0
	inc	(hl)
	ld	a,(#_pfr + 0)
	sub	a, #0x03
	jr	NZ,00102$
	ld	hl,#_pfr + 0
	ld	(hl), #0x00
00102$:
;./my/player_frame_selector.h:20: ol_prx = prx >> 3;
	ld	hl,#_ol_prx + 0
	ld	(hl), d
00104$:
;./my/player_frame_selector.h:23: psprid = pfr;
	ld	a,(#_pfr + 0)
	ld	(#_psprid + 0),a
	jr	00114$
00106$:
;./my/player_frame_selector.h:25: psprid = CELL_WALK_CYCLE + ((prx >> 3) & 3);
	ld	a,d
	and	a, #0x03
	ld	(#_psprid + 0),a
	jr	00114$
00109$:
;./my/player_frame_selector.h:27: } else { psprid = CELL_IDLE; pfr = 0; }
	ld	hl,#_psprid + 0
	ld	(hl), #0x01
	ld	hl,#_pfr + 0
	ld	(hl), #0x00
	jr	00114$
00113$:
;./my/player_frame_selector.h:28: } else psprid = CELL_AIRBORNE;
	ld	hl,#_psprid + 0
	ld	(hl), #0x04
00114$:
;./my/player_frame_selector.h:30: psprid += pfacing + game_puri;
	ld	hl,#_game_puri
	ld	a,(#_pfacing + 0)
	add	a, (hl)
	ld	d,a
	ld	hl,#_psprid
	ld	a,(hl)
	add	a, d
	ld	(hl),a
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
	ex	de,hl
	ld	hl,#_l_ts_tmaps
	add	hl,de
	ld	a,(hl)
	ld	iy,#_c_ts_tmaps
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_c_ts_tmaps + 1),a
;./mainloop/asset_setup.h:10: c_behs = 		l_behs [level];
	ld	hl,#_l_behs
	add	hl,de
	ld	a,(hl)
	ld	iy,#_c_behs
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_c_behs + 1),a
;./mainloop/asset_setup.h:11: spr_enems = 	l_spr_enems [level];
	ld	hl,#_l_spr_enems
	add	hl,de
	ld	a,(hl)
	ld	iy,#_spr_enems
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_spr_enems + 1),a
;./mainloop/asset_setup.h:13: c_map = 		l_map [level];
	ld	hl,#_l_map
	add	hl,de
	ld	a,(hl)
	ld	iy,#_c_map
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	iy,#_c_map
	ld	1 (iy),a
;./mainloop/asset_setup.h:20: c_decos = 	l_decos [level];
	ld	a,(#_level + 0)
	add	a, #<(_l_decos)
	ld	c,a
	ld	a,#0x00
	adc	a, #>(_l_decos)
	ld	b,a
	ld	a,(bc)
	ld	(#_c_decos + 0),a
;./mainloop/asset_setup.h:28: c_enems = 		l_enems [level];
	ld	hl,#_l_enems
	add	hl,de
	ld	a,(hl)
	ld	iy,#_c_enems
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_c_enems + 1),a
;./mainloop/asset_setup.h:29: c_hotspots = 	l_hotspots [level];	
	ld	hl,#_l_hotspots
	add	hl,de
	ld	a,(hl)
	ld	iy,#_c_hotspots
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_c_hotspots + 1),a
;./mainloop/asset_setup.h:31: c_max_enems = 	l_player_max_enems [level];
	ld	de,#_l_player_max_enems+0
	ld	hl,(_level)
	ld	h,#0x00
	add	hl,de
	ld	a,(hl)
	ld	(#_c_max_enems + 0),a
;./mainloop/asset_setup.h:33: c_map_w = 		l_map_w [level];
	ld	de,#_l_map_w+0
	ld	hl,(_level)
	ld	h,#0x00
	add	hl,de
	ld	a,(hl)
	ld	(#_c_map_w + 0),a
;./mainloop/asset_setup.h:34: c_map_h = 		l_map_h [level];
	ld	de,#_l_map_h+0
	ld	hl,(_level)
	ld	h,#0x00
	add	hl,de
	ld	a,(hl)
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
;./mainloop.h:20: cls ();
	call	_cls
;./mainloop.h:22: draw_game_frame ();
	call	_draw_game_frame
;./mainloop.h:25: hotspots_load ();
	call	_hotspots_load
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
;./mainloop.h:40: enems_persistent_load ();
	call	_enems_persistent_load
;./mainloop.h:48: pobjs = 0;
	ld	hl,#_pobjs + 0
	ld	(hl), #0x00
;./mainloop.h:74: propellers_on = 1;
	ld	hl,#_propellers_on + 0
	ld	(hl), #0x01
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
	ret
;./mainloop.h:137: void prepare_scr (void) {
;	---------------------------------
; Function prepare_scr
; ---------------------------------
_prepare_scr::
;./mainloop.h:138: if (!ft) {
	ld	a,(#_ft + 0)
	or	a, a
	jr	NZ,00102$
;./mainloop.h:139: HW_displayOff ();
	ld	hl,#0x0140
	push	hl
	call	_SG_VDPturnOffFeature
	pop	af
00102$:
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
;./mainloop.h:167: prp_idx = 0;
	ld	hl,#_prp_idx + 0
	ld	(hl), #0x00
;./mainloop.h:172: enems_persistent_update ();
	call	_enems_persistent_update
;./mainloop.h:175: enems_load ();
	call	_enems_load
;./mainloop.h:176: hotspots_create ();	
	call	_hotspots_create
;./mainloop.h:193: chac_chacs_queue_write = chac_chacs_queue_read = 0;
	ld	hl,#_chac_chacs_queue_read + 0
	ld	(hl), #0x00
	ld	hl,#_chac_chacs_queue_write + 0
	ld	(hl), #0x00
;./mainloop.h:194: max_chac_chacs = 0;
	ld	hl,#_max_chac_chacs + 0
	ld	(hl), #0x00
;./mainloop.h:214: draw_scr ();
	call	_draw_scr
;./mainloop.h:253: HW_initSprites ();
	call	_SG_initSprites
;./mainloop.h:270: gpit = 3; while (gpit --) en_spr_id [gpit] = en_s [gpit];
	ld	hl,#_gpit + 0
	ld	(hl), #0x03
00103$:
	ld	hl,#_gpit + 0
	ld	e, (hl)
	ld	hl, #_gpit+0
	dec	(hl)
	ld	a,e
	or	a, a
	jr	Z,00105$
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
	jr	00103$
00105$:
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
	jr	Z,00107$
	call	_hotspots_paint
00107$:
;./mainloop.h:297: hud_update ();
	call	_hud_update
;./mainloop.h:298: HW_copySpritestoSAT ();
	call	_SG_copySpritestoSAT
;./mainloop.h:299: update_list [update_index] = 0xff;
	ld	a,(#_update_index + 0)
	add	a, #<(_update_list)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_update_list)
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
00149$:
;./mainloop.h:341: hud_update ();
	call	_hud_update
;./mainloop.h:345: if (pkill) player_kill ();
	ld	a,(#_pkill + 0)
	or	a, a
	jr	Z,00102$
	call	_player_kill
00102$:
;./mainloop.h:346: if (game_over || level_reset) break;			
	ld	a,(#_game_over + 0)
	or	a, a
	jp	NZ,00150$
	ld	a,(#_level_reset + 0)
	or	a, a
	jp	NZ,00150$
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
	jr	Z,00109$
;./mainloop.h:363: prepare_scr ();
	call	_prepare_scr
;./mainloop.h:364: on_pant = n_pant;
	ld	a,(#_n_pant + 0)
	ld	(#_on_pant + 0),a
00109$:
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
	jr	NZ,00111$
	ld	hl,#_ntsc_frame + 0
	ld	(hl), #0x00
00111$:
;./mainloop.h:399: if (paused == 0 && (ntsc == 0 || ntsc_frame)) {
	ld	a,(#_paused + 0)
	or	a, a
	jp	NZ,00141$
	ld	a,(#_ntsc + 0)
	or	a, a
	jr	Z,00140$
	ld	a,(#_ntsc_frame + 0)
	or	a, a
	jp	Z,00141$
00140$:
;./mainloop.h:400: HW_initSprites ();
	call	_SG_initSprites
;./mainloop.h:403: if (ticker) -- ticker; else ticker = 50;
	ld	a,(#_ticker + 0)
	or	a, a
	jr	Z,00113$
	ld	hl, #_ticker+0
	dec	(hl)
	jr	00114$
00113$:
	ld	hl,#_ticker + 0
	ld	(hl), #0x32
00114$:
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
	jp	Z,00127$
;./mainloop/hotspots.h:7: if (collide_in (prx + 4, pry + 8, hrx, hry)) {
	ld	a,(#_pry + 0)
	add	a, #0x08
	ld	d,a
	ld	hl,#_prx + 0
	ld	b, (hl)
	inc	b
	inc	b
	inc	b
	inc	b
	ld	a,(_hry)
	push	af
	inc	sp
	ld	a,(_hrx)
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	inc	sp
	call	_collide_in
	pop	af
	pop	af
	ld	a,l
	or	a, a
	jp	Z,00127$
;./mainloop/hotspots.h:128: gp_gen = 0; rdm = 1;
	ld	hl,#0x0000
	ld	(_gp_gen),hl
	ld	hl,#_rdm + 0
	ld	(hl), #0x01
;./mainloop/hotspots.h:129: switch (hrt) {
	ld	a,(#_hrt + 0)
	dec	a
	jr	Z,00115$
	ld	a,(#_hrt + 0)
	cp	a,#0x03
	jr	Z,00116$
	sub	a, #0x04
	jr	Z,00117$
	jr	00121$
;./mainloop/hotspots.h:131: case HOTSPOT_TYPE_OBJECT:
00115$:
;./mainloop/hotspots.h:145: ++ pobjs;
	ld	hl, #_pobjs+0
	inc	(hl)
;./mainloop/hotspots.h:146: gp_gen = SFX_OBJECT;
	ld	hl,#_gp_gen + 0
	ld	(hl), #<(_s_02_object2_psg)
	ld	hl,#_gp_gen + 1
	ld	(hl), #>(_s_02_object2_psg)
;./mainloop/hotspots.h:148: break;
	jr	00121$
;./mainloop/hotspots.h:156: case HOTSPOT_TYPE_REFILL:
00116$:
;./mainloop/hotspots.h:157: plife += PLAYER_REFILL;
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
;./mainloop/hotspots.h:163: break;
	jr	00121$
;./mainloop/hotspots.h:165: case HOTSPOT_TYPE_AMMO:
00117$:
;./mainloop/hotspots.h:166: gp_gen = SFX_OBJECT;
	ld	hl,#_gp_gen + 0
	ld	(hl), #<(_s_02_object2_psg)
	ld	hl,#_gp_gen + 1
	ld	(hl), #>(_s_02_object2_psg)
;./mainloop/hotspots.h:167: if (MAX_AMMO - pammo > AMMO_REFILL)
	ld	iy,#_pammo
	ld	h,0 (iy)
	ld	l,#0x00
	ld	a,#0x63
	sub	a, h
	ld	h,a
	ld	a,#0x00
	sbc	a, l
	ld	l,a
	ld	a,#0x32
	cp	a, h
	ld	a,#0x00
	sbc	a, l
	jp	PO, 00256$
	xor	a, #0x80
00256$:
	jp	P,00119$
;./mainloop/hotspots.h:168: pammo += AMMO_REFILL;
	ld	hl,#_pammo
	ld	a,(hl)
	add	a, #0x32
	ld	(hl),a
	jr	00121$
00119$:
;./mainloop/hotspots.h:170: pammo = MAX_AMMO;
	ld	hl,#_pammo + 0
	ld	(hl), #0x63
;./mainloop/hotspots.h:192: }
00121$:
;./mainloop/hotspots.h:193: if (gp_gen) {
	ld	a,(#_gp_gen + 1)
	ld	hl,#_gp_gen + 0
	or	a,(hl)
	jr	Z,00127$
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
	ld	iy,#_hrt
	ld	0 (iy),#0x00
;./mainloop/hotspots.h:196: hact [n_pant] = 0;
	ld	a,(#_n_pant + 0)
	add	a, #<(_hact)
	ld	e,a
	ld	a,#0x00
	adc	a, #>(_hact)
	ld	d,a
	xor	a, a
	ld	(de),a
00127$:
;./mainloop.h:425: if (!warp_to_level) {
	ld	a,(#_warp_to_level + 0)
	or	a, a
	jr	NZ,00129$
;./mainloop.h:426: player_move ();
	call	_player_move
;./mainloop.h:427: player_frame_selector ();
	call	_player_frame_selector
00129$:
;./mainloop/win_level_condition.h:14: pobjs == PLAYER_MAX_OBJECTS
	ld	iy,#_l_player_max_objects
	ld	de,(_level)
	ld	d,#0x00
	add	iy, de
	ld	d, 0 (iy)
	ld	a,(#_pobjs + 0)
	sub	a, d
	jr	NZ,00131$
;./mainloop/win_level_condition.h:23: PSGStop ();
	call	_PSGStop
;./mainloop/win_level_condition.h:24: delay (50);
	ld	a,#0x32
	push	af
	inc	sp
	call	_delay
	inc	sp
;./mainloop/win_level_condition.h:25: break;
	jr	00150$
00131$:
;./mainloop.h:447: if (propellers_on) propellers_do ();
	ld	a,(#_propellers_on + 0)
	or	a, a
	jr	Z,00133$
	call	_propellers_do
00133$:
;./mainloop.h:464: cur_stp = HW_getStp (); 
	call	_SG_getStp
	ld	(_cur_stp),hl
;./mainloop.h:465: if (!warp_to_level)	player_render ();
	ld	a,(#_warp_to_level + 0)
	or	a, a
	jr	NZ,00135$
	call	_player_render
00135$:
;./mainloop.h:469: enems_move ();
	call	_enems_move
;./mainloop.h:473: if (warp_to_level) {
	ld	a,(#_warp_to_level + 0)
	or	a, a
	jr	Z,00137$
;./mainloop.h:474: update_cycle (); PSGStop (); break;
	call	_update_cycle
	call	_PSGStop
	jr	00150$
00137$:
;./mainloop.h:485: if (hrt) hotspots_paint ();
	ld	a,(#_hrt + 0)
	or	a, a
	jr	Z,00139$
	call	_hotspots_paint
00139$:
;./mainloop.h:514: chac_chacs_do ();
	call	_chac_chacs_do
00141$:
;./mainloop/cheat.h:5: if ((pad0 & (PAD_B|PAD_SELECT|PAD_UP)) == (PAD_B|PAD_SELECT|PAD_UP)) break;
	ld	a,(#_pad0 + 0)
	and	a, #0x31
	sub	a, #0x31
	jr	Z,00150$
	call	_SG_queryPauseRequested
	bit	0,l
	jp	Z,00149$
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
	jp	00149$
00150$:
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
;./game.c:143: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;./game.c:144: HW_displayOff ();
	ld	hl,#0x0140
	push	hl
	call	_SG_VDPturnOffFeature
;./game.c:145: HW_setSpriteMode (SG_SPRITEMODE_LARGE);
	ld	h,#0x01
	ex	(sp),hl
	inc	sp
	call	_SG_setSpriteMode
	inc	sp
;./game.c:146: HW_setUpdateList (update_list);
	ld	hl,#_update_list
	push	hl
	call	_SG_setUpdateList
	pop	af
;./game.c:147: first_game = 1;
	ld	hl,#_first_game + 0
	ld	(hl), #0x01
;./game.c:152: ntsc = 1;
	ld	hl,#_ntsc + 0
	ld	(hl), #0x01
;./game.c:156: unpack_bg_patterns (tsFONT_patterns_c, tsFONT_colours_c, 0, 7);
	ld	de,#_tsFONT_patterns_c
	ld	a,#0x07
	push	af
	inc	sp
	ld	hl,#0x0000
	push	hl
	ld	hl,#_tsFONT_colours_c
	push	hl
	push	de
	call	_unpack_bg_patterns
	ld	hl,#7
	add	hl,sp
	ld	sp,hl
;./game.c:158: credits ();
	call	_credits
;./game.c:161: unpack_bg_patterns (tsALL_patterns_c, tsALL_colours_c, 64*8, 7);
	ld	de,#_tsALL_patterns_c
	ld	a,#0x07
	push	af
	inc	sp
	ld	hl,#0x0200
	push	hl
	ld	hl,#_tsALL_colours_c
	push	hl
	push	de
	call	_unpack_bg_patterns
	ld	hl,#7
	add	hl,sp
	ld	sp,hl
;./game.c:162: aPLib_depack_VRAM (SGT_BASE, ssALL_patterns_c);
	ld	hl,#_ssALL_patterns_c
	push	hl
	ld	hl,#0x3800
	push	hl
	call	_aPLib_depack_VRAM
	pop	af
	pop	af
;./game.c:164: game_puri = 0;
	ld	hl,#_game_puri + 0
	ld	(hl), #0x00
;./game.c:165: while (1) {	
00112$:
;./game.c:166: plife = PLAYER_LIFE;
	ld	hl,#_plife + 0
	ld	(hl), #0x0A
;./game.c:167: title ();
	call	_title
;./game.c:172: game_init (); 
	call	_game_init
;./game.c:173: game_loop ();
	call	_game_loop
;./game.c:175: if (game_over) {
	ld	a,(#_game_over + 0)
	or	a, a
	jr	Z,00106$
;./game.c:176: pres (scr_game_over, MUSIC_GOVER);
	ld	hl,#_m_n_gover_psg
	push	hl
	ld	hl,#_scr_game_over
	push	hl
	call	_pres
	pop	af
	pop	af
;./game.c:177: break;
	jr	00110$
00106$:
;./game.c:179: pres (scr_sclear, MUSIC_SCLEAR);
	ld	hl,#_m_n_sclear_psg
	push	hl
	ld	hl,#_scr_sclear
	push	hl
	call	_pres
	pop	af
	pop	af
;./game.c:180: level_done [level] = 1;
	ld	de,#_level_done+0
	ld	hl,(_level)
	ld	h,#0x00
	add	hl,de
	ld	(hl),#0x01
;./game.c:181: if (level_done [0] && level_done [1] && level_done [2])
	ld	a,(de)
	or	a, a
	jr	Z,00110$
	ld	a, (#_level_done + 1)
	or	a, a
	jr	Z,00110$
	ld	a, (#_level_done + 2)
	or	a, a
	jr	Z,00110$
;./game.c:182: game_ending ();
	call	_game_ending
;./game.c:183: break;
00110$:
;./game.c:187: first_game = 0;
	ld	hl,#_first_game + 0
	ld	(hl), #0x00
	jr	00112$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
