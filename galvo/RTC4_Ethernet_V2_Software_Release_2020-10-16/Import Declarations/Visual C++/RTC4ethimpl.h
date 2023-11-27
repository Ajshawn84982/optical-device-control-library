//-----------------------------------------------------------------------------
//  File: RTC4ethimpl.h                         Copyright (c) 2020 SCANLAB GmbH
//-----------------------------------------------------------------------------
//
//
//
//  Abstract
//      RTC4eth function prototypes for implicitly linking - also known as
//      static load linking - to the RTC4ethDLL.DLL or RTC4ethDLLx64.DLL.
//
//  Authors
//      Gerald Schmid, Bernhard Schrems, Christian Lutz, Andreas J. Reichel 
//
//  Revision History
//      +-----+---------+--------+------------------------------------------+
//      | Mod |  Date   | Author | Description                              |
//      +-----+---------+--------+------------------------------------------+
//      | 0.0 | 13Dec00 |  GS    | * initial release                        |
//      | 0.1 | 10Jan01 |  BS    | * standard calling                       |
//      | 0.2 | 10Jan01 |  BS    | * use of const in parameter declarations |
//      | 0.3 | 18Jun15 |  CLU   | * include guard                          |
//      | 0.4 | 15Dec15 | BS,CLU | * 64bit compatibility                    |
//      | 0.5 | 29Sep16 |  CLU   | * Company name updated                   |
//      | 0.6 | 10Mar20 | ARE    | * New Python Generator for this file     |
//      +-----+---------+--------+------------------------------------------+
//
//      This file was automatically generated on 2020-10-17.
//
//  NOTE
//      You need to link the (Visual C++) import library RTC4ethDLL.LIB or
//      RTC4ethDLLx64.LIB for building a Win32 or a Win64 application
//      respectively.
//
//-----------------------------------------------------------------------------

#pragma once

