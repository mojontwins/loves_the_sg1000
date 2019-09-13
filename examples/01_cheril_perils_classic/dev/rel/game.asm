;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW32)
; This file was generated Wed Sep 11 15:06:36 2019
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
	.globl _scr_sclear
	.globl _scr_level
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
	.globl _enems_persistent_update
	.globl _enems_persistent_load
	.globl _player_move
	.globl _player_kill
	.globl _player_to_pixels
	.globl _player_render
	.globl _player_init
	.globl _chac_chacs_do
	.globl _hotspots_create
	.globl _hotspots_paint
	.globl _hotspots_load
	.globl _update_cycle
	.globl _jump_start
	.globl _pad_read
	.globl _collide_in
	.globl _pr_str
	.globl _draw_scr
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
	.globl _SG_addMetaSprite1x1
	.globl _SG_initSprites
	.globl _SG_setTile
	.globl _SG_waitForVBlank
	.globl _SG_setSpriteMode
	.globl _SG_VDPturnOffFeature
	.globl _SG_VDPturnOnFeature
	.globl _game_mode
	.globl _mode_no_resonators
	.globl _shaker_ct
	.globl _springs_on
	.globl _cfx
	.globl _res_subct
	.globl _res_ct
	.globl _res_on
	.globl _res_disable
	.globl _chac_chacs_queue_write
	.globl _chac_chacs_queue_read
	.globl _chac_chacs_queue
	.globl _chac_chacs_ct
	.globl _chac_chacs_idlewait
	.globl _chac_chacs_state
	.globl _chac_chacs_yx
	.globl _max_chac_chacs
	.globl _ep_dead
	.globl _en_spr_id
	.globl _enf_vy
	.globl _enf_y
	.globl _enf_vx
	.globl _enf_x
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
	.globl _lkact
	.globl _hact
	.globl _pctfr
	.globl _no_ct
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
	.globl _levelnames
	.globl _level3name
	.globl _level2name
	.globl _level1name
	.globl _level0name
	.globl _l_music
	.globl _l_hotspots
	.globl _l_enems
	.globl _l_n_bolts
	.globl _l_locks
	.globl _l_decos
	.globl _l_map
	.globl _l_spr_enems
	.globl _l_spr_patterns
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
	.globl _spr_hs
	.globl _spr_enems2
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
_no_ct::
	.ds 1
_pctfr::
	.ds 1
_hact::
	.ds 24
_lkact::
	.ds 16
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
_enf_x::
	.ds 6
_enf_vx::
	.ds 6
_enf_y::
	.ds 6
_enf_vy::
	.ds 6
_en_spr_id::
	.ds 3
_ep_dead::
	.ds 72
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
_res_disable::
	.ds 1
_res_on::
	.ds 1
_res_ct::
	.ds 1
_res_subct::
	.ds 1
_cfx::
	.ds 1
_springs_on::
	.ds 1
_shaker_ct::
	.ds 1
_mode_no_resonators::
	.ds 1
_game_mode::
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
	sub	a, #0x18
	jr	C,00102$
	ret
_chac_chacs_initial_times:
	.db #0x32	; 50	'2'
	.db #0x64	; 100	'd'
	.db #0x96	; 150
_chac_chacs_times:
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0x32	; 50	'2'
	.db #0x01	; 1
	.db #0x01	; 1
_chac_chacs_t1:
	.db #0x26	; 38
	.db #0x20	; 32
	.db #0x22	; 34
	.db #0x25	; 37
	.db #0x22	; 34
	.db #0x20	; 32
_chac_chacs_t2:
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x24	; 36
	.db #0x26	; 38
	.db #0x26	; 38
_chac_chacs_t3:
	.db #0x26	; 38
	.db #0x21	; 33
	.db #0x23	; 35
	.db #0x25	; 37
	.db #0x23	; 35
	.db #0x21	; 33
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x0A	; 10
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x0A	; 10
_behs1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x0A	; 10
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
_behs2:
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x0A	; 10
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x0A	; 10
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
_behs3:
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0A	; 10
_spr_player:
	.dw _ss_pl_00
	.dw _ss_pl_00
	.dw _ss_pl_01
	.dw _ss_pl_00
	.dw _ss_pl_02
	.dw _ss_pl_03
	.dw #0x0000
	.dw #0x0000
	.dw _ss_pl_04
	.dw _ss_pl_04
	.dw _ss_pl_06
	.dw _ss_pl_04
	.dw _ss_pl_05
	.dw _ss_pl_07
	.dw #0x0000
	.dw #0x0000
_spr_enems0:
	.dw _ss_en_0_00
	.dw _ss_en_0_01
	.dw #0x0000
	.dw #0x0000
	.dw _ss_en_0_02
	.dw _ss_en_0_03
	.dw #0x0000
	.dw #0x0000
	.dw _ss_en_0_04
	.dw _ss_en_0_05
	.dw #0x0000
	.dw #0x0000
	.dw _ss_en_0_06
	.dw _ss_en_0_07
	.dw #0x0000
	.dw #0x0000
	.dw _ss_en_0_08
	.dw _ss_en_0_09
	.dw #0x0000
	.dw #0x0000
	.dw _ss_en_0_0a
	.dw _ss_en_0_0b
	.dw #0x0000
	.dw #0x0000
	.dw _ss_plat_00
	.dw _ss_plat_01
	.dw #0x0000
	.dw #0x0000
	.dw _ss_plat_00
	.dw _ss_plat_01
	.dw #0x0000
	.dw #0x0000
	.dw _ss_fanty_00
	.dw _ss_fanty_01
	.dw #0x0000
	.dw #0x0000
	.dw _ss_fanty_02
	.dw _ss_fanty_03
	.dw #0x0000
	.dw #0x0000
	.dw _ss_it_04
