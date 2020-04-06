#ifndef IO_PORTS_H

#define IO_PORTS_H

unsigned char port_in_byte(unsigned short port);
unsigned short port_in_word(unsigned short port);

void port_out_byte(unsigned short port, unsigned char data);
void port_out_word(unsigned short port, unsigned short data);

#endif