extern "C" unsigned int __stdcall get_driver_status();
extern "C" unsigned int __stdcall get_net_dll_version();
extern "C" unsigned int __stdcall acquire_rtc(unsigned int card_no);
extern "C" unsigned int __stdcall release_rtc(unsigned int card_no);
extern "C" void __stdcall select_rtc(unsigned short card_no);
extern "C" unsigned int __stdcall assign_rtc(unsigned short search_no, unsigned short card_no);
extern "C" unsigned int __stdcall assign_rtc_by_ip(unsigned int ip, unsigned short card_no);
extern "C" void __stdcall remove_rtc(unsigned short card_no);
extern "C" unsigned int __stdcall convert_string_to_ip(const char * ip);
extern "C" void __stdcall convert_ip_to_string(unsigned int ip, char * cpIp);
extern "C" void __stdcall convert_mac_to_string(long long mac, char * cpMac);
extern "C" unsigned int __stdcall rtc_search_cards(unsigned short* cards, unsigned int ip, unsigned int netmask);
extern "C" long long __stdcall get_mac_address(unsigned short cardNo);
extern "C" unsigned int __stdcall get_ip_address(unsigned short cardNo);
extern "C" unsigned int __stdcall get_serial(unsigned short cardNo);
extern "C" unsigned short __stdcall get_connection_status(unsigned short cardNo);
extern "C" unsigned int __stdcall get_master_ip_address(unsigned short cardNo);
extern "C" unsigned int __stdcall get_master_id(unsigned short cardNo, char * id);
extern "C" unsigned int __stdcall set_static_ip(unsigned int ip, unsigned int netmask, unsigned int gateway);
extern "C" unsigned int __stdcall get_static_ip(unsigned int* ip, unsigned int* netmask, unsigned int* gateway);
extern "C" unsigned int __stdcall get_mcu_fw_version(unsigned short cardNo);
extern "C" unsigned int __stdcall get_nic_ip_count(unsigned short* count);
extern "C" void __stdcall get_nic_ip(unsigned short count, unsigned int* ip, unsigned int* nm);
extern "C" void __stdcall n_get_waveform(unsigned short n, unsigned short channel, unsigned short istop, signed short * MemPtr);
extern "C" void __stdcall get_waveform(unsigned short channel, unsigned short istop, signed short * MemPtr);
extern "C" void __stdcall n_measurement_status(unsigned short n, unsigned short* busy, unsigned short* position);
extern "C" void __stdcall measurement_status(unsigned short* busy, unsigned short* position);
extern "C" void __stdcall n_set_trigger(unsigned short n, unsigned short sampleperiod, unsigned short channel1, unsigned short channel2);
extern "C" void __stdcall set_trigger(unsigned short sampleperiod, unsigned short signal1, unsigned short signal2);
extern "C" short __stdcall n_get_value(unsigned short n, unsigned short signal);
extern "C" short __stdcall get_value(unsigned short signal);
extern "C" void __stdcall n_set_io_bit(unsigned short n, unsigned short mask1);
extern "C" void __stdcall set_io_bit(unsigned short mask1);
extern "C" void __stdcall n_clear_io_bit(unsigned short n, unsigned short mask0);
extern "C" void __stdcall clear_io_bit(unsigned short mask0);
extern "C" void __stdcall n_move_to(unsigned short n, unsigned short position);
extern "C" void __stdcall move_to(unsigned short position);
extern "C" void __stdcall n_control_command(unsigned short n, unsigned short head, unsigned short axis, unsigned short data);
extern "C" void __stdcall control_command(unsigned short head, unsigned short axis, unsigned short data);
extern "C" void __stdcall n_arc_rel(unsigned short n, short dx, short dy, double angle);
extern "C" void __stdcall arc_rel(short dx, short dy, double angle);
extern "C" void __stdcall n_arc_abs(unsigned short n, short x, short y, double angle);
extern "C" void __stdcall arc_abs(short x, short y, double angle);
extern "C" void __stdcall drilling(short PulseWidth, short RelEncoderDelay);
extern "C" void __stdcall regulation();
extern "C" void __stdcall flyline(short EncoderDelay);
extern "C" void __stdcall set_duty_cycle_table(unsigned short index, unsigned short dutycycle);
extern "C" short __stdcall n_load_varpolydelay(unsigned short n, const char * stbFileName, unsigned short TableNo);
extern "C" short __stdcall load_varpolydelay(const char * stbFileName, unsigned short TableNo);
extern "C" short __stdcall n_load_program_file(unsigned short n, const char * name);
extern "C" short __stdcall load_program_file(const char * name);
extern "C" short __stdcall n_load_correction_file(unsigned short n, const char * FileName, short CorTable, double Kx, double Ky, double Phi, double Xoffset, double Yoffset);
extern "C" short __stdcall load_correction_file(const char * FileName, short CorTable, double Kx, double Ky, double Phi, double Xoffset, double Yoffset);
extern "C" short __stdcall n_load_z_table(unsigned short n, double A, double B, double C);
extern "C" short __stdcall load_z_table(double A, double B, double C);
extern "C" void __stdcall n_list_nop(unsigned short n);
extern "C" void __stdcall list_nop();
extern "C" void __stdcall n_set_end_of_list(unsigned short n);
extern "C" void __stdcall set_end_of_list();
extern "C" void __stdcall n_jump_abs_3d(unsigned short n, short x, short y, short z);
extern "C" void __stdcall jump_abs_3d(short x, short y, short z);
extern "C" void __stdcall n_jump_abs(unsigned short n, short x, short y);
extern "C" void __stdcall jump_abs(short x, short y);
extern "C" void __stdcall n_mark_abs_3d(unsigned short n, short x, short y, short z);
extern "C" void __stdcall mark_abs_3d(short x, short y, short z);
extern "C" void __stdcall n_mark_abs(unsigned short n, short x, short y);
extern "C" void __stdcall mark_abs(short x, short y);
extern "C" void __stdcall n_jump_rel_3d(unsigned short n, short dx, short dy, short dz);
extern "C" void __stdcall jump_rel_3d(short dx, short dy, short dz);
extern "C" void __stdcall n_jump_rel(unsigned short n, short dx, short dy);
extern "C" void __stdcall jump_rel(short dx, short dy);
extern "C" void __stdcall n_mark_rel_3d(unsigned short n, short dx, short dy, short dz);
extern "C" void __stdcall mark_rel_3d(short dx, short dy, short dz);
extern "C" void __stdcall n_mark_rel(unsigned short n, short dx, short dy);
extern "C" void __stdcall mark_rel(short dx, short dy);
extern "C" void __stdcall n_write_8bit_port_list(unsigned short n, unsigned short value);
extern "C" void __stdcall write_8bit_port_list(unsigned short value);
extern "C" void __stdcall n_write_da_1_list(unsigned short n, unsigned short value);
extern "C" void __stdcall write_da_1_list(unsigned short value);
extern "C" void __stdcall n_write_da_2_list(unsigned short n, unsigned short value);
extern "C" void __stdcall write_da_2_list(unsigned short value);
extern "C" void __stdcall n_set_matrix_list(unsigned short n, unsigned short i, unsigned short j, double Mij);
extern "C" void __stdcall set_matrix_list(unsigned short i, unsigned short j, double Mij);
extern "C" void __stdcall n_set_offset_list(unsigned short n, short Xoffset, short Yoffset);
extern "C" void __stdcall set_offset_list(short Xoffset, short Yoffset);
extern "C" void __stdcall n_set_defocus_list(unsigned short n, short value);
extern "C" void __stdcall set_defocus_list(short value);
extern "C" void __stdcall n_set_defocus(unsigned short n, short value);
extern "C" void __stdcall set_defocus(short value);
extern "C" void __stdcall n_set_softstart_mode(unsigned short n, unsigned short mode, unsigned short number, unsigned short restartdelay);
extern "C" void __stdcall set_softstart_mode(unsigned short mode, unsigned short number, unsigned short resetdelay);
extern "C" void __stdcall n_set_softstart_level(unsigned short n, unsigned short index, unsigned short level);
extern "C" void __stdcall set_softstart_level(unsigned short index, unsigned short level);
extern "C" void __stdcall n_set_control_mode_list(unsigned short n, unsigned short mode);
extern "C" void __stdcall set_control_mode_list(unsigned short mode);
extern "C" void __stdcall n_set_control_mode(unsigned short n, unsigned short mode);
extern "C" void __stdcall set_control_mode(unsigned short mode);
extern "C" void __stdcall n_long_delay(unsigned short n, unsigned short value);
extern "C" void __stdcall long_delay(unsigned short value);
extern "C" void __stdcall n_laser_on_list(unsigned short n, unsigned short value);
extern "C" void __stdcall laser_on_list(unsigned short value);
extern "C" void __stdcall n_set_jump_speed(unsigned short n, double speed);
extern "C" void __stdcall set_jump_speed(double speed);
extern "C" void __stdcall n_set_mark_speed(unsigned short n, double speed);
extern "C" void __stdcall set_mark_speed(double speed);
extern "C" void __stdcall n_set_laser_delays(unsigned short n, short ondelay, short offdelay);
extern "C" void __stdcall set_laser_delays(short ondelay, short offdelay);
extern "C" void __stdcall n_set_scanner_delays(unsigned short n, unsigned short jumpdelay, unsigned short markdelay, unsigned short polydelay);
extern "C" void __stdcall set_scanner_delays(unsigned short jumpdelay, unsigned short markdelay, unsigned short polydelay);
extern "C" void __stdcall n_set_list_jump(unsigned short n, unsigned short position);
extern "C" void __stdcall set_list_jump(unsigned short position);
extern "C" void __stdcall n_set_input_pointer(unsigned short n, unsigned short pointer);
extern "C" void __stdcall set_input_pointer(unsigned short pointer);
extern "C" void __stdcall n_list_call(unsigned short n, unsigned short position);
extern "C" void __stdcall list_call(unsigned short position);
extern "C" void __stdcall n_list_return(unsigned short n);
extern "C" void __stdcall list_return();
extern "C" void __stdcall n_z_out_list(unsigned short n, short z);
extern "C" void __stdcall z_out_list(short z);
extern "C" void __stdcall n_set_standby_list(unsigned short n, unsigned short half_period, unsigned short pulse);
extern "C" void __stdcall set_standby_list(unsigned short half_period, unsigned short pulse);
extern "C" void __stdcall n_timed_jump_abs(unsigned short n, short x, short y, double time);
extern "C" void __stdcall timed_jump_abs(short x, short y, double time);
extern "C" void __stdcall n_timed_mark_abs(unsigned short n, short x, short y, double time);
extern "C" void __stdcall timed_mark_abs(short x, short y, double time);
extern "C" void __stdcall n_timed_jump_rel(unsigned short n, short dx, short dy, double time);
extern "C" void __stdcall timed_jump_rel(short dx, short dy, double time);
extern "C" void __stdcall n_timed_mark_rel(unsigned short n, short dx, short dy, double time);
extern "C" void __stdcall timed_mark_rel(short dx, short dy, double time);
extern "C" void __stdcall n_set_laser_timing(unsigned short n, unsigned short HalfPeriod, unsigned short Pulse1, unsigned short Pulse2, unsigned short TimeBase);
extern "C" void __stdcall set_laser_timing(unsigned short HalfPeriod, unsigned short Pulse1, unsigned short Pulse2, unsigned short TimeBase);
extern "C" void __stdcall n_set_wobbel(unsigned short n, unsigned short amplitude, double frequency);
extern "C" void __stdcall set_wobbel(unsigned short amplitude, double frequency);
extern "C" void __stdcall n_set_wobbel_xy(unsigned short n, unsigned short long_wob, unsigned short trans_wob, double frequency);
extern "C" void __stdcall set_wobbel_xy(unsigned short long_wob, unsigned short trans_wob, double frequency);
extern "C" void __stdcall n_set_fly_x(unsigned short n, double kx);
extern "C" void __stdcall set_fly_x(double kx);
extern "C" void __stdcall n_set_fly_y(unsigned short n, double ky);
extern "C" void __stdcall set_fly_y(double ky);
extern "C" void __stdcall n_set_fly_rot(unsigned short n, double resolution);
extern "C" void __stdcall set_fly_rot(double resolution);
extern "C" void __stdcall n_fly_return(unsigned short n, short x, short y);
extern "C" void __stdcall fly_return(short x, short y);
extern "C" void __stdcall n_calculate_fly(unsigned short n, unsigned short direction, double distance);
extern "C" void __stdcall calculate_fly(unsigned short direction, double distance);
extern "C" void __stdcall n_write_io_port_list(unsigned short n, unsigned short value);
extern "C" void __stdcall write_io_port_list(unsigned short value);
extern "C" void __stdcall n_select_cor_table_list(unsigned short n, unsigned short HeadA, unsigned short HeadB);
extern "C" void __stdcall select_cor_table_list(unsigned short HeadA, unsigned short HeadB);
extern "C" void __stdcall n_set_wait(unsigned short n, unsigned short value);
extern "C" void __stdcall set_wait(unsigned short value);
extern "C" void __stdcall n_simulate_ext_start(unsigned short n, short delay, short encoder);
extern "C" void __stdcall simulate_ext_start(short delay, short encoder);
extern "C" void __stdcall n_write_da_x_list(unsigned short n, unsigned short x, unsigned short value);
extern "C" void __stdcall write_da_x_list(unsigned short x, unsigned short value);
extern "C" void __stdcall n_set_pixel_line(unsigned short n, unsigned short PixelMode, unsigned short PixelPeriod, double dx, double dy);
extern "C" void __stdcall set_pixel_line(unsigned short PixelMode, unsigned short PixelPeriod, double dx, double dy);
extern "C" void __stdcall n_set_pixel(unsigned short n, unsigned short PulsWidth, unsigned short DAValue, unsigned short ADChannel);
extern "C" void __stdcall set_pixel(unsigned short PulsWidth, unsigned short DAValue, unsigned short ADChannel);
extern "C" void __stdcall n_set_extstartpos_list(unsigned short n, unsigned short position);
extern "C" void __stdcall set_extstartpos_list(unsigned short position);
extern "C" void __stdcall n_laser_signal_on_list(unsigned short n);
extern "C" void __stdcall laser_signal_on_list();
extern "C" void __stdcall n_laser_signal_off_list(unsigned short n);
extern "C" void __stdcall laser_signal_off_list();
extern "C" void __stdcall n_set_firstpulse_killer_list(unsigned short n, unsigned short fpk);
extern "C" void __stdcall set_firstpulse_killer_list(unsigned short fpk);
extern "C" void __stdcall n_set_io_cond_list(unsigned short n, unsigned short mask_1, unsigned short mask_0, unsigned short mask_set);
extern "C" void __stdcall set_io_cond_list(unsigned short mask_1, unsigned short mask_0, unsigned short mask_set);
extern "C" void __stdcall n_clear_io_cond_list(unsigned short n, unsigned short mask_1, unsigned short mask_0, unsigned short mask_clear);
extern "C" void __stdcall clear_io_cond_list(unsigned short mask_1, unsigned short mask_0, unsigned short mask_clear);
extern "C" void __stdcall n_list_jump_cond(unsigned short n, unsigned short mask_1, unsigned short mask_0, unsigned short position);
extern "C" void __stdcall list_jump_cond(unsigned short mask_1, unsigned short mask_0, unsigned short position);
extern "C" void __stdcall n_list_call_cond(unsigned short n, unsigned short mask_1, unsigned short mask_0, unsigned short position);
extern "C" void __stdcall list_call_cond(unsigned short mask_1, unsigned short mask_0, unsigned short position);
extern "C" unsigned short __stdcall n_get_input_pointer(unsigned short n);
extern "C" unsigned short __stdcall get_input_pointer();
extern "C" unsigned short __stdcall rtc4_max_cards();
extern "C" void __stdcall n_get_status(unsigned short n, unsigned short* busy, unsigned short* position);
extern "C" void __stdcall get_status(unsigned short* busy, unsigned short* position);
extern "C" unsigned short __stdcall n_read_status(unsigned short n);
extern "C" unsigned short __stdcall read_status();
extern "C" unsigned short __stdcall n_get_startstop_info(unsigned short n);
extern "C" unsigned short __stdcall get_startstop_info();
extern "C" unsigned short __stdcall n_get_marking_info(unsigned short n);
extern "C" unsigned short __stdcall get_marking_info();
extern "C" unsigned short __stdcall get_dll_version();
extern "C" void __stdcall n_set_start_list_1(unsigned short n);
extern "C" void __stdcall set_start_list_1();
extern "C" void __stdcall n_set_start_list_2(unsigned short n);
extern "C" void __stdcall set_start_list_2();
extern "C" void __stdcall n_set_start_list(unsigned short n, unsigned short ListNo);
extern "C" void __stdcall set_start_list(unsigned short ListNo);
extern "C" void __stdcall n_execute_list_1(unsigned short n);
extern "C" void __stdcall execute_list_1();
extern "C" void __stdcall n_execute_list_2(unsigned short n);
extern "C" void __stdcall execute_list_2();
extern "C" void __stdcall n_execute_list(unsigned short n, unsigned short ListNo);
extern "C" void __stdcall execute_list(unsigned short ListNo);
extern "C" void __stdcall n_write_8bit_port(unsigned short n, unsigned short value);
extern "C" void __stdcall write_8bit_port(unsigned short value);
extern "C" void __stdcall n_write_io_port(unsigned short n, unsigned short value);
extern "C" void __stdcall write_io_port(unsigned short value);
extern "C" long __stdcall n_eth_status(unsigned short n);
extern "C" long __stdcall eth_status();
extern "C" void __stdcall n_auto_change(unsigned short n);
extern "C" void __stdcall auto_change();
extern "C" void __stdcall n_auto_change_pos(unsigned short n, unsigned short start);
extern "C" void __stdcall auto_change_pos(unsigned short start);
extern "C" void __stdcall aut_change();
extern "C" void __stdcall n_start_loop(unsigned short n);
extern "C" void __stdcall start_loop();
extern "C" void __stdcall n_quit_loop(unsigned short n);
extern "C" void __stdcall quit_loop();
extern "C" void __stdcall n_stop_execution(unsigned short n);
extern "C" void __stdcall stop_execution();
extern "C" unsigned short __stdcall n_read_io_port(unsigned short n);
extern "C" unsigned short __stdcall read_io_port();
extern "C" void __stdcall n_write_da_1(unsigned short n, unsigned short value);
extern "C" void __stdcall write_da_1(unsigned short value);
extern "C" void __stdcall n_write_da_2(unsigned short n, unsigned short value);
extern "C" void __stdcall write_da_2(unsigned short value);
extern "C" void __stdcall n_set_max_counts(unsigned short n, long counts);
extern "C" void __stdcall set_max_counts(long counts);
extern "C" long __stdcall n_get_counts(unsigned short n);
extern "C" long __stdcall get_counts();
extern "C" void __stdcall n_set_matrix(unsigned short n, double M11, double M12, double M21, double M22);
extern "C" void __stdcall set_matrix(double M11, double M12, double M21, double M22);
extern "C" void __stdcall n_set_offset(unsigned short n, short Xoffset, short Yoffset);
extern "C" void __stdcall set_offset(short Xoffset, short Yoffset);
extern "C" void __stdcall n_goto_xyz(unsigned short n, short X, short Y, short Z);
extern "C" void __stdcall goto_xyz(short X, short Y, short Z);
extern "C" void __stdcall n_goto_xy(unsigned short n, short X, short Y);
extern "C" void __stdcall goto_xy(short X, short Y);
extern "C" unsigned short __stdcall n_get_hex_version(unsigned short n);
extern "C" unsigned short __stdcall get_hex_version();
extern "C" void __stdcall n_disable_laser(unsigned short n);
extern "C" void __stdcall disable_laser();
extern "C" void __stdcall n_enable_laser(unsigned short n);
extern "C" void __stdcall enable_laser();
extern "C" void __stdcall n_stop_list(unsigned short n);
extern "C" void __stdcall stop_list();
extern "C" void __stdcall n_restart_list(unsigned short n);
extern "C" void __stdcall restart_list();
extern "C" void __stdcall n_get_xyz_pos(unsigned short n, short* X, short* Y, short* Z);
extern "C" void __stdcall get_xyz_pos(short* X, short* Y, short* Z);
extern "C" void __stdcall n_get_xy_pos(unsigned short n, short* X, short* Y);
extern "C" void __stdcall get_xy_pos(short* X, short* Y);
extern "C" void __stdcall n_select_list(unsigned short n, unsigned short list_2);
extern "C" void __stdcall select_list(unsigned short list_2);
extern "C" void __stdcall n_z_out(unsigned short n, short z);
extern "C" void __stdcall z_out(short z);
extern "C" void __stdcall n_set_firstpulse_killer(unsigned short n, unsigned short fpk);
extern "C" void __stdcall set_firstpulse_killer(unsigned short fpk);
extern "C" void __stdcall n_set_standby(unsigned short n, unsigned short half_period, unsigned short pulse);
extern "C" void __stdcall set_standby(unsigned short half_period, unsigned short pulse);
extern "C" void __stdcall n_laser_signal_on(unsigned short n);
extern "C" void __stdcall laser_signal_on();
extern "C" void __stdcall n_laser_signal_off(unsigned short n);
extern "C" void __stdcall laser_signal_off();
extern "C" void __stdcall n_set_delay_mode(unsigned short n, unsigned short VarPoly, unsigned short DirectMove3D, unsigned short EdgeLevel, unsigned short MinJumpDelay, unsigned short JumpLengthLimit);
extern "C" void __stdcall set_delay_mode(unsigned short VarPoly, unsigned short DirectMove3D, unsigned short EdgeLevel, unsigned short MinJumpDelay, unsigned short JumpLengthLimit);
extern "C" void __stdcall n_set_piso_control(unsigned short n, unsigned short l1, unsigned short l2);
extern "C" void __stdcall set_piso_control(unsigned short l1, unsigned short l2);
extern "C" void __stdcall n_select_status(unsigned short n, unsigned short mode);
extern "C" void __stdcall select_status(unsigned short mode);
extern "C" void __stdcall n_get_encoder(unsigned short n, short* Zx, short* Zy);
extern "C" void __stdcall get_encoder(short* Zx, short* Zy);
extern "C" void __stdcall n_select_cor_table(unsigned short n, unsigned short HeadA, unsigned short HeadB);
extern "C" void __stdcall select_cor_table(unsigned short HeadA, unsigned short HeadB);
extern "C" void __stdcall n_execute_at_pointer(unsigned short n, unsigned short position);
extern "C" void __stdcall execute_at_pointer(unsigned short position);
extern "C" unsigned short __stdcall n_get_head_status(unsigned short n, unsigned short Head);
extern "C" unsigned short __stdcall get_head_status(unsigned short Head);
extern "C" void __stdcall n_simulate_encoder(unsigned short n, unsigned short Channel);
extern "C" void __stdcall simulate_encoder(unsigned short Channel);
extern "C" void __stdcall n_release_wait(unsigned short n);
extern "C" void __stdcall release_wait();
extern "C" unsigned short __stdcall n_get_wait_status(unsigned short n);
extern "C" unsigned short __stdcall get_wait_status();
extern "C" void __stdcall n_set_laser_mode(unsigned short n, unsigned short mode);
extern "C" void __stdcall set_laser_mode(unsigned short mode);
extern "C" void __stdcall n_set_ext_start_delay(unsigned short n, short delay, short encoder);
extern "C" void __stdcall set_ext_start_delay(short delay, short encoder);
extern "C" void __stdcall n_home_position(unsigned short n, short xhome, short yhome);
extern "C" void __stdcall home_position(short xhome, short yhome);
extern "C" void __stdcall n_set_rot_center(unsigned short n, long center_x, long center_y);
extern "C" void __stdcall set_rot_center(long center_x, long center_y);
extern "C" void __stdcall n_dsp_start(unsigned short n);
extern "C" void __stdcall dsp_start();
extern "C" void __stdcall n_write_da_x(unsigned short n, unsigned short x, unsigned short value);
extern "C" void __stdcall write_da_x(unsigned short x, unsigned short value);
extern "C" unsigned short __stdcall n_read_ad_x(unsigned short n, unsigned short x);
extern "C" unsigned short __stdcall read_ad_x(unsigned short x);
extern "C" unsigned short __stdcall n_read_pixel_ad(unsigned short n, unsigned short pos);
extern "C" unsigned short __stdcall read_pixel_ad(unsigned short pos);
extern "C" short __stdcall n_get_z_distance(unsigned short n, short x, short y, short z);
extern "C" short __stdcall get_z_distance(short x, short y, short z);
extern "C" unsigned short __stdcall n_get_io_status(unsigned short n);
extern "C" unsigned short __stdcall get_io_status();
extern "C" short __stdcall load_cor(const char * FileName);
extern "C" short __stdcall load_pro(const char * FileName);
extern "C" unsigned short __stdcall n_get_serial_number(unsigned short n);
extern "C" unsigned short __stdcall get_serial_number();
extern "C" long __stdcall n_get_serial_number_32(unsigned short n);
extern "C" long __stdcall get_serial_number_32();
extern "C" unsigned short __stdcall n_get_rtc_version(unsigned short n);
extern "C" unsigned short __stdcall get_rtc_version();
extern "C" short __stdcall n_auto_cal(unsigned short n, unsigned short Head, unsigned short command);
extern "C" short __stdcall auto_cal(unsigned short Head, unsigned short command);
extern "C" void __stdcall n_set_hi(unsigned short n, double GalvoGainX, double GalvoGainY, short GalvoOffsetX, short GalvoOffsetY, short Head);
extern "C" void __stdcall set_hi(double GalvoGainX, double GalvoGainY, short GalvoOffsetX, short GalvoOffsetY, short Head);
extern "C" void __stdcall n_set_list_mode(unsigned short n, unsigned short mode);
extern "C" void __stdcall set_list_mode(unsigned short mode);
extern "C" unsigned short __stdcall n_get_list_space(unsigned short n);
extern "C" unsigned short __stdcall get_list_space();
extern "C" void __stdcall n_save_and_restart_timer(unsigned short n);
extern "C" void __stdcall save_and_restart_timer();
extern "C" void __stdcall n_set_ext_start_delay_list(unsigned short n, short delay, short encoder);
extern "C" void __stdcall set_ext_start_delay_list(short delay, short encoder);
extern "C" double __stdcall n_get_time(unsigned short n);
extern "C" double __stdcall get_time();
extern "C" void __stdcall get_hi_data(unsigned short* x1, unsigned short* x2, unsigned short* y1, unsigned short* y2);
extern "C" short __stdcall teachin(const char * FileName, short Xin, short Yin, short Zin, double LL0, short* Xout, short* Yout, short* Zout);
extern "C" short __stdcall getmemory(unsigned short adr);
extern "C" void __stdcall set_timeout(unsigned int timeout);
extern "C" void __stdcall set_timeouts(unsigned int acquire_timeout_us, unsigned int acquire_max_retries, unsigned int send_recv_timeout_us, unsigned int send_recv_max_retries, unsigned int acqu_rel_min_intvl_ms);
extern "C" void __stdcall get_timeouts(unsigned int* acquire_timeout_us, unsigned int* acquire_max_retries, unsigned int* send_recv_timeout_us, unsigned int* send_recv_max_retries, unsigned int* acqu_rel_min_intvl_ms);
extern "C" unsigned int __stdcall rs232_config(unsigned int baudrate, unsigned int parity, unsigned int stopbits);
extern "C" unsigned int __stdcall n_rs232_config(unsigned short n, unsigned int baudrate, unsigned int parity, unsigned int stopbits);
extern "C" unsigned int __stdcall rs232_write_data(unsigned int data);
extern "C" unsigned int __stdcall n_rs232_write_data(unsigned short n, unsigned int data);
extern "C" unsigned int __stdcall rs232_write_text(const char * text);
extern "C" unsigned int __stdcall n_rs232_write_text(unsigned short n, const char * text);
extern "C" unsigned int __stdcall rs232_read_data(char * data);
extern "C" unsigned int __stdcall n_rs232_read_data(unsigned short n, char * data);
extern "C" void __stdcall n_eth_set_com_timeouts_auto(unsigned short cardNo, double initial_timeout_ms, double sum_timeout_ms, double multiplicator, long mode);
extern "C" void __stdcall eth_set_com_timeouts_auto(double initial_timeout_ms, double sum_timeout_ms, double multiplicator, long mode);
extern "C" void __stdcall n_eth_get_com_timeouts_auto(unsigned short cardNo, double* initial_timeout_ms, double* sum_timeout_ms, double* multiplicator, long* mode);
extern "C" void __stdcall eth_get_com_timeouts_auto(double* initial_timeout_ms, double* sum_timeout_ms, double* multiplicator, long* mode);