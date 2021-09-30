;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
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
	.globl _enems_persistent_update
	.globl _enems_persistent_load
	.globl _player_move
	.globl _bullets_move
	.globl _player_kill
	.globl _player_to_pixels
	.globl _player_render
	.globl _player_init
	.globl _cocos_do
	.globl _cocos_init
	.globl _hotspots_create
	.globl _hotspots_paint
	.globl _hotspots_load
	.globl _breakable_do_anim
	.globl _do_update_list_and_wait
	.globl _update_cycle
	.globl _pad_read
	.globl _collide_in
	.globl _pr_str
	.globl _draw_scr
	.globl _map_set
	.globl _p_t
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
	.globl _SG_waitForVBlank
	.globl _SG_setSpriteMode
	.globl _SG_VDPturnOffFeature
	.globl _SG_VDPturnOnFeature
	.globl _bombs_set
	.globl _en_spr_id
	.globl _en_spr_x_mod
	.globl _en_rawv
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
	.globl _pmayneedrelocation
	.globl _brky
	.globl _brkx
	.globl _brkf
	.globl _coco_vy
	.globl _coco_vx
	.globl _coco_y
	.globl _coco_x
	.globl _coco_on
	.globl _coco_slots_i
	.globl _coco_slots
	.globl _pctfr
	.globl _bmy
	.globl _bmx
	.globl _by
	.globl _bx
	.globl _bst
	.globl _b_slots_i
	.globl _b_slots
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
	.globl _coco_it
	.globl _bi
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
	.globl _pfacingh
	.globl _pfacingv
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
	.globl _pfacinghlast
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
	.globl _en_rmy
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
	.globl _bombs_y
	.globl _bombs_x
	.globl _l_music
	.globl _l_hotspots
	.globl _l_enems
	.globl _l_n_bolts
	.globl _l_locks
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
	.globl _spr_enems0
	.globl _spr_player
	.globl _behs2
	.globl _behs0
	.globl _jitter
	.globl _bits
	.globl _coco_dy
	.globl _coco_dx
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
_en_rmy::
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
_pfacinghlast::
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
_pfacingv::
	.ds 1
_pfacingh::
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
_bi::
	.ds 1
_coco_it::
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
_b_slots::
	.ds 4
_b_slots_i::
	.ds 1
_bst::
	.ds 4
_bx::
	.ds 4
_by::
	.ds 4
_bmx::
	.ds 4
_bmy::
	.ds 4
_pctfr::
	.ds 1
_coco_slots::
	.ds 4
_coco_slots_i::
	.ds 1
_coco_on::
	.ds 4
_coco_x::
	.ds 8
_coco_y::
	.ds 8
_coco_vx::
	.ds 8
_coco_vy::
	.ds 8
_brkf::
	.ds 4
_brkx::
	.ds 4
_brky::
	.ds 4
_pmayneedrelocation::
	.ds 1
_hact::
	.ds 24
_lkact::
	.ds 16
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
_en_rawv::
	.ds 3
_en_spr_x_mod::
	.ds 1
_en_spr_id::
	.ds 3
_bombs_set::
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
	ld	bc,#_hact+0
00102$:
;./engine/hotspots.h:16: hact [gpit] = 1;
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,bc
	ld	(hl),#0x01
