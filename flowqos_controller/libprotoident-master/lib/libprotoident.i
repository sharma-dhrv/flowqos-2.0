%module libprotoident
%{
extern int lpi_init_library(void);
extern void lpi_free_library(void);
extern const char* lpi_shim_guess_protocol(unsigned int client_payload,
					   unsigned int server_payload,
					   unsigned int client_ip,
					   unsigned int server_ip,
					   unsigned int client_port,
					   unsigned int server_port,
					   unsigned int client_payload_length,
					   unsigned int server_payload_length,
					   char protocol);
%}

extern int lpi_init_library(void);
extern void lpi_free_library(void);
extern const char* lpi_shim_guess_protocol(unsigned int client_payload,
					   unsigned int server_payload,
					   unsigned int client_ip,
					   unsigned int server_ip,
					   unsigned int client_port,
					   unsigned int server_port,
					   unsigned int client_payload_length,
					   unsigned int server_payload_length,
					   char protocol);