_spr_enems1:
	.dw _ss_en_1_00
	.dw _ss_en_1_01
	.dw #0x0000
	.dw #0x0000
	.dw _ss_en_1_02
	.dw _ss_en_1_03
	.dw #0x0000
	.dw #0x0000
	.dw _ss_en_1_04
	.dw _ss_en_1_05
	.dw #0x0000
	.dw #0x0000
	.dw _ss_en_1_06
	.dw _ss_en_1_07
	.dw #0x0000
	.dw #0x0000
	.dw _ss_en_1_08
	.dw _ss_en_1_09
	.dw #0x0000
	.dw #0x0000
	.dw _ss_en_1_0a
	.dw _ss_en_1_0b
	.dw #0x0000
	.dw #0x0000
	.dw _ss_plat_00
	.dw _ss_plat_01
	.dw #0x0000
	.dw #0x0000
	.dw _ss_plat_00
	.dw _ss_plat_01
	.dw #0x0000
	.dw #0x0000
	.dw _ss_fanty_00
	.dw _ss_fanty_01
	.dw #0x0000
	.dw #0x0000
	.dw _ss_fanty_02
	.dw _ss_fanty_03
	.dw #0x0000
	.dw #0x0000
	.dw _ss_it_04
_spr_enems2:
	.dw _ss_en_2_00
	.dw _ss_en_2_01
	.dw #0x0000
	.dw #0x0000
	.dw _ss_en_2_02
	.dw _ss_en_2_03
	.dw #0x0000
	.dw #0x0000
	.dw _ss_en_2_04
	.dw _ss_en_2_05
	.dw #0x0000
	.dw #0x0000
	.dw _ss_en_2_06
	.dw _ss_en_2_07
	.dw #0x0000
	.dw #0x0000
	.dw _ss_en_2_08
	.dw _ss_en_2_09
	.dw #0x0000
	.dw #0x0000
	.dw _ss_en_2_08
	.dw _ss_en_2_09
	.dw #0x0000
	.dw #0x0000
	.dw _ss_plat_00
	.dw _ss_plat_01
	.dw #0x0000
	.dw #0x0000
	.dw _ss_plat_00
	.dw _ss_plat_01
	.dw #0x0000
	.dw #0x0000
	.dw _ss_fanty_00
	.dw _ss_fanty_01
	.dw #0x0000
	.dw #0x0000
	.dw _ss_fanty_02
	.dw _ss_fanty_03
	.dw #0x0000
	.dw #0x0000
	.dw _ss_it_04
_spr_hs:
	.dw #0x0000
	.dw #0x0000
	.dw _ss_it_01
	.dw _ss_it_00
	.dw _ss_it_02
	.dw _ss_it_03
_l_scr_ini:
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x0C	; 12
_l_ini_x:
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
_l_ini_y:
	.db #0x07	; 7
	.db #0x0A	; 10
	.db #0x03	; 3
	.db #0x05	; 5
_l_map_w:
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x0C	; 12
_l_map_h:
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x02	; 2
_l_player_max_objects:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_l_player_max_enems:
	.db #0x36	; 54	'6'
	.db #0x31	; 49	'1'
	.db #0x2E	; 46
	.db #0x23	; 35
_l_ts_patterns:
	.dw _ts0_patterns_c
	.dw _ts1_patterns_c
	.dw _ts2_patterns_c
	.dw _ts3_patterns_c
_l_ts_colours:
	.dw _ts0_colours_c
	.dw _ts1_colours_c
	.dw _ts2_colours_c
	.dw _ts3_colours_c
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
_l_spr_patterns:
	.dw _ss_en_0_patterns_c
	.dw _ss_en_1_patterns_c
	.dw _ss_en_2_patterns_c
	.dw _ss_en_1_patterns_c
_l_spr_enems:
	.dw _spr_enems0
	.dw _spr_enems1
	.dw _spr_enems2
	.dw _spr_enems1
_l_map:
	.dw _map_0
	.dw _map_1
	.dw _map_2
	.dw _map_3
_l_decos:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
_l_locks:
	.dw _map_0_locks
	.dw _map_1_locks
	.dw _map_2_locks
	.dw _map_3_locks
_l_n_bolts:
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
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
	.dw _m_n_stagea_psg
