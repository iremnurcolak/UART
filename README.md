# UART
UART protocol implementation in Verilog.

The controller's baudrate is 115200 and the clock frequency is 100 MHz. Thus, cycles per bit are 100000000/115200~868.

The frame in the implementation contains one start bit (active-high), 8-bit data, one even parity bit, one stop bit (active-low).

TX signal is always high when no data is sent.
