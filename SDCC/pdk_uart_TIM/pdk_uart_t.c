{
	// Transmitter Section
	if (flag_tx_busy == SU_TRUE)
	{
		if (internal_tx_buffer & 0x01) // Check bit (1/0) for sending
			setb(PA, 7);			   // Send 1 on TX Pin
		else
			clrb(PA, 7);		  // Send 0 on TX Pin
		internal_tx_buffer >>= 1; // Shift txdata
	}
	if (internal_tx_buffer == 0)
	{
		flag_tx_busy = SU_FALSE;
	}
}