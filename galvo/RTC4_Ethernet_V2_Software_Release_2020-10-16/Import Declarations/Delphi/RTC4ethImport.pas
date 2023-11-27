unit RTC4ethImport;
{
  Delphi import declarations for the SCANLAB RTC4eth-DLL

  This file was automatically generated on 2020-10-17.
}
interface

uses Windows;

const 
{$IFDEF WIN64}
  RTC4ethDLL = 'RTC4ethDLLx64.DLL';
{$ELSE}
  RTC4ethDLL = 'RTC4ethDLL.DLL';
{$ENDIF}

type
  PInt = ^SmallInt;
  POutChar = PAnsiChar;

function  get_driver_status: dword; stdcall; external RTC4ethDLL;
function  get_net_dll_version: dword; stdcall; external RTC4ethDLL;
function  acquire_rtc(card_no: dword): dword; stdcall; external RTC4ethDLL;
function  release_rtc(card_no: dword): dword; stdcall; external RTC4ethDLL;
procedure select_rtc(card_no: word); stdcall; external RTC4ethDLL;
function  assign_rtc(search_no: word; card_no: word): dword; stdcall; external RTC4ethDLL;
function  assign_rtc_by_ip(ip: dword; card_no: word): dword; stdcall; external RTC4ethDLL;
procedure remove_rtc(card_no: word); stdcall; external RTC4ethDLL;
function  convert_string_to_ip(ip: pansichar): dword; stdcall; external RTC4ethDLL;
procedure convert_ip_to_string(ip: dword; cpIp: poutchar); stdcall; external RTC4ethDLL;
procedure convert_mac_to_string(mac: int64; cpMac: poutchar); stdcall; external RTC4ethDLL;
function  rtc_search_cards(var cards: word; ip: dword; netmask: dword): dword; stdcall; external RTC4ethDLL;
function  get_mac_address(cardNo: word): Int64; stdcall; external RTC4ethDLL;
function  get_ip_address(cardNo: word): dword; stdcall; external RTC4ethDLL;
function  get_serial(cardNo: word): dword; stdcall; external RTC4ethDLL;
function  get_connection_status(cardNo: word): word; stdcall; external RTC4ethDLL;
function  get_master_ip_address(cardNo: word): dword; stdcall; external RTC4ethDLL;
function  get_master_id(cardNo: word; id: poutchar): dword; stdcall; external RTC4ethDLL;
function  set_static_ip(ip: dword; netmask: dword; gateway: dword): dword; stdcall; external RTC4ethDLL;
function  get_static_ip(var ip: dword; var netmask: dword; var gateway: dword): dword; stdcall; external RTC4ethDLL;
function  get_mcu_fw_version(cardNo: word): dword; stdcall; external RTC4ethDLL;
function  get_nic_ip_count(var count: word): dword; stdcall; external RTC4ethDLL;
procedure get_nic_ip(count: word; var ip: dword; var nm: dword); stdcall; external RTC4ethDLL;
procedure n_get_waveform(n: word; channel: word; istop: word; MemPtr: pint); stdcall; external RTC4ethDLL;
procedure get_waveform(channel: word; istop: word; MemPtr: pint); stdcall; external RTC4ethDLL;
procedure n_measurement_status(n: word; var busy: wordbool; var position: word); stdcall; external RTC4ethDLL;
procedure measurement_status(var busy: wordbool; var position: word); stdcall; external RTC4ethDLL;
procedure n_set_trigger(n: word; sampleperiod: word; channel1: word; channel2: word); stdcall; external RTC4ethDLL;
procedure set_trigger(sampleperiod: word; signal1: word; signal2: word); stdcall; external RTC4ethDLL;
function  n_get_value(n: word; signal: word): smallint; stdcall; external RTC4ethDLL;
function  get_value(signal: word): smallint; stdcall; external RTC4ethDLL;
procedure n_set_io_bit(n: word; mask1: word); stdcall; external RTC4ethDLL;
procedure set_io_bit(mask1: word); stdcall; external RTC4ethDLL;
procedure n_clear_io_bit(n: word; mask0: word); stdcall; external RTC4ethDLL;
procedure clear_io_bit(mask0: word); stdcall; external RTC4ethDLL;
procedure n_move_to(n: word; position: word); stdcall; external RTC4ethDLL;
procedure move_to(position: word); stdcall; external RTC4ethDLL;
procedure n_control_command(n: word; head: word; axis: word; data: word); stdcall; external RTC4ethDLL;
procedure control_command(head: word; axis: word; data: word); stdcall; external RTC4ethDLL;
procedure n_arc_rel(n: word; dx: smallint; dy: smallint; angle: double); stdcall; external RTC4ethDLL;
procedure arc_rel(dx: smallint; dy: smallint; angle: double); stdcall; external RTC4ethDLL;
procedure n_arc_abs(n: word; x: smallint; y: smallint; angle: double); stdcall; external RTC4ethDLL;
procedure arc_abs(x: smallint; y: smallint; angle: double); stdcall; external RTC4ethDLL;
procedure drilling(PulseWidth: smallint; RelEncoderDelay: smallint); stdcall; external RTC4ethDLL;
procedure regulation; stdcall; external RTC4ethDLL;
procedure flyline(EncoderDelay: smallint); stdcall; external RTC4ethDLL;
procedure set_duty_cycle_table(index: word; dutycycle: word); stdcall; external RTC4ethDLL;
function  n_load_varpolydelay(n: word; stbFileName: pansichar; TableNo: word): smallint; stdcall; external RTC4ethDLL;
function  load_varpolydelay(stbFileName: pansichar; TableNo: word): smallint; stdcall; external RTC4ethDLL;
function  n_load_program_file(n: word; name: pansichar): smallint; stdcall; external RTC4ethDLL;
function  load_program_file(name: pansichar): smallint; stdcall; external RTC4ethDLL;
function  n_load_correction_file(n: word; FileName: pansichar; CorTable: smallint; Kx: double; Ky: double; Phi: double; Xoffset: double; Yoffset: double): smallint; stdcall; external RTC4ethDLL;
function  load_correction_file(FileName: pansichar; CorTable: smallint; Kx: double; Ky: double; Phi: double; Xoffset: double; Yoffset: double): smallint; stdcall; external RTC4ethDLL;
function  n_load_z_table(n: word; A: double; B: double; C: double): smallint; stdcall; external RTC4ethDLL;
function  load_z_table(A: double; B: double; C: double): smallint; stdcall; external RTC4ethDLL;
procedure n_list_nop(n: word); stdcall; external RTC4ethDLL;
procedure list_nop; stdcall; external RTC4ethDLL;
procedure n_set_end_of_list(n: word); stdcall; external RTC4ethDLL;
procedure set_end_of_list; stdcall; external RTC4ethDLL;
procedure n_jump_abs_3d(n: word; x: smallint; y: smallint; z: smallint); stdcall; external RTC4ethDLL;
procedure jump_abs_3d(x: smallint; y: smallint; z: smallint); stdcall; external RTC4ethDLL;
procedure n_jump_abs(n: word; x: smallint; y: smallint); stdcall; external RTC4ethDLL;
procedure jump_abs(x: smallint; y: smallint); stdcall; external RTC4ethDLL;
procedure n_mark_abs_3d(n: word; x: smallint; y: smallint; z: smallint); stdcall; external RTC4ethDLL;
procedure mark_abs_3d(x: smallint; y: smallint; z: smallint); stdcall; external RTC4ethDLL;
procedure n_mark_abs(n: word; x: smallint; y: smallint); stdcall; external RTC4ethDLL;
procedure mark_abs(x: smallint; y: smallint); stdcall; external RTC4ethDLL;
procedure n_jump_rel_3d(n: word; dx: smallint; dy: smallint; dz: smallint); stdcall; external RTC4ethDLL;
procedure jump_rel_3d(dx: smallint; dy: smallint; dz: smallint); stdcall; external RTC4ethDLL;
procedure n_jump_rel(n: word; dx: smallint; dy: smallint); stdcall; external RTC4ethDLL;
procedure jump_rel(dx: smallint; dy: smallint); stdcall; external RTC4ethDLL;
procedure n_mark_rel_3d(n: word; dx: smallint; dy: smallint; dz: smallint); stdcall; external RTC4ethDLL;
procedure mark_rel_3d(dx: smallint; dy: smallint; dz: smallint); stdcall; external RTC4ethDLL;
procedure n_mark_rel(n: word; dx: smallint; dy: smallint); stdcall; external RTC4ethDLL;
procedure mark_rel(dx: smallint; dy: smallint); stdcall; external RTC4ethDLL;
procedure n_write_8bit_port_list(n: word; value: word); stdcall; external RTC4ethDLL;
procedure write_8bit_port_list(value: word); stdcall; external RTC4ethDLL;
procedure n_write_da_1_list(n: word; value: word); stdcall; external RTC4ethDLL;
procedure write_da_1_list(value: word); stdcall; external RTC4ethDLL;
procedure n_write_da_2_list(n: word; value: word); stdcall; external RTC4ethDLL;
procedure write_da_2_list(value: word); stdcall; external RTC4ethDLL;
procedure n_set_matrix_list(n: word; i: word; j: word; Mij: double); stdcall; external RTC4ethDLL;
procedure set_matrix_list(i: word; j: word; Mij: double); stdcall; external RTC4ethDLL;
procedure n_set_offset_list(n: word; Xoffset: smallint; Yoffset: smallint); stdcall; external RTC4ethDLL;
procedure set_offset_list(Xoffset: smallint; Yoffset: smallint); stdcall; external RTC4ethDLL;
procedure n_set_defocus_list(n: word; value: smallint); stdcall; external RTC4ethDLL;
procedure set_defocus_list(value: smallint); stdcall; external RTC4ethDLL;
procedure n_set_defocus(n: word; value: smallint); stdcall; external RTC4ethDLL;
procedure set_defocus(value: smallint); stdcall; external RTC4ethDLL;
procedure n_set_softstart_mode(n: word; mode: word; number: word; restartdelay: word); stdcall; external RTC4ethDLL;
procedure set_softstart_mode(mode: word; number: word; resetdelay: word); stdcall; external RTC4ethDLL;
procedure n_set_softstart_level(n: word; index: word; level: word); stdcall; external RTC4ethDLL;
procedure set_softstart_level(index: word; level: word); stdcall; external RTC4ethDLL;
procedure n_set_control_mode_list(n: word; mode: word); stdcall; external RTC4ethDLL;
procedure set_control_mode_list(mode: word); stdcall; external RTC4ethDLL;
procedure n_set_control_mode(n: word; mode: word); stdcall; external RTC4ethDLL;
procedure set_control_mode(mode: word); stdcall; external RTC4ethDLL;
procedure n_long_delay(n: word; value: word); stdcall; external RTC4ethDLL;
procedure long_delay(value: word); stdcall; external RTC4ethDLL;
procedure n_laser_on_list(n: word; value: word); stdcall; external RTC4ethDLL;
procedure laser_on_list(value: word); stdcall; external RTC4ethDLL;
procedure n_set_jump_speed(n: word; speed: double); stdcall; external RTC4ethDLL;
procedure set_jump_speed(speed: double); stdcall; external RTC4ethDLL;
procedure n_set_mark_speed(n: word; speed: double); stdcall; external RTC4ethDLL;
procedure set_mark_speed(speed: double); stdcall; external RTC4ethDLL;
procedure n_set_laser_delays(n: word; ondelay: smallint; offdelay: smallint); stdcall; external RTC4ethDLL;
procedure set_laser_delays(ondelay: smallint; offdelay: smallint); stdcall; external RTC4ethDLL;
procedure n_set_scanner_delays(n: word; jumpdelay: word; markdelay: word; polydelay: word); stdcall; external RTC4ethDLL;
procedure set_scanner_delays(jumpdelay: word; markdelay: word; polydelay: word); stdcall; external RTC4ethDLL;
procedure n_set_list_jump(n: word; position: word); stdcall; external RTC4ethDLL;
procedure set_list_jump(position: word); stdcall; external RTC4ethDLL;
procedure n_set_input_pointer(n: word; pointer: word); stdcall; external RTC4ethDLL;
procedure set_input_pointer(pointer: word); stdcall; external RTC4ethDLL;
procedure n_list_call(n: word; position: word); stdcall; external RTC4ethDLL;
procedure list_call(position: word); stdcall; external RTC4ethDLL;
procedure n_list_return(n: word); stdcall; external RTC4ethDLL;
procedure list_return; stdcall; external RTC4ethDLL;
procedure n_z_out_list(n: word; z: smallint); stdcall; external RTC4ethDLL;
procedure z_out_list(z: smallint); stdcall; external RTC4ethDLL;
procedure n_set_standby_list(n: word; half_period: word; pulse: word); stdcall; external RTC4ethDLL;
procedure set_standby_list(half_period: word; pulse: word); stdcall; external RTC4ethDLL;
procedure n_timed_jump_abs(n: word; x: smallint; y: smallint; time: double); stdcall; external RTC4ethDLL;
procedure timed_jump_abs(x: smallint; y: smallint; time: double); stdcall; external RTC4ethDLL;
procedure n_timed_mark_abs(n: word; x: smallint; y: smallint; time: double); stdcall; external RTC4ethDLL;
procedure timed_mark_abs(x: smallint; y: smallint; time: double); stdcall; external RTC4ethDLL;
procedure n_timed_jump_rel(n: word; dx: smallint; dy: smallint; time: double); stdcall; external RTC4ethDLL;
procedure timed_jump_rel(dx: smallint; dy: smallint; time: double); stdcall; external RTC4ethDLL;
procedure n_timed_mark_rel(n: word; dx: smallint; dy: smallint; time: double); stdcall; external RTC4ethDLL;
procedure timed_mark_rel(dx: smallint; dy: smallint; time: double); stdcall; external RTC4ethDLL;
procedure n_set_laser_timing(n: word; HalfPeriod: word; Pulse1: word; Pulse2: word; TimeBase: word); stdcall; external RTC4ethDLL;
procedure set_laser_timing(HalfPeriod: word; Pulse1: word; Pulse2: word; TimeBase: word); stdcall; external RTC4ethDLL;
procedure n_set_wobbel(n: word; amplitude: word; frequency: double); stdcall; external RTC4ethDLL;
procedure set_wobbel(amplitude: word; frequency: double); stdcall; external RTC4ethDLL;
procedure n_set_wobbel_xy(n: word; long_wob: word; trans_wob: word; frequency: double); stdcall; external RTC4ethDLL;
procedure set_wobbel_xy(long_wob: word; trans_wob: word; frequency: double); stdcall; external RTC4ethDLL;
procedure n_set_fly_x(n: word; kx: double); stdcall; external RTC4ethDLL;
procedure set_fly_x(kx: double); stdcall; external RTC4ethDLL;
procedure n_set_fly_y(n: word; ky: double); stdcall; external RTC4ethDLL;
procedure set_fly_y(ky: double); stdcall; external RTC4ethDLL;
procedure n_set_fly_rot(n: word; resolution: double); stdcall; external RTC4ethDLL;
procedure set_fly_rot(resolution: double); stdcall; external RTC4ethDLL;
procedure n_fly_return(n: word; x: smallint; y: smallint); stdcall; external RTC4ethDLL;
procedure fly_return(x: smallint; y: smallint); stdcall; external RTC4ethDLL;
procedure n_calculate_fly(n: word; direction: word; distance: double); stdcall; external RTC4ethDLL;
procedure calculate_fly(direction: word; distance: double); stdcall; external RTC4ethDLL;
procedure n_write_io_port_list(n: word; value: word); stdcall; external RTC4ethDLL;
procedure write_io_port_list(value: word); stdcall; external RTC4ethDLL;
procedure n_select_cor_table_list(n: word; HeadA: word; HeadB: word); stdcall; external RTC4ethDLL;
procedure select_cor_table_list(HeadA: word; HeadB: word); stdcall; external RTC4ethDLL;
procedure n_set_wait(n: word; value: word); stdcall; external RTC4ethDLL;
procedure set_wait(value: word); stdcall; external RTC4ethDLL;
procedure n_simulate_ext_start(n: word; delay: smallint; encoder: smallint); stdcall; external RTC4ethDLL;
procedure simulate_ext_start(delay: smallint; encoder: smallint); stdcall; external RTC4ethDLL;
procedure n_write_da_x_list(n: word; x: word; value: word); stdcall; external RTC4ethDLL;
procedure write_da_x_list(x: word; value: word); stdcall; external RTC4ethDLL;
procedure n_set_pixel_line(n: word; PixelMode: word; PixelPeriod: word; dx: double; dy: double); stdcall; external RTC4ethDLL;
procedure set_pixel_line(PixelMode: word; PixelPeriod: word; dx: double; dy: double); stdcall; external RTC4ethDLL;
procedure n_set_pixel(n: word; PulsWidth: word; DAValue: word; ADChannel: word); stdcall; external RTC4ethDLL;
procedure set_pixel(PulsWidth: word; DAValue: word; ADChannel: word); stdcall; external RTC4ethDLL;
procedure n_set_extstartpos_list(n: word; position: word); stdcall; external RTC4ethDLL;
procedure set_extstartpos_list(position: word); stdcall; external RTC4ethDLL;
procedure n_laser_signal_on_list(n: word); stdcall; external RTC4ethDLL;
procedure laser_signal_on_list; stdcall; external RTC4ethDLL;
procedure n_laser_signal_off_list(n: word); stdcall; external RTC4ethDLL;
procedure laser_signal_off_list; stdcall; external RTC4ethDLL;
procedure n_set_firstpulse_killer_list(n: word; fpk: word); stdcall; external RTC4ethDLL;
procedure set_firstpulse_killer_list(fpk: word); stdcall; external RTC4ethDLL;
procedure n_set_io_cond_list(n: word; mask_1: word; mask_0: word; mask_set: word); stdcall; external RTC4ethDLL;
procedure set_io_cond_list(mask_1: word; mask_0: word; mask_set: word); stdcall; external RTC4ethDLL;
procedure n_clear_io_cond_list(n: word; mask_1: word; mask_0: word; mask_clear: word); stdcall; external RTC4ethDLL;
procedure clear_io_cond_list(mask_1: word; mask_0: word; mask_clear: word); stdcall; external RTC4ethDLL;
procedure n_list_jump_cond(n: word; mask_1: word; mask_0: word; position: word); stdcall; external RTC4ethDLL;
procedure list_jump_cond(mask_1: word; mask_0: word; position: word); stdcall; external RTC4ethDLL;
procedure n_list_call_cond(n: word; mask_1: word; mask_0: word; position: word); stdcall; external RTC4ethDLL;
procedure list_call_cond(mask_1: word; mask_0: word; position: word); stdcall; external RTC4ethDLL;
function  n_get_input_pointer(n: word): word; stdcall; external RTC4ethDLL;
function  get_input_pointer: word; stdcall; external RTC4ethDLL;
function  rtc4_max_cards: word; stdcall; external RTC4ethDLL;
procedure n_get_status(n: word; var busy: wordbool; var position: word); stdcall; external RTC4ethDLL;
procedure get_status(var busy: wordbool; var position: word); stdcall; external RTC4ethDLL;
function  n_read_status(n: word): word; stdcall; external RTC4ethDLL;
function  read_status: word; stdcall; external RTC4ethDLL;
function  n_get_startstop_info(n: word): word; stdcall; external RTC4ethDLL;
function  get_startstop_info: word; stdcall; external RTC4ethDLL;
function  n_get_marking_info(n: word): word; stdcall; external RTC4ethDLL;
function  get_marking_info: word; stdcall; external RTC4ethDLL;
function  get_dll_version: word; stdcall; external RTC4ethDLL;
procedure n_set_start_list_1(n: word); stdcall; external RTC4ethDLL;
procedure set_start_list_1; stdcall; external RTC4ethDLL;
procedure n_set_start_list_2(n: word); stdcall; external RTC4ethDLL;
procedure set_start_list_2; stdcall; external RTC4ethDLL;
procedure n_set_start_list(n: word; ListNo: word); stdcall; external RTC4ethDLL;
procedure set_start_list(ListNo: word); stdcall; external RTC4ethDLL;
procedure n_execute_list_1(n: word); stdcall; external RTC4ethDLL;
procedure execute_list_1; stdcall; external RTC4ethDLL;
procedure n_execute_list_2(n: word); stdcall; external RTC4ethDLL;
procedure execute_list_2; stdcall; external RTC4ethDLL;
procedure n_execute_list(n: word; ListNo: word); stdcall; external RTC4ethDLL;
procedure execute_list(ListNo: word); stdcall; external RTC4ethDLL;
procedure n_write_8bit_port(n: word; value: word); stdcall; external RTC4ethDLL;
procedure write_8bit_port(value: word); stdcall; external RTC4ethDLL;
procedure n_write_io_port(n: word; value: word); stdcall; external RTC4ethDLL;
procedure write_io_port(value: word); stdcall; external RTC4ethDLL;
function  n_eth_status(n: word): longint; stdcall; external RTC4ethDLL;
function  eth_status: longint; stdcall; external RTC4ethDLL;
procedure n_auto_change(n: word); stdcall; external RTC4ethDLL;
procedure auto_change; stdcall; external RTC4ethDLL;
procedure n_auto_change_pos(n: word; start: word); stdcall; external RTC4ethDLL;
procedure auto_change_pos(start: word); stdcall; external RTC4ethDLL;
procedure aut_change; stdcall; external RTC4ethDLL;
procedure n_start_loop(n: word); stdcall; external RTC4ethDLL;
procedure start_loop; stdcall; external RTC4ethDLL;
procedure n_quit_loop(n: word); stdcall; external RTC4ethDLL;
procedure quit_loop; stdcall; external RTC4ethDLL;
procedure n_stop_execution(n: word); stdcall; external RTC4ethDLL;
procedure stop_execution; stdcall; external RTC4ethDLL;
function  n_read_io_port(n: word): word; stdcall; external RTC4ethDLL;
function  read_io_port: word; stdcall; external RTC4ethDLL;
procedure n_write_da_1(n: word; value: word); stdcall; external RTC4ethDLL;
procedure write_da_1(value: word); stdcall; external RTC4ethDLL;
procedure n_write_da_2(n: word; value: word); stdcall; external RTC4ethDLL;
procedure write_da_2(value: word); stdcall; external RTC4ethDLL;
procedure n_set_max_counts(n: word; counts: longint); stdcall; external RTC4ethDLL;
procedure set_max_counts(counts: longint); stdcall; external RTC4ethDLL;
function  n_get_counts(n: word): longint; stdcall; external RTC4ethDLL;
function  get_counts: longint; stdcall; external RTC4ethDLL;
procedure n_set_matrix(n: word; M11: double; M12: double; M21: double; M22: double); stdcall; external RTC4ethDLL;
procedure set_matrix(M11: double; M12: double; M21: double; M22: double); stdcall; external RTC4ethDLL;
procedure n_set_offset(n: word; Xoffset: smallint; Yoffset: smallint); stdcall; external RTC4ethDLL;
procedure set_offset(Xoffset: smallint; Yoffset: smallint); stdcall; external RTC4ethDLL;
procedure n_goto_xyz(n: word; X: smallint; Y: smallint; Z: smallint); stdcall; external RTC4ethDLL;
procedure goto_xyz(X: smallint; Y: smallint; Z: smallint); stdcall; external RTC4ethDLL;
procedure n_goto_xy(n: word; X: smallint; Y: smallint); stdcall; external RTC4ethDLL;
procedure goto_xy(X: smallint; Y: smallint); stdcall; external RTC4ethDLL;
function  n_get_hex_version(n: word): word; stdcall; external RTC4ethDLL;
function  get_hex_version: word; stdcall; external RTC4ethDLL;
procedure n_disable_laser(n: word); stdcall; external RTC4ethDLL;
procedure disable_laser; stdcall; external RTC4ethDLL;
procedure n_enable_laser(n: word); stdcall; external RTC4ethDLL;
procedure enable_laser; stdcall; external RTC4ethDLL;
procedure n_stop_list(n: word); stdcall; external RTC4ethDLL;
procedure stop_list; stdcall; external RTC4ethDLL;
procedure n_restart_list(n: word); stdcall; external RTC4ethDLL;
procedure restart_list; stdcall; external RTC4ethDLL;
procedure n_get_xyz_pos(n: word; var X: smallint; var Y: smallint; var Z: smallint); stdcall; external RTC4ethDLL;
procedure get_xyz_pos(var X: smallint; var Y: smallint; var Z: smallint); stdcall; external RTC4ethDLL;
procedure n_get_xy_pos(n: word; var X: smallint; var Y: smallint); stdcall; external RTC4ethDLL;
procedure get_xy_pos(var X: smallint; var Y: smallint); stdcall; external RTC4ethDLL;
procedure n_select_list(n: word; list_2: word); stdcall; external RTC4ethDLL;
procedure select_list(list_2: word); stdcall; external RTC4ethDLL;
procedure n_z_out(n: word; z: smallint); stdcall; external RTC4ethDLL;
procedure z_out(z: smallint); stdcall; external RTC4ethDLL;
procedure n_set_firstpulse_killer(n: word; fpk: word); stdcall; external RTC4ethDLL;
procedure set_firstpulse_killer(fpk: word); stdcall; external RTC4ethDLL;
procedure n_set_standby(n: word; half_period: word; pulse: word); stdcall; external RTC4ethDLL;
procedure set_standby(half_period: word; pulse: word); stdcall; external RTC4ethDLL;
procedure n_laser_signal_on(n: word); stdcall; external RTC4ethDLL;
procedure laser_signal_on; stdcall; external RTC4ethDLL;
procedure n_laser_signal_off(n: word); stdcall; external RTC4ethDLL;
procedure laser_signal_off; stdcall; external RTC4ethDLL;
procedure n_set_delay_mode(n: word; VarPoly: word; DirectMove3D: word; EdgeLevel: word; MinJumpDelay: word; JumpLengthLimit: word); stdcall; external RTC4ethDLL;
procedure set_delay_mode(VarPoly: word; DirectMove3D: word; EdgeLevel: word; MinJumpDelay: word; JumpLengthLimit: word); stdcall; external RTC4ethDLL;
procedure n_set_piso_control(n: word; l1: word; l2: word); stdcall; external RTC4ethDLL;
procedure set_piso_control(l1: word; l2: word); stdcall; external RTC4ethDLL;
procedure n_select_status(n: word; mode: word); stdcall; external RTC4ethDLL;
procedure select_status(mode: word); stdcall; external RTC4ethDLL;
procedure n_get_encoder(n: word; var Zx: smallint; var Zy: smallint); stdcall; external RTC4ethDLL;
procedure get_encoder(var Zx: smallint; var Zy: smallint); stdcall; external RTC4ethDLL;
procedure n_select_cor_table(n: word; HeadA: word; HeadB: word); stdcall; external RTC4ethDLL;
procedure select_cor_table(HeadA: word; HeadB: word); stdcall; external RTC4ethDLL;
procedure n_execute_at_pointer(n: word; position: word); stdcall; external RTC4ethDLL;
procedure execute_at_pointer(position: word); stdcall; external RTC4ethDLL;
function  n_get_head_status(n: word; Head: word): word; stdcall; external RTC4ethDLL;
function  get_head_status(Head: word): word; stdcall; external RTC4ethDLL;
procedure n_simulate_encoder(n: word; Channel: word); stdcall; external RTC4ethDLL;
procedure simulate_encoder(Channel: word); stdcall; external RTC4ethDLL;
procedure n_release_wait(n: word); stdcall; external RTC4ethDLL;
procedure release_wait; stdcall; external RTC4ethDLL;
function  n_get_wait_status(n: word): word; stdcall; external RTC4ethDLL;
function  get_wait_status: word; stdcall; external RTC4ethDLL;
procedure n_set_laser_mode(n: word; mode: word); stdcall; external RTC4ethDLL;
procedure set_laser_mode(mode: word); stdcall; external RTC4ethDLL;
procedure n_set_ext_start_delay(n: word; delay: smallint; encoder: smallint); stdcall; external RTC4ethDLL;
procedure set_ext_start_delay(delay: smallint; encoder: smallint); stdcall; external RTC4ethDLL;
procedure n_home_position(n: word; xhome: smallint; yhome: smallint); stdcall; external RTC4ethDLL;
procedure home_position(xhome: smallint; yhome: smallint); stdcall; external RTC4ethDLL;
procedure n_set_rot_center(n: word; center_x: longint; center_y: longint); stdcall; external RTC4ethDLL;
procedure set_rot_center(center_x: longint; center_y: longint); stdcall; external RTC4ethDLL;
procedure n_dsp_start(n: word); stdcall; external RTC4ethDLL;
procedure dsp_start; stdcall; external RTC4ethDLL;
procedure n_write_da_x(n: word; x: word; value: word); stdcall; external RTC4ethDLL;
procedure write_da_x(x: word; value: word); stdcall; external RTC4ethDLL;
function  n_read_ad_x(n: word; x: word): word; stdcall; external RTC4ethDLL;
function  read_ad_x(x: word): word; stdcall; external RTC4ethDLL;
function  n_read_pixel_ad(n: word; pos: word): word; stdcall; external RTC4ethDLL;
function  read_pixel_ad(pos: word): word; stdcall; external RTC4ethDLL;
function  n_get_z_distance(n: word; x: smallint; y: smallint; z: smallint): smallint; stdcall; external RTC4ethDLL;
function  get_z_distance(x: smallint; y: smallint; z: smallint): smallint; stdcall; external RTC4ethDLL;
function  n_get_io_status(n: word): word; stdcall; external RTC4ethDLL;
function  get_io_status: word; stdcall; external RTC4ethDLL;
function  load_cor(FileName: pansichar): smallint; stdcall; external RTC4ethDLL;
function  load_pro(FileName: pansichar): smallint; stdcall; external RTC4ethDLL;
function  n_get_serial_number(n: word): word; stdcall; external RTC4ethDLL;
function  get_serial_number: word; stdcall; external RTC4ethDLL;
function  n_get_serial_number_32(n: word): longint; stdcall; external RTC4ethDLL;
function  get_serial_number_32: longint; stdcall; external RTC4ethDLL;
function  n_get_rtc_version(n: word): word; stdcall; external RTC4ethDLL;
function  get_rtc_version: word; stdcall; external RTC4ethDLL;
function  n_auto_cal(n: word; Head: word; command: word): Smallint; stdcall; external RTC4ethDLL;
function  auto_cal(Head: word; command: word): Smallint; stdcall; external RTC4ethDLL;
procedure n_set_hi(n: word; GalvoGainX: double; GalvoGainY: double; GalvoOffsetX: smallint; GalvoOffsetY: smallint; Head: smallint); stdcall; external RTC4ethDLL;
procedure set_hi(GalvoGainX: double; GalvoGainY: double; GalvoOffsetX: smallint; GalvoOffsetY: smallint; Head: smallint); stdcall; external RTC4ethDLL;
procedure n_set_list_mode(n: word; mode: word); stdcall; external RTC4ethDLL;
procedure set_list_mode(mode: word); stdcall; external RTC4ethDLL;
function  n_get_list_space(n: word): word; stdcall; external RTC4ethDLL;
function  get_list_space: word; stdcall; external RTC4ethDLL;
procedure n_save_and_restart_timer(n: word); stdcall; external RTC4ethDLL;
procedure save_and_restart_timer; stdcall; external RTC4ethDLL;
procedure n_set_ext_start_delay_list(n: word; delay: smallint; encoder: smallint); stdcall; external RTC4ethDLL;
procedure set_ext_start_delay_list(delay: smallint; encoder: smallint); stdcall; external RTC4ethDLL;
function  n_get_time(n: word): double; stdcall; external RTC4ethDLL;
function  get_time: double; stdcall; external RTC4ethDLL;
procedure get_hi_data(var x1: word; var x2: word; var y1: word; var y2: word); stdcall; external RTC4ethDLL;
function  teachin(FileName: pansichar; Xin: smallint; Yin: smallint; Zin: smallint; LL0: double; var Xout: smallint; var Yout: smallint; var Zout: smallint): SmallInt; stdcall; external RTC4ethDLL;
function  getmemory(adr: word): smallint; stdcall; external RTC4ethDLL;
procedure set_timeout(timeout: dword); stdcall; external RTC4ethDLL;
procedure set_timeouts(acquire_timeout_us: dword; acquire_max_retries: dword; send_recv_timeout_us: dword; send_recv_max_retries: dword; acqu_rel_min_intvl_ms: dword); stdcall; external RTC4ethDLL;
procedure get_timeouts(var acquire_timeout_us: dword; var acquire_max_retries: dword; var send_recv_timeout_us: dword; var send_recv_max_retries: dword; var acqu_rel_min_intvl_ms: dword); stdcall; external RTC4ethDLL;
function  rs232_config(baudrate: dword; parity: dword; stopbits: dword): dword; stdcall; external RTC4ethDLL;
function  n_rs232_config(n: word; baudrate: dword; parity: dword; stopbits: dword): dword; stdcall; external RTC4ethDLL;
function  rs232_write_data(data: dword): dword; stdcall; external RTC4ethDLL;
function  n_rs232_write_data(n: word; data: dword): dword; stdcall; external RTC4ethDLL;
function  rs232_write_text(text: pansichar): dword; stdcall; external RTC4ethDLL;
function  n_rs232_write_text(n: word; text: pansichar): dword; stdcall; external RTC4ethDLL;
function  rs232_read_data(data: poutchar): dword; stdcall; external RTC4ethDLL;
function  n_rs232_read_data(n: word; data: poutchar): dword; stdcall; external RTC4ethDLL;
procedure n_eth_set_com_timeouts_auto(cardNo: word; initial_timeout_ms: double; sum_timeout_ms: double; multiplicator: double; mode: longint); stdcall; external RTC4ethDLL;
procedure eth_set_com_timeouts_auto(initial_timeout_ms: double; sum_timeout_ms: double; multiplicator: double; mode: longint); stdcall; external RTC4ethDLL;
procedure n_eth_get_com_timeouts_auto(cardNo: word; var initial_timeout_ms: double; var sum_timeout_ms: double; var multiplicator: double; var mode: longint); stdcall; external RTC4ethDLL;
procedure eth_get_com_timeouts_auto(var initial_timeout_ms: double; var sum_timeout_ms: double; var multiplicator: double; var mode: longint); stdcall; external RTC4ethDLL;

implementation

end.