;./engine/hotspots.h:20: void hotspots_paint (void) {
;	---------------------------------
; Function hotspots_paint
; ---------------------------------
_hotspots_paint::
;./engine/hotspots.h:30: rda = hrt;
	ld	a,(#_hrt + 0)
	ld	(#_rda + 0),a
;./engine/hotspots.h:33: if (hrt == HOTSPOT_TYPE_RESONATOR && res_on) rda = HOTSPOT_TYPE_RESONATOR_ON;
	ld	a,(#_hrt + 0)
	sub	a, #0x04
	jr	NZ,00102$
	ld	a,(#_res_on + 0)
	or	a, a
	jr	Z,00102$
	ld	hl,#_rda + 0
	ld	(hl), #0x05
00102$:
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
;./engine/../my/game_frame.h:8: gp_gen = hud_rle; unrle ();
	ld	hl,#_hud_rle+0
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
	ld	(hl), #0x15
	ld	hl,#__y + 0
	ld	(hl), #0x01
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
;./engine/frame.h:32: if (okeys != pkeys) {
	ld	a,(#_okeys + 0)
	ld	iy,#_pkeys
	sub	a, 0 (iy)
	jr	Z,00104$
;./engine/frame.h:33: okeys = pkeys;
	ld	hl,#_pkeys + 0
	ld	d, (hl)
	ld	hl,#_okeys + 0
	ld	(hl), d
;./engine/frame.h:34: _x = KEYS_X; _y = KEYS_Y; _n = pkeys; p_t ();
	ld	hl,#__x + 0
	ld	(hl), #0x0C
	ld	hl,#__y + 0
	ld	(hl), #0x01
	ld	hl,#__n + 0
	ld	(hl), d
	call	_p_t
00104$:
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
	ld	(hl), #0x04
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
;./my/pres.h:30: void title (void) {
;	---------------------------------
; Function title
; ---------------------------------
_title::
;./my/pres.h:31: unpack_bg_patterns (tstitle_patterns_c, tstitle_colours_c, 64*8, 7);
	ld	de,#_tstitle_patterns_c
	ld	a,#0x07
	push	af
	inc	sp
	ld	hl,#0x0200
	push	hl
	ld	hl,#_tstitle_colours_c
	push	hl
	push	de
	call	_unpack_bg_patterns
	ld	hl,#7
	add	hl,sp
	ld	sp,hl
;./my/pres.h:32: gp_gen = title_rle; unrle ();
	ld	hl,#_title_rle+0
	ld	(_gp_gen),hl
	call	_unrle
;./my/pres.h:34: _x = 7; _y = 12; pr_str ("SELECT AND PUSH 1!");
	ld	hl,#__x + 0
	ld	(hl), #0x07
	ld	hl,#__y + 0
	ld	(hl), #0x0C
	ld	hl,#___str_0
	push	hl
	call	_pr_str
	pop	af
;./my/pres.h:36: _x = 12; _y = 16; pr_str ("RESONATORS");
	ld	hl,#__x + 0
	ld	(hl), #0x0C
	ld	hl,#__y + 0
	ld	(hl), #0x10
	ld	hl,#___str_1
	push	hl
	call	_pr_str
	pop	af
;./my/pres.h:37: _y = 18; pr_str ("EASY MODE");
	ld	hl,#__y + 0
	ld	(hl), #0x12
	ld	hl,#___str_2
	push	hl
	call	_pr_str
	pop	af
;./my/pres.h:39: _x = 5; _y = 23; pr_str ("@ 2018 THE MOJON TWINS");
	ld	hl,#__x + 0
	ld	(hl), #0x05
	ld	hl,#__y + 0
	ld	(hl), #0x17
	ld	hl,#___str_3
	push	hl
	call	_pr_str
	pop	af
;./my/pres.h:41: bat_in ();
	call	_bat_in
;./my/pres.h:43: PSGPlay (MUSIC_TITLE);
	ld	hl,#_m_n_title_psg
	push	hl
	call	_PSGPlay
	pop	af
;./my/pres.h:44: while (1) {
00115$:
;./my/pres.h:45: update_cycle ();
	call	_update_cycle
;./my/pres.h:46: SG_addMetaSprite1x1 (82, 122 + (mode_no_resonators << 4), ss_pl_00);
	ld	hl,#_ss_pl_00
	ld	a,(#_mode_no_resonators + 0)
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
	call	_SG_addMetaSprite1x1
	pop	af
	pop	af
;./my/pres.h:47: pad_read ();
	call	_pad_read
;./my/pres.h:48: rda = mode_no_resonators;
	ld	a,(#_mode_no_resonators + 0)
	ld	(#_rda + 0),a
;./my/pres.h:49: if (pad_this_frame & PAD_DOWN) {
	ld	hl,#_pad_this_frame+0
	bit	1, (hl)
	jr	Z,00104$
;./my/pres.h:50: ++ mode_no_resonators; if (mode_no_resonators == 2) mode_no_resonators = 0;
	ld	hl, #_mode_no_resonators+0
	inc	(hl)
	ld	a,(#_mode_no_resonators + 0)
	sub	a, #0x02
	jr	NZ,00104$
	ld	hl,#_mode_no_resonators + 0
	ld	(hl), #0x00
00104$:
;./my/pres.h:52: if (pad_this_frame & PAD_UP) {
	ld	hl,#_pad_this_frame+0
	bit	0, (hl)
	jr	Z,00109$
;./my/pres.h:53: if (mode_no_resonators) -- mode_no_resonators; else mode_no_resonators = 1;
	ld	a,(#_mode_no_resonators + 0)
	or	a, a
	jr	Z,00106$
	ld	hl, #_mode_no_resonators+0
	dec	(hl)
	jr	00109$
00106$:
	ld	hl,#_mode_no_resonators + 0
	ld	(hl), #0x01
00109$:
;./my/pres.h:55: if (mode_no_resonators != rda) PSGSFXPlay (SFX_USE, 1);
	ld	a,(#_mode_no_resonators + 0)
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
;./my/pres.h:56: if (pad_this_frame & PAD_1) break;
	ld	hl,#_pad_this_frame+0
	bit	4, (hl)
	jr	Z,00115$
;./my/pres.h:59: PSGSFXPlay (SFX_START, 1); delay (20);
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
;./my/pres.h:61: plife = mode_no_resonators ? 5 : 3;
	ld	a,(#_mode_no_resonators + 0)
	or	a, a
	jr	Z,00119$
	ld	a,#0x05
	jr	00120$
00119$:
	ld	a,#0x03
00120$:
	ld	(#_plife + 0),a
;./my/pres.h:63: bat_out ();
	jp  _bat_out
___str_0:
	.ascii "SELECT AND PUSH 1!"
	.db 0x00
___str_1:
	.ascii "RESONATORS"
	.db 0x00
___str_2:
	.ascii "EASY MODE"
	.db 0x00
___str_3:
	.ascii "@ 2018 THE MOJON TWINS"
	.db 0x00
;./my/pres.h:66: void scr_game_over (void) {
;	---------------------------------
; Function scr_game_over
; ---------------------------------
_scr_game_over::
;./my/pres.h:67: _x = 11; _y = 15; pr_str ("GAME OVER!");
	ld	hl,#__x + 0
	ld	(hl), #0x0B
	ld	hl,#__y + 0
	ld	(hl), #0x0F
	ld	hl,#___str_4
	push	hl
	call	_pr_str
	pop	af
	ret
___str_4:
	.ascii "GAME OVER!"
	.db 0x00
;./my/pres.h:70: void scr_the_end (void) {
;	---------------------------------
; Function scr_the_end
; ---------------------------------
_scr_the_end::
;./my/pres.h:71: unpack_bg_patterns (tsending_patterns_c, tsending_colours_c, 64*8, 7);
	ld	de,#_tsending_patterns_c
	ld	a,#0x07
	push	af
	inc	sp
	ld	hl,#0x0200
	push	hl
	ld	hl,#_tsending_colours_c
	push	hl
	push	de
	call	_unpack_bg_patterns
	ld	hl,#7
	add	hl,sp
	ld	sp,hl
;./my/pres.h:72: gp_gen = ending_rle; unrle ();
	ld	hl,#_ending_rle+0
	ld	(_gp_gen),hl
	call	_unrle
;./my/pres.h:73: _x = 4; _y = 13; pr_str ("'CONGRATS, CHERIL'- SAID%%THE MAJOR -'YOU HAVE WON%%LA COPA DEL MEAO!', AND%%THEN CHERIL RETURNED TO%%THE FOREST . . .");
	ld	hl,#__x + 0
	ld	(hl), #0x04
	ld	hl,#__y + 0
	ld	(hl), #0x0D
	ld	hl,#___str_5
	push	hl
	call	_pr_str
	pop	af
	ret
___str_5:
	.ascii "'CONGRATS, CHERIL'- SAID%%THE MAJOR -'YOU HAVE WON%%LA COPA "
	.ascii "DEL MEAO!', AND%%THEN CHERIL RETURNED TO%%THE FOREST . . ."
	.db 0x00
;./my/pres.h:82: void scr_level (void) {
;	---------------------------------
; Function scr_level
; ---------------------------------
_scr_level::
;./my/pres.h:83: _x = 12; _y = 14; pr_str ("LEVEL 0"); SG_setTile (17+level);
	ld	hl,#__x + 0
	ld	(hl), #0x0C
	ld	hl,#__y + 0
	ld	(hl), #0x0E
	ld	hl,#___str_6
	push	hl
	call	_pr_str
	pop	af
	ld	a,(#_level + 0)
	add	a, #0x11
	push	af
	inc	sp
	call	_SG_setTile
	inc	sp
;./my/pres.h:84: _x = 10; _y = 16; pr_str (levelnames [level]);
	ld	hl,#__x + 0
	ld	(hl), #0x0A
	ld	hl,#__y + 0
	ld	(hl), #0x10
	ld	iy,#_level
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ld	de,#_levelnames
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	call	_pr_str
	pop	af
	ret
_level0name:
	.ascii "  THE CITY"
	.db 0x00
_level1name:
	.ascii "THE FACTORY"
	.db 0x00
_level2name:
	.ascii " THE FOREST"
	.db 0x00
_level3name:
	.ascii "  PEPINONI"
	.db 0x00
_levelnames:
	.dw _level0name
	.dw _level1name
	.dw _level2name
	.dw _level3name
___str_6:
	.ascii "LEVEL 0"
	.db 0x00
;./my/pres.h:87: void scr_sclear (void) {
;	---------------------------------
; Function scr_sclear
; ---------------------------------
_scr_sclear::
;./my/pres.h:88: _x = 10; _y = 14; pr_str (levelnames [level]);
	ld	hl,#__x + 0
	ld	(hl), #0x0A
	ld	hl,#__y + 0
	ld	(hl), #0x0E
	ld	iy,#_level
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ld	de,#_levelnames
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	call	_pr_str
	pop	af
;./my/pres.h:89: _x = 10; _y = 16; pr_str ("STAGE CLEAR!");
	ld	hl,#__x + 0
	ld	(hl), #0x0A
	ld	hl,#__y + 0
	ld	(hl), #0x10
	ld	hl,#___str_11
	push	hl
	call	_pr_str
	pop	af
	ret
___str_11:
	.ascii "STAGE CLEAR!"
	.db 0x00
;./my/pres.h:92: void credits (void) {
;	---------------------------------
; Function credits
; ---------------------------------
_credits::
;./my/pres.h:93: cls ();
	call	_cls
;./my/pres.h:95: _x = 0; _y = 0; if (ntsc) pr_str ("NTSC"); else pr_str ("PAL");
	ld	hl,#__x + 0
	ld	(hl), #0x00
	ld	hl,#__y + 0
	ld	(hl), #0x00
	ld	a,(#_ntsc + 0)
	or	a, a
	jr	Z,00102$
	ld	hl,#___str_12
	push	hl
	call	_pr_str
	pop	af
	jr	00103$
00102$:
	ld	hl,#___str_13
	push	hl
	call	_pr_str
	pop	af
00103$:
;./my/pres.h:97: rds16 = 0; rdy = 240;
	ld	hl,#0x0000
	ld	(_rds16),hl
	ld	hl,#_rdy + 0
	ld	(hl), #0xF0
;./my/pres.h:98: _x = 0; _y = 18; 
	ld	hl,#__x + 0
	ld	(hl), #0x00
	ld	hl,#__y + 0
	ld	(hl), #0x12
;./my/pres.h:99: pr_str ("     CHERIL PERILS CLASSIC%%         ORIGINAL GAME:%     @ 2011 THE MOJON TWINS%       REPROGRAMMED GAME:%     @ 2018 THE MOJON TWINS");
	ld	hl,#___str_14+0
	push	hl
	call	_pr_str
;./my/pres.h:101: SG_displayOn ();
	ld	hl, #0x0140
	ex	(sp),hl
	call	_SG_VDPturnOnFeature
	pop	af
;./my/pres.h:103: while (!(SG_getKeysStatus () & PAD_START) && rds16 < 300) {
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
;./my/pres.h:106: update_cycle ();
	call	_update_cycle
;./my/pres.h:107: rds16 ++;
	ld	hl, #_rds16+0
	inc	(hl)
	jr	NZ,00105$
	ld	hl, #_rds16+1
	inc	(hl)
	jr	00105$
00107$:
;./my/pres.h:110: SG_displayOff ();
	ld	hl,#0x0140
	push	hl
	call	_SG_VDPturnOffFeature
	pop	af
	ret
___str_12:
	.ascii "NTSC"
	.db 0x00
___str_13:
	.ascii "PAL"
	.db 0x00
___str_14:
	.ascii "     CHERIL PERILS CLASSIC%%         ORIGINAL GAME:%     @ 2"
	.ascii "011 THE MOJON TWINS%       REPROGRAMMED GAME:%     @ 2018 TH"
	.ascii "E MOJON TWINS"
	.db 0x00
;./mainloop/flickscreen.h:7: void flickscreen_do_horizontal (void) {
;	---------------------------------
; Function flickscreen_do_horizontal
; ---------------------------------
_flickscreen_do_horizontal::
;./mainloop/flickscreen.h:12: (cfx + pvx) < 0
	ld	iy,#_cfx
	ld	c,0 (iy)
	ld	a,(#_cfx + 0)
	rla
	sbc	a, a
	ld	b,a
	ld	a,(#_pvx + 0)
	add	a, c
	ld	d,a
	ld	a,(#_pvx + 1)
	adc	a, b
	ld	e,a
;./mainloop/flickscreen.h:8: if (prx == 4 && 
	ld	a,(#_prx + 0)
	sub	a, #0x04
	jr	NZ,00105$
;./mainloop/flickscreen.h:12: (cfx + pvx) < 0
	bit	7, e
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
	ld	iy,#_prx
	ld	a,0 (iy)
	sub	a, #0xF4
	ret	NZ
;./mainloop/flickscreen.h:21: (cfx + pvx) > 0
	xor	a, a
	cp	a, d
	sbc	a, e
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
	ld	a,#0x60
	ld	iy,#_pvy
	cp	a, 0 (iy)
	ld	a,#0xFF
	ld	iy,#_pvy
	sbc	a, 1 (iy)
	jp	PO, 00142$
	xor	a, #0x80
00142$:
	ret	P
	ld	hl,#0xFF60
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
;./my/player_frame_selector.h:37: if (ppossee || pgotten) {
	ld	a,(#_ppossee + 0)
	or	a, a
	jr	NZ,00105$
	ld	a,(#_pgotten + 0)
	or	a, a
	jr	Z,00106$
00105$:
;./my/player_frame_selector.h:39: if (pvx > PLAYER_VX_MIN || pvx < -PLAYER_VX_MIN) {
	ld	a,#0x18
	ld	iy,#_pvx
	cp	a, 0 (iy)
	ld	a,#0x00
	ld	iy,#_pvx
	sbc	a, 1 (iy)
	jp	PO, 00119$
	xor	a, #0x80
00119$:
	jp	M,00101$
	ld	a,(#_pvx + 0)
	sub	a, #0xE8
	ld	a,(#_pvx + 1)
	rla
	ccf
	rra
	sbc	a, #0x7F
	jr	NC,00102$
00101$:
;./my/player_frame_selector.h:40: psprid = CELL_WALK_CYCLE + ((prx >> 3) & 3);
	ld	a,(#_prx + 0)
	rrca
	rrca
	rrca
	and	a,#0x1F
	and	a, #0x03
	ld	hl,#_psprid
	inc	a
	ld	(hl),a
	jr	00107$
00102$:
;./my/player_frame_selector.h:42: psprid = CELL_IDLE;
	ld	hl,#_psprid + 0
	ld	(hl), #0x00
	jr	00107$
00106$:
;./my/player_frame_selector.h:45: psprid = CELL_AIRBORNE;
	ld	hl,#_psprid + 0
	ld	(hl), #0x04
00107$:
;./my/player_frame_selector.h:55: psprid += pfacing;
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
;./mainloop/asset_setup.h:20: c_decos = 	l_decos [level];
	ld	a,#<(_l_decos)
	ld	hl,#_level
	add	a, (hl)
	ld	e,a
	ld	a,#>(_l_decos)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#_c_decos + 0),a
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
;./my/level_pattern_unpacker.h:3: unpack_bg_patterns (l_ts_patterns [level], l_ts_colours [level], 64*8, 7);
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
	ld	hl,#0x0200
	push	hl
	push	de
	push	bc
	call	_unpack_bg_patterns
	ld	hl,#7
	add	hl,sp
	ld	sp,hl
;./my/level_pattern_unpacker.h:4: aPLib_depack_VRAM (SGT_BASE + 160*8, l_spr_patterns [level]);
	ld	iy,#_level
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ld	de,#_l_spr_patterns
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	ld	hl,#0x3D00
	push	hl
	call	_aPLib_depack_VRAM
	pop	af
	pop	af
;./mainloop.h:20: cls ();
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
;./mainloop.h:40: enems_persistent_load ();
	call	_enems_persistent_load
;./mainloop.h:44: enems_persistent_deaths_load ();
	call	_enems_persistent_deaths_load
;./mainloop.h:56: pkeys = 0;
	ld	hl,#_pkeys + 0
	ld	(hl), #0x00
;./mainloop.h:60: res_on = 0;
	ld	hl,#_res_on + 0
	ld	(hl), #0x00
;./mainloop.h:61: res_disable = 0;
	ld	hl,#_res_disable + 0
	ld	(hl), #0x00
;./mainloop.h:69: no_ct = 0;
	ld	hl,#_no_ct + 0
	ld	(hl), #0x00
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
;./my/extra_inits.h:7: springs_on = (level == 1);
	ld	a,(#_level + 0)
	dec	a
	jr	NZ,00120$
	ld	a,#0x01
	jr	00121$
00120$:
	xor	a,a
00121$:
	ld	(#_springs_on + 0),a
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
;./my/on_entering_screen.h:8: if (mode_no_resonators) {
	ld	a,(#_mode_no_resonators + 0)
	or	a, a
	jr	Z,00106$
;./my/on_entering_screen.h:9: res_disable = 1;
	ld	hl,#_res_disable + 0
	ld	(hl), #0x01
;./my/on_entering_screen.h:10: if (hrt == HOTSPOT_TYPE_RESONATOR) hrt = 0;
	ld	a,(#_hrt + 0)
	sub	a, #0x04
	jr	NZ,00106$
	ld	hl,#_hrt + 0
	ld	(hl), #0x00
00106$:
;./mainloop.h:270: gpit = 3; while (gpit --) en_spr_id [gpit] = en_s [gpit];
	ld	hl,#_gpit + 0
	ld	(hl), #0x03
00107$:
	ld	hl,#_gpit + 0
	ld	e, (hl)
	ld	hl, #_gpit+0
	dec	(hl)
	ld	a,e
	or	a, a
	jr	Z,00109$
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
	jr	00107$
00109$:
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
	jr	Z,00111$
	call	_hotspots_paint
00111$:
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
00169$:
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
	jp	NZ,00170$
	ld	a,(#_level_reset + 0)
	or	a, a
	jp	NZ,00170$
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
	jp	NZ,00161$
	ld	a,(#_ntsc + 0)
	or	a, a
	jr	Z,00160$
	ld	a,(#_ntsc_frame + 0)
	or	a, a
	jp	Z,00161$
00160$:
;./mainloop.h:400: HW_initSprites ();
	call	_SG_initSprites
;./mainloop.h:403: if (ticker) -- ticker; else ticker = 50;
	ld	a,(#_ticker + 0)
	or	a, a
	jr	Z,00113$
	ld	iy,#_ticker
	dec	0 (iy)
	jr	00114$
00113$:
	ld	iy,#_ticker
	ld	0 (iy),#0x32
00114$:
;./mainloop.h:404: half_life ^= 1;
	ld	a,(#_half_life + 0)
	xor	a, #0x01
	ld	iy,#_half_life
	ld	0 (iy),a
;./mainloop.h:405: ++ frame_counter;
	ld	iy,#_frame_counter
	inc	0 (iy)
;./mainloop/hotspots.h:6: if (hrt) {
	ld	a,(#_hrt + 0)
	or	a, a
	jp	Z,00131$
;./mainloop/hotspots.h:7: if (collide_in (prx + 4, pry + 8, hrx, hry)) {
	ld	a,(#_pry + 0)
	add	a, #0x08
	ld	e,a
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
	ld	a,e
	push	af
	inc	sp
	push	de
	inc	sp
	call	_collide_in
	pop	af
	pop	af
	ld	a,l
	or	a, a
	jp	Z,00131$
;./mainloop/hotspots.h:9: if (hrt == HOTSPOT_TYPE_RESONATOR) {
	ld	a,(#_hrt + 0)
	sub	a, #0x04
	jr	NZ,00126$
;./mainloop/hotspots.h:10: if (pvy > 0 && pry < hry) {
	xor	a, a
	ld	iy,#_pvy
	cp	a, 0 (iy)
	ld	iy,#_pvy
	sbc	a, 1 (iy)
	jp	PO, 00315$
	xor	a, #0x80
00315$:
	jp	P,00131$
	ld	hl,#_hry
	ld	a,(#_pry + 0)
	sub	a, (hl)
	jp	NC,00131$
;./mainloop/hotspots.h:11: if (res_on == 0) {
	ld	a,(#_res_on + 0)
	or	a, a
	jp	NZ,00131$
;./mainloop/hotspots.h:12: res_on = 1; res_ct = 9; res_subct = 50;
	ld	hl,#_res_on + 0
	ld	(hl), #0x01
	ld	hl,#_res_ct + 0
	ld	(hl), #0x09
	ld	hl,#_res_subct + 0
	ld	(hl), #0x32
;./mainloop/hotspots.h:13: jump_start ();
	call	_jump_start
;./mainloop/hotspots.h:23: PSGSFXPlay (SFX_BREAKH, 2);
	ld	de,#_s_13_breakh3_psg
	ld	a,#0x02
	push	af
	inc	sp
	push	de
	call	_PSGSFXPlay
	pop	af
	inc	sp
	jp	00131$
00126$:
;./mainloop/hotspots.h:128: gp_gen = 0; rdm = 1;
	ld	hl,#0x0000
	ld	(_gp_gen),hl
	ld	iy,#_rdm
	ld	0 (iy),#0x01
;./mainloop/hotspots.h:129: switch (hrt) {
	ld	a,(#_hrt + 0)
	cp	a,#0x02
	jr	Z,00120$
	sub	a, #0x03
	jr	Z,00121$
	jr	00122$
;./mainloop/hotspots.h:151: case HOTSPOT_TYPE_KEYS:
00120$:
;./mainloop/hotspots.h:152: ++ pkeys;
	ld	iy,#_pkeys
	inc	0 (iy)
;./mainloop/hotspots.h:153: gp_gen = SFX_OBJECT;
	ld	iy,#_gp_gen
	ld	0 (iy),#<(_s_02_object2_psg)
	ld	iy,#_gp_gen
	ld	1 (iy),#>(_s_02_object2_psg)
;./mainloop/hotspots.h:154: break;
	jr	00122$
;./mainloop/hotspots.h:156: case HOTSPOT_TYPE_REFILL:
00121$:
;./mainloop/hotspots.h:157: plife += PLAYER_REFILL;
	ld	iy,#_plife
	inc	0 (iy)
;./mainloop/hotspots.h:161: gp_gen = SFX_USE;
	ld	iy,#_gp_gen
	ld	0 (iy),#<(_s_03_use2_psg)
	ld	iy,#_gp_gen
	ld	1 (iy),#>(_s_03_use2_psg)
;./mainloop/hotspots.h:162: rdm = 2;
	ld	iy,#_rdm
	ld	0 (iy),#0x02
;./mainloop/hotspots.h:192: }
00122$:
;./mainloop/hotspots.h:193: if (gp_gen) {
	ld	a,(#_gp_gen + 1)
	ld	iy,#_gp_gen
	or	a,0 (iy)
	jr	Z,00131$
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
00131$:
;./mainloop.h:425: if (!warp_to_level) {
	ld	a,(#_warp_to_level + 0)
	or	a, a
	jr	NZ,00133$
;./mainloop.h:426: player_move ();
	call	_player_move
;./mainloop.h:427: player_frame_selector ();
	call	_player_frame_selector
00133$:
;./my/extra_checks.h:14: if (c_max_enems == pkilled) {
	ld	a,(#_c_max_enems + 0)
	ld	iy,#_pkilled
	sub	a, 0 (iy)
	jr	NZ,00139$
;./my/extra_checks.h:16: en_cttouched [0] == 0 &&
	ld	a, (#_en_cttouched + 0)
	or	a, a
	jr	NZ,00139$
;./my/extra_checks.h:17: en_cttouched [1] == 0 &&
	ld	a, (#_en_cttouched + 1)
	or	a, a
	jr	NZ,00139$
;./my/extra_checks.h:18: en_cttouched [2] == 0
	ld	a, (#_en_cttouched + 2)
	or	a, a
	jr	NZ,00139$
;./my/extra_checks.h:19: ) win_level = 1;
	ld	hl,#_win_level + 0
	ld	(hl), #0x01
00139$:
;./mainloop/win_level_condition.h:10: win_level
	ld	a,(#_win_level + 0)
	or	a, a
	jr	Z,00141$
;./mainloop/win_level_condition.h:23: PSGStop ();
	call	_PSGStop
;./mainloop/win_level_condition.h:24: delay (50);
	ld	a,#0x32
	push	af
	inc	sp
	call	_delay
	inc	sp
;./mainloop/win_level_condition.h:25: break;
	jp	00170$
00141$:
;./mainloop.h:464: cur_stp = HW_getStp (); 
	call	_SG_getStp
	ld	(_cur_stp),hl
;./mainloop.h:465: if (!warp_to_level)	player_render ();
	ld	a,(#_warp_to_level + 0)
	or	a, a
	jr	NZ,00143$
	call	_player_render
00143$:
;./mainloop.h:469: enems_move ();
	call	_enems_move
;./mainloop.h:473: if (warp_to_level) {
	ld	a,(#_warp_to_level + 0)
	or	a, a
	jr	Z,00145$
;./mainloop.h:474: update_cycle (); PSGStop (); break;
	call	_update_cycle
	call	_PSGStop
	jp	00170$
00145$:
;./mainloop/resonators.h:5: if (res_on) {
	ld	a,(#_res_on + 0)
	or	a, a
	jr	Z,00155$
;./mainloop/resonators.h:7: gp_addr = ((RESONATOR_COUNTER_Y << 5) | RESONATOR_COUNTER_X) + PNTADDRESS;
	ld	hl,#0x183D
	ld	(_gp_addr),hl
;./mainloop/resonators.h:8: _n = 16 + res_ct; 
	ld	hl,#__n
	ld	a,(#_res_ct + 0)
	add	a, #0x10
	ld	(hl),a
;./mainloop/resonators.h:9: ul_putc ();
	call	_ul_putc
;./mainloop/resonators.h:12: if (res_subct) -- res_subct; else {
	ld	a,(#_res_subct + 0)
	or	a, a
	jr	Z,00152$
	ld	iy,#_res_subct
	dec	0 (iy)
	jr	00155$
00152$:
;./mainloop/resonators.h:13: res_subct = 50;
	ld	iy,#_res_subct
	ld	0 (iy),#0x32
;./mainloop/resonators.h:14: if (res_ct) { 
	ld	a,(#_res_ct + 0)
	or	a, a
	jr	Z,00149$
;./mainloop/resonators.h:15: -- res_ct; 
	ld	iy,#_res_ct
	dec	0 (iy)
;./mainloop/resonators.h:16: if (res_ct <= 5) PSGSFXPlay (SFX_COUNT, 1);
	ld	a,#0x05
	ld	iy,#_res_ct
	sub	a, 0 (iy)
	jr	C,00155$
	ld	de,#_s_12_count2_psg
	ld	a,#0x01
	push	af
	inc	sp
	push	de
	call	_PSGSFXPlay
	pop	af
	inc	sp
	jr	00155$
00149$:
;./mainloop/resonators.h:18: res_on = 0;
	ld	hl,#_res_on + 0
	ld	(hl), #0x00
;./mainloop/resonators.h:19: PSGSFXPlay (SFX_SPRING, 1); 
	ld	de,#_s_11_spring2_psg
	ld	a,#0x01
	push	af
	inc	sp
	push	de
	call	_PSGSFXPlay
	pop	af
	inc	sp
00155$:
;./mainloop.h:485: if (hrt) hotspots_paint ();
	ld	a,(#_hrt + 0)
	or	a, a
	jr	Z,00157$
	call	_hotspots_paint
00157$:
;./mainloop/no.h:5: if (no_ct) {
	ld	a,(#_no_ct + 0)
	or	a, a
	jr	Z,00159$
;./mainloop/no.h:6: -- no_ct;
	ld	iy,#_no_ct
	dec	0 (iy)
;./mainloop/no.h:9: NO_METASPRITE
	ld	de,#_ss_it_06
;./mainloop/no.h:8: prx + NO_OFFS_X, pry + NO_OFFS_Y + SPRITE_ADJUST,
	ld	a,(#_pry + 0)
	add	a, #0xE3
	ld	h,a
	push	de
	push	hl
	inc	sp
	ld	a,(_prx)
	push	af
	inc	sp
	call	_SG_addMetaSprite1x1
	pop	af
	pop	af
00159$:
;./mainloop.h:514: chac_chacs_do ();
	call	_chac_chacs_do
00161$:
;./mainloop/cheat.h:5: if ((pad0 & (PAD_B|PAD_SELECT|PAD_UP)) == (PAD_B|PAD_SELECT|PAD_UP)) break;
	ld	a,(#_pad0 + 0)
	and	a, #0x31
	sub	a, #0x31
	jr	Z,00170$
	call	_SG_queryPauseRequested
	bit	0,l
	jp	Z,00169$
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
	jp	00169$
00170$:
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
;./game.c:145: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;./game.c:146: HW_displayOff ();
	ld	hl,#0x0140
	push	hl
	call	_SG_VDPturnOffFeature
;./game.c:147: HW_setSpriteMode (SG_SPRITEMODE_LARGE);
	ld	h,#0x01
	ex	(sp),hl
	inc	sp
	call	_SG_setSpriteMode
	inc	sp
;./game.c:148: HW_setUpdateList (update_list);
	ld	hl,#_update_list
	push	hl
	call	_SG_setUpdateList
	pop	af
;./game.c:149: first_game = 1;
	ld	hl,#_first_game + 0
	ld	(hl), #0x01
;./game.c:154: ntsc = 1;
	ld	hl,#_ntsc + 0
	ld	(hl), #0x01
;./game.c:158: unpack_bg_patterns (tsfont_patterns_c, tsfont_colours_c, 0, 7);
	ld	de,#_tsfont_patterns_c
	ld	a,#0x07
	push	af
	inc	sp
	ld	hl,#0x0000
	push	hl
	ld	hl,#_tsfont_colours_c
	push	hl
	push	de
	call	_unpack_bg_patterns
	ld	hl,#7
	add	hl,sp
	ld	sp,hl
;./game.c:160: credits ();
	call	_credits
;./game.c:163: aPLib_depack_VRAM (SGT_BASE, ss_fixed_patterns_c);
	ld	hl,#_ss_fixed_patterns_c
	push	hl
	ld	hl,#0x3800
	push	hl
	call	_aPLib_depack_VRAM
	pop	af
	pop	af
;./game.c:165: mode_no_resonators = 0;
	ld	hl,#_mode_no_resonators + 0
	ld	(hl), #0x00
;./game.c:166: while (1) {	
00110$:
;./game.c:167: title ();
	call	_title
;./game.c:169: level = 0;
	ld	hl,#_level + 0
	ld	(hl), #0x00
;./game.c:170: plife = PLAYER_LIFE;
	ld	hl,#_plife + 0
	ld	(hl), #0x05
;./game.c:174: while (1) {
00107$:
;./game.c:175: pres (scr_level, MUSIC_JINGLE);
	ld	hl,#_m_n_jingle_psg
	push	hl
	ld	hl,#_scr_level
	push	hl
	call	_pres
	pop	af
	pop	af
;./game.c:176: game_init (); 
	call	_game_init
;./game.c:177: game_loop ();
	call	_game_loop
;./game.c:179: if (game_over) {
	ld	a,(#_game_over + 0)
	or	a, a
	jr	Z,00104$
;./game.c:180: pres (scr_game_over, MUSIC_GOVER);
	ld	hl,#_m_n_gover_psg
	push	hl
	ld	hl,#_scr_game_over
	push	hl
	call	_pres
	pop	af
	pop	af
;./game.c:181: break;
	jr	00108$
00104$:
;./game.c:183: pres (scr_sclear, MUSIC_SCLEAR);
	ld	hl,#_m_n_sclear_psg
	push	hl
	ld	hl,#_scr_sclear
	push	hl
	call	_pres
	pop	af
	pop	af
;./game.c:184: level ++;
	ld	hl, #_level+0
	inc	(hl)
;./game.c:185: if (level == MAX_LEVELS) {
	ld	a,(#_level + 0)
	sub	a, #0x04
	jr	NZ,00107$
;./game.c:186: pres (scr_the_end, 0);
	ld	hl,#0x0000
	push	hl
	ld	hl,#_scr_the_end
	push	hl
	call	_pres
	pop	af
	pop	af
;./game.c:187: break;
00108$:
;./game.c:192: first_game = 0;
	ld	hl,#_first_game + 0
	ld	(hl), #0x00
	jr	00110$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
