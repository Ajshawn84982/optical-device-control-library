#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>
#include "RTC4ethimpl.h"

#pragma comment(lib, "RTC4ethDLL.lib")
// RTC4ethDLL.dll automatically initializes RTC4netDLL.dll

void program_list1(unsigned short cardno)
{
	select_rtc(cardno);


	set_start_list_1();
	set_jump_speed(100);

	jump_abs(0, 0);
	long_delay(10000);

	set_matrix(1, 0, 0, 1);
	

	set_io_cond_list(0, 0, 1); // set bit #0 of the 16-bit digital output port
	list_call_cond(0, 1,4000); // loop until the signal is confirmed
	// (i.e. bit #0 of the digital input turns HIGH)
	clear_io_cond_list(0, 0, 1); // clear bit #0 of the 16-bit output

	list_call_cond(0, 1, 4000); // loop until the signal is confirmed
	// (i.e. bit #0 of the digital input turns HIGH)
	clear_io_cond_list(0, 0, 1); // clear bit #0 of the 16-bit output


	

	set_end_of_list();
}


int main(int argc, char* argv[])
{
	uint16_t num_found_cards;
	uint32_t res, card_ip;
	uint32_t itest;
	char ipbuff[16];

	rtc_search_cards(&num_found_cards,
		convert_string_to_ip("0.0.0.0"),
		convert_string_to_ip("255.255.255.0"));

	if (num_found_cards == 0) {
		printf("Error, no RTC4ethernet cards found.\n");
		return EXIT_FAILURE;
	}
	if (num_found_cards != 0) {
		printf("number of card %d.\n", num_found_cards);
	}
	for (int i = 1; i <= num_found_cards; i++) {
		// assign card #i the user number i (1:1 mapping)
		if (assign_rtc(i, i) != i) {
			printf("Error, could not assign id %d to card #%d.\n", i, i);
			return EXIT_FAILURE;
		}
		//select_rtc(i);
		acquire_rtc(i);
		
		// select card #i with an intrinsic acquire
		//if (select_rtc(i) != 0) {
		//	printf("Error, could not select card %d.\n", i);
		//}
		res = n_load_program_file(i,"RTC4D2.hex");
		if (res) {
			printf("card %d, n_load_program_file error: %d\n", i, res);
			return EXIT_FAILURE;
		}

		res = n_load_correction_file(i,"Cor_1to1.ctb", 1, 1.0, 1.0, 0, 0, 0);
		if (res) {
			printf("card %d, could not load correction file: %d\n", i, res);
			return EXIT_FAILURE;
		}

		card_ip = get_ip_address(i);
		convert_ip_to_string(card_ip, ipbuff);

		printf("Card #%d has IP: %s and serial %d.\n", i, ipbuff, n_get_serial_number_32(i));
	}




	int list_no = 1;
	int working_card = 1;
	unsigned short busy, pos;
	
	

	select_rtc(working_card);
	n_set_start_list_2(working_card);

	n_set_jump_speed(working_card, 5000);
	//n_list_jump_cond(working_card, 0, 0, get_input_pointer());
	int s1 = 0;
	
	int s = 10000;
	for (int i = 0; i < 20; i++)
	{
		n_jump_abs(working_card, s1, s1);
		n_long_delay(working_card, 20000);
		n_jump_abs(working_card, s, s);
		n_long_delay(working_card, 20000);
	}
	n_set_end_of_list(working_card);
	select_rtc(working_card);



	n_execute_list_2(working_card);
	
	

	


	for (int i = num_found_cards; i > 0; i--) {
		release_rtc(i);
	}

	return EXIT_SUCCESS;
}