;./engine/hotspots.h:11: for (gpit = 0; gpit < MAP_SIZE; gpit ++) {
	ld	iy,#_gpit
	inc	0 (iy)
	ld	a,0 (iy)
	sub	a, #0x18
	jr	C,00102$
	ret
_coco_dx:
	.dw #0xff00
	.dw #0x0000
	.dw #0x0100
	.dw #0x0000
_coco_dy:
	.dw #0x0000
	.dw #0xff00
	.dw #0x0000
	.dw #0x0100
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
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x11	; 17
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x0b	; 11
	.db #0x0a	; 10
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_behs2:
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x11	; 17
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x0b	; 11
	.db #0x0a	; 10
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_spr_player:
	.dw _ss_pl_00
	.dw _ss_pl_01
	.dw _ss_pl_02
	.dw _ss_pl_03
	.dw _ss_pl_04
	.dw _ss_pl_05
	.dw _ss_pl_06
	.dw _ss_pl_07
_spr_enems0:
	.dw _ss_en_00
	.dw _ss_en_01
	.dw #0x0000
	.dw #0x0000
	.dw _ss_en_00
	.dw _ss_en_01
	.dw #0x0000
	.dw #0x0000
	.dw _ss_en_02
	.dw _ss_en_03
	.dw #0x0000
	.dw #0x0000
	.dw _ss_en_02
	.dw _ss_en_03
	.dw #0x0000
	.dw #0x0000
	.dw _ss_en_04
	.dw _ss_en_05
	.dw #0x0000
	.dw #0x0000
	.dw _ss_en_04
	.dw _ss_en_05
	.dw #0x0000
	.dw #0x0000
	.dw _ss_en_06
	.dw _ss_en_07
	.dw #0x0000
	.dw #0x0000
	.dw _ss_en_06
	.dw _ss_en_07
	.dw #0x0000
	.dw #0x0000
	.dw _ss_en_08
	.dw _ss_en_09
	.dw #0x0000
	.dw #0x0000
	.dw _ss_en_08
	.dw _ss_en_09
	.dw #0x0000
	.dw #0x0000
	.dw _ss_it_00
	.dw _ss_ss_00
	.dw _ss_ss_01
	.dw _ss_ss_02
	.dw _ss_ss_03
_spr_hs:
	.dw #0x0000
	.dw _ss_it_01
	.dw _ss_it_02
	.dw _ss_it_03
	.dw _ss_it_04
_l_scr_ini:
	.db #0x17	; 23
	.db #0x17	; 23
	.db #0x17	; 23
_l_ini_x:
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x07	; 7
_l_ini_y:
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x0a	; 10
_l_map_w:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
_l_map_h:
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
_l_player_max_objects:
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
_l_player_max_enems:
	.db #0x1e	; 30
	.db #0x0b	; 11
	.db #0x0d	; 13
_l_ts_tmaps:
	.dw _ts0_tmaps
	.dw _ts1_tmaps
	.dw _ts2_tmaps
_l_behs:
	.dw _behs0
	.dw _behs0
	.dw _behs2
_l_spr_enems:
	.dw _spr_enems0
	.dw _spr_enems0
	.dw _spr_enems0
_l_map:
	.dw _map_0
	.dw _map_1
	.dw _map_2
_l_locks:
	.dw _map_0_locks
	.dw _map_1_locks
	.dw _map_2_locks
_l_n_bolts:
	.db #0x07	; 7
	.db #0x09	; 9
	.db #0x08	; 8
_l_enems:
	.dw _enems_0
	.dw _enems_1
	.dw _enems_2
_l_hotspots:
	.dw _hotspots_0
	.dw _hotspots_1
	.dw _hotspots_2
_l_music:
	.dw _m_p_stagea_psg
	.dw _m_p_stageb_psg
	.dw _m_p_stagec_psg
_bombs_x:
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x0a	; 10
	.db #0x0a	; 10
_bombs_y:
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x05	; 5
;./engine/hotspots.h:20: void hotspots_paint (void) {
;	---------------------------------
; Function hotspots_paint
; ---------------------------------
_hotspots_paint::
;./engine/hotspots.h:30: rda = hrt;
	ld	a,(#_hrt + 0)
;./engine/hotspots.h:38: spr_hs [rda]
	ld	hl,#_rda + 0
	ld	(hl),a
	ld	l,(hl)
	ld	h,#0x00
	add	hl, hl
	ld	de,#_spr_hs
	add	hl,de
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;./engine/hotspots.h:37: hrx, hry + SPRITE_ADJUST, 
	ld	a,(#_hry + 0)
	add	a, #0xf7
	ld	d,a
	push	bc
	push	de
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
	ld	c, l
	ld	b, h
	ld	hl,#_gp_gen
	ld	iy,#_c_hotspots
	ld	a,0 (iy)
	add	a, c
	ld	(hl),a
	ld	a,1 (iy)
	adc	a, b
	inc	hl
	ld	(hl),a
;./engine/hotspots.h:55: hrt = *gp_gen ++; rda = *gp_gen; 
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_hrt + 0),a
	ld	iy,#_gp_gen
	inc	0 (iy)
	jr	NZ,00115$
	inc	1 (iy)
00115$:
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rda + 0),a
;./engine/hotspots.h:56: if (hrt && hact [n_pant]) {
	ld	a,(#_hrt + 0)
	or	a, a
	jr	Z,00102$
	ld	bc,#_hact+0
	ld	hl,(_n_pant)
	ld	h,#0x00
	add	hl,bc
	ld	a,(hl)
	or	a, a
	jr	Z,00102$
;./engine/hotspots.h:57: hry = rda & 0xf0; hrx = rda << 4;
	ld	a,(#_rda + 0)
	and	a, #0xf0
	ld	(#_hry + 0),a
	ld	a,(#_rda + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0xf0
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
	ld	c,0 (iy)
	ld	hl,#_oobjs + 0
	ld	(hl), c
;./engine/frame.h:21: _x = OBJECTS_X; _y = OBJECTS_Y; 
	ld	hl,#__x + 0
	ld	(hl), #0x1b
	ld	hl,#__y + 0
	ld	(hl), #0x00
;./engine/frame.h:25: _n = pobjs; 
	ld	hl,#__n + 0
	ld	(hl), c
;./engine/frame.h:27: p_t ();
	call	_p_t
00102$:
;./engine/frame.h:32: if (okeys != pkeys) {
	ld	a,(#_okeys + 0)
	ld	iy,#_pkeys
	sub	a, 0 (iy)
	jr	Z,00104$
;./engine/frame.h:33: okeys = pkeys;
	ld	c,0 (iy)
	ld	hl,#_okeys + 0
	ld	(hl), c
;./engine/frame.h:34: _x = KEYS_X; _y = KEYS_Y; _n = pkeys; p_t ();
	ld	hl,#__x + 0
	ld	(hl), #0x14
	ld	hl,#__y + 0
	ld	(hl), #0x00
	ld	hl,#__n + 0
	ld	(hl), c
	call	_p_t
00104$:
;./engine/frame.h:39: if (olife != plife) {
	ld	a,(#_olife + 0)
	ld	iy,#_plife
	sub	a, 0 (iy)
	jr	Z,00106$
;./engine/frame.h:40: olife = plife;
	ld	c,0 (iy)
	ld	hl,#_olife + 0
	ld	(hl), c
;./engine/frame.h:41: _x = LIFE_X; _y = LIFE_Y; _n = plife; p_t ();
	ld	hl,#__x + 0
	ld	(hl), #0x05
	ld	hl,#__y + 0
	ld	(hl), #0x00
	ld	hl,#__n + 0
	ld	(hl), c
	call	_p_t
00106$:
;./engine/frame.h:46: if (oammo != pammo) {
	ld	a,(#_oammo + 0)
	ld	iy,#_pammo
	sub	a, 0 (iy)
	ret	Z
;./engine/frame.h:47: oammo = pammo;
	ld	c,0 (iy)
	ld	hl,#_oammo + 0
	ld	(hl), c
;./engine/frame.h:48: _x = AMMO_X; _y = AMMO_Y; _n = pammo; p_t ();
	ld	hl,#__x + 0
	ld	(hl), #0x0c
	ld	hl,#__y + 0
	ld	(hl), #0x00
	ld	hl,#__n + 0
	ld	(hl), c
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
	ld	c,0 (iy)
	ld	b,1 (iy)
	push	bc
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
;./my/pres.h:31: gp_gen = title_rle; unrle ();
	ld	hl,#_title_rle+0
	ld	(_gp_gen),hl
	call	_unrle
;./my/pres.h:33: _x = 5; _y = 23; pr_str ("@ 2018 THE MOJON TWINS");
	ld	hl,#__x + 0
	ld	(hl), #0x05
	ld	hl,#__y + 0
	ld	(hl), #0x17
	ld	hl,#___str_0
	push	hl
	call	_pr_str
	pop	af
;./my/pres.h:35: bat_in ();
	call	_bat_in
;./my/pres.h:37: PSGPlay (MUSIC_TITLE);
	ld	hl,#_m_p_title_psg
	push	hl
	call	_PSGPlay
	pop	af
;./my/pres.h:38: while (1) {
00115$:
;./my/pres.h:39: update_cycle ();
	call	_update_cycle
;./my/pres.h:40: SG_addMetaSprite1x1 (80, 108 + (level << 4), ss_pl_00);
	ld	de,#_ss_pl_00
	ld	a,(#_level + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0xf0
	add	a, #0x6c
	ld	b,a
	push	de
	push	bc
	inc	sp
	ld	a,#0x50
	push	af
	inc	sp
	call	_SG_addMetaSprite1x1
	pop	af
	pop	af
;./my/pres.h:41: pad_read ();
	call	_pad_read
;./my/pres.h:42: rda = level;
	ld	a,(#_level + 0)
	ld	(#_rda + 0),a
;./my/pres.h:43: if (pad_this_frame & PAD_DOWN) {
	ld	hl,#_pad_this_frame+0
	bit	1, (hl)
	jr	Z,00104$
;./my/pres.h:44: ++ level; if (level == 3) level = 0;
	ld	iy,#_level
	inc	0 (iy)
	ld	a,0 (iy)
	sub	a, #0x03
	jr	NZ,00104$
	ld	0 (iy),#0x00
00104$:
;./my/pres.h:46: if (pad_this_frame & PAD_UP) {
	ld	hl,#_pad_this_frame+0
	bit	0, (hl)
	jr	Z,00109$
;./my/pres.h:47: if (level) -- level; else level = 2;
	ld	iy,#_level
	ld	a,0 (iy)
	or	a, a
	jr	Z,00106$
	dec	0 (iy)
	jr	00109$
00106$:
	ld	hl,#_level + 0
	ld	(hl), #0x02
00109$:
;./my/pres.h:49: if (level != rda) PSGSFXPlay (SFX_USE, 1);
	ld	a,(#_level + 0)
	ld	iy,#_rda
	sub	a, 0 (iy)
	jr	Z,00111$
	ld	a,#0x01
	push	af
	inc	sp
	ld	hl,#_s_03_use2_psg
	push	hl
	call	_PSGSFXPlay
	pop	af
	inc	sp
00111$:
;./my/pres.h:50: if (pad_this_frame & PAD_1) break;
	ld	hl,#_pad_this_frame+0
	bit	4, (hl)
	jr	Z,00115$
;./my/pres.h:53: PSGSFXPlay (SFX_START, 1); delay (20);
	ld	a,#0x01
	push	af
	inc	sp
	ld	hl,#_s_00_start2_psg
	push	hl
	call	_PSGSFXPlay
	pop	af
	inc	sp
	ld	a,#0x14
	push	af
	inc	sp
	call	_delay
	inc	sp
;./my/pres.h:55: bat_out ();
	jp  _bat_out
___str_0:
	.ascii "@ 2018 THE MOJON TWINS"
	.db 0x00
;./my/pres.h:58: void scr_game_over (void) {
;	---------------------------------
; Function scr_game_over
; ---------------------------------
_scr_game_over::
;./my/pres.h:59: gp_gen = cuts_rle; unrle ();
	ld	hl,#_cuts_rle+0
	ld	(_gp_gen),hl
	call	_unrle
;./my/pres.h:60: _x = 10; _y = 8; pr_str ("GAME OVER!");
	ld	hl,#__x + 0
	ld	(hl), #0x0a
	ld	hl,#__y + 0
	ld	(hl), #0x08
	ld	hl,#___str_1
	push	hl
	call	_pr_str
	pop	af
;./my/pres.h:61: _x =  4; _y = 10; pr_str ("NICE TRY, BUT NO BANANA!");
	ld	hl,#__x + 0
	ld	(hl), #0x04
	ld	hl,#__y + 0
	ld	(hl), #0x0a
	ld	hl,#___str_2
	push	hl
	call	_pr_str
	pop	af
;./my/pres.h:62: _x =  5; _y = 12; pr_str ("DO IT BETTER NEXT TIME");
	ld	hl,#__x + 0
	ld	(hl), #0x05
	ld	hl,#__y + 0
	ld	(hl), #0x0c
	ld	hl,#___str_3
	push	hl
	call	_pr_str
	pop	af
;./my/pres.h:63: _x =  9; _y = 14; pr_str ("MISSION FAILED");
	ld	hl,#__x + 0
	ld	(hl), #0x09
	ld	hl,#__y + 0
	ld	(hl), #0x0e
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
;./my/pres.h:66: void scr_the_end (void) {
;	---------------------------------
; Function scr_the_end
; ---------------------------------
_scr_the_end::
;./my/pres.h:67: gp_gen = cuts_rle; unrle ();
	ld	hl,#_cuts_rle+0
	ld	(_gp_gen),hl
	call	_unrle
;./my/pres.h:68: _x = 9; _y = 8; pr_str ("CONGRATULATIONS!");
	ld	hl,#__x + 0
	ld	(hl), #0x09
	ld	hl,#__y + 0
	ld	(hl), #0x08
	ld	hl,#___str_5
	push	hl
	call	_pr_str
	pop	af
;./my/pres.h:69: _x = 2; _y = 10; pr_str ("YOU MANAGED TO SET THE BOMBS");
	ld	hl,#__x + 0
	ld	(hl), #0x02
	ld	hl,#__y + 0
	ld	(hl), #0x0a
	ld	hl,#___str_6
	push	hl
	call	_pr_str
	pop	af
;./my/pres.h:70: _x = 4; _y = 12; pr_str ("AND DESTROY THE COMPUTER");
	ld	hl,#__x + 0
	ld	(hl), #0x04
	ld	hl,#__y + 0
	ld	(hl), #0x0c
	ld	hl,#___str_7
	push	hl
	call	_pr_str
	pop	af
;./my/pres.h:71: _x = 5; _y = 14; pr_str ("MISSION ACCOMPLISHED!!");	
	ld	hl,#__x + 0
	ld	(hl), #0x05
	ld	hl,#__y + 0
	ld	(hl), #0x0e
	ld	hl,#___str_8
	push	hl
	call	_pr_str
	pop	af
	ret
___str_5:
	.ascii "CONGRATULATIONS!"
	.db 0x00
___str_6:
	.ascii "YOU MANAGED TO SET THE BOMBS"
	.db 0x00
___str_7:
	.ascii "AND DESTROY THE COMPUTER"
	.db 0x00
___str_8:
	.ascii "MISSION ACCOMPLISHED!!"
	.db 0x00
;./my/pres.h:74: void credits (void) {
;	---------------------------------
; Function credits
; ---------------------------------
_credits::
;./my/pres.h:75: cls ();
	call	_cls
;./my/pres.h:77: _x = 0; _y = 0; if (ntsc) pr_str ("NTSC"); else pr_str ("PAL");
	ld	hl,#__x + 0
	ld	(hl), #0x00
	ld	hl,#__y + 0
	ld	(hl), #0x00
	ld	a,(#_ntsc + 0)
	or	a, a
	jr	Z,00102$
	ld	hl,#___str_9
	push	hl
	call	_pr_str
	pop	af
	jr	00103$
00102$:
	ld	hl,#___str_10
	push	hl
	call	_pr_str
	pop	af
00103$:
;./my/pres.h:79: rds16 = 0; rdy = 240;
	ld	hl,#0x0000
	ld	(_rds16),hl
	ld	hl,#_rdy + 0
	ld	(hl), #0xf0
;./my/pres.h:80: _x = 0; _y = 18; 
	ld	hl,#__x + 0
	ld	(hl), #0x00
	ld	hl,#__y + 0
	ld	(hl), #0x12
;./my/pres.h:81: pr_str ("   SGT. HELMET - TRAINING DAY%%         ORIGINAL GAME:%     @ 2013 THE MOJON TWINS%       REPROGRAMMED GAME:%     @ 2018 THE MOJON TWINS");
	ld	hl,#___str_11
	push	hl
	call	_pr_str
;./my/pres.h:83: SG_displayOn ();
	ld	hl, #0x0140
	ex	(sp),hl
	call	_SG_VDPturnOnFeature
	pop	af
;./my/pres.h:85: while (!(SG_getKeysStatus () & PAD_START) && rds16 < 300) {
00105$:
	call	_SG_getKeysStatus
	bit	4, l
	jr	NZ,00107$
	ld	iy,#_rds16
	ld	a,0 (iy)
	sub	a, #0x2c
	ld	a,1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x81
	jr	NC,00107$
;./my/pres.h:88: update_cycle ();
	call	_update_cycle
;./my/pres.h:89: rds16 ++;
	ld	iy,#_rds16
	inc	0 (iy)
	jr	NZ,00105$
	inc	1 (iy)
	jr	00105$
00107$:
;./my/pres.h:92: SG_displayOff ();
	ld	hl,#0x0140
	push	hl
	call	_SG_VDPturnOffFeature
	pop	af
	ret
___str_9:
	.ascii "NTSC"
	.db 0x00
___str_10:
	.ascii "PAL"
	.db 0x00
___str_11:
	.ascii "   SGT. HELMET - TRAINING DAY%%         ORIGINAL GAME:%     "
	.ascii "@ 2013 THE MOJON TWINS%       REPROGRAMMED GAME:%     @ 2018"
	.ascii " THE MOJON TWINS"
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
	ld	hl,#0x3d00
	ld	(_px),hl
	ret
00105$:
;./mainloop/flickscreen.h:17: } else if (prx == 244 && 
	ld	a,(#_prx + 0)
	sub	a, #0xf4
	ret	NZ
;./mainloop/flickscreen.h:23: ) {
	xor	a, a
	ld	iy,#_pvx
	cp	a, 0 (iy)
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
;./mainloop/flickscreen.h:32: if (pry <= 16 && pvy < 0) {
	ld	a,#0x10
	ld	iy,#_pry
	sub	a, 0 (iy)
	jr	C,00105$
	ld	a,(#_pvy + 1)
	bit	7,a
	jr	Z,00105$
;./mainloop/flickscreen.h:33: n_pant -= c_map_w;
	ld	hl,#_c_map_w
	push	de
	ld	iy,#_n_pant
	push	iy
	pop	de
	ld	a,(de)
	sub	a, (hl)
	ld	(de),a
	pop	de
;./mainloop/flickscreen.h:34: py = 192 << FIXBITS;
	ld	hl,#0x3000
	ld	(_py),hl
	ret
00105$:
;./mainloop/flickscreen.h:35: } else if (pry >= 192 && pvy > 0) {
	ld	a,(#_pry + 0)
	sub	a, #0xc0
	ret	C
	xor	a, a
	ld	iy,#_pvy
	cp	a, 0 (iy)
	sbc	a, 1 (iy)
	jp	PO, 00126$
	xor	a, #0x80
00126$:
	ret	P
;./mainloop/flickscreen.h:36: n_pant += c_map_w;
	ld	hl,#_c_map_w
	push	de
	ld	iy,#_n_pant
	push	iy
	pop	de
	ld	a,(de)
	add	a, (hl)
	ld	(de),a
	pop	de
;./mainloop/flickscreen.h:37: py = 16 << FIXBITS;
	ld	hl,#0x0400
	ld	(_py),hl
	ret
;./mainloop.h:6: void player_frame_selector (void) {
;	---------------------------------
; Function player_frame_selector
; ---------------------------------
_player_frame_selector::
;./my/player_frame_selector.h:15: if (pvx != 0 || pvy != 0) {
	ld	iy,#_pvx
	ld	a,1 (iy)
	or	a,0 (iy)
	jr	NZ,00103$
	ld	iy,#_pvy
	ld	a,1 (iy)
	or	a,0 (iy)
	ret	Z
00103$:
;./my/player_frame_selector.h:16: ++ pctfr;
	ld	iy,#_pctfr
	inc	0 (iy)
;./my/player_frame_selector.h:17: if (pctfr == 4) {
	ld	a,0 (iy)
	sub	a, #0x04
	ret	NZ
;./my/player_frame_selector.h:18: pctfr = 0;
	ld	0 (iy),#0x00
;./my/player_frame_selector.h:19: pfr = !pfr;
	ld	iy,#_pfr
	ld	a,0 (iy)
	sub	a,#0x01
	ld	a,#0x00
	rla
	ld	0 (iy), a
;./my/player_frame_selector.h:20: psprid = pfacing + pfr;
	ld	hl,#_pfr
	push	de
	ld	iy,#_psprid
	push	iy
	pop	de
	ld	a,(#_pfacing + 0)
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
	ld	1 (iy),a
;./mainloop/asset_setup.h:10: c_behs = 		l_behs [level];
	ld	hl,#_l_behs+0
	add	hl,bc
	ld	a,(hl)
	ld	iy,#_c_behs
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	1 (iy),a
;./mainloop/asset_setup.h:11: spr_enems = 	l_spr_enems [level];
	ld	hl,#_l_spr_enems+0
	add	hl,bc
	ld	a,(hl)
	ld	iy,#_spr_enems
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	1 (iy),a
;./mainloop/asset_setup.h:13: c_map = 		l_map [level];
	ld	hl,#_l_map+0
	add	hl,bc
	ld	a,(hl)
	ld	iy,#_c_map
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	1 (iy),a
;./mainloop/asset_setup.h:23: c_locks = 	l_locks [level];
	ld	hl,#_l_locks+0
	add	hl,bc
	ld	a,(hl)
	ld	iy,#_c_locks
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	1 (iy),a
;./mainloop/asset_setup.h:25: l_n_bolts [level];
	ld	a,(#_level + 0)
	add	a, #<(_l_n_bolts)
	ld	e,a
	ld	a,#0x00
	adc	a, #>(_l_n_bolts)
	ld	d,a
	ld	a,(de)
	ld	(#_c_max_bolts + 0),a
;./mainloop/asset_setup.h:28: c_enems = 		l_enems [level];
	ld	hl,#_l_enems+0
	add	hl,bc
	ld	a,(hl)
	ld	iy,#_c_enems
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	1 (iy),a
;./mainloop/asset_setup.h:29: c_hotspots = 	l_hotspots [level];	
	ld	hl,#_l_hotspots+0
	add	hl,bc
	ld	a,(hl)
	ld	iy,#_c_hotspots
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	1 (iy),a
;./mainloop/asset_setup.h:31: c_max_enems = 	l_player_max_enems [level];
	ld	bc,#_l_player_max_enems+0
	ld	hl,(_level)
	ld	h,#0x00
	add	hl,bc
	ld	a,(hl)
	ld	(#_c_max_enems + 0),a
;./mainloop/asset_setup.h:33: c_map_w = 		l_map_w [level];
	ld	bc,#_l_map_w+0
	ld	hl,(_level)
	ld	h,#0x00
	add	hl,bc
	ld	a,(hl)
	ld	(#_c_map_w + 0),a
;./mainloop/asset_setup.h:34: c_map_h = 		l_map_h [level];
	ld	bc,#_l_map_h+0
	ld	hl,(_level)
	ld	h,#0x00
	add	hl,bc
	ld	a,(hl)
	ld	iy,#_c_map_h
	ld	0 (iy),a
;./mainloop/asset_setup.h:84: rda = c_map_h; c_map_size = 0; while (rda --) c_map_size += c_map_w;
	ld	a,0 (iy)
	ld	(#_rda + 0),a
	ld	hl,#_c_map_size + 0
	ld	(hl), #0x00
00101$:
	ld	iy,#_rda
	ld	c,0 (iy)
	dec	0 (iy)
	ld	a,c
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
;./mainloop.h:28: memfill (lkact, 1, c_max_bolts);
	ld	hl,#_c_max_bolts + 0
	ld	c, (hl)
	ld	b,#0x00
	push	bc
	ld	a,#0x01
	push	af
	inc	sp
	ld	hl,#_lkact
	push	hl
	call	_memfill
	pop	af
	pop	af
	inc	sp
;./mainloop.h:31: if (!warp_to_level)	{
	ld	a,(#_warp_to_level + 0)
	or	a, a
	jr	NZ,00105$
;./mainloop.h:32: n_pant = SCR_INI;
	ld	bc,#_l_scr_ini+0
	ld	hl,(_level)
	ld	h,#0x00
	add	hl,bc
	ld	a,(hl)
	ld	(#_n_pant + 0),a
;./mainloop.h:33: px = (4 + (PLAYER_INI_X << 4)) << FIXBITS;
	ld	bc,#_l_ini_x+0
	ld	hl,(_level)
	ld	h,#0x00
	add	hl,bc
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
	ld	bc,#_l_ini_y+0
	ld	hl,(_level)
	ld	h,#0x00
	add	hl,bc
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
;./mainloop.h:56: pkeys = 0;
	ld	hl,#_pkeys + 0
	ld	(hl), #0x00
;./mainloop.h:119: half_life = 0;
	ld	hl,#_half_life + 0
	ld	(hl), #0x00
;./mainloop.h:120: frame_counter = 0;
	ld	hl,#_frame_counter + 0
	ld	(hl), #0x00
;./mainloop.h:121: olife = oammo = oobjs = okeys = 0xff;
	ld	hl,#_okeys + 0
	ld	(hl), #0xff
	ld	hl,#_oobjs + 0
	ld	(hl), #0xff
	ld	hl,#_oammo + 0
	ld	(hl), #0xff
	ld	hl,#_olife + 0
	ld	(hl), #0xff
;./mainloop.h:122: okilled = 0xff;
	ld	hl,#_okilled + 0
	ld	(hl), #0xff
;./my/extra_inits.h:7: bombs_set = 0;
	ld	hl,#_bombs_set + 0
	ld	(hl), #0x00
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
	ld	c,a
	ld	a,#0x00
	adc	a, #>(_update_list)
	ld	b,a
	ld	a,#0xff
	ld	(bc),a
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
;./mainloop.h:179: cocos_init ();
	call	_cocos_init
;./mainloop.h:214: draw_scr ();
	call	_draw_scr
;./mainloop.h:217: do_process_breakable = 0;
	ld	hl,#_do_process_breakable + 0
	ld	(hl), #0x00
;./mainloop.h:218: gpit = BREAKABLE_MAX; while (gpit --) brkf [gpit] = 0;
	ld	hl,#_gpit + 0
	ld	(hl), #0x04
	ld	bc,#_brkf+0
00103$:
	ld	iy,#_gpit
	ld	e,0 (iy)
	dec	0 (iy)
	ld	a,e
	or	a, a
	jr	Z,00105$
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,bc
	ld	(hl),#0x00
	jr	00103$
00105$:
;./mainloop.h:231: for (gpit = 0; gpit < MAX_BULLETS; gpit ++) {
	ld	hl,#_gpit + 0
	ld	(hl), #0x00
	ld	bc,#_b_slots+0
00122$:
;./mainloop.h:232: b_slots [gpit] = gpit; 
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,bc
	ld	iy,#_gpit
	ld	a,0 (iy)
	ld	(hl),a
;./mainloop.h:233: bst [gpit] = 0;
	ld	a,#<(_bst)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_bst)
	adc	a, #0x00
	ld	d,a
	xor	a, a
	ld	(de),a
;./mainloop.h:231: for (gpit = 0; gpit < MAX_BULLETS; gpit ++) {
	inc	0 (iy)
	ld	a,0 (iy)
	sub	a, #0x04
	jr	C,00122$
;./mainloop.h:235: b_slots_i = MAX_BULLETS;
	ld	hl,#_b_slots_i + 0
	ld	(hl), #0x04
;./mainloop.h:253: HW_initSprites ();
	call	_SG_initSprites
;./my/on_entering_screen.h:8: if (n_pant == 0) {
	ld	a,(#_n_pant + 0)
	or	a, a
	jp	NZ,00116$
;./my/on_entering_screen.h:10: do_update_list_and_wait ();
	call	_do_update_list_and_wait
;./my/on_entering_screen.h:13: clear_update_list ();
	call	_clear_update_list
;./my/on_entering_screen.h:14: rdx = 6; rdy = 4; rdt = 16; gpit = 6; while (gpit --) {
	ld	hl,#_rdx + 0
	ld	(hl), #0x06
	ld	hl,#_rdy + 0
	ld	(hl), #0x04
	ld	hl,#_rdt + 0
	ld	(hl), #0x10
	ld	hl,#_gpit + 0
	ld	(hl), #0x06
00109$:
	ld	iy,#_gpit
	ld	c,0 (iy)
	dec	0 (iy)
	ld	a,c
	or	a, a
	jr	Z,00111$
;./my/on_entering_screen.h:15: _x = rdx; _y = rdy; _t = rdt; map_set ();
	ld	a,(#_rdx + 0)
	ld	(#__x + 0),a
	ld	a,(#_rdy + 0)
	ld	(#__y + 0),a
	ld	a,(#_rdt + 0)
	ld	(#__t + 0),a
	call	_map_set
;./my/on_entering_screen.h:16: rdt ++; rdx ++; if (rdx == 9) { rdx = 6; rdy ++; }
	ld	hl, #_rdt+0
	inc	(hl)
	ld	iy,#_rdx
	inc	0 (iy)
	ld	a,0 (iy)
	sub	a, #0x09
	jr	NZ,00109$
	ld	0 (iy),#0x06
	ld	hl, #_rdy+0
	inc	(hl)
	jr	00109$
00111$:
;./my/on_entering_screen.h:20: if (bombs_set) {
	ld	a,(#_bombs_set + 0)
	or	a, a
	jr	Z,00114$
;./my/on_entering_screen.h:21: do_update_list_and_wait ();
	call	_do_update_list_and_wait
;./my/on_entering_screen.h:22: clear_update_list ();
	call	_clear_update_list
;./my/on_entering_screen.h:23: for (gpit = 0; gpit < 5; gpit ++) {
	ld	hl,#_gpit + 0
	ld	(hl), #0x00
	ld	bc,#_bombs_x+0
00124$:
;./my/on_entering_screen.h:24: _x = bombs_x [gpit]; _y = bombs_y [gpit]; _t = 24; map_set ();
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,bc
	ld	a,(hl)
	ld	(#__x + 0),a
	ld	a,#<(_bombs_y)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_bombs_y)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#__y + 0),a
	ld	hl,#__t + 0
	ld	(hl), #0x18
	push	bc
	call	_map_set
	pop	bc
;./my/on_entering_screen.h:23: for (gpit = 0; gpit < 5; gpit ++) {
	ld	iy,#_gpit
	inc	0 (iy)
	ld	a,0 (iy)
	sub	a, #0x05
	jr	C,00124$
00114$:
;./my/on_entering_screen.h:28: do_update_list_and_wait ();
	call	_do_update_list_and_wait
;./my/on_entering_screen.h:29: clear_update_list ();
	call	_clear_update_list
00116$:
;./mainloop.h:270: gpit = 3; while (gpit --) en_spr_id [gpit] = en_s [gpit];
	ld	hl,#_gpit + 0
	ld	(hl), #0x03
00117$:
	ld	iy,#_gpit
	ld	b,0 (iy)
	dec	0 (iy)
	ld	a,b
	or	a, a
	jr	Z,00119$
	ld	a,#<(_en_spr_id)
	ld	hl,#_gpit
	add	a, (hl)
	ld	c,a
	ld	a,#>(_en_spr_id)
	adc	a, #0x00
	ld	b,a
	ld	a,#<(_en_s)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_s)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(bc),a
	jr	00117$
00119$:
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
	jr	Z,00121$
	call	_hotspots_paint
00121$:
;./mainloop.h:297: hud_update ();
	call	_hud_update
;./mainloop.h:298: HW_copySpritestoSAT ();
	call	_SG_copySpritestoSAT
;./mainloop.h:299: update_list [update_index] = 0xff;
	ld	a,(#_update_index + 0)
	add	a, #<(_update_list)
	ld	c,a
	ld	a,#0x00
	adc	a, #>(_update_list)
	ld	b,a
	ld	a,#0xff
	ld	(bc),a
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
	ld	bc,#_l_music+0
	ld	iy,#_level
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl,bc
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	push	bc
	call	_PSGPlay
	pop	af
;./mainloop.h:332: paused = 0; HW_resetPauseRequest ();
	ld	hl,#_paused + 0
	ld	(hl), #0x00
	call	_SG_resetPauseRequest
;./mainloop.h:334: while (1) {
00159$:
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
	jp	NZ,00160$
	ld	a,(#_level_reset + 0)
	or	a, a
	jp	NZ,00160$
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
	ld	c,a
	ld	a,#>(_update_list)
	adc	a, #0x00
	ld	b,a
	ld	a,#0xff
	ld	(bc),a
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
	ld	iy,#_ntsc_frame
	inc	0 (iy)
	ld	a,0 (iy)
	sub	a, #0x06
	jr	NZ,00111$
	ld	0 (iy),#0x00
00111$:
;./mainloop.h:399: if (paused == 0 && (ntsc == 0 || ntsc_frame)) {
	ld	a,(#_paused + 0)
	or	a, a
	jp	NZ,00151$
	ld	a,(#_ntsc + 0)
	or	a, a
	jr	Z,00150$
	ld	a,(#_ntsc_frame + 0)
	or	a, a
	jp	Z,00151$
00150$:
;./mainloop.h:400: HW_initSprites ();
	call	_SG_initSprites
;./mainloop.h:403: if (ticker) -- ticker; else ticker = 50;
	ld	iy,#_ticker
	ld	a,0 (iy)
	or	a, a
	jr	Z,00113$
	dec	0 (iy)
	jr	00114$
00113$:
	ld	hl,#_ticker + 0
	ld	(hl), #0x32
00114$:
;./mainloop.h:404: half_life ^= 1;
	ld	iy,#_half_life
	ld	a,0 (iy)
	xor	a, #0x01
	ld	0 (iy),a
;./mainloop.h:405: ++ frame_counter;
	ld	hl, #_frame_counter+0
	inc	(hl)
;./mainloop/hotspots.h:6: if (hrt) {
	ld	a,(#_hrt + 0)
	or	a, a
	jp	Z,00128$
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
	jp	Z,00128$
;./mainloop/hotspots.h:128: gp_gen = 0; rdm = 1;
	ld	hl,#0x0000
	ld	(_gp_gen),hl
	ld	hl,#_rdm + 0
	ld	(hl), #0x01
;./mainloop/hotspots.h:129: switch (hrt) {
	ld	iy,#_hrt
	ld	a,0 (iy)
	sub	a, #0x01
	jp	C,00122$
	ld	a,#0x04
	sub	a, 0 (iy)
	jp	C,00122$
	ld	e,0 (iy)
	dec	e
	ld	d,#0x00
	ld	hl,#00293$
	add	hl,de
	add	hl,de
;./mainloop/hotspots.h:131: case HOTSPOT_TYPE_OBJECT:
	jp	(hl)
00293$:
	jr	00115$
	jr	00116$
	jr	00117$
	jr	00118$
00115$:
;./mainloop/hotspots.h:145: ++ pobjs;
	ld	hl, #_pobjs+0
	inc	(hl)
;./mainloop/hotspots.h:146: gp_gen = SFX_OBJECT;
	ld	iy,#_gp_gen
	ld	0 (iy),#<(_s_02_object2_psg)
	ld	1 (iy),#>(_s_02_object2_psg)
;./mainloop/hotspots.h:148: break;
	jr	00122$
;./mainloop/hotspots.h:151: case HOTSPOT_TYPE_KEYS:
00116$:
;./mainloop/hotspots.h:152: ++ pkeys;
	ld	hl, #_pkeys+0
	inc	(hl)
;./mainloop/hotspots.h:153: gp_gen = SFX_OBJECT;
	ld	iy,#_gp_gen
	ld	0 (iy),#<(_s_02_object2_psg)
	ld	1 (iy),#>(_s_02_object2_psg)
;./mainloop/hotspots.h:154: break;
	jr	00122$
;./mainloop/hotspots.h:156: case HOTSPOT_TYPE_REFILL:
00117$:
;./mainloop/hotspots.h:157: plife += PLAYER_REFILL;
	ld	hl, #_plife+0
	inc	(hl)
;./mainloop/hotspots.h:161: gp_gen = SFX_USE;
	ld	iy,#_gp_gen
	ld	0 (iy),#<(_s_03_use2_psg)
	ld	1 (iy),#>(_s_03_use2_psg)
;./mainloop/hotspots.h:162: rdm = 2;
	ld	hl,#_rdm + 0
	ld	(hl), #0x02
;./mainloop/hotspots.h:163: break;
	jr	00122$
;./mainloop/hotspots.h:165: case HOTSPOT_TYPE_AMMO:
00118$:
;./mainloop/hotspots.h:166: gp_gen = SFX_OBJECT;
	ld	iy,#_gp_gen
	ld	0 (iy),#<(_s_02_object2_psg)
	ld	1 (iy),#>(_s_02_object2_psg)
;./mainloop/hotspots.h:167: if (MAX_AMMO - pammo > AMMO_REFILL)
	ld	hl,#_pammo + 0
	ld	c, (hl)
	ld	b,#0x00
	ld	a,#0x63
	sub	a, c
	ld	c,a
	ld	a,#0x00
	sbc	a, b
	ld	b,a
	ld	a,#0x32
	cp	a, c
	ld	a,#0x00
	sbc	a, b
	jp	PO, 00294$
	xor	a, #0x80
00294$:
	jp	P,00120$
;./mainloop/hotspots.h:168: pammo += AMMO_REFILL;
	ld	hl,#_pammo
	ld	a,(hl)
	add	a, #0x32
	ld	(hl),a
	jr	00122$
00120$:
;./mainloop/hotspots.h:170: pammo = MAX_AMMO;
	ld	hl,#_pammo + 0
	ld	(hl), #0x63
;./mainloop/hotspots.h:192: }
00122$:
;./mainloop/hotspots.h:193: if (gp_gen) {
	ld	iy,#_gp_gen
	ld	a,1 (iy)
	or	a,0 (iy)
	jr	Z,00128$
;./mainloop/hotspots.h:194: PSGSFXPlay (gp_gen, rdm);
	ld	bc,(_gp_gen)
	ld	a,(_rdm)
	push	af
	inc	sp
	push	bc
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
	ld	c,a
	ld	a,#>(_hact)
	adc	a, #0x00
	ld	b,a
	xor	a, a
	ld	(bc),a
00128$:
;./mainloop.h:425: if (!warp_to_level) {
	ld	a,(#_warp_to_level + 0)
	or	a, a
	jr	NZ,00130$
;./mainloop.h:426: player_move ();
	call	_player_move
;./mainloop.h:427: player_frame_selector ();
	call	_player_frame_selector
00130$:
;./my/extra_checks.h:14: if (n_pant == 23 && bombs_set) {
	ld	a,(#_n_pant + 0)
	sub	a, #0x17
	jr	NZ,00132$
	ld	a,(#_bombs_set + 0)
	or	a, a
	jr	Z,00132$
;./my/extra_checks.h:15: update_cycle ();
	call	_update_cycle
;./my/extra_checks.h:16: PSGSFXPlay (SFX_FANFARE, 2);
	ld	a,#0x02
	push	af
	inc	sp
	ld	hl,#_s_19_fanfare2_psg
	push	hl
	call	_PSGSFXPlay
	pop	af
	inc	sp
;./my/extra_checks.h:17: delay (120);
	ld	a,#0x78
	push	af
	inc	sp
	call	_delay
	inc	sp
;./my/extra_checks.h:18: win_level = 1;
	ld	hl,#_win_level + 0
	ld	(hl), #0x01
00132$:
;./mainloop/win_level_condition.h:10: win_level
	ld	a,(#_win_level + 0)
	or	a, a
	jr	Z,00135$
;./mainloop/win_level_condition.h:23: PSGStop ();
	call	_PSGStop
;./mainloop/win_level_condition.h:24: delay (50);
	ld	a,#0x32
	push	af
	inc	sp
	call	_delay
	inc	sp
;./mainloop/win_level_condition.h:25: break;
	jp	00160$
00135$:
;./mainloop.h:453: bullets_move ();
	call	_bullets_move
;./mainloop.h:459: cocos_do ();
	call	_cocos_do
;./mainloop.h:464: cur_stp = HW_getStp (); 
	call	_SG_getStp
	ld	(_cur_stp),hl
;./mainloop.h:465: if (!warp_to_level)	player_render ();
	ld	a,(#_warp_to_level + 0)
	or	a, a
	jr	NZ,00137$
	call	_player_render
00137$:
;./mainloop.h:469: enems_move ();
	call	_enems_move
;./mainloop.h:473: if (warp_to_level) {
	ld	a,(#_warp_to_level + 0)
	or	a, a
	jr	Z,00139$
;./mainloop.h:474: update_cycle (); PSGStop (); break;
	call	_update_cycle
	call	_PSGStop
	jp	00160$
00139$:
;./mainloop.h:485: if (hrt) hotspots_paint ();
	ld	a,(#_hrt + 0)
	or	a, a
	jr	Z,00141$
	call	_hotspots_paint
00141$:
;./mainloop.h:496: if (do_process_breakable) breakable_do_anim ();
	ld	a,(#_do_process_breakable + 0)
	or	a, a
	jr	Z,00143$
	call	_breakable_do_anim
00143$:
;./my/extra_routines.h:7: if (pobjs == 5 && n_pant == 0 && bombs_set == 0 && pry < 128) {
	ld	a,(#_pobjs + 0)
	sub	a, #0x05
	jr	NZ,00151$
	ld	a,(#_n_pant + 0)
	or	a, a
	jr	NZ,00151$
	ld	a,(#_bombs_set + 0)
	or	a, a
	jr	NZ,00151$
	ld	a,(#_pry + 0)
	sub	a, #0x80
	jr	NC,00151$
;./my/extra_routines.h:8: for (gpit = 0; gpit < 5; gpit ++) {
	ld	hl,#_gpit + 0
	ld	(hl), #0x00
00161$:
;./my/extra_routines.h:9: _x = bombs_x [gpit]; _y = bombs_y [gpit]; _t = 24; map_set ();	
	ld	a,#<(_bombs_x)
	ld	hl,#_gpit
	add	a, (hl)
	ld	c,a
	ld	a,#>(_bombs_x)
	adc	a, #0x00
	ld	b,a
	ld	a,(bc)
	ld	(#__x + 0),a
	ld	a,#<(_bombs_y)
	ld	hl,#_gpit
	add	a, (hl)
	ld	c,a
	ld	a,#>(_bombs_y)
	adc	a, #0x00
	ld	b,a
	ld	a,(bc)
	ld	(#__y + 0),a
	ld	hl,#__t + 0
	ld	(hl), #0x18
	call	_map_set
;./my/extra_routines.h:10: do_update_list_and_wait (); 
	call	_do_update_list_and_wait
;./my/extra_routines.h:11: clear_update_list (); 
	call	_clear_update_list
;./my/extra_routines.h:12: PSGSFXPlay (SFX_HITTER, 3); 
	ld	a,#0x03
	push	af
	inc	sp
	ld	hl,#_s_14_hitter3_psg
	push	hl
	call	_PSGSFXPlay
	pop	af
	inc	sp
;./my/extra_routines.h:13: delay (20); 
	ld	a,#0x14
	push	af
	inc	sp
	call	_delay
	inc	sp
;./my/extra_routines.h:8: for (gpit = 0; gpit < 5; gpit ++) {
	ld	iy,#_gpit
	inc	0 (iy)
	ld	a,0 (iy)
	sub	a, #0x05
	jr	C,00161$
;./my/extra_routines.h:16: bombs_set = 1;
	ld	hl,#_bombs_set + 0
	ld	(hl), #0x01
00151$:
;./mainloop/cheat.h:5: if ((pad0 & (PAD_B|PAD_SELECT|PAD_UP)) == (PAD_B|PAD_SELECT|PAD_UP)) break;
	ld	a,(#_pad0 + 0)
	and	a, #0x31
	sub	a, #0x31
	jr	Z,00160$
	call	_SG_queryPauseRequested
	bit	0,l
	jp	Z,00159$
;./mainloop/pause.h:6: HW_resetPauseRequest ();
	call	_SG_resetPauseRequest
;./mainloop/pause.h:7: paused ^= 1;
	ld	iy,#_paused
	ld	a,0 (iy)
	xor	a, #0x01
	ld	0 (iy),a
;./mainloop/pause.h:8: music_pause (paused);
	ld	a,(_paused)
	push	af
	inc	sp
	call	_music_pause
	inc	sp
	jp	00159$
00160$:
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
	ld	hl,#_update_list
	push	hl
	call	_SG_setUpdateList
	pop	af
;./game.c:145: first_game = 1;
	ld	hl,#_first_game + 0
	ld	(hl), #0x01
;./game.c:148: ntsc = 0;
	ld	hl,#_ntsc + 0
	ld	(hl), #0x00
;./game.c:154: unpack_bg_patterns (tsFONT_patterns_c, tsFONT_colours_c, 0, 7);
	ld	a,#0x07
	push	af
	inc	sp
	ld	hl,#0x0000
	push	hl
	ld	hl,#_tsFONT_colours_c
	push	hl
	ld	hl,#_tsFONT_patterns_c
	push	hl
	call	_unpack_bg_patterns
	ld	hl,#7
	add	hl,sp
	ld	sp,hl
;./game.c:156: credits ();
	call	_credits
;./game.c:159: unpack_bg_patterns (tsALL_patterns_c, tsALL_colours_c, 64*8, 7);
	ld	a,#0x07
	push	af
	inc	sp
	ld	hl,#0x0200
	push	hl
	ld	hl,#_tsALL_colours_c
	push	hl
	ld	hl,#_tsALL_patterns_c
	push	hl
	call	_unpack_bg_patterns
	ld	hl,#7
	add	hl,sp
	ld	sp,hl
;./game.c:160: aPLib_depack_VRAM (SGT_BASE, ssALL_patterns_c);
	ld	hl,#_ssALL_patterns_c
	push	hl
	ld	hl,#0x3800
	push	hl
	call	_aPLib_depack_VRAM
	pop	af
	pop	af
;./game.c:162: while (1) {	
00108$:
;./game.c:163: title ();
	call	_title
;./game.c:166: plife = PLAYER_LIFE;
	ld	hl,#_plife + 0
	ld	(hl), #0x0f
;./game.c:171: game_init (); 
	call	_game_init
;./game.c:172: game_loop ();
	call	_game_loop
;./game.c:174: if (game_over) {
	ld	a,(#_game_over + 0)
	or	a, a
	jr	Z,00102$
;./game.c:175: pres (scr_game_over, MUSIC_GOVER);
	ld	hl,#_m_p_gover_psg
	push	hl
	ld	hl,#_scr_game_over
	push	hl
	call	_pres
	pop	af
	pop	af
;./game.c:176: break;
	jr	00106$
00102$:
;./game.c:180: pres (scr_the_end, MUSIC_GOVER);
	ld	hl,#_m_p_gover_psg
	push	hl
	ld	hl,#_scr_the_end
	push	hl
	call	_pres
	pop	af
	pop	af
;./game.c:181: break;
00106$:
;./game.c:186: first_game = 0;
	ld	hl,#_first_game + 0
	ld	(hl), #0x00
	jr	00108$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
