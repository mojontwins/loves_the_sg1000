;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW32)
; This file was generated Wed Oct 31 11:59:43 2018
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
	.globl _flickscreen_do_vertical
	.globl _flickscreen_do_horizontal
	.globl _credits
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
	.globl _enems_hit
	.globl _enems_kill
	.globl _enems_load
	.globl _enems_boioiong_init
	.globl _enems_init_fp
	.globl _enems_facing
	.globl _enems_update_unsigned_char_arrays
	.globl _enems_persistent_deaths_load
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
	.globl _distance
	.globl _pad_read
	.globl _collide
	.globl _collide_in
	.globl _cm_two_points
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
	.globl _PSGStop
	.globl _SG_doUpdateList
	.globl _SG_setUpdateList
	.globl _UNSAFE_SG_copySpritestoSAT
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
	.globl _behs2
	.globl _behs1
	.globl _behs0
	.globl _jitter
	.globl _bits
	.globl _chac_chacs_t3
	.globl _chac_chacs_t2
	.globl _chac_chacs_t1
	.globl _chac_chacs_times
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
	.ds 2
_pad_this_frame::
	.ds 2
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
;engine/hotspots.h:7: void hotspots_load (void) {
;	---------------------------------
; Function hotspots_load
; ---------------------------------
_hotspots_load::
;engine/hotspots.h:9: gp_gen = (unsigned char *) c_hotspots;
	ld	hl,(_c_hotspots)
	ld	(_gp_gen),hl
;engine/hotspots.h:11: for (gpit = 0; gpit < MAP_SIZE; gpit ++) {
	ld	hl,#_gpit + 0
	ld	(hl), #0x00
	ld	de,#_hact+0
00102$:
;engine/hotspots.h:16: hact [gpit] = 1;
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	(hl),#0x01
;engine/hotspots.h:11: for (gpit = 0; gpit < MAP_SIZE; gpit ++) {
	ld	hl, #_gpit+0
	inc	(hl)
	ld	a,(#_gpit + 0)
	sub	a, #0x18
	jr	C,00102$
	ret
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
_l_ini_x:
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
_l_ini_y:
	.db #0x07	; 7
	.db #0x0A	; 10
	.db #0x03	; 3
_l_map_w:
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
_l_map_h:
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x03	; 3
_l_player_max_objects:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_l_player_max_enems:
	.db #0x36	; 54	'6'
	.db #0x31	; 49	'1'
	.db #0x2E	; 46
_l_ts_patterns:
	.dw _ts0_patterns_c
	.dw _ts1_patterns_c
	.dw _ts2_patterns_c
_l_ts_colours:
	.dw _ts0_colours_c
	.dw _ts1_colours_c
	.dw _ts2_colours_c
_l_ts_tmaps:
	.dw _ts0_tmaps
	.dw _ts1_tmaps
	.dw _ts2_tmaps
_l_behs:
	.dw _behs0
	.dw _behs1
	.dw _behs2
_l_spr_patterns:
	.dw _ss_en_0_patterns_c
	.dw _ss_en_1_patterns_c
	.dw _ss_en_2_patterns_c
_l_spr_enems:
	.dw _spr_enems0
	.dw _spr_enems1
	.dw _spr_enems2
_l_map:
	.dw _map_0
	.dw _map_1
	.dw _map_2
_l_decos:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
_l_locks:
	.dw _map_0_locks
	.dw _map_1_locks
	.dw _map_2_locks
_l_n_bolts:
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
_l_enems:
	.dw _enems_0
	.dw _enems_1
	.dw _enems_2
_l_hotspots:
	.dw _hotspots_0
	.dw _hotspots_1
	.dw _hotspots_2
_l_music:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
;engine/hotspots.h:20: void hotspots_paint (void) {
;	---------------------------------
; Function hotspots_paint
; ---------------------------------
_hotspots_paint::
;engine/hotspots.h:30: rda = hrt;
	ld	a,(#_hrt + 0)
	ld	(#_rda + 0),a
;engine/hotspots.h:33: if (hrt == HOTSPOT_TYPE_RESONATOR && res_on) rda = HOTSPOT_TYPE_RESONATOR_ON;
	ld	a,(#_hrt + 0)
	sub	a, #0x04
	jr	NZ,00102$
	ld	a,(#_res_on + 0)
	or	a, a
	jr	Z,00102$
	ld	hl,#_rda + 0
	ld	(hl), #0x05
00102$:
;engine/hotspots.h:38: spr_hs [rda]
	ld	de,#_spr_hs+0
	ld	iy,#_rda
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
;engine/hotspots.h:37: hrx, hry + SPRITE_ADJUST, 
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
;engine/hotspots.h:42: void hotspots_create (void) {
;	---------------------------------
; Function hotspots_create
; ---------------------------------
_hotspots_create::
;engine/hotspots.h:54: gp_gen = (unsigned char *) (c_hotspots + (n_pant << 1));
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
;engine/hotspots.h:55: hrt = *gp_gen ++; rda = *gp_gen; 
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
;engine/hotspots.h:56: if (hrt && hact [n_pant]) {
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
;engine/hotspots.h:57: hry = rda & 0xf0; hrx = rda << 4;
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
;engine/hotspots.h:58: } else hrt = 0;
	ld	hl,#_hrt + 0
	ld	(hl), #0x00
	ret
;engine/enengine.h:16: void enems_persistent_deaths_load (void) {
;	---------------------------------
; Function enems_persistent_deaths_load
; ---------------------------------
_enems_persistent_deaths_load::
;engine/enengine.h:17: memfill (ep_dead, 0, MAP_SIZE * 3);
	ld	de,#_ep_dead
	ld	hl,#0x0048
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_memfill
	pop	af
	pop	af
	inc	sp
	ret
;engine/enengine.h:21: void enems_update_unsigned_char_arrays (void) {
;	---------------------------------
; Function enems_update_unsigned_char_arrays
; ---------------------------------
_enems_update_unsigned_char_arrays::
;engine/enengine.h:22: en_t [gpit] = _en_t;
	ld	de,#_en_t+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(#__en_t + 0)
	ld	(hl),a
;engine/enengine.h:23: en_s [gpit] = _en_s;
	ld	de,#_en_s+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(#__en_s + 0)
	ld	(hl),a
;engine/enengine.h:24: en_x [gpit] = _en_x; en_y [gpit] = _en_y;
	ld	de,#_en_x+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(#__en_x + 0)
	ld	(hl),a
	ld	de,#_en_y+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(#__en_y + 0)
	ld	(hl),a
;engine/enengine.h:25: en_x1 [gpit] = _en_x1; en_y1 [gpit] = _en_y1;
	ld	de,#_en_x1+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(#__en_x1 + 0)
	ld	(hl),a
	ld	de,#_en_y1+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(#__en_y1 + 0)
	ld	(hl),a
;engine/enengine.h:26: en_x2 [gpit] = _en_x2; en_y2 [gpit] = _en_y2;
	ld	de,#_en_x2+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(#__en_x2 + 0)
	ld	(hl),a
	ld	de,#_en_y2+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(#__en_y2 + 0)
	ld	(hl),a
;engine/enengine.h:27: en_mx [gpit] = _en_mx; en_my [gpit] = _en_my;
	ld	de,#_en_mx+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(#__en_mx + 0)
	ld	(hl),a
	ld	de,#_en_my+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(#__en_my + 0)
	ld	(hl),a
;engine/enengine.h:28: en_ct [gpit] = _en_ct;
	ld	de,#_en_ct+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(#__en_ct + 0)
	ld	(hl),a
;engine/enengine.h:29: en_facing [gpit] = _en_facing;
	ld	de,#_en_facing+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(#__en_facing + 0)
	ld	(hl),a
;engine/enengine.h:30: en_state [gpit] = _en_state;
	ld	de,#_en_state+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(#__en_state + 0)
	ld	(hl),a
;engine/enengine.h:33: enf_x [gpit] = _enf_x; enf_vx [gpit] = _enf_vx;
	ld	iy,#_gpit
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ld	de,#_enf_x
	add	hl,de
	ld	a,(#__enf_x + 0)
	ld	(hl),a
	inc	hl
	ld	a,(#__enf_x + 1)
	ld	(hl),a
	ld	iy,#_gpit
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ld	de,#_enf_vx
	add	hl,de
	ld	a,(#__enf_vx + 0)
	ld	(hl),a
	inc	hl
	ld	a,(#__enf_vx + 1)
	ld	(hl),a
;engine/enengine.h:34: enf_y [gpit] = _enf_y; enf_vy [gpit] = _enf_vy;
	ld	iy,#_gpit
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ld	de,#_enf_y
	add	hl,de
	ld	a,(#__enf_y + 0)
	ld	(hl),a
	inc	hl
	ld	a,(#__enf_y + 1)
	ld	(hl),a
	ld	iy,#_gpit
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ld	de,#_enf_vy
	add	hl,de
	ld	a,(#__enf_vy + 0)
	ld	(hl),a
	inc	hl
	ld	a,(#__enf_vy + 1)
	ld	(hl),a
	ret
;engine/enengine.h:38: void enems_facing (void) {
;	---------------------------------
; Function enems_facing
; ---------------------------------
_enems_facing::
;engine/enengine.h:39: _en_facing = rda << 2;
	ld	a,(#_rda + 0)
	add	a, a
	add	a, a
	ld	(#__en_facing + 0),a
	ret
;engine/enengine.h:42: void enems_init_fp (void) {
;	---------------------------------
; Function enems_init_fp
; ---------------------------------
_enems_init_fp::
;engine/enengine.h:43: _enf_x = _en_x << 6;
	ld	iy,#__en_x
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	(__enf_x),hl
;engine/enengine.h:44: _enf_y = _en_y << 6;
	ld	iy,#__en_y
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	(__enf_y),hl
	ret
;engine/enengine.h:47: void enems_boioiong_init (void) {
;	---------------------------------
; Function enems_boioiong_init
; ---------------------------------
_enems_boioiong_init::
;engine/enengine.h:48: enems_init_fp ();
	call	_enems_init_fp
;engine/enengine.h:49: _enf_vy = 0; 
	ld	hl,#0x0000
	ld	(__enf_vy),hl
;engine/enengine.h:50: _enf_vx = ADD_SIGN2 (_en_x2, _en_x1, rdm << FIXBITS);
	ld	a,(#__en_x2 + 0)
	ld	iy,#__en_x1
	sub	a, 0 (iy)
	jr	NZ,00103$
	ld	de,#0x0000
	jr	00104$
00103$:
	ld	iy,#_rdm
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de,hl
	ld	a,(#__en_x1)
	ld	iy,#__en_x2
	sub	a, 0 (iy)
	jr	C,00106$
	xor	a, a
	sub	a, e
	ld	e,a
	ld	a, #0x00
	sbc	a, d
	ld	d,a
00106$:
00104$:
	ld	(__enf_vx),de
;engine/enengine.h:54: _en_ct = 0;
	ld	hl,#__en_ct + 0
	ld	(hl), #0x00
	ret
;engine/enengine.h:58: void enems_load (void) {
;	---------------------------------
; Function enems_load
; ---------------------------------
_enems_load::
;engine/enengine.h:59: gp_gen = (unsigned char *) (c_enems + (n_pant << 2) + (n_pant << 3));
	ld	hl,#_n_pant + 0
	ld	c, (hl)
	ld	b,#0x00
	ld	e, c
	ld	d, b
	sla	e
	rl	d
	sla	e
	rl	d
	ld	a,(#_c_enems + 0)
	add	a, e
	ld	e,a
	ld	a,(#_c_enems + 1)
	adc	a, d
	ld	d,a
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	ld	a,e
	ld	hl,#_gp_gen
	add	a, c
	ld	(hl),a
	ld	a,d
	adc	a, b
	inc	hl
	ld	(hl),a
;engine/enengine.h:62: en_offs = rdc = (n_pant << 1) + n_pant;
	ld	a,(#_n_pant + 0)
	add	a, a
	ld	hl,#_n_pant
	add	a, (hl)
	ld	(#_rdc + 0),a
	ld	(#_en_offs + 0),a
;engine/enengine.h:65: for (gpit = 0; gpit < 3; gpit ++) {
	ld	hl,#_gpit + 0
	ld	(hl), #0x00
00118$:
;engine/enengine.h:69: if (ep_dead [rdc]) {
	ld	iy,#_ep_dead
	ld	de,(_rdc)
	ld	d,#0x00
	add	iy, de
	ld	a, 0 (iy)
	or	a, a
	jr	Z,00115$
;engine/enengine.h:70: _en_t = 0;
	ld	hl,#__en_t + 0
	ld	(hl), #0x00
;engine/enengine.h:71: gp_gen += 4;
	ld	hl,#_gp_gen
	ld	a,(hl)
	add	a, #0x04
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
	jp	00116$
00115$:
;engine/enengine.h:76: _en_t = *gp_gen ++;
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#__en_t + 0),a
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00190$
	ld	hl, #_gp_gen+1
	inc	(hl)
00190$:
;engine/enengine.h:79: _en_state = 0;
	ld	hl,#__en_state + 0
	ld	(hl), #0x00
;engine/enengine.h:82: rda = *gp_gen ++;
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rda + 0),a
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00191$
	ld	hl, #_gp_gen+1
	inc	(hl)
00191$:
;engine/enengine.h:83: _en_y1 = rda & 0xf0;
	ld	a,(#_rda + 0)
	and	a, #0xF0
	ld	(#__en_y1 + 0),a
;engine/enengine.h:84: _en_x1 = rda << 4;
	ld	a,(#_rda + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	(#__en_x1 + 0),a
;engine/enengine.h:87: rda = *gp_gen ++;
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rda + 0),a
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00192$
	ld	hl, #_gp_gen+1
	inc	(hl)
00192$:
;engine/enengine.h:88: _en_y2 = rda & 0xf0;
	ld	a,(#_rda + 0)
	and	a, #0xF0
	ld	(#__en_y2 + 0),a
;engine/enengine.h:89: _en_x2 = rda << 4;
	ld	a,(#_rda + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	(#__en_x2 + 0),a
;engine/enengine.h:92: rda = *gp_gen ++;
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rda + 0),a
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00193$
	ld	hl, #_gp_gen+1
	inc	(hl)
00193$:
;engine/enengine.h:95: rdd = rda & 0xf0; 	// Used for respawn speed!
	ld	a,(#_rda + 0)
	and	a, #0xF0
	ld	(#_rdd + 0),a
;engine/enengine.h:96: rdm = rda & 0x0f; 	// Actual speed.
	ld	a,(#_rda + 0)
	and	a, #0x0F
	ld	(#_rdm + 0),a
;engine/enengine.h:99: _en_x = _en_x1;
	ld	a,(#__en_x1 + 0)
	ld	(#__en_x + 0),a
;engine/enengine.h:100: _en_y = _en_y1;
	ld	a,(#__en_y1 + 0)
	ld	(#__en_y + 0),a
;engine/enengine.h:102: switch (_en_t & 0x3f) {
	ld	a,(#__en_t + 0)
	and	a, #0x3F
	ld	l,a
	dec	a
	jr	Z,00104$
	ld	a,l
	cp	a,#0x02
	jr	Z,00104$
	cp	a,#0x03
	jr	Z,00104$
	cp	a,#0x04
	jr	Z,00104$
	sub	a, #0x06
	jp	Z,00112$
	jp	00113$
;engine/enengine.h:106: case 4:
00104$:
;engine/enengine.h:109: _en_ct = 0;			
	ld	hl,#__en_ct + 0
	ld	(hl), #0x00
;engine/enengine.h:110: _en_s = (_en_t - 1) << 3;
	ld	a,(#__en_t + 0)
	add	a,#0xFF
	rlca
	rlca
	rlca
	and	a,#0xF8
	ld	(#__en_s + 0),a
;engine/enengine.h:119: _en_mx = ADD_SIGN2 (_en_x2, _en_x1, rdm);
	ld	hl,#_rdm + 0
	ld	d, (hl)
	xor	a, a
	ld	iy,#_rdm
	sub	a, 0 (iy)
	ld	e,a
	ld	a,(#__en_x2 + 0)
	ld	iy,#__en_x1
	sub	a, 0 (iy)
	jr	NZ,00122$
	ld	a,#0x00
	jr	00123$
00122$:
	ld	a,(#__en_x1)
	ld	iy,#__en_x2
	sub	a, 0 (iy)
	jr	NC,00124$
	ld	a,d
	jr	00125$
00124$:
	ld	a,e
00125$:
00123$:
	ld	(#__en_mx + 0),a
;engine/enengine.h:120: _en_my = ADD_SIGN2 (_en_y2, _en_y1, rdm);
	ld	a,(#__en_y2 + 0)
	ld	iy,#__en_y1
	sub	a, 0 (iy)
	jr	NZ,00126$
	ld	e,#0x00
	jr	00127$
00126$:
	ld	a,(#__en_y1)
	ld	iy,#__en_y2
	sub	a, 0 (iy)
	jr	NC,00128$
	ld	e,d
00128$:
00127$:
	ld	hl,#__en_my + 0
	ld	(hl), e
;engine/enengine.h:125: en_status [gpit] = 1; 
	ld	a,#<(_en_status)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_status)
	adc	a, #0x00
	ld	d,a
;engine/enengine.h:124: if (rdm == 1) {
	ld	a,(#_rdm + 0)
	dec	a
	jr	NZ,00106$
;engine/enengine.h:125: en_status [gpit] = 1; 
	ld	a,#0x01
	ld	(de),a
	jr	00107$
00106$:
;engine/enengine.h:127: en_status [gpit] = 0;
	xor	a, a
	ld	(de),a
;engine/enengine.h:128: _en_mx >>= 1;
	ld	a,(#__en_mx + 0)
	sra	a
	ld	(#__en_mx + 0),a
;engine/enengine.h:129: _en_my >>= 1;						
	ld	a,(#__en_my + 0)
	sra	a
	ld	(#__en_my + 0),a
00107$:
;engine/enengine.h:133: if (_en_x1 > _en_x2) { rda = _en_x1; _en_x1 = _en_x2; _en_x2 = rda; }
	ld	a,(#__en_x2)
	ld	iy,#__en_x1
	sub	a, 0 (iy)
	jr	NC,00109$
	ld	a,(#__en_x1 + 0)
	ld	(#_rda + 0),a
	ld	a,(#__en_x2 + 0)
	ld	(#__en_x1 + 0),a
	ld	a,(#_rda + 0)
	ld	(#__en_x2 + 0),a
00109$:
;engine/enengine.h:134: if (_en_y1 > _en_y2) { rda = _en_y1; _en_y1 = _en_y2; _en_y2 = rda; }
	ld	a,(#__en_y2)
	ld	iy,#__en_y1
	sub	a, 0 (iy)
	jr	NC,00113$
	ld	a,(#__en_y1 + 0)
	ld	(#_rda + 0),a
	ld	a,(#__en_y2 + 0)
	ld	(#__en_y1 + 0),a
	ld	a,(#_rda + 0)
	ld	(#__en_y2 + 0),a
;engine/enengine.h:144: break;
	jr	00113$
;engine/enengine.h:161: case 6:
00112$:
;engine/enengine.h:163: enems_init_fp ();
	call	_enems_init_fp
;engine/enengine.h:164: _enf_vx = _enf_vy = 0;
	ld	hl,#0x0000
	ld	(__enf_vy),hl
	ld	l, #0x00
	ld	(__enf_vx),hl
;engine/enengine.h:169: _en_s = FANTY_BASE_SPRID;
	ld	hl,#__en_s + 0
	ld	(hl), #0x20
;engine/enengine.h:274: }
00113$:
;engine/enengine.h:284: en_cttouched [gpit] = 0;
	ld	a,#<(_en_cttouched)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_cttouched)
	adc	a, #0x00
	ld	d,a
	xor	a, a
	ld	(de),a
;engine/enengine.h:285: en_flags [gpit] = 0;
	ld	a,#<(_en_flags)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_flags)
	adc	a, #0x00
	ld	d,a
	xor	a, a
	ld	(de),a
00116$:
;engine/enengine.h:288: ++ rdc;
	ld	hl, #_rdc+0
	inc	(hl)
;engine/enengine.h:291: enems_update_unsigned_char_arrays ();
	call	_enems_update_unsigned_char_arrays
;engine/enengine.h:65: for (gpit = 0; gpit < 3; gpit ++) {
	ld	hl, #_gpit+0
	inc	(hl)
	ld	a,(#_gpit + 0)
	sub	a, #0x03
	jp	C,00118$
	ret
;engine/enengine.h:296: void enems_kill () {
;	---------------------------------
; Function enems_kill
; ---------------------------------
_enems_kill::
;engine/enengine.h:297: en_flags [gpit] |= EN_STATE_DEAD;
	ld	de,#_en_flags+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	set	0, (hl)
	ld	a, (hl)
;engine/enengine.h:303: ep_dead [en_offs + gpit] = 1;
	ld	hl,#_gpit
	ld	a,(#_en_offs + 0)
	add	a, (hl)
	ld	e,a
	ld	hl,#_ep_dead
	ld	d,#0x00
	add	hl, de
	ld	(hl),#0x01
;engine/enengine.h:314: ++ pkilled;
	ld	hl, #_pkilled+0
	inc	(hl)
	ret
;engine/enengine.h:321: void enems_hit (void) {
;	---------------------------------
; Function enems_hit
; ---------------------------------
_enems_hit::
;engine/enengine.h:322: _en_facing = ((_en_x < prx) ? 0 : 4);
	ld	hl,#_prx
	ld	a,(#__en_x + 0)
	sub	a, (hl)
	jr	NC,00103$
	ld	a,#0x00
	jr	00104$
00103$:
	ld	a,#0x04
00104$:
	ld	(#__en_facing + 0),a
;engine/enengine.h:323: en_cttouched [gpit] = ENEMS_TOUCHED_FRAMES;
	ld	de,#_en_cttouched+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	(hl),#0x08
;engine/enengine.h:339: enems_kill ();
	jp  _enems_kill
;engine/enengine.h:345: void enems_move (void) {
;	---------------------------------
; Function enems_move
; ---------------------------------
_enems_move::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-9
	add	hl,sp
	ld	sp,hl
;engine/enengine.h:347: pgotten = pgtmx = pgtmy = 0;
	ld	hl,#0x0000
	ld	(_pgtmy),hl
	ld	l, #0x00
	ld	(_pgtmx),hl
	ld	hl,#_pgotten + 0
	ld	(hl), #0x00
;engine/enengine.h:351: touched = 0;
	ld	hl,#_touched + 0
	ld	(hl), #0x00
;engine/enengine.h:352: ++ en_initial; if (en_initial >= 3) en_initial = 0;
	ld	hl, #_en_initial+0
	inc	(hl)
	ld	a,(#_en_initial + 0)
	sub	a, #0x03
	jr	C,00102$
	ld	hl,#_en_initial + 0
	ld	(hl), #0x00
00102$:
;engine/enengine.h:353: gpit = en_initial;
	ld	a,(#_en_initial + 0)
	ld	(#_gpit + 0),a
;engine/enengine.h:354: gpjt = 3; while (gpjt --) {
	ld	hl,#_gpjt + 0
	ld	(hl), #0x03
00233$:
	ld	hl,#_gpjt + 0
	ld	d, (hl)
	ld	hl, #_gpjt+0
	dec	(hl)
	ld	a,d
	or	a, a
	jp	Z,00236$
;engine/enengine.h:355: gpit += 2; if (gpit > 2) gpit -=3;
	ld	hl, #_gpit+0
	inc	(hl)
	ld	hl, #_gpit+0
	inc	(hl)
	ld	a,#0x02
	ld	iy,#_gpit
	sub	a, 0 (iy)
	jr	NC,00104$
	ld	hl,#_gpit
	ld	a,(hl)
	add	a,#0xFD
	ld	(hl),a
00104$:
;engine/enengine.h:358: _en_t = en_t [gpit];
	ld	a,#<(_en_t)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_t)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#__en_t + 0),a
;engine/enengine.h:359: _en_s = en_s [gpit];
	ld	a,#<(_en_s)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_s)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#__en_s + 0),a
;engine/enengine.h:360: _en_x = en_x [gpit]; _en_y = en_y [gpit];
	ld	a,#<(_en_x)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_x)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#__en_x + 0),a
	ld	a,#<(_en_y)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_y)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#__en_y + 0),a
;engine/enengine.h:361: _en_x1 = en_x1 [gpit]; _en_y1 = en_y1 [gpit];
	ld	a,#<(_en_x1)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_x1)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#__en_x1 + 0),a
	ld	a,#<(_en_y1)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_y1)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#__en_y1 + 0),a
;engine/enengine.h:362: _en_x2 = en_x2 [gpit]; _en_y2 = en_y2 [gpit];
	ld	a,#<(_en_x2)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_x2)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#__en_x2 + 0),a
	ld	a,#<(_en_y2)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_y2)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#__en_y2 + 0),a
;engine/enengine.h:363: _en_mx = en_mx [gpit]; _en_my = en_my [gpit];
	ld	a,#<(_en_mx)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_mx)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#__en_mx + 0),a
	ld	a,#<(_en_my)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_my)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#__en_my + 0),a
;engine/enengine.h:364: _en_ct = en_ct [gpit];
	ld	a,#<(_en_ct)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_ct)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#__en_ct + 0),a
;engine/enengine.h:365: _en_facing = en_facing [gpit];
	ld	a,#<(_en_facing)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_facing)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#__en_facing + 0),a
;engine/enengine.h:366: _en_state = en_state [gpit];
	ld	a,#<(_en_state)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_state)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#__en_state + 0),a
;engine/enengine.h:369: _enf_x = enf_x [gpit]; _enf_vx = enf_vx [gpit];
	ld	iy,#_gpit
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ex	de,hl
	ld	hl,#_enf_x
	add	hl,de
	ld	a,(hl)
	ld	iy,#__enf_x
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#__enf_x + 1),a
	ld	hl,#_enf_vx
	add	hl,de
	ld	a,(hl)
	ld	iy,#__enf_vx
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#__enf_vx + 1),a
;engine/enengine.h:370: _enf_y = enf_y [gpit]; _enf_vy = enf_vy [gpit];
	ld	hl,#_enf_y
	add	hl,de
	ld	a,(hl)
	ld	iy,#__enf_y
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#__enf_y + 1),a
	ld	hl,#_enf_vy
	add	hl,de
	ld	a,(hl)
	ld	iy,#__enf_vy
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#__enf_vy + 1),a
;engine/enengine.h:373: if (_en_t == 0) continue;
	ld	a,(#__en_t + 0)
	or	a, a
	jp	Z,00233$
;engine/enengine.h:374: en_is_alive = !(en_flags [gpit] & EN_STATE_DEAD);
	ld	iy,#_en_flags
	ld	de,(_gpit)
	ld	d,#0x00
	add	iy, de
	ld	a, 0 (iy)
	and	a,#0x01
	xor	a,#0x01
	ld	(#_en_is_alive + 0),a
;engine/enengine.h:378: en_spr = 0xff;
	ld	hl,#_en_spr + 0
	ld	(hl), #0xFF
;engine/enengine.h:381: en_spr_x_mod = 0;
	ld	hl,#_en_spr_x_mod + 0
	ld	(hl), #0x00
;engine/enengine.h:384: if (en_cttouched [gpit]) {
	ld	a,#<(_en_cttouched)
	ld	hl,#_gpit
	add	a, (hl)
	ld	-2 (ix),a
	ld	a,#>(_en_cttouched)
	adc	a, #0x00
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	-3 (ix), a
	or	a, a
	jp	Z,00228$
;engine/enengine.h:385: -- en_cttouched [gpit];
	ld	d,-3 (ix)
	dec	d
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),d
;engine/enengine.h:401: rda = frame_counter & 0xf;
	ld	a,(#_frame_counter + 0)
	and	a, #0x0F
	ld	(#_rda + 0),a
;engine/enengine.h:405: spr_enems [ENEMS_EXPLODING_CELL]
	ld	hl,(_spr_enems)
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	de, #0x0050
	add	hl, de
	ld	a,(hl)
	ld	-2 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-1 (ix),a
;engine/enengine.h:404: _en_y + jitter [15 - rda] + SPRITE_ADJUST, 
	ld	hl,#_rda
	ld	a,#0x0F
	sub	a, (hl)
	add	a,#<(_jitter)
	ld	-7 (ix),a
	ld	a,#>(_jitter)
	adc	a, #0x00
	ld	-6 (ix),a
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	ld	-7 (ix),a
	ld	a,(#__en_y + 0)
	add	a, -7 (ix)
	ld	-7 (ix), a
	add	a, #0xF7
	ld	-7 (ix),a
;engine/enengine.h:403: _en_x + jitter [rda],
	ld	a,#<(_jitter)
	ld	hl,#_rda
	add	a, (hl)
	ld	-9 (ix),a
	ld	a,#>(_jitter)
	adc	a, #0x00
	ld	-8 (ix),a
	pop	hl
	push	hl
	ld	h,(hl)
	ld	a,(#__en_x + 0)
	add	a, h
	ld	d,a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	a,-7 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_SG_addMetaSprite1x1
	pop	af
	pop	af
	jp	00230$
00228$:
;engine/enengine.h:424: if (en_is_alive) {
	ld	a,(#_en_is_alive + 0)
	or	a, a
	jp	Z,00230$
;engine/enengine.h:427: pregotten = (prx + 7 >= _en_x && prx <= _en_x + 15);
	ld	hl,#_prx + 0
	ld	e, (hl)
	ld	d,#0x00
	ld	hl,#0x0007
	add	hl,de
	ld	c,l
	ld	b,h
	ld	iy,#__en_x
	ld	l,0 (iy)
	ld	h,#0x00
	ld	a,c
	sub	a, l
	ld	a,b
	sbc	a, h
	jp	PO, 00569$
	xor	a, #0x80
00569$:
	jp	M,00238$
	ld	bc,#0x000F
	add	hl,bc
	ld	a,l
	sub	a, e
	ld	a,h
	sbc	a, d
	jp	PO, 00570$
	xor	a, #0x80
00570$:
	jp	P,00239$
00238$:
	ld	-9 (ix),#0x00
	jr	00240$
00239$:
	ld	-9 (ix),#0x01
00240$:
	ld	a,-9 (ix)
	ld	(#_pregotten + 0),a
;engine/enengine.h:430: en_fr = ((((_en_mx) ? _en_x : _en_y)+4) >> 3) & 1;
	ld	a,(#__en_x + 0)
	ld	-9 (ix),a
	ld	a,(#__en_y + 0)
	ld	-7 (ix),a
	ld	a,(#__en_mx + 0)
	or	a, a
	jr	Z,00241$
	ld	a,-9 (ix)
	ld	-3 (ix),a
	jr	00242$
00241$:
	ld	a,-7 (ix)
	ld	-3 (ix),a
00242$:
	ld	a,-3 (ix)
	ld	-2 (ix),a
	ld	-1 (ix),#0x00
	ld	a,-2 (ix)
	add	a, #0x04
	ld	-2 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
	sra	-1 (ix)
	rr	-2 (ix)
	sra	-1 (ix)
	rr	-2 (ix)
	sra	-1 (ix)
	rr	-2 (ix)
	ld	a,-2 (ix)
	and	a, #0x01
	ld	-2 (ix),a
	ld	-1 (ix),#0x00
	ld	a,-2 (ix)
	ld	(#_en_fr + 0),a
;engine/enengine.h:433: if (res_on 
	ld	a,(#_res_on + 0)
	or	a, a
	jr	Z,00172$
;engine/enengine.h:446: ) {
	ld	a,(#__en_t + 0)
	sub	a, #0x04
	jr	Z,00172$
;engine/enengine.h:447: en_spr = en_spr_id [gpit];
	ld	a,#<(_en_spr_id)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_spr_id)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#_en_spr + 0),a
	jp	00173$
00172$:
;engine/enengine.h:451: switch (_en_t & 63) {
	ld	a,(#__en_t + 0)
	and	a, #0x3F
	ld	h,a
	dec	a
	jr	Z,00110$
	ld	a,h
	cp	a,#0x02
	jr	Z,00110$
	cp	a,#0x03
	jr	Z,00110$
	cp	a,#0x04
	jr	Z,00110$
	sub	a, #0x06
	jp	Z,00122$
	jp	00170$
;engine/enengine.h:455: case 4:
00110$:
;engine/../engine/enemmods/enem_linear.h:11: if (!en_status [gpit] || half_life) {
	ld	a,#<(_en_status)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_status)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	or	a, a
	jr	Z,00119$
	ld	a,(#_half_life + 0)
	or	a, a
	jp	Z,00120$
00119$:
;engine/../engine/enemmods/enem_linear.h:15: _en_x += _en_mx;
	ld	a,(#__en_x + 0)
	ld	hl,#__en_mx
	ld	iy,#__en_x
	add	a, (hl)
	ld	0 (iy),a
;engine/../engine/enemmods/enem_linear.h:32: _en_y += _en_my;
	ld	a,(#__en_y + 0)
	ld	hl,#__en_my
	ld	iy,#__en_y
	add	a, (hl)
	ld	0 (iy),a
;engine/../engine/enemmods/enem_linear.h:53: if (_en_x == _en_x1 || _en_x == _en_x2) _en_mx = -_en_mx;
	ld	a,(#__en_x + 0)
	ld	iy,#__en_x1
	sub	a, 0 (iy)
	jr	Z,00111$
	ld	a,(#__en_x + 0)
	ld	iy,#__en_x2
	sub	a, 0 (iy)
	jr	NZ,00112$
00111$:
	xor	a, a
	ld	iy,#__en_mx
	sub	a, 0 (iy)
	ld	(#__en_mx + 0),a
00112$:
;engine/../engine/enemmods/enem_linear.h:60: if (_en_y <= _en_y1) { _en_y = _en_y1; _en_my = ABS (_en_my); }
	ld	a,(#__en_my + 0)
	rlca
	and	a,#0x01
	ld	c,a
	xor	a, a
	ld	iy,#__en_my
	sub	a, 0 (iy)
	ld	d,a
	ld	hl,#__en_my + 0
	ld	e, (hl)
	ld	a,(#__en_y1)
	ld	iy,#__en_y
	sub	a, 0 (iy)
	jr	C,00117$
	ld	a,(#__en_y1 + 0)
	ld	(#__en_y + 0),a
	ld	a,c
	or	a, a
	jr	Z,00243$
	ld	e,d
00243$:
	ld	hl,#__en_my + 0
	ld	(hl), e
	jr	00120$
00117$:
;engine/../engine/enemmods/enem_linear.h:61: else if (_en_y >= _en_y2) { _en_y = _en_y2; _en_my = -ABS (_en_my); }
	ld	hl,#__en_y2
	ld	a,(#__en_y + 0)
	sub	a, (hl)
	jr	C,00120$
	ld	a,(#__en_y2 + 0)
	ld	(#__en_y + 0),a
	ld	a,c
	or	a, a
	jr	NZ,00246$
	ld	d,e
00246$:
	xor	a, a
	sub	a, d
	ld	(#__en_my + 0),a
00120$:
;engine/../engine/enemmods/enem_linear.h:77: rda = _en_mx ? (_en_mx < 0) : (_en_my < 0); enems_facing ();
	ld	a,(#__en_mx + 0)
	or	a, a
	jr	Z,00247$
	ld	a,(#__en_mx + 0)
	rlca
	and	a,#0x01
	jr	00248$
00247$:
	ld	a,(#__en_my + 0)
	rlca
	and	a,#0x01
00248$:
	ld	(#_rda + 0),a
	call	_enems_facing
;engine/../engine/enemmods/enem_linear.h:79: en_spr = _en_s + en_fr + _en_facing;
	ld	hl,#_en_fr
	ld	a,(#__en_s + 0)
	add	a, (hl)
	ld	hl,#__en_facing
	ld	iy,#_en_spr
	add	a, (hl)
	ld	0 (iy),a
;engine/enengine.h:464: break;
	jp	00170$
;engine/enengine.h:479: case 6:
00122$:
;engine/../engine/enemmods/enem_homing_fanty.h:7: rdx = _en_x; rdy = _en_y; rdt = distance ();
	ld	a,-9 (ix)
	ld	(#_rdx + 0),a
	ld	a,-7 (ix)
	ld	(#_rdy + 0),a
	call	_distance
	ld	iy,#_rdt
	ld	0 (iy),l
;engine/../engine/enemmods/enem_homing_fanty.h:35: _enf_y = _en_y << FIXBITS;
	ld	a,(#__en_y + 0)
	ld	-9 (ix),a
	ld	-8 (ix),#0x00
;engine/../engine/enemmods/enem_homing_fanty.h:11: switch (_en_state) {
	ld	a,(#__en_state + 0)
	or	a, a
	jr	Z,00123$
	ld	a,(#__en_state + 0)
	dec	a
	jr	Z,00126$
	jp	00143$
;engine/../engine/enemmods/enem_homing_fanty.h:12: case 0:
00123$:
;engine/../engine/enemmods/enem_homing_fanty.h:14: _enf_vx = ADD_SIGN2 (_en_x1, _en_x, FANTY_V_RETREAT);
	ld	a,(#__en_x1 + 0)
	ld	iy,#__en_x
	sub	a, 0 (iy)
	jr	NZ,00249$
	ld	a,#0x00
	jr	00250$
00249$:
	ld	a,(#__en_x)
	ld	iy,#__en_x1
	sub	a, 0 (iy)
	jr	NC,00251$
	ld	a,#0x10
	jr	00252$
00251$:
	ld	a,#0xF0
00252$:
00250$:
	ld	(#__enf_vx + 0),a
	rla
	sbc	a, a
	ld	(#__enf_vx + 1),a
;engine/../engine/enemmods/enem_homing_fanty.h:15: _enf_vy = ADD_SIGN2 (_en_y1, _en_y, FANTY_V_RETREAT);
	ld	a,(#__en_y1 + 0)
	ld	iy,#__en_y
	sub	a, 0 (iy)
	jr	NZ,00253$
	ld	a,#0x00
	jr	00254$
00253$:
	ld	a,(#__en_y)
	ld	iy,#__en_y1
	sub	a, 0 (iy)
	jr	NC,00255$
	ld	a,#0x10
	jr	00256$
00255$:
	ld	a,#0xF0
00256$:
00254$:
	ld	(#__enf_vy + 0),a
	rla
	sbc	a, a
	ld	(#__enf_vy + 1),a
;engine/../engine/enemmods/enem_homing_fanty.h:16: if (rdt < FANTY_DISTANCE) _en_state = 1;
	ld	a,(#_rdt + 0)
	sub	a, #0x60
	jp	NC,00143$
	ld	hl,#__en_state + 0
	ld	(hl), #0x01
;engine/../engine/enemmods/enem_homing_fanty.h:17: break;
	jp	00143$
;engine/../engine/enemmods/enem_homing_fanty.h:18: case 1:
00126$:
;engine/../engine/enemmods/enem_homing_fanty.h:20: if (px < _enf_x) {
	ld	hl,#__enf_x
	ld	a,(#_px + 0)
	sub	a, (hl)
	ld	iy,#_px
	ld	a,1 (iy)
	inc	hl
	sbc	a, (hl)
	jp	PO, 00586$
	xor	a, #0x80
00586$:
	jp	P,00132$
;engine/../engine/enemmods/enem_homing_fanty.h:21: _enf_vx -= FANTY_A; if (_enf_vx < -FANTY_MAXV) _enf_vx = -FANTY_MAXV;
	ld	hl,(__enf_vx)
	dec	hl
	dec	hl
	ld	(__enf_vx),hl
	ld	a,(#__enf_vx + 0)
	sub	a, #0xE0
	ld	a,(#__enf_vx + 1)
	rla
	ccf
	rra
	sbc	a, #0x7F
	jr	NC,00133$
	ld	hl,#0xFFE0
	ld	(__enf_vx),hl
	jr	00133$
00132$:
;engine/../engine/enemmods/enem_homing_fanty.h:23: _enf_vx += FANTY_A; if (_enf_vx > FANTY_MAXV) _enf_vx = FANTY_MAXV;
	ld	hl,#__enf_vx
	ld	a,(hl)
	add	a, #0x02
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
	ld	a,#0x20
	ld	iy,#__enf_vx
	cp	a, 0 (iy)
	ld	a,#0x00
	ld	iy,#__enf_vx
	sbc	a, 1 (iy)
	jp	PO, 00587$
	xor	a, #0x80
00587$:
	jp	P,00133$
	ld	hl,#0x0020
	ld	(__enf_vx),hl
00133$:
;engine/../engine/enemmods/enem_homing_fanty.h:26: if (py < _enf_y) {
	ld	hl,#__enf_y
	ld	a,(#_py + 0)
	sub	a, (hl)
	ld	iy,#_py
	ld	a,1 (iy)
	inc	hl
	sbc	a, (hl)
	jp	PO, 00588$
	xor	a, #0x80
00588$:
	jp	P,00139$
;engine/../engine/enemmods/enem_homing_fanty.h:27: _enf_vy -= FANTY_A; if (_enf_vy < -FANTY_MAXV) _enf_vy = -FANTY_MAXV;
	ld	hl,(__enf_vy)
	dec	hl
	dec	hl
	ld	(__enf_vy),hl
	ld	a,(#__enf_vy + 0)
	sub	a, #0xE0
	ld	a,(#__enf_vy + 1)
	rla
	ccf
	rra
	sbc	a, #0x7F
	jr	NC,00140$
	ld	hl,#0xFFE0
	ld	(__enf_vy),hl
	jr	00140$
00139$:
;engine/../engine/enemmods/enem_homing_fanty.h:29: _enf_vy += FANTY_A; if (_enf_vy > FANTY_MAXV) _enf_vy = FANTY_MAXV;
	ld	hl,#__enf_vy
	ld	a,(hl)
	add	a, #0x02
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
	ld	a,#0x20
	ld	iy,#__enf_vy
	cp	a, 0 (iy)
	ld	a,#0x00
	ld	iy,#__enf_vy
	sbc	a, 1 (iy)
	jp	PO, 00589$
	xor	a, #0x80
00589$:
	jp	P,00140$
	ld	hl,#0x0020
	ld	(__enf_vy),hl
00140$:
;engine/../engine/enemmods/enem_homing_fanty.h:32: if (rdt > FANTY_DISTANCE) {
	ld	a,#0x60
	ld	iy,#_rdt
	sub	a, 0 (iy)
	jr	NC,00143$
;engine/../engine/enemmods/enem_homing_fanty.h:34: _enf_x = _en_x << FIXBITS;
	ld	iy,#__en_x
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	(__enf_x),hl
;engine/../engine/enemmods/enem_homing_fanty.h:35: _enf_y = _en_y << FIXBITS;
	ld	a,-9 (ix)
	ld	(#__enf_y + 0),a
	ld	a,-8 (ix)
	ld	(#__enf_y + 1),a
	ld	a,#0x06+1
	jr	00591$
00590$:
	ld	iy,#__enf_y
	sla	0 (iy)
	ld	iy,#__enf_y
	rl	1 (iy)
00591$:
	dec	a
	jr	NZ,00590$
;engine/../engine/enemmods/enem_homing_fanty.h:36: _en_state = 0;
	ld	hl,#__en_state + 0
	ld	(hl), #0x00
;engine/../engine/enemmods/enem_homing_fanty.h:39: }
00143$:
;engine/../engine/enemmods/enem_homing_fanty.h:43: _enf_x += _enf_vx; 
	ld	hl,#__enf_vx
	push	de
	ld	iy,#__enf_x
	push	iy
	pop	de
	ld	a,(de)
	add	a, (hl)
	ld	(de),a
	inc	de
	ld	a,(de)
	inc	hl
	adc	a, (hl)
	ld	(de),a
	pop	de
;engine/../engine/enemmods/enem_homing_fanty.h:44: if (_enf_x < 0) _enf_x = 0;
	ld	a,(#__enf_x + 1)
	bit	7,a
	jr	Z,00145$
	ld	hl,#0x0000
	ld	(__enf_x),hl
00145$:
;engine/../engine/enemmods/enem_homing_fanty.h:45: if (_enf_x > 15360) _enf_x = 15360;
	xor	a, a
	ld	iy,#__enf_x
	cp	a, 0 (iy)
	ld	a,#0x3C
	ld	iy,#__enf_x
	sbc	a, 1 (iy)
	jp	PO, 00592$
	xor	a, #0x80
00592$:
	jp	P,00147$
	ld	hl,#0x3C00
	ld	(__enf_x),hl
00147$:
;engine/../engine/enemmods/enem_homing_fanty.h:46: _en_x = _enf_x >> 6;
	ld	hl,(__enf_x)
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
	ld	iy,#__en_x
	ld	0 (iy),l
;engine/../engine/enemmods/enem_homing_fanty.h:50: if (_enf_vx) {
	ld	a,(#__enf_vx + 1)
	ld	hl,#__enf_vx + 0
	or	a,(hl)
	jp	Z,00155$
;engine/../engine/enemmods/enem_homing_fanty.h:51: cy1 = (_en_y + 4) >> 4;
	ld	a,-9 (ix)
	add	a, #0x04
	ld	l,a
	ld	a,-8 (ix)
	adc	a, #0x00
	ld	h,a
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	iy,#_cy1
	ld	0 (iy),l
;engine/../engine/enemmods/enem_homing_fanty.h:52: cy2 = (_en_y + 11) >> 4;
	ld	a,-9 (ix)
	add	a, #0x0B
	ld	h,a
	ld	a,-8 (ix)
	adc	a, #0x00
	ld	l,a
	sra	l
	rr	h
	sra	l
	rr	h
	sra	l
	rr	h
	sra	l
	rr	h
	ld	iy,#_cy2
	ld	0 (iy),h
;engine/enengine.h:427: pregotten = (prx + 7 >= _en_x && prx <= _en_x + 15);
	ld	iy,#__en_x
	ld	c,0 (iy)
	ld	b,#0x00
;engine/../engine/enemmods/enem_homing_fanty.h:54: if (_enf_vx > 0) {
	xor	a, a
	ld	iy,#__enf_vx
	cp	a, 0 (iy)
	ld	iy,#__enf_vx
	sbc	a, 1 (iy)
	jp	PO, 00593$
	xor	a, #0x80
00593$:
	jp	P,00149$
;engine/../engine/enemmods/enem_homing_fanty.h:55: cx1 = cx2 = (_en_x + 11) >> 4;
	ld	hl,#0x000B
	add	hl,bc
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	a,l
	ld	(#_cx2 + 0),a
	ld	(#_cx1 + 0),a
;engine/../engine/enemmods/enem_homing_fanty.h:56: rda = ((cx2 - 1) << 4) + 4;
	ld	a,(#_cx2 + 0)
	add	a,#0xFF
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	hl,#_rda
	add	a, #0x04
	ld	(hl),a
	jr	00150$
00149$:
;engine/../engine/enemmods/enem_homing_fanty.h:58: cx1 = cx2 = (_en_x + 4) >> 4;
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	hl,#_cx2 + 0
	ld	(hl), c
	ld	hl,#_cx1 + 0
	ld	(hl), c
;engine/../engine/enemmods/enem_homing_fanty.h:59: rda = ((cx1 + 1) << 4) - 4;
	ld	a,(#_cx1 + 0)
	inc	a
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	hl,#_rda
	add	a,#0xFC
	ld	(hl),a
00150$:
;engine/../engine/enemmods/enem_homing_fanty.h:61: cm_two_points ();
	call	_cm_two_points
;engine/../engine/enemmods/enem_homing_fanty.h:62: if ((at1 & 8) || (at2 & 8)) {
	ld	hl,#_at1+0
	bit	3, (hl)
	jr	NZ,00151$
	ld	hl,#_at2+0
	bit	3, (hl)
	jr	Z,00155$
00151$:
;engine/../engine/enemmods/enem_homing_fanty.h:63: _enf_vx = -_enf_vx;
	xor	a, a
	ld	iy,#__enf_vx
	sub	a, 0 (iy)
	ld	(#__enf_vx + 0),a
	ld	a, #0x00
	ld	iy,#__enf_vx
	sbc	a, 1 (iy)
	ld	(#__enf_vx + 1),a
;engine/../engine/enemmods/enem_homing_fanty.h:64: _en_x = rda; 
	ld	a,(#_rda + 0)
	ld	(#__en_x + 0),a
;engine/../engine/enemmods/enem_homing_fanty.h:65: _enf_x = rda << FIXBITS;
	ld	iy,#_rda
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	(__enf_x),hl
00155$:
;engine/../engine/enemmods/enem_homing_fanty.h:73: _enf_y += _enf_vy; 
	ld	hl,#__enf_vy
	push	de
	ld	iy,#__enf_y
	push	iy
	pop	de
	ld	a,(de)
	add	a, (hl)
	ld	(de),a
	inc	de
	ld	a,(de)
	inc	hl
	adc	a, (hl)
	ld	(de),a
	pop	de
;engine/../engine/enemmods/enem_homing_fanty.h:74: if (_enf_y < 0) _enf_y = 0;
	ld	a,(#__enf_y + 1)
	bit	7,a
	jr	Z,00157$
	ld	hl,#0x0000
	ld	(__enf_y),hl
00157$:
;engine/../engine/enemmods/enem_homing_fanty.h:75: if (_enf_y > 11264) _enf_y = 11264;
	xor	a, a
	ld	iy,#__enf_y
	cp	a, 0 (iy)
	ld	a,#0x2C
	ld	iy,#__enf_y
	sbc	a, 1 (iy)
	jp	PO, 00597$
	xor	a, #0x80
00597$:
	jp	P,00159$
	ld	hl,#0x2C00
	ld	(__enf_y),hl
00159$:
;engine/../engine/enemmods/enem_homing_fanty.h:76: _en_y = _enf_y >> 6;
	ld	hl,(__enf_y)
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
	ld	iy,#__en_y
	ld	0 (iy),l
;engine/../engine/enemmods/enem_homing_fanty.h:80: if (_enf_vy) {
	ld	a,(#__enf_vy + 1)
	ld	hl,#__enf_vy + 0
	or	a,(hl)
	jp	Z,00167$
;engine/../engine/enemmods/enem_homing_fanty.h:81: cx1 = (_en_x + 4) >> 4;
	ld	hl,#__en_x + 0
	ld	e, (hl)
	ld	d,#0x00
	ld	hl,#0x0004
	add	hl,de
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	iy,#_cx1
	ld	0 (iy),l
;engine/../engine/enemmods/enem_homing_fanty.h:82: cx2 = (_en_x + 11) >> 4;
	ld	hl,#0x000B
	add	hl,de
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	iy,#_cx2
	ld	0 (iy),l
;engine/../engine/enemmods/enem_homing_fanty.h:35: _enf_y = _en_y << FIXBITS;
	ld	iy,#__en_y
	ld	c,0 (iy)
	ld	b,#0x00
;engine/../engine/enemmods/enem_homing_fanty.h:84: if (_enf_vy > 0) {
	xor	a, a
	ld	iy,#__enf_vy
	cp	a, 0 (iy)
	ld	iy,#__enf_vy
	sbc	a, 1 (iy)
	jp	PO, 00598$
	xor	a, #0x80
00598$:
	jp	P,00161$
;engine/../engine/enemmods/enem_homing_fanty.h:85: rdb = 12;
	ld	hl,#_rdb + 0
	ld	(hl), #0x0C
;engine/../engine/enemmods/enem_homing_fanty.h:86: cy1 = cy2 = (_en_y + 11) >> 4;
	ld	hl,#0x000B
	add	hl,bc
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	a,l
	ld	(#_cy2 + 0),a
	ld	(#_cy1 + 0),a
;engine/../engine/enemmods/enem_homing_fanty.h:87: rda = ((cy2 - 1) << 4) + 4;
	ld	a,(#_cy2 + 0)
	add	a,#0xFF
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	hl,#_rda
	add	a, #0x04
	ld	(hl),a
	jr	00162$
00161$:
;engine/../engine/enemmods/enem_homing_fanty.h:89: rdb = 8;
	ld	hl,#_rdb + 0
	ld	(hl), #0x08
;engine/../engine/enemmods/enem_homing_fanty.h:90: cy1 = cy2 = (_en_y + 4) >> 4;
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	hl,#_cy2 + 0
	ld	(hl), c
	ld	hl,#_cy1 + 0
	ld	(hl), c
;engine/../engine/enemmods/enem_homing_fanty.h:91: rda = ((cy1 + 1) << 4) - 4;
	ld	a,(#_cy1 + 0)
	inc	a
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	hl,#_rda
	add	a,#0xFC
	ld	(hl),a
00162$:
;engine/../engine/enemmods/enem_homing_fanty.h:94: cm_two_points ();
	call	_cm_two_points
;engine/../engine/enemmods/enem_homing_fanty.h:95: if ((at1 & rdb) || (at2 & rdb)) {
	ld	a,(#_at1 + 0)
	ld	iy,#_rdb
	and	a, 0 (iy)
	or	a, a
	jr	NZ,00163$
	ld	a,(#_at2 + 0)
	ld	iy,#_rdb
	and	a, 0 (iy)
	or	a, a
	jr	Z,00167$
00163$:
;engine/../engine/enemmods/enem_homing_fanty.h:96: _enf_vy = -_enf_vy;
	xor	a, a
	ld	iy,#__enf_vy
	sub	a, 0 (iy)
	ld	(#__enf_vy + 0),a
	ld	a, #0x00
	ld	iy,#__enf_vy
	sbc	a, 1 (iy)
	ld	(#__enf_vy + 1),a
;engine/../engine/enemmods/enem_homing_fanty.h:97: _en_y = rda;
	ld	a,(#_rda + 0)
	ld	(#__en_y + 0),a
;engine/../engine/enemmods/enem_homing_fanty.h:98: _enf_y = rda << FIXBITS;
	ld	iy,#_rda
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	(__enf_y),hl
00167$:
;engine/../engine/enemmods/enem_homing_fanty.h:105: cx1 = (_en_x + 8) >> 4;
	ld	iy,#__en_x
	ld	l,0 (iy)
	ld	h,#0x00
	ld	bc,#0x0008
	add	hl,bc
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	iy,#_cx1
	ld	0 (iy),l
;engine/../engine/enemmods/enem_homing_fanty.h:106: cy1 = (_en_y + 8) >> 4;
	ld	iy,#__en_y
	ld	l,0 (iy)
	ld	h,#0x00
	ld	bc,#0x0008
	add	hl,bc
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	iy,#_cy1
	ld	0 (iy),l
;engine/../engine/enemmods/enem_homing_fanty.h:107: cm_two_points ();
	call	_cm_two_points
;engine/../engine/enemmods/enem_homing_fanty.h:108: if (at1 & 1) {
	ld	hl,#_at1+0
	bit	0, (hl)
	jr	Z,00169$
;engine/../engine/enemmods/enem_homing_fanty.h:109: en_cttouched [gpit] = 8;
	ld	a,#<(_en_cttouched)
	ld	hl,#_gpit
	add	a, (hl)
	ld	l, a
	ld	a, #>(_en_cttouched)
	adc	a, #0x00
	ld	h, a
	ld	(hl),#0x08
;engine/../engine/enemmods/enem_homing_fanty.h:110: enems_kill ();
	call	_enems_kill
00169$:
;engine/../engine/enemmods/enem_homing_fanty.h:117: en_fr = (_en_x >> 3) & 1;
	ld	a,(#__en_x + 0)
	rrca
	rrca
	rrca
	and	a,#0x1F
	and	a, #0x01
	ld	(#_en_fr + 0),a
;engine/../engine/enemmods/enem_homing_fanty.h:122: rda = (prx < _en_x); enems_facing ();
	ld	hl,#__en_x
	push	de
	ld	iy,#_rda
	push	iy
	pop	de
	ld	a,(#_prx + 0)
	sub	a, (hl)
	ld	a,#0x00
	rla
	ld	(de),a
	pop	de
	call	_enems_facing
;engine/../engine/enemmods/enem_homing_fanty.h:123: en_spr = _en_s + en_fr + _en_facing;
	ld	hl,#_en_fr
	ld	a,(#__en_s + 0)
	add	a, (hl)
	ld	hl,#__en_facing
	ld	iy,#_en_spr
	add	a, (hl)
	ld	0 (iy),a
;engine/enengine.h:543: }
00170$:
;engine/enengine.h:547: en_spr_id [gpit] = en_spr;
	ld	a,#<(_en_spr_id)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_spr_id)
	adc	a, #0x00
	ld	d,a
	ld	a,(#_en_spr + 0)
	ld	(de),a
00173$:
;engine/enengine.h:446: ) {
	ld	a,(#__en_t + 0)
	sub	a, #0x04
	jr	NZ,00600$
	ld	a,#0x01
	jr	00601$
00600$:
	xor	a,a
00601$:
	ld	-9 (ix),a
;engine/../engine/enemmods/enem_homing_fanty.h:35: _enf_y = _en_y << FIXBITS;
	ld	hl,#__en_y + 0
	ld	b, (hl)
	ld	c,#0x00
;engine/enengine.h:584: if (_en_t == 4 && pregotten && !pgotten && !pj) {
	ld	a,-9 (ix)
	or	a, a
	jp	Z,00188$
	ld	a,(#_pregotten + 0)
	or	a, a
	jp	Z,00188$
	ld	a,(#_pgotten + 0)
	or	a, a
	jp	NZ,00188$
	ld	a,(#_pj + 0)
	or	a, a
	jp	NZ,00188$
;engine/../engine/enemmods/enem_linear.h:11: if (!en_status [gpit] || half_life) {
	ld	a,#<(_en_status)
	ld	hl,#_gpit
	add	a, (hl)
	ld	-7 (ix),a
	ld	a,#>(_en_status)
	adc	a, #0x00
	ld	-6 (ix),a
;engine/enengine.h:592: py = (_en_y - 16) << 6; pry = py >> 6;
	ld	a,b
	add	a,#0xF0
	ld	l,a
	ld	a,c
	adc	a,#0xFF
	ld	h,a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	-2 (ix),l
	ld	-1 (ix),h
;engine/enengine.h:588: if (_en_mx) {
	ld	a,(#__en_mx + 0)
	or	a, a
	jp	Z,00179$
;engine/enengine.h:589: if (pry + 16 >= _en_y && pry + 12 <= _en_y) {
	ld	iy,#_pry
	ld	e,0 (iy)
	ld	d,#0x00
	ld	hl,#0x0010
	add	hl,de
	ld	a,l
	sub	a, b
	ld	a,h
	sbc	a, c
	jp	PO, 00602$
	xor	a, #0x80
00602$:
	jp	M,00179$
	ld	hl,#0x000C
	add	hl,de
	ld	a,b
	sub	a, l
	ld	a,c
	sbc	a, h
	jp	PO, 00603$
	xor	a, #0x80
00603$:
	jp	M,00179$
;engine/enengine.h:590: pgotten = 1;
	ld	hl,#_pgotten + 0
	ld	(hl), #0x01
;engine/enengine.h:591: pgtmx = _en_mx << (6 - en_status [gpit]);
	ld	hl,#__en_mx + 0
	ld	d, (hl)
	ld	a,(#__en_mx + 0)
	rla
	sbc	a, a
	ld	e,a
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	l,(hl)
	ld	h,#0x00
	ld	a,#0x06
	sub	a, l
	ld	l,a
	ld	a,#0x00
	sbc	a, h
	ld	a,l
	push	af
	ld	hl,#_pgtmx + 0
	ld	(hl), d
	ld	hl,#_pgtmx + 1
	ld	(hl), e
	pop	af
	inc	a
	jr	00605$
00604$:
	ld	iy,#_pgtmx
	sla	0 (iy)
	ld	iy,#_pgtmx
	rl	1 (iy)
00605$:
	dec	a
	jr	NZ,00604$
;engine/enengine.h:592: py = (_en_y - 16) << 6; pry = py >> 6;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(_py),hl
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
00179$:
;engine/enengine.h:589: if (pry + 16 >= _en_y && pry + 12 <= _en_y) {
	ld	hl,#_pry + 0
	ld	e, (hl)
	ld	d,#0x00
;engine/enengine.h:600: (_en_my > 0 && pry + 16 + _en_my >= _en_y && pry + 12 <= _en_y)
	ld	a,(#__en_my + 0)
	ld	-5 (ix),a
	ld	iy,#__en_my
	ld	a,0 (iy)
	rla
	sbc	a, a
	ld	-4 (ix),a
;engine/enengine.h:599: (_en_my < 0 && pry + 17 >= _en_y && pry + 12 <= _en_y) ||
	ld	hl,#0x000C
	add	hl,de
	ld	a,b
	sub	a, l
	ld	a,c
	sbc	a, h
	jp	PO, 00606$
	xor	a, #0x80
00606$:
	rlca
	and	a,#0x01
	ld	-3 (ix),a
	ld	iy,#__en_my
	bit	7,0 (iy)
	jr	Z,00186$
	ld	hl,#0x0011
	add	hl,de
	ld	a,l
	sub	a, b
	ld	a,h
	sbc	a, c
	jp	PO, 00607$
	xor	a, #0x80
00607$:
	jp	M,00186$
	ld	a,-3 (ix)
	or	a, a
	jr	Z,00180$
00186$:
;engine/enengine.h:600: (_en_my > 0 && pry + 16 + _en_my >= _en_y && pry + 12 <= _en_y)
	xor	a, a
	ld	iy,#__en_my
	sub	a, 0 (iy)
	jp	PO, 00608$
	xor	a, #0x80
00608$:
	jp	P,00188$
	ld	hl,#0x0010
	add	hl,de
	ld	e,-5 (ix)
	ld	d,-4 (ix)
	add	hl,de
	ld	a,l
	sub	a, b
	ld	a,h
	sbc	a, c
	jp	PO, 00609$
	xor	a, #0x80
00609$:
	jp	M,00188$
	ld	a,-3 (ix)
	or	a, a
	jr	NZ,00188$
00180$:
;engine/enengine.h:602: pgotten = 1;
	ld	hl,#_pgotten + 0
	ld	(hl), #0x01
;engine/enengine.h:603: pgtmy = _en_my << (6 - en_status [gpit]);
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	l,(hl)
	ld	h,#0x00
	ld	a,#0x06
	sub	a, l
	ld	l,a
	ld	a,#0x00
	sbc	a, h
	push	af
	ld	a,-5 (ix)
	ld	iy,#_pgtmy
	ld	0 (iy),a
	ld	a,-4 (ix)
	ld	iy,#_pgtmy
	ld	1 (iy),a
	pop	af
	inc	l
	jr	00611$
00610$:
	ld	iy,#_pgtmy
	sla	0 (iy)
	ld	iy,#_pgtmy
	rl	1 (iy)
00611$:
	dec	l
	jr	NZ,00610$
;engine/enengine.h:604: py = (_en_y - 16) << 6; pry = py >> 6;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(_py),hl
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
;engine/enengine.h:605: pvy = 0;
	ld	hl,#0x0000
	ld	(_pvy),hl
00188$:
;engine/enengine.h:617: en_is_alive == 0	// General condition.
	ld	a,(#_en_is_alive + 0)
	or	a, a
	jp	Z,00230$
;engine/enengine.h:619: || en_cttouched [gpit]
	ld	a,#<(_en_cttouched)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_cttouched)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	or	a, a
	jp	NZ,00230$
;engine/enengine.h:645: ) goto skipdo;
	ld	a,-9 (ix)
	or	a, a
	jp	NZ,00230$
;engine/enengine.h:653: pregotten && 
	ld	a,(#_pregotten + 0)
	or	a, a
	jp	Z,00216$
;engine/enengine.h:654: pry < _en_y && 
	ld	hl,#__en_y
	ld	a,(#_pry + 0)
	sub	a, (hl)
	jp	NC,00216$
;engine/enengine.h:655: pry + 15 + ENEMS_COLLISION_VSTRETCH_FG >= _en_y &&
	ld	iy,#_pry
	ld	l,0 (iy)
	ld	h,#0x00
	ld	de,#0x000D
	add	hl,de
	ld	a,l
	sub	a, b
	ld	a,h
	sbc	a, c
	jp	PO, 00612$
	xor	a, #0x80
00612$:
	jp	M,00216$
;engine/enengine.h:656: pgotten == 0 &&	ppossee == 0
	ld	a,(#_pgotten + 0)
	or	a, a
	jp	NZ,00216$
	ld	a,(#_ppossee + 0)
	or	a, a
	jp	NZ,00216$
;engine/enengine.h:669: ) {
	ld	a,#0x20
	ld	iy,#_pvy
	cp	a, 0 (iy)
	ld	a,#0x00
	ld	iy,#_pvy
	sbc	a, 1 (iy)
	jp	PO, 00613$
	xor	a, #0x80
00613$:
	jp	P,00216$
;engine/enengine.h:672: if (res_on || res_disable)
	ld	a,(#_res_on + 0)
	or	a, a
	jr	NZ,00196$
	ld	a,(#_res_disable + 0)
	or	a, a
	jr	Z,00197$
00196$:
;engine/enengine.h:677: enems_hit ();
	call	_enems_hit
00197$:
;engine/enengine.h:680: if (_en_my < 0) _en_my = -_en_my;
	ld	a,(#__en_my + 0)
	bit	7,a
	jr	Z,00200$
	xor	a, a
	ld	iy,#__en_my
	sub	a, 0 (iy)
	ld	(#__en_my + 0),a
00200$:
;engine/enengine.h:684: if (pad0 & PAD_A) {
	ld	hl,#_pad0+0
	bit	5, (hl)
	jr	Z,00202$
;engine/enengine.h:685: jump_start ();
	call	_jump_start
	jr	00203$
00202$:
;engine/enengine.h:689: pvy = -PLAYER_VY_JUMP_INITIAL << 1;
	ld	hl,#0xFF80
	ld	(_pvy),hl
00203$:
;engine/enengine.h:697: if (pry > _en_y - ENEMS_UPPER_COLLISION_BOUND) { pry = _en_y - ENEMS_UPPER_COLLISION_BOUND; py = pry << FIXBITS; }
	ld	a,(#__en_y + 0)
	ld	l, #0x00
	add	a,#0xF4
	ld	e,a
	ld	a,l
	adc	a,#0xFF
	ld	d,a
	ld	iy,#_pry
	ld	l,0 (iy)
	ld	h,#0x00
	ld	a,e
	sub	a, l
	ld	a,d
	sbc	a, h
	jp	PO, 00615$
	xor	a, #0x80
00615$:
	jp	P,00205$
	ld	hl,#_pry
	ld	a,(#__en_y + 0)
	add	a,#0xF4
	ld	(hl),a
	ld	iy,#_pry
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	(_py),hl
00205$:
;engine/enengine.h:699: touched = 1;
	ld	hl,#_touched + 0
	ld	(hl), #0x01
	jr	00230$
00216$:
;engine/enengine.h:707: touched == 0 &&
	ld	a,(#_touched + 0)
	or	a, a
	jr	NZ,00230$
;engine/enengine.h:708: collide ()
	call	_collide
	ld	a,l
	or	a, a
	jr	Z,00230$
;engine/enengine.h:714: en_sg_1 = 0;
	ld	hl,#_en_sg_1 + 0
	ld	(hl), #0x00
;engine/enengine.h:718: en_sg_2 = (pflickering == 0);
	ld	a,(#_pflickering + 0)
	or	a, a
	jr	NZ,00616$
	ld	a,#0x01
	jr	00617$
00616$:
	xor	a,a
00617$:
	ld	(#_en_sg_2 + 0),a
;engine/enengine.h:727: ) en_sg_2 = 0;
	ld	a,(#_res_on + 0)
	dec	a
	jr	NZ,00207$
	ld	hl,#_en_sg_2 + 0
	ld	(hl), #0x00
00207$:
;engine/enengine.h:751: if (en_sg_1) enems_hit ();
	ld	a,(#_en_sg_1 + 0)
	or	a, a
	jr	Z,00209$
	call	_enems_hit
00209$:
;engine/enengine.h:753: if (en_sg_2) { 
	ld	a,(#_en_sg_2 + 0)
	or	a, a
	jr	Z,00211$
;engine/enengine.h:754: pkill = 1; 
	ld	hl,#_pkill + 0
	ld	(hl), #0x01
00211$:
;engine/enengine.h:769: touched = 1; 
	ld	hl,#_touched + 0
	ld	(hl), #0x01
;engine/enengine.h:890: skipdo: 
00230$:
;engine/enengine.h:893: if (en_spr != 0xff) {
	ld	a,(#_en_spr + 0)
	inc	a
	jr	Z,00232$
;engine/enengine.h:896: spr_enems [en_spr]
	ld	iy,#_en_spr
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ex	de,hl
	ld	hl,(_spr_enems)
	add	hl,de
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;engine/enengine.h:895: _en_x + en_spr_x_mod, _en_y + SPRITE_ADJUST, 
	ld	a,(#__en_y + 0)
	add	a, #0xF7
	ld	d,a
	ld	hl,#_en_spr_x_mod
	ld	a,(#__en_x + 0)
	add	a, (hl)
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	call	_SG_addMetaSprite1x1
	pop	af
	pop	af
00232$:
;engine/enengine.h:902: enems_update_unsigned_char_arrays ();
	call	_enems_update_unsigned_char_arrays
	jp	00233$
00236$:
	ld	sp, ix
	pop	ix
	ret
;engine/../my/game_frame.h:7: void draw_game_frame (void) {
;	---------------------------------
; Function draw_game_frame
; ---------------------------------
_draw_game_frame::
;engine/../my/game_frame.h:8: gp_gen = hud_rle; unrle ();
	ld	hl,#_hud_rle+0
	ld	(_gp_gen),hl
	jp  _unrle
;engine/frame.h:9: void hud_update (void) {
;	---------------------------------
; Function hud_update
; ---------------------------------
_hud_update::
;engine/frame.h:12: if (okilled != pkilled) {
	ld	a,(#_okilled + 0)
	ld	iy,#_pkilled
	sub	a, 0 (iy)
	jr	Z,00102$
;engine/frame.h:13: okilled = pkilled;
	ld	a,(#_pkilled + 0)
	ld	(#_okilled + 0),a
;engine/frame.h:14: _x = KILLED_X; _y = KILLED_Y; _n = c_max_enems - pkilled; p_t ();
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
;engine/frame.h:32: if (okeys != pkeys) {
	ld	a,(#_okeys + 0)
	ld	iy,#_pkeys
	sub	a, 0 (iy)
	jr	Z,00104$
;engine/frame.h:33: okeys = pkeys;
	ld	hl,#_pkeys + 0
	ld	d, (hl)
	ld	hl,#_okeys + 0
	ld	(hl), d
;engine/frame.h:34: _x = KEYS_X; _y = KEYS_Y; _n = pkeys; p_t ();
	ld	hl,#__x + 0
	ld	(hl), #0x0C
	ld	hl,#__y + 0
	ld	(hl), #0x01
	ld	hl,#__n + 0
	ld	(hl), d
	call	_p_t
00104$:
;engine/frame.h:39: if (olife != plife) {
	ld	a,(#_olife + 0)
	ld	iy,#_plife
	sub	a, 0 (iy)
	ret	Z
;engine/frame.h:40: olife = plife;
	ld	hl,#_plife + 0
	ld	d, (hl)
	ld	hl,#_olife + 0
	ld	(hl), d
;engine/frame.h:41: _x = LIFE_X; _y = LIFE_Y; _n = plife; p_t ();
	ld	hl,#__x + 0
	ld	(hl), #0x04
	ld	hl,#__y + 0
	ld	(hl), #0x01
	ld	hl,#__n + 0
	ld	(hl), d
	jp  _p_t
;my/pres.h:6: void bat_in (void) {
;	---------------------------------
; Function bat_in
; ---------------------------------
_bat_in::
;my/pres.h:7: SG_displayOn ();
	ld	hl,#0x0140
	push	hl
	call	_SG_VDPturnOnFeature
	pop	af
;my/pres.h:8: while (SG_getKeysStatus ());
00101$:
	call	_SG_getKeysStatus
	ld	a,h
	or	a,l
	jr	NZ,00101$
	ret
;my/pres.h:11: void bat_out (void) {
;	---------------------------------
; Function bat_out
; ---------------------------------
_bat_out::
;my/pres.h:12: PSGStop ();
	call	_PSGStop
;my/pres.h:13: SG_displayOff ();
	ld	hl,#0x0140
	push	hl
	call	_SG_VDPturnOffFeature
	pop	af
;my/pres.h:14: SG_initSprites ();
	call	_SG_initSprites
;my/pres.h:15: UNSAFE_SG_copySpritestoSAT ();	
	jp  _UNSAFE_SG_copySpritestoSAT
;my/pres.h:18: void pres (void (*func) (void)) {
;	---------------------------------
; Function pres
; ---------------------------------
_pres::
;my/pres.h:19: cls ();
	call	_cls
;my/pres.h:20: (*func) ();
	pop	bc
	pop	hl
	push	hl
	push	bc
	call	___sdcc_call_hl
;my/pres.h:21: bat_in ();
	call	_bat_in
;my/pres.h:22: while (1) {
00104$:
;my/pres.h:23: pad_read ();
	call	_pad_read
;my/pres.h:24: if (pad_this_frame & (PAD_A|PAD_B|PAD_START)) break;
	ld	a,(#_pad_this_frame + 0)
	and	a, #0x30
	jr	Z,00104$
;my/pres.h:26: bat_out ();
	jp  _bat_out
;my/pres.h:29: void title (void) {
;	---------------------------------
; Function title
; ---------------------------------
_title::
;my/pres.h:30: unpack_bg_patterns (tstitle_patterns_c, tstitle_colours_c, 64*8, 7);
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
;my/pres.h:31: gp_gen = title_rle; unrle ();
	ld	hl,#_title_rle+0
	ld	(_gp_gen),hl
	call	_unrle
;my/pres.h:33: _x = 7; _y = 12; pr_str ("SELECT AND PUSH 1!");
	ld	hl,#__x + 0
	ld	(hl), #0x07
	ld	hl,#__y + 0
	ld	(hl), #0x0C
	ld	hl,#___str_0
	push	hl
	call	_pr_str
	pop	af
;my/pres.h:35: _x = 12; _y = 16; pr_str ("RESONATORS");
	ld	hl,#__x + 0
	ld	(hl), #0x0C
	ld	hl,#__y + 0
	ld	(hl), #0x10
	ld	hl,#___str_1
	push	hl
	call	_pr_str
	pop	af
;my/pres.h:36: _y = 18; pr_str ("EASY MODE");
	ld	hl,#__y + 0
	ld	(hl), #0x12
	ld	hl,#___str_2
	push	hl
	call	_pr_str
	pop	af
;my/pres.h:38: _x = 5; _y = 23; pr_str ("@ 2018 THE MOJON TWINS");
	ld	hl,#__x + 0
	ld	(hl), #0x05
	ld	hl,#__y + 0
	ld	(hl), #0x17
	ld	hl,#___str_3
	push	hl
	call	_pr_str
	pop	af
;my/pres.h:40: bat_in ();
	call	_bat_in
;my/pres.h:42: while (1) {
00113$:
;my/pres.h:43: update_cycle ();
	call	_update_cycle
;my/pres.h:44: SG_addMetaSprite1x1 (82, 122 + (mode_no_resonators << 4), ss_pl_00);
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
;my/pres.h:45: pad_read ();
	call	_pad_read
;my/pres.h:46: rda = mode_no_resonators;
	ld	a,(#_mode_no_resonators + 0)
	ld	(#_rda + 0),a
;my/pres.h:47: if (pad_this_frame & PAD_DOWN) {
	ld	hl,#_pad_this_frame+0
	bit	1, (hl)
	jr	Z,00104$
;my/pres.h:48: ++ mode_no_resonators; if (mode_no_resonators == 2) mode_no_resonators = 0;
	ld	hl, #_mode_no_resonators+0
	inc	(hl)
	ld	a,(#_mode_no_resonators + 0)
	sub	a, #0x02
	jr	NZ,00104$
	ld	hl,#_mode_no_resonators + 0
	ld	(hl), #0x00
00104$:
;my/pres.h:50: if (pad_this_frame & PAD_UP) {
	ld	hl,#_pad_this_frame+0
	bit	0, (hl)
	jr	Z,00109$
;my/pres.h:51: if (mode_no_resonators) -- mode_no_resonators; else mode_no_resonators = 1;
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
;my/pres.h:54: if (pad_this_frame & PAD_1) break;
	ld	hl,#_pad_this_frame+0
	bit	4, (hl)
	jr	Z,00113$
;my/pres.h:60: plife = mode_no_resonators ? 5 : 3;
	ld	a,(#_mode_no_resonators + 0)
	or	a, a
	jr	Z,00117$
	ld	a,#0x05
	jr	00118$
00117$:
	ld	a,#0x03
00118$:
	ld	(#_plife + 0),a
;my/pres.h:62: bat_out ();
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
;my/pres.h:65: void scr_game_over (void) {
;	---------------------------------
; Function scr_game_over
; ---------------------------------
_scr_game_over::
;my/pres.h:66: _x = 11; _y = 15; pr_str ("GAME OVER!");
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
;my/pres.h:69: void scr_the_end (void) {
;	---------------------------------
; Function scr_the_end
; ---------------------------------
_scr_the_end::
;my/pres.h:70: _x = 6; _y = 6; pr_str (" CHERIL VANQUISHED%    ALL ZOMBIES%AND RETURNED SAFELY%   TO THE BOSQUE");
	ld	hl,#__x + 0
	ld	(hl), #0x06
	ld	hl,#__y + 0
	ld	(hl), #0x06
	ld	hl,#___str_5
	push	hl
	call	_pr_str
	pop	af
;my/pres.h:72: _x = 12; _y = 25; pr_str ("THE  END");
	ld	hl,#__x + 0
	ld	(hl), #0x0C
	ld	hl,#__y + 0
	ld	(hl), #0x19
	ld	hl,#___str_6
	push	hl
	call	_pr_str
	pop	af
	ret
___str_5:
	.ascii " CHERIL VANQUISHED%    ALL ZOMBIES%AND RETURNED SAFELY%   TO"
	.ascii " THE BOSQUE"
	.db 0x00
___str_6:
	.ascii "THE  END"
	.db 0x00
;my/pres.h:80: void scr_level (void) {
;	---------------------------------
; Function scr_level
; ---------------------------------
_scr_level::
;my/pres.h:81: _x = 12; _y = 14; pr_str ("LEVEL 0"); SG_setTile (17+level);
	ld	hl,#__x + 0
	ld	(hl), #0x0C
	ld	hl,#__y + 0
	ld	(hl), #0x0E
	ld	hl,#___str_7
	push	hl
	call	_pr_str
	pop	af
	ld	a,(#_level + 0)
	add	a, #0x11
	push	af
	inc	sp
	call	_SG_setTile
	inc	sp
;my/pres.h:82: _x = 10; _y = 16; pr_str (levelnames [level]);
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
_levelnames:
	.dw _level0name
	.dw _level1name
	.dw _level2name
___str_7:
	.ascii "LEVEL 0"
	.db 0x00
;my/pres.h:85: void credits (void) {
;	---------------------------------
; Function credits
; ---------------------------------
_credits::
;my/pres.h:86: cls ();
	call	_cls
;my/pres.h:87: rds16 = 0; rdy = 240;
	ld	hl,#0x0000
	ld	(_rds16),hl
	ld	hl,#_rdy + 0
	ld	(hl), #0xF0
;my/pres.h:89: _x = 0; _y = 19; 
	ld	hl,#__x + 0
	ld	(hl), #0x00
	ld	hl,#__y + 0
	ld	(hl), #0x13
;my/pres.h:90: pr_str ("     CHERIL PERIL CLASSIC%%         ORIGINAL GAME%   @ 2011 BY THE MOJON TWINS%       REPROGRAMMED GAME%@ 2014, 2018 BY THE MOJON TWINS");
	ld	hl,#___str_11+0
	push	hl
	call	_pr_str
;my/pres.h:92: SG_displayOn ();
	ld	hl, #0x0140
	ex	(sp),hl
	call	_SG_VDPturnOnFeature
	pop	af
;my/pres.h:94: while (!(SG_getKeysStatus () & PAD_START) && rds16 < 300) {
00102$:
	call	_SG_getKeysStatus
	bit	4, l
	jr	NZ,00104$
	ld	a,(#_rds16 + 0)
	sub	a, #0x2C
	ld	a,(#_rds16 + 1)
	rla
	ccf
	rra
	sbc	a, #0x81
	jr	NC,00104$
;my/pres.h:97: update_cycle ();
	call	_update_cycle
;my/pres.h:98: rds16 ++;
	ld	hl, #_rds16+0
	inc	(hl)
	jr	NZ,00102$
	ld	hl, #_rds16+1
	inc	(hl)
	jr	00102$
00104$:
;my/pres.h:101: SG_displayOff ();
	ld	hl,#0x0140
	push	hl
	call	_SG_VDPturnOffFeature
	pop	af
	ret
___str_11:
	.ascii "     CHERIL PERIL CLASSIC%%         ORIGINAL GAME%   @ 2011 "
	.ascii "BY THE MOJON TWINS%       REPROGRAMMED GAME%@ 2014, 2018 BY "
	.ascii "THE MOJON TWINS"
	.db 0x00
;mainloop/flickscreen.h:7: void flickscreen_do_horizontal (void) {
;	---------------------------------
; Function flickscreen_do_horizontal
; ---------------------------------
_flickscreen_do_horizontal::
;mainloop/flickscreen.h:12: (cfx + pvx) < 0
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
;mainloop/flickscreen.h:8: if (prx == 4 && 
	ld	a,(#_prx + 0)
	sub	a, #0x04
	jr	NZ,00105$
;mainloop/flickscreen.h:12: (cfx + pvx) < 0
	bit	7, e
	jr	Z,00105$
;mainloop/flickscreen.h:15: -- n_pant;
	ld	hl, #_n_pant+0
	dec	(hl)
;mainloop/flickscreen.h:16: px = 244 << FIXBITS;
	ld	hl,#0x3D00
	ld	(_px),hl
	ret
00105$:
;mainloop/flickscreen.h:17: } else if (prx == 244 && 
	ld	iy,#_prx
	ld	a,0 (iy)
	sub	a, #0xF4
	ret	NZ
;mainloop/flickscreen.h:21: (cfx + pvx) > 0
	xor	a, a
	cp	a, d
	sbc	a, e
	jp	PO, 00130$
	xor	a, #0x80
00130$:
	ret	P
;mainloop/flickscreen.h:24: ++ n_pant;
	ld	hl, #_n_pant+0
	inc	(hl)
;mainloop/flickscreen.h:25: px = 4 << FIXBITS;
	ld	hl,#0x0100
	ld	(_px),hl
	ret
;mainloop/flickscreen.h:29: void flickscreen_do_vertical (void) {
;	---------------------------------
; Function flickscreen_do_vertical
; ---------------------------------
_flickscreen_do_vertical::
;mainloop/flickscreen.h:42: if (pry == 0 && pvy < 0 && n_pant >= c_map_w) {
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
;mainloop/flickscreen.h:43: n_pant -= c_map_w;
	ld	hl,#_c_map_w
	push	de
	ld	iy,#_n_pant
	push	iy
	pop	de
	ld	a,(de)
	sub	a, (hl)
	ld	(de),a
	pop	de
;mainloop/flickscreen.h:44: py = 192 << FIXBITS;
	ld	hl,#0x3000
	ld	(_py),hl
;mainloop/flickscreen.h:45: if (pvy > -PLAYER_VY_JUMP_MAX) pvy = -PLAYER_VY_JUMP_MAX;
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
;mainloop/flickscreen.h:46: } else if (pry >= 192 && pvy > 0 && n_pant < c_map_size - c_map_w) {
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
;mainloop/flickscreen.h:47: n_pant += c_map_w;
	ld	hl,#_c_map_w
	push	de
	ld	iy,#_n_pant
	push	iy
	pop	de
	ld	a,(de)
	add	a, (hl)
	ld	(de),a
	pop	de
;mainloop/flickscreen.h:48: py = 0;
	ld	hl,#0x0000
	ld	(_py),hl
	ret
;mainloop.h:7: void game_init (void) {
;	---------------------------------
; Function game_init
; ---------------------------------
_game_init::
;mainloop.h:9: win_level = game_over = 0;
	ld	hl,#_game_over + 0
	ld	(hl), #0x00
	ld	hl,#_win_level + 0
	ld	(hl), #0x00
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
;mainloop/asset_setup.h:10: c_behs = 		l_behs [level];
	ld	hl,#_l_behs
	add	hl,bc
	ld	a,(hl)
	ld	iy,#_c_behs
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_c_behs + 1),a
;mainloop/asset_setup.h:11: spr_enems = 	l_spr_enems [level];
	ld	hl,#_l_spr_enems
	add	hl,bc
	ld	a,(hl)
	ld	iy,#_spr_enems
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_spr_enems + 1),a
;mainloop/asset_setup.h:13: c_map = 		l_map [level];
	ld	hl,#_l_map
	add	hl,bc
	ld	a,(hl)
	ld	iy,#_c_map
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_c_map + 1),a
;mainloop/asset_setup.h:20: c_decos = 	l_decos [level];
	ld	a,#<(_l_decos)
	ld	hl,#_level
	add	a, (hl)
	ld	e,a
	ld	a,#>(_l_decos)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#_c_decos + 0),a
;mainloop/asset_setup.h:23: c_locks = 	l_locks [level];
	ld	hl,#_l_locks
	add	hl,bc
	ld	a,(hl)
	ld	iy,#_c_locks
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_c_locks + 1),a
;mainloop/asset_setup.h:25: l_n_bolts [level];
	ld	a,#<(_l_n_bolts)
	ld	hl,#_level
	add	a, (hl)
	ld	e,a
	ld	a,#>(_l_n_bolts)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#_c_max_bolts + 0),a
;mainloop/asset_setup.h:28: c_enems = 		l_enems [level];
	ld	hl,#_l_enems
	add	hl,bc
	ld	a,(hl)
	ld	iy,#_c_enems
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_c_enems + 1),a
;mainloop/asset_setup.h:29: c_hotspots = 	l_hotspots [level];	
	ld	hl,#_l_hotspots
	add	hl,bc
	ld	a,(hl)
	ld	iy,#_c_hotspots
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_c_hotspots + 1),a
;mainloop/asset_setup.h:31: c_max_enems = 	l_player_max_enems [level];
	ld	a,#<(_l_player_max_enems)
	ld	hl,#_level
	add	a, (hl)
	ld	e,a
	ld	a,#>(_l_player_max_enems)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#_c_max_enems + 0),a
;mainloop/asset_setup.h:33: c_map_w = 		l_map_w [level];
	ld	a,#<(_l_map_w)
	ld	hl,#_level
	add	a, (hl)
	ld	e,a
	ld	a,#>(_l_map_w)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#_c_map_w + 0),a
;mainloop/asset_setup.h:34: c_map_h = 		l_map_h [level];
	ld	a,#<(_l_map_h)
	ld	hl,#_level
	add	a, (hl)
	ld	e,a
	ld	a,#>(_l_map_h)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
;mainloop/asset_setup.h:84: rda = c_map_h; c_map_size = 0; while (rda --) c_map_size += c_map_w;
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
;my/level_pattern_unpacker.h:3: unpack_bg_patterns (l_ts_patterns [level], l_ts_colours [level], 64*8, 7);
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
;my/level_pattern_unpacker.h:4: aPLib_depack_VRAM (SGT_BASE + 160*8, l_spr_patterns [level]);
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
;mainloop.h:17: cls ();
	call	_cls
;mainloop.h:19: draw_game_frame ();
	call	_draw_game_frame
;mainloop.h:22: hotspots_load ();
	call	_hotspots_load
;mainloop.h:25: memfill (lkact, 1, c_max_bolts);
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
;mainloop.h:28: if (!warp_to_level)	{
	ld	a,(#_warp_to_level + 0)
	or	a, a
	jr	NZ,00105$
;mainloop.h:29: n_pant = SCR_INI;
	ld	de,#_l_scr_ini+0
	ld	hl,(_level)
	ld	h,#0x00
	add	hl,de
	ld	a,(hl)
	ld	(#_n_pant + 0),a
;mainloop.h:30: px = (4 + (PLAYER_INI_X << 4)) << FIXBITS;
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
;mainloop.h:31: py = (PLAYER_INI_Y << 4) << FIXBITS;
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
;mainloop.h:33: player_to_pixels ();
	call	_player_to_pixels
;mainloop.h:34: player_init ();
	call	_player_init
;mainloop.h:41: enems_persistent_deaths_load ();
	call	_enems_persistent_deaths_load
;mainloop.h:53: pkeys = 0;
	ld	hl,#_pkeys + 0
	ld	(hl), #0x00
;mainloop.h:57: res_on = 0;
	ld	hl,#_res_on + 0
	ld	(hl), #0x00
;mainloop.h:58: res_disable = 0;
	ld	hl,#_res_disable + 0
	ld	(hl), #0x00
;mainloop.h:66: no_ct = 0;
	ld	hl,#_no_ct + 0
	ld	(hl), #0x00
;mainloop.h:105: half_life = 0;
	ld	hl,#_half_life + 0
	ld	(hl), #0x00
;mainloop.h:106: frame_counter = 0;
	ld	hl,#_frame_counter + 0
	ld	(hl), #0x00
;mainloop.h:107: olife = oammo = oobjs = okeys = 0xff;
	ld	hl,#_okeys + 0
	ld	(hl), #0xFF
	ld	hl,#_oobjs + 0
	ld	(hl), #0xFF
	ld	hl,#_oammo + 0
	ld	(hl), #0xFF
	ld	hl,#_olife + 0
	ld	(hl), #0xFF
;mainloop.h:108: okilled = 0xff;
	ld	hl,#_okilled + 0
	ld	(hl), #0xFF
;my/extra_inits.h:7: springs_on = (level == 1);
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
;mainloop.h:117: void prepare_scr (void) {
;	---------------------------------
; Function prepare_scr
; ---------------------------------
_prepare_scr::
;mainloop.h:118: SG_displayOff ();
	ld	hl,#0x0140
	push	hl
	call	_SG_VDPturnOffFeature
	pop	af
;mainloop.h:128: ft = 0;
	ld	iy,#_ft
	ld	0 (iy),#0x00
;mainloop.h:130: update_list [update_index] = 0xff;
	ld	a,(#_update_index + 0)
	add	a, #<(_update_list)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_update_list)
	ld	h, a
	ld	(hl),#0xFF
;mainloop.h:131: SG_doUpdateList ();
	call	_SG_doUpdateList
;mainloop.h:132: clear_update_list ();
	call	_clear_update_list
;mainloop.h:144: enems_load ();
	call	_enems_load
;mainloop.h:145: hotspots_create ();	
	call	_hotspots_create
;mainloop.h:162: chac_chacs_queue_write = chac_chacs_queue_read = 0;
	ld	hl,#_chac_chacs_queue_read + 0
	ld	(hl), #0x00
	ld	hl,#_chac_chacs_queue_write + 0
	ld	(hl), #0x00
;mainloop.h:163: max_chac_chacs = 0;
	ld	hl,#_max_chac_chacs + 0
	ld	(hl), #0x00
;mainloop.h:172: draw_scr ();
	call	_draw_scr
;mainloop.h:210: SG_initSprites ();
	call	_SG_initSprites
;my/on_entering_screen.h:8: if (mode_no_resonators) {
	ld	a,(#_mode_no_resonators + 0)
	or	a, a
	jr	Z,00104$
;my/on_entering_screen.h:9: res_disable = 1;
	ld	hl,#_res_disable + 0
	ld	(hl), #0x01
;my/on_entering_screen.h:10: if (hrt == HOTSPOT_TYPE_RESONATOR) hrt = 0;
	ld	a,(#_hrt + 0)
	sub	a, #0x04
	jr	NZ,00104$
	ld	hl,#_hrt + 0
	ld	(hl), #0x00
00104$:
;mainloop.h:227: gpit = 3; while (gpit --) en_spr_id [gpit] = en_s [gpit];
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
;mainloop.h:229: prx = px >> FIXBITS; pry = py >> FIXBITS;
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
;mainloop.h:234: player_move ();
	call	_player_move
;mainloop.h:235: enems_move ();
	call	_enems_move
;mainloop.h:237: if (hrt) hotspots_paint ();
	ld	a,(#_hrt + 0)
	or	a, a
	jr	Z,00109$
	call	_hotspots_paint
00109$:
;mainloop.h:252: hud_update ();
	call	_hud_update
;mainloop.h:253: UNSAFE_SG_copySpritestoSAT ();
	call	_UNSAFE_SG_copySpritestoSAT
;mainloop.h:254: update_list [update_index] = 0xff;
	ld	a,(#_update_index + 0)
	add	a, #<(_update_list)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_update_list)
	ld	h, a
	ld	(hl),#0xFF
;mainloop.h:255: SG_doUpdateList ();
	call	_SG_doUpdateList
;mainloop.h:256: clear_update_list ();	
	call	_clear_update_list
;mainloop.h:257: SG_displayOn ();
	ld	hl,#0x0140
	push	hl
	call	_SG_VDPturnOnFeature
	pop	af
	ret
;mainloop.h:260: void game_loop (void) {
;	---------------------------------
; Function game_loop
; ---------------------------------
_game_loop::
;mainloop.h:267: clear_update_list ();
	call	_clear_update_list
;mainloop.h:270: on_pant = 99; ft = 1; fade_delay = 1;
	ld	hl,#_on_pant + 0
	ld	(hl), #0x63
	ld	hl,#_ft + 0
	ld	(hl), #0x01
	ld	hl,#_fade_delay + 0
	ld	(hl), #0x01
;mainloop.h:274: SG_displayOn ();
	ld	hl,#0x0140
	push	hl
	call	_SG_VDPturnOnFeature
	pop	af
;mainloop.h:285: ntsc_frame = level_reset = warp_to_level = 0; 
	ld	hl,#_warp_to_level + 0
	ld	(hl), #0x00
	ld	hl,#_level_reset + 0
	ld	(hl), #0x00
	ld	hl,#_ntsc_frame + 0
	ld	(hl), #0x00
;mainloop.h:286: ticker = 50;
	ld	hl,#_ticker + 0
	ld	(hl), #0x32
;mainloop.h:288: while (1) {
00167$:
;mainloop.h:295: hud_update ();
	call	_hud_update
;mainloop.h:299: if (pkill) player_kill ();
	ld	a,(#_pkill + 0)
	or	a, a
	jr	Z,00102$
	call	_player_kill
00102$:
;mainloop.h:300: if (game_over || level_reset) break;			
	ld	a,(#_game_over + 0)
	or	a, a
	jp	NZ,00168$
	ld	a,(#_level_reset + 0)
	or	a, a
	jp	NZ,00168$
;mainloop.h:304: flick_override = 0;
	ld	hl,#_flick_override + 0
	ld	(hl), #0x00
;mainloop.h:307: flickscreen_do_horizontal ();
	call	_flickscreen_do_horizontal
;mainloop.h:308: flickscreen_do_vertical ();
	call	_flickscreen_do_vertical
;mainloop.h:313: if (on_pant != n_pant) {
	ld	a,(#_on_pant + 0)
	ld	iy,#_n_pant
	sub	a, 0 (iy)
	jr	Z,00109$
;mainloop.h:314: prepare_scr ();
	call	_prepare_scr
;mainloop.h:315: on_pant = n_pant;
	ld	a,(#_n_pant + 0)
	ld	(#_on_pant + 0),a
00109$:
;mainloop.h:334: SG_waitForVBlank ();
	call	_SG_waitForVBlank
;mainloop.h:335: UNSAFE_SG_copySpritestoSAT ();
	call	_UNSAFE_SG_copySpritestoSAT
;mainloop.h:336: update_list [update_index] = 0xff;
	ld	a,#<(_update_list)
	ld	hl,#_update_index
	add	a, (hl)
	ld	l, a
	ld	a, #>(_update_list)
	adc	a, #0x00
	ld	h, a
	ld	(hl),#0xFF
;mainloop.h:337: SG_doUpdateList ();
	call	_SG_doUpdateList
;mainloop.h:338: clear_update_list ();
	call	_clear_update_list
;mainloop.h:342: pad_read ();
	call	_pad_read
;mainloop.h:343: a_button = (pad_this_frame & PAD_A);
	ld	a,(#_pad_this_frame + 0)
	and	a, #0x20
	ld	h,a
	ld	iy,#_a_button
	ld	0 (iy),h
;mainloop.h:344: b_button = (pad_this_frame & PAD_B);
	ld	a,(#_pad_this_frame + 0)
	and	a, #0x10
	ld	h,a
	ld	iy,#_b_button
	ld	0 (iy),h
;mainloop.h:348: ntsc_frame ++; if (ntsc_frame == 6) ntsc_frame = 0;
	ld	hl, #_ntsc_frame+0
	inc	(hl)
	ld	a,(#_ntsc_frame + 0)
	sub	a, #0x06
	jr	NZ,00111$
	ld	hl,#_ntsc_frame + 0
	ld	(hl), #0x00
00111$:
;mainloop.h:350: if (paused == 0 && (ntsc == 0 || ntsc_frame)) {
	ld	a,(#_paused + 0)
	or	a, a
	jp	NZ,00159$
	ld	a,(#_ntsc + 0)
	or	a, a
	jr	Z,00158$
	ld	a,(#_ntsc_frame + 0)
	or	a, a
	jp	Z,00159$
00158$:
;mainloop.h:351: SG_initSprites ();
	call	_SG_initSprites
;mainloop.h:354: if (ticker) -- ticker; else ticker = 50;
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
;mainloop.h:355: half_life ^= 1;
	ld	a,(#_half_life + 0)
	xor	a, #0x01
	ld	iy,#_half_life
	ld	0 (iy),a
;mainloop.h:356: ++ frame_counter;
	ld	iy,#_frame_counter
	inc	0 (iy)
;mainloop/hotspots.h:6: if (hrt) {
	ld	a,(#_hrt + 0)
	or	a, a
	jp	Z,00131$
;mainloop/hotspots.h:7: if (collide_in (prx + 4, pry + 8, hrx, hry)) {
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
	jp	Z,00131$
;mainloop/hotspots.h:9: if (hrt == HOTSPOT_TYPE_RESONATOR) {
	ld	a,(#_hrt + 0)
	sub	a, #0x04
	jr	NZ,00126$
;mainloop/hotspots.h:10: if (pvy > 0 && pry < hry) {
	xor	a, a
	ld	iy,#_pvy
	cp	a, 0 (iy)
	ld	iy,#_pvy
	sbc	a, 1 (iy)
	jp	PO, 00309$
	xor	a, #0x80
00309$:
	jp	P,00131$
	ld	hl,#_hry
	ld	a,(#_pry + 0)
	sub	a, (hl)
	jr	NC,00131$
;mainloop/hotspots.h:11: if (res_on == 0) {
	ld	a,(#_res_on + 0)
	or	a, a
	jr	NZ,00131$
;mainloop/hotspots.h:12: res_on = 1; res_ct = 9; res_subct = 50;
	ld	hl,#_res_on + 0
	ld	(hl), #0x01
	ld	hl,#_res_ct + 0
	ld	(hl), #0x09
	ld	hl,#_res_subct + 0
	ld	(hl), #0x32
;mainloop/hotspots.h:13: jump_start ();
	call	_jump_start
	jr	00131$
00126$:
;mainloop/hotspots.h:128: rda = 0;
	ld	iy,#_rda
	ld	0 (iy),#0x00
;mainloop/hotspots.h:129: switch (hrt) {
	ld	a,(#_hrt + 0)
	cp	a,#0x02
	jr	Z,00120$
	sub	a, #0x03
	jr	Z,00121$
	jr	00122$
;mainloop/hotspots.h:151: case HOTSPOT_TYPE_KEYS:
00120$:
;mainloop/hotspots.h:152: ++ pkeys;
	ld	iy,#_pkeys
	inc	0 (iy)
;mainloop/hotspots.h:153: rda = SFX_OBJECT;
	ld	iy,#_rda
	ld	0 (iy),#0x02
;mainloop/hotspots.h:154: break;
	jr	00122$
;mainloop/hotspots.h:156: case HOTSPOT_TYPE_REFILL:
00121$:
;mainloop/hotspots.h:157: plife += PLAYER_REFILL;
	ld	iy,#_plife
	inc	0 (iy)
;mainloop/hotspots.h:161: rda = SFX_USE;
	ld	iy,#_rda
	ld	0 (iy),#0x03
;mainloop/hotspots.h:191: }
00122$:
;mainloop/hotspots.h:192: if (rda) {
	ld	a,(#_rda + 0)
	or	a, a
	jr	Z,00131$
;mainloop/hotspots.h:194: hrt = 0;
	ld	hl,#_hrt + 0
	ld	(hl), #0x00
;mainloop/hotspots.h:195: hact [n_pant] = 0;
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
;mainloop.h:376: if (!warp_to_level) {
	ld	a,(#_warp_to_level + 0)
	or	a, a
	jr	NZ,00133$
;mainloop.h:377: player_move ();
	call	_player_move
00133$:
;my/extra_checks.h:14: if (c_max_enems == pkilled) {
	ld	a,(#_c_max_enems + 0)
	ld	iy,#_pkilled
	sub	a, 0 (iy)
	jr	NZ,00139$
;my/extra_checks.h:16: en_cttouched [0] == 0 &&
	ld	a, (#_en_cttouched + 0)
	or	a, a
	jr	NZ,00139$
;my/extra_checks.h:17: en_cttouched [1] == 0 &&
	ld	a, (#_en_cttouched + 1)
	or	a, a
	jr	NZ,00139$
;my/extra_checks.h:18: en_cttouched [2] == 0
	ld	a, (#_en_cttouched + 2)
	or	a, a
	jr	NZ,00139$
;my/extra_checks.h:19: ) win_level = 1;
	ld	hl,#_win_level + 0
	ld	(hl), #0x01
00139$:
;mainloop/win_level_condition.h:10: win_level
	ld	a,(#_win_level + 0)
	or	a, a
	jr	Z,00141$
;mainloop/win_level_condition.h:23: PSGStop ();
	call	_PSGStop
;mainloop/win_level_condition.h:24: delay (50);
	ld	a,#0x32
	push	af
	inc	sp
	call	_delay
	inc	sp
;mainloop/win_level_condition.h:25: break;
	jp	00168$
00141$:
;mainloop.h:414: cur_stp = SG_getStp (); 
	call	_SG_getStp
	ld	(_cur_stp),hl
;mainloop.h:415: if (!warp_to_level)	player_render ();
	ld	a,(#_warp_to_level + 0)
	or	a, a
	jr	NZ,00143$
	call	_player_render
00143$:
;mainloop.h:419: enems_move ();
	call	_enems_move
;mainloop.h:423: if (warp_to_level) {
	ld	a,(#_warp_to_level + 0)
	or	a, a
	jr	Z,00145$
;mainloop.h:424: update_cycle (); PSGStop (); break;
	call	_update_cycle
	call	_PSGStop
	jp	00168$
00145$:
;mainloop/resonators.h:5: if (res_on) {
	ld	a,(#_res_on + 0)
	or	a, a
	jr	Z,00153$
;mainloop/resonators.h:7: gp_addr = ((RESONATOR_COUNTER_Y << 5) | RESONATOR_COUNTER_X) + PNTADDRESS;
	ld	hl,#0x183D
	ld	(_gp_addr),hl
;mainloop/resonators.h:8: _n = 16 + res_ct; 
	ld	hl,#__n
	ld	a,(#_res_ct + 0)
	add	a, #0x10
	ld	(hl),a
;mainloop/resonators.h:9: ul_putc ();
	call	_ul_putc
;mainloop/resonators.h:12: if (res_subct) -- res_subct; else {
	ld	a,(#_res_subct + 0)
	or	a, a
	jr	Z,00150$
	ld	iy,#_res_subct
	dec	0 (iy)
	jr	00153$
00150$:
;mainloop/resonators.h:13: res_subct = 50;
	ld	iy,#_res_subct
	ld	0 (iy),#0x32
;mainloop/resonators.h:14: if (res_ct) { 
	ld	a,(#_res_ct + 0)
	or	a, a
	jr	Z,00147$
;mainloop/resonators.h:15: -- res_ct; 
	ld	iy,#_res_ct
	dec	0 (iy)
	jr	00153$
00147$:
;mainloop/resonators.h:18: res_on = 0;
	ld	iy,#_res_on
	ld	0 (iy),#0x00
00153$:
;mainloop.h:435: if (hrt) hotspots_paint ();
	ld	a,(#_hrt + 0)
	or	a, a
	jr	Z,00155$
	call	_hotspots_paint
00155$:
;mainloop/no.h:5: if (no_ct) {
	ld	a,(#_no_ct + 0)
	or	a, a
	jr	Z,00157$
;mainloop/no.h:6: -- no_ct;
	ld	iy,#_no_ct
	dec	0 (iy)
;mainloop/no.h:9: NO_METASPRITE
	ld	de,#_ss_it_06
;mainloop/no.h:8: prx + NO_OFFS_X, pry + NO_OFFS_Y + SPRITE_ADJUST,
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
00157$:
;mainloop.h:464: chac_chacs_do ();
	call	_chac_chacs_do
00159$:
;mainloop/cheat.h:5: if ((pad0 & (PAD_B|PAD_SELECT|PAD_UP)) == (PAD_B|PAD_SELECT|PAD_UP)) break;
	ld	a,(#_pad0 + 0)
	and	a, #0x31
	ld	l, #0x00
	sub	a,#0x31
	jr	NZ,00314$
	or	a,l
	jr	Z,00168$
00314$:
	call	_SG_queryPauseRequested
	bit	0,l
	jp	Z,00167$
;mainloop/pause.h:6: SG_resetPauseRequest ();
	call	_SG_resetPauseRequest
;mainloop/pause.h:7: paused ^= 1;
	ld	a,(#_paused + 0)
	xor	a, #0x01
	ld	(#_paused + 0),a
	jp	00167$
00168$:
;mainloop.h:481: SG_displayOff ();
	ld	hl,#0x0140
	push	hl
	call	_SG_VDPturnOffFeature
	pop	af
;mainloop.h:482: SG_initSprites ();
	call	_SG_initSprites
;mainloop.h:483: UNSAFE_SG_copySpritestoSAT ();	
	jp  _UNSAFE_SG_copySpritestoSAT
;game.c:110: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;game.c:111: SG_displayOff ();
	ld	hl,#0x0140
	push	hl
	call	_SG_VDPturnOffFeature
;game.c:112: SG_setSpriteMode (SG_SPRITEMODE_LARGE);
	ld	h,#0x01
	ex	(sp),hl
	inc	sp
	call	_SG_setSpriteMode
	inc	sp
;game.c:113: SG_setUpdateList (update_list);
	ld	hl,#_update_list+0
	push	hl
	call	_SG_setUpdateList
	pop	af
;game.c:114: first_game = 1;
	ld	hl,#_first_game + 0
	ld	(hl), #0x01
;game.c:120: unpack_bg_patterns (tsfont_patterns_c, tsfont_colours_c, 0, 7);
	ld	de,#_tsfont_colours_c+0
	ld	bc,#_tsfont_patterns_c+0
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
;game.c:122: credits ();
	call	_credits
;game.c:125: aPLib_depack_VRAM (SGT_BASE, ss_fixed_patterns_c);
	ld	hl,#_ss_fixed_patterns_c+0
	push	hl
	ld	hl,#0x3800
	push	hl
	call	_aPLib_depack_VRAM
	pop	af
	pop	af
;game.c:127: mode_no_resonators = 0;
	ld	hl,#_mode_no_resonators + 0
	ld	(hl), #0x00
;game.c:128: while (1) {	
00110$:
;game.c:129: title ();
	call	_title
;game.c:131: level = 0;
	ld	hl,#_level + 0
	ld	(hl), #0x00
;game.c:132: plife = PLAYER_LIFE;
	ld	hl,#_plife + 0
	ld	(hl), #0x05
;game.c:136: while (1) {
00107$:
;game.c:137: pres (scr_level);
	ld	hl,#_scr_level
	push	hl
	call	_pres
	pop	af
;game.c:138: game_init (); 
	call	_game_init
;game.c:139: game_loop ();
	call	_game_loop
;game.c:141: if (game_over) {
	ld	a,(#_game_over + 0)
	or	a, a
	jr	Z,00104$
;game.c:142: pres (scr_game_over);
	ld	hl,#_scr_game_over
	push	hl
	call	_pres
	pop	af
;game.c:143: break;
	jr	00108$
00104$:
;game.c:145: level ++;
	ld	hl, #_level+0
	inc	(hl)
;game.c:146: if (level == MAX_LEVELS) {
	ld	a,(#_level + 0)
	sub	a, #0x03
	jr	NZ,00107$
;game.c:147: pres (scr_the_end);
	ld	hl,#_scr_the_end
	push	hl
	call	_pres
	pop	af
;game.c:148: break;
00108$:
;game.c:153: first_game = 0;
	ld	hl,#_first_game + 0
	ld	(hl), #0x00
	jr	00110$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
