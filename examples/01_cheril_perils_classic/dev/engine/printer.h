// SG-1000 MK1 v0.4
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// printer.h
// Draw map, print text, etcetera.

void clear_update_list (void);
void cls (void);
void ul_putc (void);
void p_t (void);
void draw_tile (void);
void update_list_tile (void);
void map_set (void);
unsigned char get_byte (void);
void draw_scr (void);
void pr_str (const unsigned char *s);
#ifdef ENABLE_UL_PRINTER
	void pr_ul_str ();
#endif
#ifdef DEBUG
	unsigned char get_hex_digit (unsigned char n);
	void debug_print_hex_16_dl (unsigned char x, unsigned char y, unsigned int n);
#endif

void p_tf (void);
